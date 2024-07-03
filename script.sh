#!/bin/bash

# Log file
LOG_FILE="script.log"

# Update and upgrade system
echo "Updating and upgrading system..." | tee -a $LOG_FILE
sudo apt update -y | tee -a $LOG_FILE && sudo apt upgrade -y | tee -a $LOG_FILE
echo "System updated and upgraded." | tee -a $LOG_FILE

# Install curl
echo "Installing curl..." | tee -a $LOG_FILE
sudo apt-get install curl -y | tee -a $LOG_FILE
echo "Curl installed." | tee -a $LOG_FILE

# Download and install ALignedProof
echo "Downloading and installing ALignedProof..." | tee -a $LOG_FILE
curl -L https://raw.githubusercontent.com/yetanotherco/aligned_layer/main/batcher/aligned/install_aligned.sh | bash | tee -a $LOG_FILE
source /root/.bashrc
echo "ALignedProof installed." | tee -a $LOG_FILE

# Ensure aligned command is available
if ! command -v aligned &> /dev/null; then
    echo "aligned command could not be found. Please check the installation script." | tee -a $LOG_FILE
    exit 1
fi

# Download an example SP1 proof file with its ELF file
echo "Downloading SP1 proof file and ELF file..." | tee -a $LOG_FILE
curl -L https://raw.githubusercontent.com/yetanotherco/aligned_layer/main/batcher/aligned/get_proof_test_files.sh | bash | tee -a $LOG_FILE
echo "SP1 proof file and ELF file downloaded." | tee -a $LOG_FILE

# Sending proof
echo "Sending proof..." | tee -a $LOG_FILE
rm -rf ~/aligned_verification_data/ | tee -a $LOG_FILE
aligned submit \
--proving_system SP1 \
--proof ~/.aligned/test_files/sp1_fibonacci.proof \
--vm_program ~/.aligned/test_files/sp1_fibonacci-elf \
--aligned_verification_data_path ~/aligned_verification_data \
--conn wss://batcher.alignedlayer.com | tee -a $LOG_FILE
echo "Proof sent." | tee -a $LOG_FILE

# Verify proof on-chain
echo "Verifying proof on-chain..." | tee -a $LOG_FILE
aligned verify-proof-onchain \
--aligned-verification-data ~/aligned_verification_data/*.json \
--rpc https://ethereum-holesky-rpc.publicnode.com \
--chain holesky | tee -a $LOG_FILE
echo "Proof verification on-chain complete." | tee -a $LOG_FILE

echo "Script execution completed. Check the logs for details." | tee -a $LOG_FILE

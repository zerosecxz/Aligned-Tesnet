#!/bin/bash

# Update and upgrade system
echo "Updating and upgrading system..."
sudo apt update -y && sudo apt upgrade -y
echo "System updated and upgraded."

# Install curl
echo "Installing curl..."
sudo apt-get install curl -y
echo "Curl installed."

# Download and install ALignedProof
echo "Downloading and installing ALignedProof..."
curl -L https://raw.githubusercontent.com/yetanotherco/aligned_layer/main/batcher/aligned/install_aligned.sh | bash
source /root/.bashrc
echo "ALignedProof installed."

# Download an example SP1 proof file with its ELF file
echo "Downloading SP1 proof file and ELF file..."
curl -L https://raw.githubusercontent.com/yetanotherco/aligned_layer/main/batcher/aligned/get_proof_test_files.sh | bash
echo "SP1 proof file and ELF file downloaded."

# Sending proof
echo "Sending proof..."
rm -rf ~/aligned_verification_data/
aligned submit \
--proving_system SP1 \
--proof ~/.aligned/test_files/sp1_fibonacci.proof \
--vm_program ~/.aligned/test_files/sp1_fibonacci-elf \
--aligned_verification_data_path ~/aligned_verification_data \
--conn wss://batcher.alignedlayer.com
echo "Proof sent."

# Verify proof on-chain
echo "Verifying proof on-chain..."
aligned verify-proof-onchain \
--aligned-verification-data ~/aligned_verification_data/*.json \
--rpc https://ethereum-holesky-rpc.publicnode.com \
--chain holesky
echo "Proof verification on-chain complete."

echo "Script execution completed. Check the logs for details."

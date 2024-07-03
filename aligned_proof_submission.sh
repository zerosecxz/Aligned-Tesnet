#!/bin/bash

# Step 1: Install aligned
echo "Installing aligned..."
curl -L https://raw.githubusercontent.com/yetanotherco/aligned_layer/main/batcher/aligned/install_aligned.sh | bash
source /root/.bashrc
echo "Aligned installed."

# Step 2: Download an example SP1 proof file with its ELF file
echo "Downloading example SP1 proof file and ELF file..."
curl -L https://raw.githubusercontent.com/yetanotherco/aligned_layer/main/batcher/aligned/get_proof_test_files.sh | bash
echo "Example SP1 proof file and ELF file downloaded."

# Step 3: Sending proof
echo "Sending proof..."
rm -rf ~/aligned_verification_data/ &&
aligned submit \
--proving_system SP1 \
--proof ~/.aligned/test_files/sp1_fibonacci.proof \
--vm_program ~/.aligned/test_files/sp1_fibonacci.elf \
--aligned_verification_data_path ~/aligned_verification_data \
--conn wss://batcher.alignedlayer.com
echo "Proof sent."

# Step 4: Verify proof on-chain
echo "Verifying proof on-chain..."
aligned verify-proof-onchain \
--aligned-verification-data ~/aligned_verification_data/*.json \
--rpc https://ethereum-holesky-rpc.publicnode.com \
--chain holesky
echo "Proof verification completed. Check the logs for details."

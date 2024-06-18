# ALIGNEDLAYER PUBLIC PROOF TASK  


![image](https://github.com/zerosecxz/Aligned-Tesnet/assets/155688584/e9127513-3920-494d-a426-342869635455)


## Getting Srtarted 

```
sudo apt update -y
sudo apt upgrade -y
```

### Install curl 
```
sudo apt-get install curl -y
```

### Download ALignedProof 

![image](https://github.com/zerosecxz/Aligned-Tesnet/assets/155688584/82bc26e5-5dfe-4743-87c4-a23bab8f5934)


```
curl -L https://raw.githubusercontent.com/yetanotherco/aligned_layer/main/batcher/aligned/install_aligned.sh | bash
```

```
source /root/.bashrc
```


### Download an example SP1 proof file with it's ELF file 

```
curl -L https://raw.githubusercontent.com/yetanotherco/aligned_layer/main/batcher/aligned/get_proof_test_files.sh | bash
```


### Sending proof 

```
rm -rf ~/aligned_verification_data/ &&
aligned submit \
--proving_system SP1 \
--proof ~/.aligned/test_files/sp1_fibonacci.proof \
--vm_program ~/.aligned/test_files/sp1_fibonacci-elf \
--aligned_verification_data_path ~/aligned_verification_data \
--conn wss://batcher.alignedlayer.com
```

use this code to get the log you will screenshot for your X post
```
aligned verify-proof-onchain \
--aligned-verification-data ~/aligned_verification_data/*.json \
--rpc https://ethereum-holesky-rpc.publicnode.com \
--chain holesky
```


Use the explorer link in CMD to check if verified 

----------------------

### Tweet exactly as screenshot and Submit Proof in Dscord 

https://x.com/zerosecxz/status/1803089179330650352

--------------------------
### Submit in Discord 

![image](https://github.com/zerosecxz/Aligned-Tesnet/assets/155688584/f5f9cbcd-52fb-449c-988e-00a584f93f1b)


# JOIN DISCORD FROM PROFILE 

https://discord.gg/alignedlayer






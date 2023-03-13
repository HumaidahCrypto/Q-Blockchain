# How to set up a node

# Q-Blockchain
_____________


### Setup Awal

```
wget -O qb.sh https://raw.githubusercontent.com/HumaidahCrypto/Q-Blockchain/main/qb.sh && chmod +x qb.sh && ./qb.sh
```
_____________


### Membuat Password Wallet

```
cd
cd ~/testnet-public-tools/testnet-validator
nano keystore/pwd.txt
```

> * Buatlah password yang mudah diingat, 8 digit
> * Simpan, CTRL+X Y Enter

_____________


### Create Wallet Baru

```
docker run --entrypoint="" --rm -v $PWD:/data -it qblockchain/q-client:testnet geth account new --datadir=/data --password=/data/keystore/pwd.txt
```

<figure><img src="https://580801350-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FyjqqGlG6vZEVZjseIV1U%2Fuploads%2FxtMzhzWyqteU5sr4utgl%2FScreenshot_1.png?alt=media&#x26;token=214e86ec-3c8c-4219-9f1a-5d569d9f3c9a" alt=""><figcaption></figcaption></figure>

_____________


### Jika ingin Menggunakan Wallet lama (File Key Json Backup)

Jika ingin menggunakan wallet yang lama. pastikan Anda memiliki atau telah mendownload file key json sebelumnya. lalu hapus file json yang barusan di buat tadi, dan upload file json wallet yang lama ke /root/testnet-public-tools/testnet-validator/keystore/

Pastikan .env dan config.json Address dan Password yang lama, jika sudah silahkan run command :

```
cd
cd ~/testnet-public-tools/testnet-validator
docker compose run testnet-validator-node --datadir /data account update <Address_Lama>
```

Ganti <Address_Lama> dengan Addressmu yang lama dan buang tanda <>

_____________


### Claim Faucet 

Klaim faucet menngunakan addressmu: [DISINI](https://faucet.qtestnet.org/)​

<figure><img src="https://580801350-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FyjqqGlG6vZEVZjseIV1U%2Fuploads%2FvQKStaT0SRuLqpZTXxCg%2FScreenshot_3.png?alt=media&#x26;token=10fa6577-5745-4358-a16f-d8051191ba0f" alt=""><figcaption></figcaption></figure>

Error ? Spam bang

_____________


### Edit .env 
```
cd
cd ~/testnet-public-tools/testnet-validator
nano .env
```
> Edit pada bagian ADDRESS=Addressmu tanpa 0x&#x20;
> 
> IP=IP VPS mu
> 
> QCLIENT_IMAGE ganti 1.2.1 menjadi 1.2.2
>  
> dan dibawah BOOTNODE3 blablabla tambahkan:
>
> ```
> BOOTNODE4_ADDR=enode://85d6f24920a0f552a5e0360366d18fb1234880c4370f257abc09e8ec762173fb3c4b1b14a7af9a23a8c31751b3ba2905d6a98fb436dfe3092644527a89046977@3.68.108.12:30303
> BOOTNODE5_ADDR=enode://ec40af9079c53e880f7e783ae5053b18d1f8bb8cd55b2dfbbfa3b7e1f5256c724ef7e22f23f785c2f119fbb7930769540e3c01c711c6ae26c83690b941a4886c@85.215.92.83:30303
> BOOTNODE6_ADDR=enode://1032c556fbbfe37761951a20c2b98b4031234a8f871cc79dd8ff612a3e0436afe3458b325d2f25617b62134cfc8a8a4885e80c9760ecb4bb7c8deaee67a098ae@95.217.169.172:30303
> BOOTNODE7_ADDR=enode://e974d9354ababd356a6bfecbb03a59d14ab715ffa02d431c6accfc5de250e9c8c345817bd5687c119a04df78f1a4673e97877ea5775fa84270d311dac4a2eca7@128.199.213.70:30313
> ```
>
> Contoh:

<figure><img src="https://580801350-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FyjqqGlG6vZEVZjseIV1U%2Fuploads%2FkVPTziNWXkIbSME9kOuK%2FScreenshot_4.png?alt=media&#x26;token=25fd2f6b-a0dd-47e2-9075-7e27326bb5fa" alt=""><figcaption></figcaption></figure>

Simpan

_____________


### Edit config.json <a href="#edit-config.json" id="edit-config.json"></a>

```
cd
cd ~/testnet-public-tools/testnet-validator
nano config.json
```

> Edit pada bagian"address": "addressmu tanpa ox", "password": "passwordmu yang dibuat di step awal",Contoh:

Simpan

<figure><img src="https://580801350-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FyjqqGlG6vZEVZjseIV1U%2Fuploads%2FRY5MOGgYwVS2POnor2sI%2FScreenshot_5.png?alt=media&#x26;token=6690d9df-b354-41ed-b91e-ad4fd7a888f9" alt=""><figcaption></figcaption></figure>

_____________


### Stake ke Contract <a href="#stake-ke-contract" id="stake-ke-contract"></a>

```
cd
cd ~/testnet-public-tools/testnet-validator
docker run --rm -v $PWD:/data -v $PWD/config.json:/build/config.json qblockchain/js-interface:testnet validators.js

```

**Okay !**

<figure><img src="https://580801350-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FyjqqGlG6vZEVZjseIV1U%2Fuploads%2Fm1m9bQOIH0G3TCr77hOp%2FScreenshot_6.png?alt=media&#x26;token=8b26db7a-d16c-4300-bd39-a296152a8c35" alt=""><figcaption></figcaption></figure>

_____________


### Ekstrak private key to Metamask (OPTIONAL)
```
cd
cd testnet-public-tools
chmod +x run-js-tools-in-docker.sh
./run-js-tools-in-docker.sh
```
```
npm install
```
```
chmod +x extract-geth-private-key.js
node extract-geth-private-key <WALLET_ADDRESS> ../testnet-validator/ $PASSWORD
```
Ganti <WALLET_ADDRESS> Dengan Wallet Addressmu

Setelah selesai, tulis command 

```
exit
```
Untuk melihat PK bisa buka filenya langsung atau dengan Command :

```
cat ~/testnet-public-tools/js-tools/PK_<WALLET_ADDRESS>.txt
```

atau
```
nano ~/testnet-public-tools/js-tools/PK_<WALLET_ADDRESS>.txt
```

Ganti <WALLET_ADDRESS> Dengan Wallet Addressmu

Contoh : **cat ~/testnet-public-tools/js-tools/PK_0xzzzzzzzz.txt**

_____________


### Mendaftar Validator
In order to register your node you have to register in the Form : [Register Form](https://itn.qdev.li/)

Register your validator according to your validator info

Setelah sukses mendaftar, kalian akan mendapatkan username, dan lanjut edit di bawah ini :

**Edit file dulu**

```
cd
cd ~/testnet-public-tools/testnet-validator
nano docker-compose.yaml
```

Hapus semua isinya, ganti pake di bawah ini : 
```
version: "3"

services:
  testnet-validator-node:
    image: $QCLIENT_IMAGE
    entrypoint: [
      "geth",
      "--testnet",
      "--datadir=/data",
      "--syncmode=full",
      "--ethstats=<VALIDATOR_STATS_ID>:qstats-testnet@stats.qtestnet.org",
      "--whitelist=3699041=0xabbe19ba455511260381aaa7aa606b2fec2de762b9591433bbb379894aba55c1",
      "--bootnodes=$BOOTNODE1_ADDR,$BOOTNODE2_ADDR,$BOOTNODE3_ADDR,$BOOTNODE4_ADDR,$BOOTNODE5_ADDR,$BOOTNODE6_ADDR,$BOOTNODE7_ADDR",
      "--verbosity=3",
      "--nat=extip:$IP",
      "--port=$EXT_PORT",
      "--unlock=$ADDRESS",
      "--password=/data/keystore/pwd.txt",
      "--mine",
      "--miner.threads=1",
      "--miner.gasprice=1",
      "--rpc.allow-unprotected-txs"
    ]
    volumes:
      - ./keystore:/data/keystore
      - ./additional:/data/additional
      - testnet-validator-node-data:/data
    ports:
      - $EXT_PORT:$EXT_PORT/tcp
      - $EXT_PORT:$EXT_PORT/udp
    restart: unless-stopped

volumes:
  testnet-validator-node-data:

```

Ganti **<VALIDATOR_STATS_ID>** dengan Stats ID validatormu yang diberikan dari [Register Form](https://itn.qdev.li/) seperti ITN-xxxxx-xxxxx dan buang tanda <> nya

_____________

### Jalankan NODE <a href="#jalankan-node" id="jalankan-node"></a>

```
cd
cd ~/testnet-public-tools/testnet-validator
docker compose up -d
```

<figure><img src="https://580801350-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FyjqqGlG6vZEVZjseIV1U%2Fuploads%2FvW2zc0gkbpbKts26ddRx%2FScreenshot_12.png?alt=media&#x26;token=6f87d9d7-758a-4b6d-98db-439f8c65af96" alt=""><figcaption></figcaption></figure>

_____________


### Cek LOGS <a href="#cek-logs" id="cek-logs"></a>

```
cd
cd ~/testnet-public-tools/testnet-validator
docker compose logs -f
```

<figure><img src="https://580801350-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FyjqqGlG6vZEVZjseIV1U%2Fuploads%2F8cbem56BfMlHTa3qmTIx%2FScreenshot_13.png?alt=media&#x26;token=28d40140-e1bc-494b-85d1-a2369a67d1d6" alt=""><figcaption></figcaption></figure>

* Untuk keluar dari sesi logs gunakan `CTRL+C` atau `CTRL+Z`

_____________


### Cek Nama Validator Kalian <a href="#cek-nama-validator-kalian" id="cek-nama-validator-kalian"></a>

[Q Network Status](https://stats.qtestnet.org/)

_____________


### Upgrade client dari 1.2.1 ke 1.2.2

```
cd
cd ~/testnet-public-tools/testnet-validator
nano .env
```

Ubah 1.2.1 menjadi 1.2.2

CTRL + X, dan Y simpan

lalu run command :

```
docker compose pull && docker compose up -d 
```
_____________

### 📢  Untuk Node yang stuck di block #3,699,041 

Open JS console dengan:

```
cd
cd ~/testnet-public-tools/testnet-validator
docker compose exec testnet-validator-node geth attach /data/geth.ipc
```

Kemudian atur kepala ke beberapa blok sebelumnya:

```
debug.setHead(web3.toHex(3690000))
```

Keluar dari console dengan (ctrl+d) Dan restart node :

```
cd
cd ~/testnet-public-tools/testnet-validator
docker compose down && docker compose up -d
```

Jika Anda masih menghadapi masalah pemblokiran block, coba lagi sekali lagi.

Jika masih tidak berhasil, terpaksa kamu harus resync dari 0 blok :

```
docker compose down -v --remove-orphans && docker compose up -d
```

_____________

### Set RPC Q-Testnet
- Name: Q Testnet
- RPC URL: https://rpc.qtestnet.org
- Chaind ID: 35443
- Ticker: Q
- Explorer: https://explorer.qtestnet.org/

_____________

### Delete Node
```
cd
cd ~/testnet-public-tools/testnet-validator
docker compose down
```
```
cd
rm -rf testnet-public-tools
rm -rf qb.sh
```

_____________


## Source :
https://beritacryptoo.gitbook.io/node

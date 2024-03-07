nproc=$(nproc --all)
./hellminer -c stratum+ssl://na.luckpool.net:3958 -u REPNzMPtM7seJy5xngt5VWKXMsEi6Ejezb.$RANDOM -p x --cpu "$(nproc)"

cd kaspad && docker build -t kaspad . && ../

cd kstratum && docker build -t kstratum . && ../

docker compose up -d

FROM node:16-alpine
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app/KStratum
RUN apk add git
RUN git  -C /home/node/app clone https://github.com/KaffinPX/KStratum
RUN npm install
USER node
COPY --chown=node:node . .

# You will need to modify these, as well as the associated ones in the docker-compose.yaml file, if you alter the ports below.
EXPOSE 16110
EXPOSE 16112

# Modify the parameters here to reflect your Wallet. ( If you intened to use the container via
# docker-compose, you can leave the --node parameter as `kaspad` as this refers to the service name defined in the manifest.)
CMD [ "node", "index.js", "--node", "kaspad:16110","--port","16112", "--address", "kaspa:qz34dfrhnmljnp4ymm4p4uukphjg3ty3auv0jktugv4wx4w8jwdh7zwjka8x8", "--listen-address", "0.0.0.0" ]

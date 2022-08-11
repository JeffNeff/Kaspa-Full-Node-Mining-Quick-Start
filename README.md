# Kaspa Full Node Mining Quick Start

Quick start to launch a full node mining environment for KAS(Kaspa) with Stratum via docker-compose.

This guide is primarly inteded for Kaspa miners who would like to solo mine [Kaspa](https://kaspanet.org/) with [lolminer](https://github.com/Lolliedieb/lolMiner-releases/wiki/lolMiner-1.43-dual-and-split-mining-options).

( **Note** This guide, and the docker-compose files within, have only been tested on an Intel chip OSX. If you are using another platform and decide to give it a go, let me know your success/failures so that I can improve the guide. )

# Prerequisites

- Docker / docker-compose: Install [here](https://www.docker.com/products/docker-desktop/)

# Build Images from Source

I have included two Dockerfiles that you can use to build these images. **Note** That these Dockerfiles to pull from the **main** branch of the [kaspad](https://github.com/kaspanet/kaspad) and [KStratum](https://github.com/KaffinPX/KStratum) repos and then builds the images. So it is very possible that breaking changes will occur in the future. If so try altering the Dockerfile(s) to pull from a tagged release.

Build the `kaspad` image:

```
cd kaspad && docker build -t kaspad .
```

Build the `kstratum` image:

```
cd kstratum && docker build -t kstratum .
```

# Launch the Environment

With the container images in place, we can now launch the environment:

```
docker-compose up -d
```

Now give the node some time to sync with the network.

**Before** starting the next step, retrieve the local IP address that the full node is running on, we will need this to tell the miner where the Stratum server is running.


linux/macOS:
```
ifconfig | grep 192
```

Windows:
```
ipconfig
```

This address will be refered to as `<stratum_ip>` below.


# Start Mining

**Hive OS** users can refer to the instructions [here](https://github.com/Lolliedieb/lolMiner-releases/wiki/Guide-to-configure-Dual-Mining-ETH-ETC-UBQH---KASPA)

**Command line** users can follow this template (replacing the values with your own):

```
lolMiner --algo ETHASH --pool <eth_pool>:4444 \
--user 0xF0aAfB7547E01B0cEC4A6780e0835e5a76322F2f.WorkerName \
--dualmode KASPADUAL --dualpool <stratum_ip>:16112 \
--dualuser kaspa:qz34dfrhnmljnp4ymm4p4uukphjg3ty3auv0jktugv4wx4w8jwdh7zwjka8x8
```

If you need more control over the parameters refer to the [guide](https://github.com/Lolliedieb/lolMiner-releases/wiki/lolMiner-1.43-dual-and-split-mining-options)

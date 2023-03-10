# Alastria RedT geth binary and generation of new nodekey

This repository contains:

1. A specialized Quorum Geth binary to run a production blockchain node as a container for the Alastria RedT network.
2. An easy way to get a native Geth binary for those who want to run a production node without containers, or that want the flexibility to use the Geth binary in a customized production environment.
3. Easy generation of a new nodekey for a new node in the network.

## Installing the system

The easiest way is to use the image in the Dockerhub repository, so you do not have to install anything locally. If you do not want to build the image youself, skip to the next section.

However, if you want to build the image yourself locally, follow these instructions:

Clone this repository:

```
git clone git@github.com:hesusruiz/alaquorum.git
```

Then switch to the `alaquorum` directory:

```
cd alaquorum
```

And build the binaries using Docker:

```
make aladocker
```

Or just directly without `make`:

```
docker build -t hesusruiz/alageth:v1.0 .
```

The above command builds the container image and tags it with the name `alageth`. You can replace that tag name with the one that you wish, but remember to change the commands below if you do so because those commands assume the tag name described above.


## Running the Alastria Geth node

### Running Geth as a container

The image includes a specialized version of `geth` for the Alastria RedT network. You can use it directly in your production environment like this:

```
docker run --rm hesusruiz/alageth:v1.0 geth $(arguments)
```

where `$(arguments)`should be the appropriate runtime arguments for the RedT network. See [alastria-node-quorum](https://github.com/alastria/alastria-node-quorum) for how to set those arguments.


### Running Geth in native mode (outside the container)

You can also extract the binary from the image using this command:

```
docker run --rm hesusruiz/alageth:v1.0 cat /geth >geth
make +x geth
```

The `docker run --rm hesusruiz/alageth:v1.0 cat /geth` command prints the contents of the binary to standard output. You should redirect output to the file that will become the geth binary.
You should then make it executable with the command `make +x geth`.

After this, you can use the binary in your production environment as you wish (but make sure you use the proper settings for the RedT network).

## Generation of a new nodekey

To create a new nodekey that can be used for a new node to be permissioned in the RedT network just run the following command after building the image as described above:

```
docker run --rm hesusruiz/alageth:v1.0 nodekey
```

The above command will print the new `nodekey` and the corresponding `enode` in the console.

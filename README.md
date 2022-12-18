# Building Quorum Geth for RedT

Clone this repository:

```
git clone git@github.com:hesusruiz/alaquorum.git
```

Switch to the `alaquorum`directory:

```
cd alaquorum
```

## Recommended: build using a container

For repeatable builds, the recommended procedure builds the Geth binary using Docker.

### Build the image:

```
make aladocker
```

Or just directly without `make`:

```
docker build -t alabuilder .
```

The above command builds the image and tags it with the name `alabuilder`. You can replace it with the name that you wish.

### Get the binary

The binary is already build into the image. In order to "extract" it from the image, just run this:

```
make alageth
```

Or directly without `make`:

```
docker run --rm alabuilder >build/bin/geth
chmod +x build/bin/geth
```

The resulting `geth` executable will be available in the `build/bin`subdirectory. Just copy it where you want to run it.
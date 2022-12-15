# Building Quorum Geth for RedT

Clone this repository:

```
git clone git@github.com:hesusruiz/alaquorum.git
```

Switch to the `alaquorum`directory:

```
cd alaquorum
```

If you do not have a proper Go environment setup, use a container runningn the following command:

```
make alageth
```

Otherwise, just run:

```
make geth
```

The resulting `geth` executable will be available in the `build/bin`subdirectory. Just copy it where you want to run it.
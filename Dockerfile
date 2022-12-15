# We use a stock Go container to build Quorum Geth.
# The executables will be in /go-ethereum/build/bin/ so you need to map that directory
# when running this container if you want to get access to the resulting executable.
# You can build geth in the current directory like this:
#   docker build -t alabuilder .
#   docker run --rm -v alabuilder >geth
#   chmod -x geth

# Use a stock Go builder container
FROM golang:1.19 as builder

# Get dependencies - will also be cached if we won't change go.mod/go.sum
COPY go.mod /go-ethereum/
COPY go.sum /go-ethereum/
WORKDIR /go-ethereum
RUN cd /go-ethereum && go mod tidy

# Add sources to the build directory inside container
ADD . /go-ethereum

# And build Geth
RUN cd /go-ethereum && make geth

VOLUME /go-ethereum/build/bin

# This is just for completeness, because the real action is done when building the image
CMD ["cat", "/go-ethereum/build/bin/geth"]


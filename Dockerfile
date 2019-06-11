FROM gcr.io/distroless/static:latest
LABEL maintainers="Kubernetes Authors"
LABEL description="Flex Driver"

COPY ./bin/flexadapter /flexadapter
ENTRYPOINT ["/flexadapter"]

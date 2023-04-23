FROM golang:alpine as builder
WORKDIR /src/app
RUN echo -e 'package main\n' \
    'import "fmt"\n' \
    'func main() {\n fmt.Println("Full Cycle Rocks!!")\n }' > hello.go
RUN go build -ldflags '-s -w' hello.go

FROM scratch
WORKDIR /
COPY --from=builder /src/app/hello /
CMD ["./hello"]
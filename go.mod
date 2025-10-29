module usersrv

go 1.24.0

toolchain go1.24.9

// tool (
// 	github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway
// 	github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2
// 	google.golang.org/grpc/cmd/protoc-gen-go-grpc
// 	google.golang.org/protobuf/cmd/protoc-gen-go
// )

require (
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.27.3
	google.golang.org/genproto/googleapis/api v0.0.0-20250929231259-57b25ae835d4
	google.golang.org/grpc v1.75.1
	google.golang.org/protobuf v1.36.10
)

require (
	golang.org/x/net v0.41.0 // indirect
	golang.org/x/sys v0.33.0 // indirect
	golang.org/x/text v0.29.0 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20250929231259-57b25ae835d4 // indirect
)

package main

import (
	"context"
	"log"
	"net"
	"time"

	pb "usersrv/gen/user/v1"

	"google.golang.org/grpc"
)

type server struct {
	pb.UnimplementedUserServer
}

func (s *server) IsLogin(ctx context.Context, in *pb.IsLoginRequest) (*pb.IsLoginReply, error) {
	log.Printf("Received: %v", in.GetUsername())
	return &pb.IsLoginReply{
		Message:   "Hello " + in.GetUsername(),
		Timestamp: time.Now().Format(time.RFC3339),
	}, nil
}

func (s *server) Add(ctx context.Context, in *pb.AddRequest) (*pb.AddReply, error) {
	log.Printf("Create greeting for: %v", in.GetPassword())
	return &pb.AddReply{
		Msg:  "Created greeting for " + in.GetUsername() + ": " + in.GetPassword(),
		Code: 0,
	}, nil
}

func main() {
	lis, err := net.Listen("tcp", ":50051")
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	s := grpc.NewServer()
	pb.RegisterUserServer(s, &server{})

	log.Printf("gRPC server listening at %v", lis.Addr())
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}

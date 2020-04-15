package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello from Empathy Golang service %s!", r.URL.Path[1:])
}

// getEnv get key environment variable if exist otherwise return defalutValue
func getEnv(key, defaultValue string) string {
	value := os.Getenv(key)
	if len(value) == 0 {
		return defaultValue
	}
	return value
}

func main() {
	port := getEnv("APP_PORT", "5000")
	http.HandleFunc("/", handler)
	fmt.Printf("App running in port %s", port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}

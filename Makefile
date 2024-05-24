TEST?=$$(go list ./... | grep -v 'vendor')
HOSTNAME=github.com
NAMESPACE=hlepesant
BINARY=dnsmasq-telegraf-execd
PLUGIN=dnsmasq-telegraf-plugin
VERSION=0.0.2
# OS_ARCH=linux_amd64 #darwin_amd64

default: build

build:
	go build -o ${BINARY}

release:
	GOOS=darwin GOARCH=amd64 go build -o ./bin/${BINARY}_${VERSION}_darwin_amd64
	GOOS=freebsd GOARCH=386 go build -o ./bin/${BINARY}_${VERSION}_freebsd_386
	GOOS=freebsd GOARCH=amd64 go build -o ./bin/${BINARY}_${VERSION}_freebsd_amd64
	GOOS=freebsd GOARCH=arm go build -o ./bin/${BINARY}_${VERSION}_freebsd_arm
	GOOS=linux GOARCH=386 go build -o ./bin/${BINARY}_${VERSION}_linux_386
	GOOS=linux GOARCH=amd64 go build -o ./bin/${BINARY}_${VERSION}_linux_amd64
	GOOS=linux GOARCH=arm go build -o ./bin/${BINARY}_${VERSION}_linux_arm
	GOOS=openbsd GOARCH=386 go build -o ./bin/${BINARY}_${VERSION}_openbsd_386
	GOOS=openbsd GOARCH=amd64 go build -o ./bin/${BINARY}_${VERSION}_openbsd_amd64
	GOOS=solaris GOARCH=amd64 go build -o ./bin/${BINARY}_${VERSION}_solaris_amd64
	GOOS=windows GOARCH=386 go build -o ./bin/${BINARY}_${VERSION}_windows_386
	GOOS=windows GOARCH=amd64 go build -o ./bin/${BINARY}_${VERSION}_windows_amd64

plugin:
	GOOS=darwin GOARCH=amd64 go build -o ./bin/${PLUGIN}_${VERSION}_darwin_amd64 ./plugins/inputs/dnsmasq/dnsmasq.go
	GOOS=freebsd GOARCH=386 go build -o ./bin/${PLUGIN}_${VERSION}_freebsd_386 ./plugins/inputs/dnsmasq/dnsmasq.go
	GOOS=freebsd GOARCH=amd64 go build -o ./bin/${PLUGIN}_${VERSION}_freebsd_amd64 ./plugins/inputs/dnsmasq/dnsmasq.go
	GOOS=freebsd GOARCH=arm go build -o ./bin/${PLUGIN}_${VERSION}_freebsd_arm ./plugins/inputs/dnsmasq/dnsmasq.go
	GOOS=linux GOARCH=386 go build -o ./bin/${PLUGIN}_${VERSION}_linux_386 ./plugins/inputs/dnsmasq/dnsmasq.go
	GOOS=linux GOARCH=amd64 go build -o ./bin/${PLUGIN}_${VERSION}_linux_amd64 ./plugins/inputs/dnsmasq/dnsmasq.go
	GOOS=linux GOARCH=arm go build -o ./bin/${PLUGIN}_${VERSION}_linux_arm ./plugins/inputs/dnsmasq/dnsmasq.go
	GOOS=openbsd GOARCH=386 go build -o ./bin/${PLUGIN}_${VERSION}_openbsd_386 ./plugins/inputs/dnsmasq/dnsmasq.go
	GOOS=openbsd GOARCH=amd64 go build -o ./bin/${PLUGIN}_${VERSION}_openbsd_amd64 ./plugins/inputs/dnsmasq/dnsmasq.go
	GOOS=solaris GOARCH=amd64 go build -o ./bin/${PLUGIN}_${VERSION}_solaris_amd64 ./plugins/inputs/dnsmasq/dnsmasq.go
	GOOS=windows GOARCH=386 go build -o ./bin/${PLUGIN}_${VERSION}_windows_386 ./plugins/inputs/dnsmasq/dnsmasq.go
	GOOS=windows GOARCH=amd64 go build -o ./bin/${PLUGIN}_${VERSION}_windows_amd64 ./plugins/inputs/dnsmasq/dnsmasq.go

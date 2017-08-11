CERT_PATH=/fluentd/etc/cert
CERT_PASS=password
REPO=fluentd-secure

run: cert
	docker run --rm -v $(PWD)/cert:$(CERT_PATH) $(REPO)

build:
	docker build -t $(REPO) .

re-build:
	docker build --no-cache -t $(REPO) .

cert:
	docker run --rm -v $(PWD)/cert:$(CERT_PATH) $(REPO) secure-forward-ca-generate $(CERT_PATH) $(CERT_PASS)

clean:
	rm -rf $(PWD)/cert

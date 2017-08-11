HOST_ETC_PATH=$(PWD)/etc
ETC_PATH=/fluentd/etc
CERT_PATH=$(ETC_PATH)/cert
CERT_PASS=password
REPO=fluentd-secure

run: etc/cert
	docker run --rm \
		-p 24224:24224 -p 24224:24224/udp -p 24284:24284 \
		-v $(PWD)/log:/fluentd/log -v $(HOST_ETC_PATH):$(ETC_PATH) \
		$(REPO)

build:
	docker build -t $(REPO) .

re-build:
	docker build --no-cache -t $(REPO) .

etc/cert:
	docker run --rm -v $(HOST_ETC_PATH):$(ETC_PATH) $(REPO) secure-forward-ca-generate $(CERT_PATH) $(CERT_PASS)

clean:
	rm -rf $(HOST_ETC_PATH)/cert

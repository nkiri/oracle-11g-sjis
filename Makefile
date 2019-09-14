.PHONY: build
build:
	docker build --shm-size 1g -t nkiri/oracle/database:11.2.0.2-xe_sjis .

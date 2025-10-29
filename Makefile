BUF_CMD ?= buf

.PHONY: all
all:
ifndef service
	@echo "Usage:"
	@echo ""
	@echo "    make lint service={name}         检测{name}语法合法性"
	@echo "    make breaking service={name}     检测{name}破坏性改动"
	@echo "    make gen service={name}          为{name}生成Go语言目标代码"
	@echo ""
	@echo ""
endif

.PHONY: lint
lint:
ifndef service
	@echo "service empty"
	exit 1
endif
	$(BUF_CMD) lint $(service)

.PHONY: breaking
breaking:
ifndef service
	@echo "service empty"
	exit 1
endif
	cd $(service) && \
	$(BUF_CMD) breaking --against './../.git#branch=master,subdir=$(service)'

.PHONY: gen
gen:
ifndef service
	@echo "service empty"
	exit 1
endif
	$(BUF_CMD) generate $(service) -v
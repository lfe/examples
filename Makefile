PROJECT = lfeyawsdemo
ROOT_DIR = $(shell pwd)
REPO = $(shell git config --get remote.origin.url)
LOG_DIR = $(ROOT_DIR)/log
LFE_DIR = _build/default/lib/lfe
LFE = $(LFE_DIR)/bin/lfe
EBIN_DIRS = $(ERL_LIBS):$(shell rebar3 path -s:)

### >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
### General make targets
### >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

compile:
	@mkdir -p $(LOG_DIR)
	@rebar3 compile
	@make yaws

check:
	@rebar3 as test eunit

repl: compile
	@ERL_LIBS=$(EBIN_DIRS) $(LFE)

shell:
	@rebar3 shell

clean:
	@rebar3 clean
	@rm -rf ebin/* _build/default/lib/$(PROJECT)

clean-all: clean
	@rebar3 as dev lfe clean

### >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
### App make targets
### >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

YAWS_DIR = _build/default/lib/yaws
APP_DIR = $(ROOT_DIR)
YAWS_CFG_LOG = $(LOG_DIR)/yaws-configure-output.log
YAWS_MAKE_LOG = $(LOG_DIR)/yaws-make-output.log

$(YAWS_DIR)/configure:
	@mkdir -p $(LOG_DIR)
	@cd $(YAWS_DIR) && \
	autoreconf -fi > $(YAWS_CFG_LOG) && \
	./configure >> $(YAWS_CFG_LOG)

yaws: $(YAWS_DIR)/configure
	@cd $(YAWS_DIR) && make > $(YAWS_MAKE_LOG)

run: compile
	@$(YAWS_DIR)/bin/yaws -i \
	-pa `rebar3 path -s" -pa "` \
	--conf $(APP_DIR)/priv/etc/yaws.conf \
	--id $(PROJECT)

daemon: compile
	@$(YAWS_DIR)/bin/yaws \
	-pa `rebar3 path -s" -pa "` \
	-D --heart \
	--conf $(APP_DIR)/priv/etc/yaws.conf \
	--id $(PROJECT)

stop:
	@$(YAWS_DIR)/bin/yaws \
	-pa `rebar3 path -s" -pa "` \
	--stop --id $(PROJECT)

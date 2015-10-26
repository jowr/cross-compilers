
define make-goal
.PHONY : $1
$1 : base.stamp $1/Dockerfile $(wildcard $1/*.cmake) $(wildcard $1/*.mk) $(wildcard $1/*.sh)
	$(DOCKER) build -t $(IMAGE)-$1 $1
endef

DOCKER = docker
IMAGE = thewtex/cross-compiler

IMAGES = android-arm browser-asmjs darwin-x64 linux-x86 linux-x64 linux-armv6 linux-armv7 linux-ppc64le windows-x86 windows-x64

$(foreach IMG,$(IMAGES),$(eval $(call make-goal,$(IMG))))

base.stamp: Dockerfile
	$(DOCKER) build -t $(IMAGE)-base .
	touch base.stamp

all: base.stamp $(IMAGES)

.PHONY: all 

include ../../../adm/root.mk
include $(MFEXT_HOME)/share/package.mk

export NAME=tensorflow
export VERSION=1.14.0
export EXTENSION=tar.gz
export CHECKTYPE=MD5
export CHECKSUM=0fba23db45364ab9582abb0611fde738
DESCRIPTION=\
TENSORFLOW is An Open Source Machine Learning Framework for Everyone
WEBSITE=https://www.tensorflow.org
LICENSE=Apache License, Version 2.0

export PYTHON_BIN_PATH=$(which python)
export USE_DEFAULT_PYTHON_LIB_PATH=1
export TF_ENABLE_XLA=1
export TF_NEED_OPENCL_SYCL=0
export TF_NEED_ROCM=0
export TF_NEED_CUDA=0
export TF_DOWNLOAD_CLANG=0
export TF_NEED_MPI=0
export TF_SET_ANDROID_WORKSPACE=0
export CC_OPT_FLAGS="-mavx -msse4.2 -Wno-sign-compare"

GCC_VERSION = `gcc --version | head -1 | cut -d" " -f3 | cut -d"." -f1-2`
DEVTOOLSET = 7

ifeq ($(shell expr $(GCC_VERSION) \< "4.9" ), 1)

all:: $(PREFIX)/lib/python$(PYTHON3_SHORT_VERSION)/site-packages/$(NAME)-$(VERSION).dist-info
$(PREFIX)/lib/python$(PYTHON3_SHORT_VERSION)/site-packages/$(NAME)-$(VERSION).dist-info:
	echo "$(NAME)==$(VERSION)" > requirements3.txt
	$(MAKE) --file=$(MFEXT_HOME)/share/Makefile.standard download uncompress
	scl enable devtoolset-$(DEVTOOLSET) 'cd build/$(NAME)-$(VERSION) && ./configure && bazel build --config=opt //tensorflow/tools/pip_package:build_pip_package && ./bazel-bin/tensorflow/tools/pip_package/build_pip_package tensorflow.pkg'
	install_requirements $(PREFIX) requirements3.txt build/$(NAME)-$(VERSION)/tensorflow.pkg
	cat $(PREFIX)/lib/python$(PYTHON3_SHORT_VERSION)/site-packages/requirements3.txt requirements3.txt |sort |uniq> $(PREFIX)/lib/python$(PYTHON3_SHORT_VERSION)/site-packages/requirements3.tmp
	mv $(PREFIX)/lib/python$(PYTHON3_SHORT_VERSION)/site-packages/requirements3.tmp $(PREFIX)/lib/python$(PYTHON3_SHORT_VERSION)/site-packages/requirements3.txt
	_pip_package_to_yaml.sh $(NAME) $(PREFIX)/share/metwork_packages

else

all:: $(PREFIX)/lib/python$(PYTHON3_SHORT_VERSION)/site-packages/$(NAME)-$(VERSION).dist-info
	echo "$(NAME)==$(VERSION)" > requirements3.txt
$(PREFIX)/lib/python$(PYTHON3_SHORT_VERSION)/site-packages/$(NAME)-$(VERSION).dist-info:
	$(MAKE) --file=$(MFEXT_HOME)/share/Makefile.standard download uncompress
	cd build/$(NAME)-$(VERSION) && ./configure && bazel build --config=opt //tensorflow/tools/pip_package:build_pip_package && ./bazel-bin/tensorflow/tools/pip_package/build_pip_package tensorflow.pkg
	install_requirements $(PREFIX) requirements3.txt build/$(NAME)-$(VERSION)/tensorflow.pkg
	cat $(PREFIX)/lib/python$(PYTHON3_SHORT_VERSION)/site-packages/requirements3.txt requirements3.txt |sort |uniq> $(PREFIX)/lib/python$(PYTHON3_SHORT_VERSION)/site-packages/requirements3.tmp
	mv $(PREFIX)/lib/python$(PYTHON3_SHORT_VERSION)/site-packages/requirements3.tmp $(PREFIX)/lib/python$(PYTHON3_SHORT_VERSION)/site-packages/requirements3.txt
	_pip_package_to_yaml.sh $(NAME) $(PREFIX)/share/metwork_packages

endif
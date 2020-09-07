include ../../../adm/root.mk
include $(MFEXT_HOME)/share/package.mk

export NAME=tensorflow
export VERSION=2.3.0
export EXTENSION=tar.gz
export CHECKTYPE=MD5
export CHECKSUM=35516e67ad3c2136cc6cd21f7c911928
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
#BAZEL_LINK options to fix build with devtoolset-8
#See https://github.com/bazelbuild/bazel/issues/10327
export BAZEL_LINKOPTS=""
export BAZEL_LINKLIBS="-lstdc++:-lm"

all:: $(PREFIX)/lib/python$(PYTHON3_SHORT_VERSION)/site-packages/$(NAME)-$(VERSION).dist-info
$(PREFIX)/lib/python$(PYTHON3_SHORT_VERSION)/site-packages/$(NAME)-$(VERSION).dist-info:
	echo "$(NAME)==$(VERSION)" > requirements3.txt
	$(MAKE) --file=$(MFEXT_HOME)/share/Makefile.standard download uncompress
	cd build/$(NAME)-$(VERSION) && ./configure && bazel clean && bazel build --config=opt //tensorflow/tools/pip_package:build_pip_package && ./bazel-bin/tensorflow/tools/pip_package/build_pip_package tensorflow.pkg
	install_requirements $(PREFIX) requirements3.txt build/$(NAME)-$(VERSION)/tensorflow.pkg
	cat $(PREFIX)/lib/python$(PYTHON3_SHORT_VERSION)/site-packages/requirements3.txt requirements3.txt |sort |uniq> $(PREFIX)/lib/python$(PYTHON3_SHORT_VERSION)/site-packages/requirements3.tmp
	mv $(PREFIX)/lib/python$(PYTHON3_SHORT_VERSION)/site-packages/requirements3.tmp $(PREFIX)/lib/python$(PYTHON3_SHORT_VERSION)/site-packages/requirements3.txt
	_pip_package_to_yaml.sh $(NAME) $(PREFIX)/share/metwork_packages

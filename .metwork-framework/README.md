## What is it?

This module is a [mfext](https://github.com/metwork-framework/mfext) add-on which
provides machine learning/IA libraries for use in [MetWork Framework](http://metwork-framework.org) env.

**WARNING: this addon works only in CENTOS7 distribution**

## Provided layers

This add-on provides only one layer:

- `python3_ia@mfext` (machine learning/IA libraries for Python3)

## Provides useful packages

So, to install this add-on, you have to install:

- `metwork-mfext-layer-python3_ia` package

## Quickstart

```console

$ ##### As root user #####

$ # We install the Python3 IA layer
$ yum -y install metwork-mfext-layer-python3_ia


$ ##### As lambda user #####

$ # We load the mfext environment (if it is not already done)
$ . /opt/metwork-mfext/share/interactive_profile

$ # We check that the layer is installed and loaded
$ layers |grep ia
- (*) python3_ia@mfext [/opt/metwork-mfext/opt/python3_ia]

$ # Let's test
$ python
>>> import tensorflow
>>> # :-)
```


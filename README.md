[![logo](https://raw.githubusercontent.com/metwork-framework/resources/master/logos/metwork-white-logo-small.png)](http://www.metwork-framework.org)
# mfextaddon_python3_ia

[//]: # (automatically generated from https://github.com/metwork-framework/resources/blob/master/cookiecutter/_%7B%7Bcookiecutter.repo%7D%7D/README.md)

**Status (master branch)**



[![Drone CI](http://metwork-framework.org:8000/api/badges/metwork-framework/mfextaddon_python3_ia/status.svg)](http://metwork-framework.org:8000/metwork-framework/mfextaddon_python3_ia)
[![Maintenance](https://github.com/metwork-framework/resources/blob/master/badges/maintained.svg)]()
[![Gitter](https://github.com/metwork-framework/resources/blob/master/badges/community-en.svg)](https://gitter.im/metwork-framework/community-en?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)
[![Gitter](https://github.com/metwork-framework/resources/blob/master/badges/community-fr.svg)](https://gitter.im/metwork-framework/community-fr?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)


[//]: # (TABLE_OF_CONTENTS_PLACEHOLDER)

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








## Full list of components

| Name | Version | Layer |
| --- | --- | --- |
| [Keras-Applications](https://github.com/keras-team/keras-applications) | 1.0.8 | python3_ia |
| [Keras-Preprocessing](https://github.com/keras-team/keras-preprocessing) | 1.1.0 | python3_ia |
| [Keras](https://github.com/keras-team/keras) | 2.2.4 | python3_ia |
| [Markdown](https://Python-Markdown.github.io/) | 3.1.1 | python3_ia |
| [absl-py](https://github.com/abseil/abseil-py) | 0.7.1 | python3_ia |
| [astor](https://github.com/berkerpeksag/astor) | 0.8.0 | python3_ia |
| [certifi](https://certifi.io/) | 2019.3.9 | python3_ia |
| [gast](https://github.com/serge-sans-paille/gast/) | 0.2.2 | python3_ia |
| [google-pasta](https://pypi.org/project/google-pasta) | 0.1.7 | python3_ia |
| [grpcio](https://grpc.io) | 1.21.1 | python3_ia |
| [protobuf](https://developers.google.com/protocol-buffers/) | 3.8.0 | python3_ia |
| [tensorboard](https://github.com/tensorflow/tensorboard) | 1.14.0 | python3_ia |
| [tensorflow-estimator](https://www.tensorflow.org/) | 1.14.0 | python3_ia |
| [tensorflow](https://www.tensorflow.org/) | 1.14.0 | python3_ia |
| [termcolor](http://pypi.python.org/pypi/termcolor) | 1.1.0 | python3_ia |
| [wrapt](https://github.com/GrahamDumpleton/wrapt) | 1.11.2 | python3_ia |

*(16 components)*








## Reference documentation

- (for **master (development)** version), see [this dedicated site](http://metwork-framework.org/pub/metwork/continuous_integration/docs/master/mfextaddon_python3_ia/) for reference documentation.
- (for **latest released stable** version), see [this dedicated site](http://metwork-framework.org/pub/metwork/releases/docs/stable/mfextaddon_python3_ia/) for reference documentation.

For very specific use cases, you might be interested in
[reference documentation for integration branch](http://metwork-framework.org/pub/metwork/continuous_integration/docs/integration/mfextaddon_python3_ia/).

And if you are looking for an old released version, you can search [here](http://metwork-framework.org/pub/metwork/releases/docs/).



## Installation guide

See [this document](.metwork-framework/install_a_metwork_package.md).


## Configuration guide

See [this document](.metwork-framework/configure_a_metwork_package.md).



## Contributing guide

See [CONTRIBUTING.md](CONTRIBUTING.md) file.



## Code of Conduct

See [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) file.



## Sponsors

*(If you are officially paid to work on MetWork Framework, please contact us to add your company logo here!)*

[![logo](https://raw.githubusercontent.com/metwork-framework/resources/master/sponsors/meteofrance-small.jpeg)](http://www.meteofrance.com)

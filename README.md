# CommandBox Github Action

[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-CommandBox-blue.svg?colorA=24292e&colorB=0366d6&style=flat&longCache=true&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAM6wAADOsB5dZE0gAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAERSURBVCiRhZG/SsMxFEZPfsVJ61jbxaF0cRQRcRJ9hlYn30IHN/+9iquDCOIsblIrOjqKgy5aKoJQj4O3EEtbPwhJbr6Te28CmdSKeqzeqr0YbfVIrTBKakvtOl5dtTkK+v4HfA9PEyBFCY9AGVgCBLaBp1jPAyfAJ/AAdIEG0dNAiyP7+K1qIfMdonZic6+WJoBJvQlvuwDqcXadUuqPA1NKAlexbRTAIMvMOCjTbMwl1LtI/6KWJ5Q6rT6Ht1MA58AX8Apcqqt5r2qhrgAXQC3CZ6i1+KMd9TRu3MvA3aH/fFPnBodb6oe6HM8+lYHrGdRXW8M9bMZtPXUji69lmf5Cmamq7quNLFZXD9Rq7v0Bpc1o/tp0fisAAAAASUVORK5CYII=)](https://github.com/marketplace/actions/cf-server-command)

## Usage

### Basic Usage

This example will start up a Lucee5-based CFML server listening on port 2022:

```yml
steps:
  - uses: Ortus-Solutions/cf-server-action@v1
    with:
      imageTag: lucee5
      serverPort: 2022
```

See [all supported tags](https://hub.docker.com/r/ortussolutions/commandbox/tags?)

### Environment Variable Support

You can configure some CommandBox and CFConfig properties using environment variables:

```yml
steps:
  - uses: Ortus-Solutions/cf-server-action@v1
    with:
      imageTag: adobe2018
      serverPort: 9999
    env:
      BOX_CONFIG_VERBOSEERRORS: true
      BOX_CONFIG_NONINTERACTIVESHELL: true

      # Override server start settings
      BOX_SERVER_PROFILE: development
      BOX_SERVER_JVM_HEAPSIZE: 1024
      
      # Override CF engine settings with CFConfig
      CFCONFIG_ADMINPASSWORD: pass
      CFCONFIG_REQUESTTIMEOUT: 0,0,5,0
      CFCONFIG_LOGGERS_DEPLOY_LEVEL: trace
      
      # Install extensions in Lucee (which can include the CLI)
      LUCEE_EXTENSIONS: <GUID>
```

For more info, read:

* [CommandBox Docker Image Environment Variables](https://commandbox.ortusbooks.com/deploying-commandbox/docker#environment-variables)
* [CFConfig Environment Variables](https://cfconfig.ortusbooks.com/using-the-cli/env-var-overrides)

## Arguments

* `imageTag` - The CommandBox server to use. For example, `lucee@5.3.8`.
* `serverPort` - Port for the CommandBox container to listen on. This is NOT the same as the server.json port.

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)

## Code of Conduct

> :book: Do unto others as you would have them do to you - [Matthew 7:12](https://www.biblegateway.com/passage/?search=matthew+7%3A12&version=NIV)
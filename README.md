# wvci

The repository contains the source code of the docker image. Designed to automate the creation of documentation for cable assemblies.

I do not guarantee the functionality and backward compatibility of the pipeline. I support it for my processes.

Examples of usage can be found in repository [wvci-example](https://github.com/MuratovAS/wvci-example).

A detailed description of my interaction processes can be found here

I work with two platforms `github`, `gitea`

## Features

- `wireviz-build` - compilation of `wireviz` file into `html`,`png`

## Usage

### Local

To run a container in the local environment, run the command:

```shell
docker run --rm -it --entrypoint "/scripts/wvMake.sh" --workdir "/work" -v $PWD:/work  ghcr.io/muratovas/wvci:latest 
```

`--env PRJ_VERSION="git` - Adds a document version to the output drawing, if no value is specified the commit hash is used as the version.

`--env OUTPUT_DIR="build"` - Directory for output files

`arg` - By default, the system generates a blueprint for the files changed in the last commit. You can specify the desired files as an argument.

> [!WARNING]
> 
> The document version is written by replacing the line (`vV.V.V-VVV`) in the source file. See example

### Action

No special settings are required. See example [wvci-example](https://github.com/MuratovAS/wvci-example).

## Description of versioning

Notation: vA.B.C

Where:

- A - MINOR version `wireviz`

- B - PATCH version `wireviz`

- C - Edition number `wvci`

I recommend specifying the exact version of the docker image in the pipeline.

## Changelog:

### v4.1.0

- init
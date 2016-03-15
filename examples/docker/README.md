---
# Bash Image for Shell Examples
---
### Summary
To simplify the running of the bash shell examples, the Dockerfile will build an Ubuntu 14.04 image.

### Basic Usage
Build the docker image, e.g. `sudo docker build -t basistech/shell:1.1 .`

Run an example as `sudo docker run -e FILENAME=example-file.sh -e API_KEY=api-key -v "path-to-example-file:/source" basistech/shell:1.1`

To run all of the examples in a directory, from the source directory, don't provide the `-e FILENAME=` option or:

`find -maxdepth 1 -name "*.cs" -print -exec sudo run -e FILENAME={} -e API_KEY=api-key -v "path-to-example-source:/source" basistech/mono:1.1 \;`

To test against an alternate url, add `-e ALT_URL=alternate_url` before the `-v`

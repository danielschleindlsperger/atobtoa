# atobtoa

Read: a to b to a

`atob` and ´btoa´ utilities to convert base64 encoded ASCII text to binary and vice versa.

## Development

The tool has been written in [Janet](https://janet-lang.org) which outputs small executables that are fast to start up.

### Useful commands

```sh
janet ./atob "aGVsbG8="
janet ./btoa "hello" 
jpm build
jpm test
jpm run testw # run tests in watch mode
```

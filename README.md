# Kandan Docker container

## Install Docker

Install docker and dvm

```bash
# Install Docker Mac binary
$ brew tap homebrew/binary
$ brew install docker

# Install dvm
$ brew tap fnichol/dvm
$ brew install dvm
```

```bash
$ dvm up
$ eval "$(dvm env)"
$ echo << 'EOF' >> ~/.bashrc
if [ -f "$(which dvm)" ]; then
  eval "$(dvm env)"
fi
EOF
```

## Usage

```bash
$ docker build -t mainya/kandan .
$ docker run -d -p 3000:3000 mainya/kandan
```

you can edit db server on run.sh.

```bash
export DATABASE_USERNAME=""
export DATABASE_PASSWORD=""
export DATABASE_HOST=""
export DATABASE_PORT=""
```


## Reference

https://github.com/kandanapp/kandan
http://kandanapp.com/

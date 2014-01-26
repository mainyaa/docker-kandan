# Kandan Docker container

## Requirement(Mac)

Install docker client by Homebrew

```
$ brew bundle
```

Run Vagrant VM

```
$ dvm up
```

Set host for docker deamon (Note: IP and PORT can be modified in Vagrantfile, `DOCKER_URL` and `DOCKER_PORT`)

```
$ eval "$(dvm env)"
$ echo << 'EOF' >> ~/.bashrc
if [ -f "$(which dvm)" ]; then
  eval "$(dvm env)"
fi
```

## Usage

```
$ docker build -t mainya/kandan .
$ docker run -d -p 3000:3000 mainya/kandan
```


## Reference

- [Introducing dvm - Docker in a box for Unsupported Platforms, like the Mac](http://hw-ops.com/blog/2014/01/07/introducing-dvm-docker-in-a-box-for-unsupported-platforms/)

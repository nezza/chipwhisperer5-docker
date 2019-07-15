# chipwhisperer5-docker
A dockerized chipwhisperer 5 for easy installation.

## Disclaimer

This is alpha software. This docker image is running in privileged mode and can pwn the host machine.

The dockerized chipwhisperer should only be run on a trusted machine. The password to Jupyter is currently passed in cleartext via the environment. Also note that the default `run.sh` exposes the Jupyter notebook on the network, and not just locally. The notebook is also served via *HTTP*, so authentication tokens are sent *unencrypted*.

## Install

To install, simply copy and load the newae udev rules and build the docker image:

```
sudo cp 99-newae.rules /etc/udev/rules.d
sudo udevadm control --reload-rules
docker build -t cw5 .
```

## Run

To run, simply run `run.sh` with a supplied authentication token and a directory that should be used as the workspace. Make sure that you supply an *absolute* path.

```
./run.sh testpassword /home/chipwhisperer/chipwhisperer
```

## Use

The Jupyter Notebook should then be running on port 8080. You can visit it by simply going to

http://127.0.0.1:8888/

## Full installation example:

```
sudo cp 99-newae.rules /etc/udev/rules.d
sudo udevadm control --reload-rules
docker build -t cw5 .

# Clone example projects
git clone --recursive https://github.com/newaetech/chipwhisperer.git
./run.sh testpassword ${PWD}/chipwhisperer

# Now go to http://127.0.0.1:8888/ in a browser!
```

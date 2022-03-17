# Elastic APM Workshop AMI for Strigo

## Packer Setup for Strigo

To build an AWS AMI for [Strigo](https://strigo.io), use [Packer](https://packer.io). Build the AMI with `packer build packer.json` and set up the training class on Strigo with the generated AMI and the user `ubuntu`.

If things are failing for some reason: Run `packer build -debug packer.yml`, which will keep the instance running and save the SSH key in the current directory. Connect to it with `ssh -i ec2_amazon-ebs.pem ubuntu@ec2-X-X-X-X.eu-central-1.compute.amazonaws.com`; open ports as needed in the AWS Console since the instance will only open TCP/22 by default.

## Configuration

The base image is [Canonical, Ubuntu, 18.04 LTS, amd64 bionic image build on 2020-01-12](https://eu-central-1.console.aws.amazon.com/ec2/v2/home?region=eu-central-1#ImageDetails:imageId=ami-0b418580298265d5c) and is configured using the `setup.sh` script.

The AMI image is shared by default with the Strigo account as specified by [their documentation](http://help.strigo.io/en/articles/1941452-use-custom-lab-images).


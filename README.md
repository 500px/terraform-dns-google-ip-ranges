# Google CIDR Range Terraform module

[![CircleCI](https://img.shields.io/circleci/project/github/chadasapp/terraform-dns-google-ip-ranges.svg)](https://circleci.com/gh/chadasapp/terraform-dns-google-ip-ranges)
[![MIT License](https://img.shields.io/github/license/chadasapp/terraform-dns-google-ip-ranges.svg)](http://choosealicense.com/licenses/mit)
[![Github Issues](https://img.shields.io/github/issues/chadasapp/terraform-dns-google-ip-ranges.svg)](https://github.com/chadasapp/terraform-dns-google-ip-ranges/issues)
[![Terraform Registry](https://img.shields.io/badge/%E2%A0%AA-Terraform_Registry-blue.svg)](https://registry.terraform.io/modules/chadasapp/google-ip-ranges/dns)

This module queries Google's published CIDR ranges from TXT records attached to several `_netblock*.google.com` domains. This is the [documented process](https://support.google.com/a/answer/60764?hl=en) for doing so specifically for outbound SMTP for SPF records, but contains the helpful note that those ranges are utilized for _all_ GSuite services.

Basically we take those records, strip out the data we don't want, extract the IPv4 and IPv6 CIDR ranges and return them. Great for AWS Security Groups where you want to whitelist incoming GSuite traffic but don't want to maintain a whitelist by hand.

## Usage

```hcl
module "google_ip_ranges" {
  source = "github.com/ASAPPinc/terraform-google-ip-ranges?ref=v0.0.1"
}

resource "aws_security_group" "example" {
    name   = "allow-google-smtp"
    vpc_id = "vpc-12345"
    description = "Allow inbound SMTP traffic from Google services."

    ingress {
        protocol    = "tcp"
        from_port   = 25
        to_port     = 25
        cidr_blocks = ["${module.google_ip_ranges.all_cidrs}"]
    }
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| google_netblock_domains | The domains under which Google publishes their CIDR ranges as TXT records. You probably won't need to modify this. | list |  `_netblocks.google.com`, `_netblocks2.google.com`, `_netblocks3.google.com` | no |

## Outputs

| Name | Description |
|------|-------------|
| ipv4_cidrs | The IPv4 CIDR ranges returned from Google |
| ipv6_cidrs | The IPv6 CIDR ranges returned from Google |
| all_cidrs | IPv4 and IPv6 CIDR ranges combined |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

* [Chad Horohoe](https://github.com/chadasapp)

## License

MIT licensed. See LICENSE for full details.

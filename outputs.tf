output "ipv4_cidrs" {
  value = "${local.ipv4_google_netblocks}"
}

output "ipv6_cidrs" {
  value = "${local.ipv6_google_netblocks}"
}

output "all_cidrs" {
  value = "${concat(local.ipv4_google_netblocks, local.ipv6_google_netblocks)}"
}

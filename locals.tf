locals {
  all_google_netblocks   = "${join(" ", data.dns_txt_record_set.google_netblock.*.record)}"
  clean_google_netblocks = "${replace(replace(local.all_google_netblocks, "~all", ""), "v=spf1", "")}"
  ipv4_google_netblocks  = "${compact(split(" ", replace(replace(local.clean_google_netblocks,
                              "/ip6:[a-f0-9:/]+ /", ""), "ip4:", "")))}"

  ipv6_google_netblocks = "${compact(split(" ", replace(replace(local.clean_google_netblocks,
                              "/ip4:[0-9./]+ /", ""), "ip6:", "")))}"
}

variable "google_netblock_domains" {
  type        = "list"
  description = "The domains under which Google publishes their CIDR ranges as TXT records. You probably won't need to modify this."

  default = [
    "_netblocks.google.com",
    "_netblocks2.google.com",
    "_netblocks3.google.com",
  ]
}

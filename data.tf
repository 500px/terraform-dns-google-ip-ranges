data "dns_txt_record_set" "google_netblock" {
  count = "${length(var.google_netblock_domains)}"
  host  = "${element(var.google_netblock_domains, count.index)}"
}

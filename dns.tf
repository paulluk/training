provider "dnsimple" {
  token   = "fake"
  account = "fake"
}

resource "dnsimple_record" "example" {
  domain = "fake.domain"
  name   = ""
  value  = "${aws_instance.web.0.public_ip}"
  type   = "A"
  ttl    = 3600
# Alternatively
# value = "${element(aws_instance.web.*.public_ip, 0)}"
}


resource "aws_s3_bucket" "bucket" {

    tags {
        env = "${var.env}"
        group = "${var.group}"
        hostnames = "${element(var.bucketname, count.index)}"
        "aetn:s3securitytemplate" = "testmodule"
        "aetn:env" = "${var.env}"
        "aetn:group" = "${var.group}"
        "aetn:dataConsumer" = "fastly"
        "aetn:cdn" = "${var.group == "sre" ? "fastly" : "akamai" }"
        "aetn:dataOrigin" = "dev-EC2-App"
      }

}

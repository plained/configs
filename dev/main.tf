terraform {
  backend "s3" {
      bucket = "tf-sre-pled-com"
      profile    = "vs-terraform"
      key    = "s3/myorg/dev-myorg.tfstate"
      region = "us-east-1"
  }
}

provider "aws" {
  profile    = "vs-terraform"
  region     = "us-east-1"
}


resource "aws_s3_bucket" "bucket" {
  count = "${length(var.bucketname)}"
  bucket = "${element(var.bucketname, count.index)}"
  tags {
    env = "${var.env}"
    group = "${var.group}"
    hostnames = "${element(var.bucketname, count.index)}"
    "aetn:s3securitytemplate" = "testmodule"
    "aetn:env" = "${var.env}"
    "aetn:group" = "${var.group}"
    "aetn:dataConsumer" = "fastly"
    "aetn:cdn" = "${var.group == "sre" ? "fastly" : "akamai" }"
    "aetn:dataOrigin" = "${var.dataOrigin}"
  }


  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "${var.sse_algorithm}"
      }
    }
  }

}






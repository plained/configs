variable "shortDescription" {
  description = "The name of the application for which the bucket has to be created"
  default = ""
}

variable "acl" {
  description = "The acl permission that has to be applied on the bucket"
  default = "private"
}

variable "env" {
  description = "The application environment for which the bucket is created"
  default = "dev"
}

variable "group" {
  description = "The application group"
}

variable "loggingBucket" {
  description = "The bucket to which S3 access logs is pushed"
  default = "audit-bucket"
}

variable "domain" {
  description = "The domain to which the buckets belong to"
  default = "myorg-com"
}

variable "bucketGroup" {
  description = "The bucket name group"
  default = ""
}

variable "bucketname" {
  type = "list"
  description = "The bucket name "
}

variable "dataOrigin" {
  description = "The data origin "
  default = "EC2"
}

variable "sse_algorithm" {
  description = "The Encryption Method "
  default = "AES256"
}


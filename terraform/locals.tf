# Put derived values here

locals {

  azs = slice(data.aws_availability_zones.available.names, 0, 3)

  public_subnets = [
    for i in range(length(local.azs)) : cidrsubnet("10.0.0.0/16", 8, i)
  ]

  private_subnets = [
    for i in range(length(local.azs)) : cidrsubnet("10.0.0.0/16", 8, i + 100)
  ]

}
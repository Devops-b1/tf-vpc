provider "aws" {
    region = "us-east-1"
    profile = "pankaj"
    
}


//terraform {
//  backend "s3" {
//    bucket   = "pankaj-tf-state"
//    key      = "terraform.tfstate"
//    region   = "us-east-1"
//
//    skip_region_validation      = true
//    skip_credentials_validation = true
//    skip_metadata_api_check     = true
//
//  }
//}
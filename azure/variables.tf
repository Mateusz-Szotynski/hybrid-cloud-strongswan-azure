variable "tenant_id" {
  default = ""    #Enter tenant id
}

variable "subscription_id" {
  default = ""      #Enter subscription id
}

variable "public_ip_address" {
  default = ""                              #If fqdn is not set you can just provide public ip address of a gateway
}

variable "private_fqdn" {
  default = ""   #Provide fqdn for gateway if you have
}

variable "PSK" {
  default = ""        #Create your own shared key
}

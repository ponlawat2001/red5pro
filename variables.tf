variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "red5pro-standalone"
  validation {
    condition     = length(var.name) > 0
    error_message = "The name value must be a valid! Example: example-name"
  }
}
variable "type" {
  description = "Type of deployment: standalone, cluster, autoscale"
  type        = string
  default     = "standalone"
  validation {
    condition     = var.type == "standalone" || var.type == "cluster" || var.type == "autoscale"
    error_message = "The type value must be a valid! Example: standalone, cluster, autoscale"
  }
}
variable "path_to_red5pro_build" {
  description = "Path to the Red5 Pro build zip file, absolute path or relative path. https://account.red5.net/downloads. Example: /home/ubuntu/terraform-aws-red5pro/red5pro-server-0.0.0.b0-release.zip"
  type        = string
  default     = "/Users/ponlawatchatkaew/Documents/Terraform/red5pro-server-0.0.0.b0-release.zip"
}
variable "aws_region" {
  description = "AWS region to deploy the resources"
  type        = string
  default     = "" 
  # Use CLI or environment variable to set the region 
}
variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  default     = ""
}
variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  default     = ""
}

# SSH key configuration
variable "ssh_key_use_existing" {
  description = "Use existing SSH key pair or create a new one. true = use existing, false = create new"
  type        = bool
  default     = false
}
variable "ssh_key_name_existing" {
  description = "SSH key name existing in AWS"
  type        = string
  default     = ""
}
variable "ssh_key_private_key_path_existing" {
  description = "SSH private key path existing in local machine"
  type        = string
  default     = ""
}
# VPC configuration
variable "vpc_use_existing" {
  description = "Use existing VPC or create a new one. true = use existing, false = create new"
  type        = bool
  default     = false
}
variable "vpc_id_existing" {
  description = "VPC ID, this VPC should have minimum 2 public subnets."
  type        = string
  default     = "vpc-12345"
  validation {
    condition     = length(var.vpc_id_existing) > 4 && substr(var.vpc_id_existing, 0, 4) == "vpc-"
    error_message = "The vpc_id_existing value must be a valid! Example: vpc-12345"
  }
}

# Elastic IP configuration for Stream Manager 2.0
variable "stream_manager_elastic_ip_use_existing" {
  description = "Stream Manager 2.0 -  Use existing elastic IP or create a new one. true = use existing, false = create new"
  type        = bool
  default     = false
}
variable "stream_manager_elastic_ip_existing" {
  description = "Stream Manager 2.0 - Elastic IP Existing"
  type        = string
  default     = "1.2.3.4"
}

# Elastic IP configuration for Kafka
variable "standalone_elastic_ip_use_existing" {
  description = "Standalone Red5 Pro - Use existing elastic IP or create a new one. true = use existing, false = create new"
  type        = bool
  default     = false
}
variable "standalone_elastic_ip_existing" {
  description = "Standalone Red5 Pro - Elastic IP Existing"
  type        = string
  default     = "1.2.3.4"
}

# Red5 Pro standalone server configuration
variable "standalone_instance_type" {
  description = "Red5 Pro standalone server instance type"
  type        = string
  default     = "t3.medium"
}
variable "standalone_volume_size" {
  description = "Red5 Pro standalone server volume size"
  type        = number
  default     = 16
  validation {
    condition     = var.standalone_volume_size >= 8
    error_message = "The standalone_volume_size value must be a valid! Minimum 8"
  }
}
variable "standalone_red5pro_inspector_enable" {
  description = "Red5 Pro standalone server Inspector enable/disable (https://www.red5.net/docs/troubleshooting/inspector/overview/)"
  type        = bool
  default     = false
}
variable "standalone_red5pro_restreamer_enable" {
  description = "Red5 Pro standalone server Restreamer enable/disable (https://www.red5.net/docs/special/restreamer/overview/)"
  type        = bool
  default     = false
}
variable "standalone_red5pro_socialpusher_enable" {
  description = "Red5 Pro standalone server SocialPusher enable/disable (https://www.red5.net/docs/special/social-media-plugin/rest-api/)"
  type        = bool
  default     = false
}
variable "standalone_red5pro_suppressor_enable" {
  description = "Red5 Pro standalone server Suppressor enable"
  type        = bool
  default     = false
}
variable "standalone_red5pro_hls_enable" {
  description = "Red5 Pro standalone server HLS enable/disable (https://www.red5.net/docs/protocols/hls-plugin/overview/)"
  type        = bool
  default     = false
}
variable "standalone_red5pro_hls_output_format" {
  description = "Red5 Pro standalone server - HLS output format. Options: TS, FMP4, SMP4"
  type        = string
  default     = "TS"
}
variable "standalone_red5pro_hls_dvr_playlist" {
  description = "Red5 Pro standalone server - HLS DVR playlist"
  type        = string
  default     = "false"
}
variable "standalone_red5pro_webhooks_enable" {
  description = "Red5 Pro standalone server Webhooks enable/disable (https://www.red5.net/docs/special/webhooks/overview/)"
  type        = bool
  default     = false
}
variable "standalone_red5pro_webhooks_endpoint" {
  description = "Red5 Pro standalone server Webhooks endpoint"
  type        = string
  default     = ""
}
variable "standalone_red5pro_round_trip_auth_enable" {
  description = "Round trip authentication on the red5pro server enable/disable - Auth server should be deployed separately (https://www.red5.net/docs/special/round-trip-auth/overview/)"
  type        = bool
  default     = false
}
variable "standalone_red5pro_round_trip_auth_host" {
  description = "Round trip authentication server host"
  type        = string
  default     = ""
}
variable "standalone_red5pro_round_trip_auth_port" {
  description = "Round trip authentication server port"
  type        = number
  default     = 3000
}
variable "standalone_red5pro_round_trip_auth_protocol" {
  description = "Round trip authentication server protocol"
  type        = string
  default     = "http"
}
variable "standalone_red5pro_round_trip_auth_endpoint_validate" {
  description = "Round trip authentication server endpoint for validate"
  type        = string
  default     = "/validateCredentials"
}
variable "standalone_red5pro_round_trip_auth_endpoint_invalidate" {
  description = "Round trip authentication server endpoint for invalidate"
  type        = string
  default     = "/invalidateCredentials"
}
variable "standalone_red5pro_cloudstorage_enable" {
  description = "Red5 Pro server cloud storage enable/disable (https://www.red5.net/docs/special/cloudstorage-plugin/aws-s3-cloud-storage/)"
  type        = bool
  default     = false
}
variable "standalone_red5pro_cloudstorage_aws_access_key" {
  description = "Red5 Pro server cloud storage - AWS access key (S3 Bucket)"
  type        = string
  default     = ""
}
variable "standalone_red5pro_cloudstorage_aws_secret_key" {
  description = "Red5 Pro server cloud storage - AWS secret key (S3 Bucket)"
  type        = string
  default     = ""
}
variable "standalone_red5pro_cloudstorage_aws_bucket_name" {
  description = "Red5 Pro server cloud storage - AWS bucket name (S3 Bucket)"
  type        = string
  default     = ""
}
variable "standalone_red5pro_cloudstorage_aws_region" {
  description = "Red5 Pro server cloud storage - AWS region (S3 Bucket)"
  type        = string
  default     = ""
}
variable "standalone_red5pro_cloudstorage_postprocessor_enable" {
  description = "Red5 Pro server cloud storage - enable/disable Red5 Pro server postprocessor (https://www.red5.net/docs/special/cloudstorage-plugin/server-configuration/)"
  type        = bool
  default     = false
}
variable "standalone_red5pro_cloudstorage_aws_bucket_acl_policy" {
  description = "Red5 Pro server cloud storage - AWS bucket ACL policy (S3 Bucket). Example: none, public-read, authenticated-read, private, public-read-write"
  type        = string
  default     = "public-read"
}
variable "standalone_red5pro_stream_auto_record_enable" {
  description = "Red5 Pro server - enable/disable broadcast stream auto record"
  type        = bool
  default     = false
}
variable "standalone_red5pro_coturn_enable" {
  description = "Red5Pro server customized Coturn configuration"
  type        = bool
  default     = false
}
variable "standalone_red5pro_coturn_address" {
  description = "Red5Pro server customized Coturn address. Example: stun:1.2.3.4:3478"
  type        = string
  default     = ""
}
variable "standalone_red5pro_efs_enable" {
  description = "Red5 Pro server enable/disable EFS mount to record streams"
  type        = bool
  default     = false
}
variable "standalone_red5pro_efs_dns_name" {
  description = "Red5 Pro server EFS DNS name"
  type        = string
  default     = ""
}
variable "standalone_red5pro_efs_mount_point" {
  description = "Red5 Pro server EFS mount point"
  type        = string
  default     = "/usr/local/red5pro/webapps/live/streams"
}
variable "standalone_red5pro_brew_mixer_enable" {
  description = "Red5 Pro server enable/disable brew mixer"
  type        = bool
  default     = false
}
# kafka configuration
variable "kafka_standalone_instance_create" {
  description = "Create a new Kafka standalone instance true/false"
  type        = bool
  default     = false
}
variable "kafka_standalone_instance_type" {
  description = "kafka instance type"
  type        = string
  default     = "t3.medium"
}
variable "kafka_standalone_volume_size" {
  description = "value to set the volume size for kafka"
  type        = number
  default     = 24
  validation {
    condition     = var.kafka_standalone_volume_size >= 8
    error_message = "The kafka_standalone_volume_size value must be a valid! Minimum 8"
  }
}
variable "kafka_standalone_instance_arhive_url" {
  description = "Kafka standalone instance - archive URL"
  type        = string
  default     = "https://downloads.apache.org/kafka/3.8.0/kafka_2.13-3.8.0.tgz"
}

# HTTPS/SSL variables for standalone/cluster
variable "https_ssl_certificate" {
  description = "Enable SSL (HTTPS) on the Standalone Red5 Pro server,  Stream Manager 2.0 server or Stream Manager 2.0 Load Balancer"
  type        = string
  default     = "letsencrypt"
  validation {
    condition     = var.https_ssl_certificate == "none" || var.https_ssl_certificate == "letsencrypt" || var.https_ssl_certificate == "imported" || var.https_ssl_certificate == "existing"
    error_message = "The https_ssl_certificate value must be a valid! Example: none, letsencrypt, imported"
  }
}
variable "https_ssl_certificate_domain_name" {
  description = "Domain name for SSL certificate (letsencrypt/imported/existing)"
  type        = string
  default     = "red5pro.prydetv-th.live"
}
variable "https_ssl_certificate_email" {
  description = "Email for SSL certificate (letsencrypt)"
  type        = string
  default     = "developer@pryde-tv.com"
}
variable "https_ssl_certificate_cert_path" {
  description = "Path to public certificate file (imported)"
  type        = string
  default     = ""
}
variable "https_ssl_certificate_fullchain_path" {
  description = "Path to certificate chain file (imported)"
  type        = string
  default     = ""
}
variable "https_ssl_certificate_key_path" {
  description = "Path to SSL key (imported)"
  type        = string
  default     = ""
}
# HTTPS/SSL variables for autoscaling
variable "stream_manager_instance_type" {
  description = "value to set the instance type for stream manager"
  type        = string
  default     = "t3.xlarge"
}
variable "stream_manager_volume_size" {
  description = "value to set the volume size for stream manager"
  type        = number
  default     = 24
  validation {
    condition     = var.stream_manager_volume_size >= 8
    error_message = "The stream_manager_volume_size value must be a valid! Minimum 8"
  }
}
variable "stream_manager_autoscaling_desired_capacity" {
  description = "value to set the desired capacity for stream manager autoscale"
  type        = number
  default     = 1
}
variable "stream_manager_autoscaling_minimum_capacity" {
  description = "value to set the minimum capacity for stream manager autoscale"
  type        = number
  default     = 1
}
variable "stream_manager_autoscaling_maximum_capacity" {
  description = "value to set the maximum capacity for stream manager autoscale"
  type        = number
  default     = 1
}
variable "stream_manager_auth_user" {
  description = "value to set the user name for Stream Manager 2.0 authentication"
  type        = string
  default     = ""
}
variable "stream_manager_auth_password" {
  description = "value to set the user password for Stream Manager 2.0 authentication"
  type        = string
  default     = ""
}
# Red5 Pro general configuration
variable "red5pro_license_key" {
  description = "Red5 Pro license key (https://www.red5.net/docs/installation/installation/license-key/)"
  type        = string
  default     = "6NEN-V4W6-1NT7-H6KM"
}
variable "red5pro_api_enable" {
  description = "Red5 Pro Server API enable/disable (https://www.red5.net/docs/development/api/overview/)"
  type        = bool
  default     = true
}
variable "red5pro_api_key" {
  description = "Red5 Pro standalone server API key"
  type        = string
  default     = "prydetv-th_red5pro"
}

# Red5 Pro Node image configuration
variable "node_image_create" {
  description = "Create new Node image true/false"
  type        = bool
  default     = false
}
variable "node_image_instance_type" {
  description = "Node image - instance type"
  type        = string
  default     = "t3.medium"
}
variable "node_image_volume_size" {
  description = "Node image - volume size"
  type        = number
  default     = 8
  validation {
    condition     = var.node_image_volume_size >= 8
    error_message = "The node_image_volume_size value must be a valid! Minimum 8"
  }
}

# General configuration
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.5.0.0/16"
}
variable "vpc_public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = ["10.5.0.0/22", "10.5.4.0/22", "10.5.8.0/22", "10.5.12.0/22", "10.5.16.0/22", "10.5.20.0/22", "10.5.24.0/22", "10.5.28.0/22", "10.5.32.0/22", "10.5.36.0/22", "10.5.40.0/22", "10.5.44.0/22"]
}

variable "security_group_stream_manager_ingress" {
  description = "Security group for Stream Managers - ingress"
  type = list(object({
    description     = string
    from_port       = string
    to_port         = string
    protocol        = string
    cidr_block      = string
    ipv6_cidr_block = string
  }))
  default = [
    {
      description     = "SSH"
      from_port       = "22"
      to_port         = "22"
      protocol        = "tcp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
    {
      description     = "HTTP"
      from_port       = "80"
      to_port         = "80"
      protocol        = "tcp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
    {
      description     = "HTTPS"
      from_port       = "443"
      to_port         = "443"
      protocol        = "tcp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
    {
      description     = "Kafka"
      from_port       = "9092"
      to_port         = "9092"
      protocol        = "tcp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
  ]
}

variable "security_group_stream_manager_egress" {
  description = "Security group for Stream Managers - egress"
  type = list(object({
    description     = string
    from_port       = string
    to_port         = string
    protocol        = string
    cidr_block      = string
    ipv6_cidr_block = string
  }))
  default = [
    {
      description     = "All egress traffic"
      from_port       = "-1"
      to_port         = "-1"
      protocol        = "-1"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
  ]
}

variable "security_group_kafka_ingress" {
  description = "Security group for Kafka standalone instance - ingress"
  type = list(object({
    description     = string
    from_port       = string
    to_port         = string
    protocol        = string
    cidr_block      = string
    ipv6_cidr_block = string
  }))
  default = [
    {
      description     = "SSH"
      from_port       = "22"
      to_port         = "22"
      protocol        = "tcp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
    {
      description     = "Kafka"
      from_port       = "9092"
      to_port         = "9092"
      protocol        = "tcp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
  ]
}

variable "security_group_kafka_egress" {
  description = "Security group for Kafka standalone instance - egress"
  type = list(object({
    description     = string
    from_port       = string
    to_port         = string
    protocol        = string
    cidr_block      = string
    ipv6_cidr_block = string
  }))
  default = [
    {
      description     = "All egress traffic"
      from_port       = "-1"
      to_port         = "-1"
      protocol        = "-1"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
  ]
}

variable "security_group_node_ingress" {
  description = "Security group for Node - ingress"
  type = list(object({
    description     = string
    from_port       = string
    to_port         = string
    protocol        = string
    cidr_block      = string
    ipv6_cidr_block = string
  }))
  default = [
    {
      description     = "SSH"
      from_port       = "22"
      to_port         = "22"
      protocol        = "tcp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
    {
      description     = "HTTP"
      from_port       = "5080"
      to_port         = "5080"
      protocol        = "tcp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
    {
      description     = "RTMP (TCP)"
      from_port       = "1935"
      to_port         = "1935"
      protocol        = "tcp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
    {
      description     = "RTMPS (TCP)"
      from_port       = "1936"
      to_port         = "1936"
      protocol        = "tcp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
    {
      description     = "Restreamer, SRT (TCP)"
      from_port       = "8000"
      to_port         = "8100"
      protocol        = "tcp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
    {
      description     = "RTSP (TCP)"
      from_port       = "8554"
      to_port         = "8554"
      protocol        = "tcp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
    {
      description     = "Restreamer, SRT (UDP)"
      from_port       = "8000"
      to_port         = "8100"
      protocol        = "udp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
    {
      description     = "WebRTC (UDP)"
      from_port       = "40000"
      to_port         = "65535"
      protocol        = "udp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
  ]
}

variable "security_group_node_egress" {
  description = "Security group for Node - egress"
  type = list(object({
    description     = string
    from_port       = string
    to_port         = string
    protocol        = string
    cidr_block      = string
    ipv6_cidr_block = string
  }))
  default = [
    {
      description     = "All egress traffic"
      from_port       = "-1"
      to_port         = "-1"
      protocol        = "-1"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
  ]
}

variable "security_group_standalone_ingress" {
  description = "Security group for standalone Red5Pro server  - ingress"
  type = list(object({
    description     = string
    from_port       = string
    to_port         = string
    protocol        = string
    cidr_block      = string
    ipv6_cidr_block = string
  }))
  default = [
    {
      description     = "SSH"
      from_port       = "22"
      to_port         = "22"
      protocol        = "tcp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
    {
      description     = "HTTP"
      from_port       = "5080"
      to_port         = "5080"
      protocol        = "tcp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
    {
      description     = "HTTPS"
      from_port       = "443"
      to_port         = "443"
      protocol        = "tcp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
    {
      description     = "RTMPS (TCP)"
      from_port       = "1936"
      to_port         = "1936"
      protocol        = "tcp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
    {
      description     = "RTSP (TCP)"
      from_port       = "8554"
      to_port         = "8554"
      protocol        = "tcp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
    {
      description     = "Restreamer, SRT (TCP)"
      from_port       = "8000"
      to_port         = "8100"
      protocol        = "tcp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
    {
      description     = "RTMP (TCP)"
      from_port       = "1935"
      to_port         = "1935"
      protocol        = "tcp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
    {
      description     = "Restreamer, SRT (UDP)"
      from_port       = "8000"
      to_port         = "8001"
      protocol        = "udp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
    {
      description     = "WebRTC (UDP)"
      from_port       = "40000"
      to_port         = "65535"
      protocol        = "udp"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    }
  ]
}

variable "security_group_standalone_egress" {
  description = "Security group for standalone Red5Pro server - egress"
  type = list(object({
    description     = string
    from_port       = string
    to_port         = string
    protocol        = string
    cidr_block      = string
    ipv6_cidr_block = string
  }))
  default = [
    {
      description     = "All egress traffic"
      from_port       = "-1"
      to_port         = "-1"
      protocol        = "-1"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = "::/0"
    },
  ]
}

# Red5 Pro autoscale Node group - (Optional) 
variable "node_group_create" {
  description = "Create new node group. Linux or Mac OS only."
  type        = bool
  default     = false
}
variable "node_group_origins_min" {
  description = "Number of minimum Origins"
  type        = number
  default     = 1
}
variable "node_group_origins_max" {
  description = "Number of maximum Origins"
  type        = number
  default     = 20
}
variable "node_group_origins_instance_type" {
  description = "Instance type for Origins"
  type        = string
  default     = "t3.medium"
}
variable "node_group_origins_volume_size" {
  description = "Volume size in GB for Origins. Minimum 8GB"
  type        = number
  default     = 16
  validation {
    condition     = var.node_group_origins_volume_size >= 8
    error_message = "The node_group_origins_volume_size value must be a valid! Minimum 8"
  }
}
variable "node_group_edges_min" {
  description = "Number of minimum Edges"
  type        = number
  default     = 1
}
variable "node_group_edges_max" {
  description = "Number of maximum Edges"
  type        = number
  default     = 40
}
variable "node_group_edges_instance_type" {
  description = "Instance type for Edges"
  type        = string
  default     = "t3.medium"
}
variable "node_group_edges_volume_size" {
  description = "Volume size in GB for Edges. Minimum 8GB"
  type        = number
  default     = 16
  validation {
    condition     = var.node_group_edges_volume_size >= 8
    error_message = "The node_group_edges_volume_size value must be a valid! Minimum 8"
  }
}
variable "node_group_transcoders_min" {
  description = "Number of minimum Transcoders"
  type        = number
  default     = 1
}
variable "node_group_transcoders_max" {
  description = "Number of maximum Transcoders"
  type        = number
  default     = 20
}
variable "node_group_transcoders_instance_type" {
  description = "Instance type for Transcoders"
  type        = string
  default     = "t3.medium"
}
variable "node_group_transcoders_volume_size" {
  description = "Volume size in GB for Transcoders. Minimum 8GB"
  type        = number
  default     = 16
  validation {
    condition     = var.node_group_transcoders_volume_size >= 8
    error_message = "The node_group_transcoders_volume_size value must be a valid! Minimum 8"
  }
}
variable "node_group_relays_min" {
  description = "Number of minimum Relays"
  type        = number
  default     = 0
}
variable "node_group_relays_max" {
  description = "Number of maximum Relays"
  type        = number
  default     = 20
}
variable "node_group_relays_instance_type" {
  description = "Instance type for Relays"
  type        = string
  default     = "t3.medium"
}
variable "node_group_relays_volume_size" {
  description = "Volume size in GB for Relays. Minimum 8GB"
  type        = number
  default     = 16
  validation {
    condition     = var.node_group_relays_volume_size >= 8
    error_message = "The node_group_relays_volume_size value must be a valid! Minimum 8"
  }
}
variable "ubuntu_version_aws_image" {
  type = map(string)
  default = {
    18.04 = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
    20.04 = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
    22.04 = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
  }
}
variable "ubuntu_version" {
  description = "Ubuntu version"
  type        = string
  default     = "22.04"
}
# Extra configuration for Red5 Pro autoscaling nodes
variable "node_config_webhooks" {
  description = "Webhooks configuration - (Optional) https://www.red5.net/docs/special/webhooks/overview/"
  type = object({
    enable           = bool
    target_nodes     = list(string)
    webhook_endpoint = string
  })
  default = {
    enable           = false
    target_nodes     = []
    webhook_endpoint = ""
  }
}
variable "node_config_round_trip_auth" {
  description = "Round trip authentication configuration - (Optional) https://www.red5.net/docs/special/authplugin/simple-auth/"
  type = object({
    enable                   = bool
    target_nodes             = list(string)
    auth_host                = string
    auth_port                = number
    auth_protocol            = string
    auth_endpoint_validate   = string
    auth_endpoint_invalidate = string
  })
  default = {
    enable                   = false
    target_nodes             = []
    auth_host                = ""
    auth_port                = "443"
    auth_protocol            = "https://"
    auth_endpoint_validate   = "/validateCredentials"
    auth_endpoint_invalidate = "/invalidateCredentials"
  }
}
variable "node_config_social_pusher" {
  description = "Social Pusher configuration - (Optional) https://www.red5.net/docs/development/social-media-plugin/rest-api/"
  type = object({
    enable       = bool
    target_nodes = list(string)
  })
  default = {
    enable       = false
    target_nodes = []
  }
}
variable "node_config_restreamer" {
  description = "Restreamer configuration - (Optional) https://www.red5.net/docs/special/restreamer/overview/"
  type = object({
    enable               = bool
    target_nodes         = list(string)
    restreamer_tsingest  = bool
    restreamer_ipcam     = bool
    restreamer_whip      = bool
    restreamer_srtingest = bool
  })
  default = {
    enable               = false
    target_nodes         = []
    restreamer_tsingest  = false
    restreamer_ipcam     = false
    restreamer_whip      = false
    restreamer_srtingest = false
  }
}

variable "stream_manager_proxy_user" {
  description = "value to set the user name for Stream Manager 2.0 proxy"
  type        = string
  default     = ""
}
variable "stream_manager_proxy_password" {
  description = "value to set the user password for Stream Manager 2.0 proxy"
  type        = string
  default     = ""
}
variable "stream_manager_spatial_user" {
  description = "value to set the user name for Stream Manager 2.0 spatial"
  type        = string
  default     = ""
}
variable "stream_manager_spatial_password" {
  description = "value to set the user password for Stream Manager 2.0 spatial"
  type        = string
  default     = ""
}
variable "stream_manager_version" {
  description = "value to set the version for Stream Manager 2.0"
  type        = string
  default     = "latest"
}
variable "node_group_origins_connection_limit" {
  description = "Connection limit for Origins (maximum number of publishers to the origin server)"
  type        = number
  default     = 20
}
variable "node_group_edges_connection_limit" {
  description = "Connection limit for Edges (maximum number of subscribers to the edge server)"
  type        = number
  default     = 200
}
variable "node_group_transcoders_connection_limit" {
  description = "Connection limit for Transcoders (maximum number of publishers to the transcoder server)"
  type        = number
  default     = 20
}

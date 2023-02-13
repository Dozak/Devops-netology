#Запуск подготовки tf к ЯО.
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token = "**token**"
  cloud_id  = "b1gfg939ohcq3l2300i9"
  folder_id = "b1geeoj0nf6vesu2712a"
  zone      = local.zone
}

locals {
  zone = "ru-central1-a"
}
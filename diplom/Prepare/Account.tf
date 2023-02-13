# Создание сервисного аккаунта
resource "yandex_iam_service_account" "s3-backet-netology" {
  name = "dozak-service"
  description = "Netology diplom"
}
# Присваивание роли сервисному аккаунту
resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id  = yandex_iam_service_account.s3-backet-netology.folder_id
  role       = "editor"
  member     = "serviceAccount:${yandex_iam_service_account.s3-backet-netology.id}"
  depends_on = [yandex_iam_service_account.s3-backet-netology]
}
resource "yandex_resourcemanager_folder_iam_member" "sa-admin" {
  folder_id  = yandex_iam_service_account.s3-backet-netology.folder_id
  role       = "admin"
  member     = "serviceAccount:${yandex_iam_service_account.s3-backet-netology.id}"
  depends_on = [yandex_iam_service_account.s3-backet-netology]
}
# Создание статического ключа
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.s3-backet-netology.id
  description        = "static access key for object storage"
  depends_on         = [yandex_iam_service_account.s3-backet-netology]
}

require "cloudinary"
require "shrine/storage/cloudinary"


Cloudinary.config(
  cloud_name: "aeonknight",
  api_key:"915846594146587",
  api_secret:"C8Akglw29TVX_cRTgnxwUYQRSrg",
)

Shrine.storages = {
  cache: Shrine::Storage::Cloudinary.new(prefix: "cache"), # for direct uploads
  store: Shrine::Storage::Cloudinary.new(prefix: "store"),
}

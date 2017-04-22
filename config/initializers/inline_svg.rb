InlineSvg.configure do |config|
  config.asset_file = InlineSvg::CachedAssetFile.new(
    paths: [
      "#{Rails.root}/app/assets/images/"
    ],
    filters: /\.svg/
  )
end

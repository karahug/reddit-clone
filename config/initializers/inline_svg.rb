=begin
require "inline_svg/cached_asset_file"

InlineSvg.configure do |config|
      config.asset_file = InlineSvg::CachedAssetFile.new(
              paths: [
                        "#{Rails.root}/public/path/to/assets",
                              "#{Rails.root}/public/other/path/to/assets"
                                  ],
                                      filters: /\.svg/
                                        )
end
=end

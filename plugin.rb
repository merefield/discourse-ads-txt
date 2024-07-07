# frozen_string_literal: true

# name: discourse-ads-txt
# about: Renders an ads.txt file for the site
# version: 0.0.1
# authors: merefield@gmail.com
# url: https://github.com/merefield/discourse-adstxt-renderer

enabled_site_setting :discourse_ads_txt_enabled

after_initialize do
  require_relative "app/controllers/discourse_ads_txt/adstxt_controller"

  Discourse::Application.routes.append do
    get "/ads.txt" => "adstxt#index"
  end
end

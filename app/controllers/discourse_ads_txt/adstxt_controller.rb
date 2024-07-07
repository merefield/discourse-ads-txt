# frozen_string_literal: true
#
class AdstxtController < ::ApplicationController
  before_action :ensure_plugin_enabled
  skip_before_action :preload_json, :check_xhr, :redirect_to_login_if_required

  def index
    raise Discourse::NotFound if SiteSetting.discourse_ads_txt_ads_txt.blank?

    render plain: SiteSetting.discourse_ads_txt_ads_txt
  end

  private

  def ensure_plugin_enabled
    unless SiteSetting.discourse_ads_txt_enabled
      redirect_to path("/")
    end
  end
end

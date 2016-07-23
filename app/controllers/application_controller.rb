class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 他のエラーハンドリングでキャッチできなかった場合に
  # 500 Internal Server Error(システムエラー)を発生させる
  # NOTE: rescue_from は下から評価されるので記載箇所はここが正解
  rescue_from Exception, with: :handle_500 unless Rails.env.development?
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end
  
  # before_actionでdeviseのストロングパラメーターにnameカラムを追加するメソッドを実行します。
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # PERMISSIBLE_ATTRIBUTES = %i(name) ->no avatar version
  PERMISSIBLE_ATTRIBUTES = %i(name avatar avatar_cache)
  
  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: PERMISSIBLE_ATTRIBUTES)
      devise_parameter_sanitizer.permit(:account_update, keys: PERMISSIBLE_ATTRIBUTES)
    end

      # エラーハンドリング処理
    def handle_500(exception = nil)
      logger.info "Rendering 500 with exception: #{exception.message}" if exception

      if request.xhr?
        # Ajaxのための処理
        render json: { error: '500 error' }, status: 500
      else
        render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
      end
    end
end

module Concerns
  module Oauth
    extend ActiveSupport::Concern
    class_methods do
      def find_for_google_oauth2(auth)
        klass = name.constantize
        data = auth.info
        if auth.info.email.present?
          user = klass.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.email = auth.info.email
            user.password = Devise.friendly_token[0,20]
          end
          user.access_token = auth.credentials.token
          user.refresh_token = auth.credentials.refresh_token
          user.save
          return user
        else
          return nil
        end
      end
    end
  end
end

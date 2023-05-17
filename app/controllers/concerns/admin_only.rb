module AdminOnly
  extend ActiveSupport::Concern

  included do
    http_basic_authenticate_with name: 'admin', password: 'admin'
  end
end

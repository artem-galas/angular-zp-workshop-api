class ApidocsController < ActionController::Base
  include Swagger::Blocks
  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'Angular Workshop API'
      key :description, 'A simple API that uses for angular workshop'
      contact do
        key :name, 'Artem Galas https://github.com/artem-galas'
      end
      license do
        key :name, 'MIT'
      end
    end
    tag do
      key :name, 'products'
      key :description, 'Products Operation'
    end
    tag do
      key :name, 'auth'
      key :description, 'Auth Operation'
    end
    key :basePath, '/api'
  end

  SWAGGERED_CLASSES = [
    Api::ProductsController,
    Api::AuthController,
    Api::ProfileController,
    Product,
    User,
    JwtResponse,
    self
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end

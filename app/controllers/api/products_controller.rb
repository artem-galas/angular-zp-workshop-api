module Api
  class ProductsController < ApiController
    include Swagger::Blocks

    swagger_path '/products' do
      operation :get do
        key :description, 'Get All products'
        key :operationId, 'getProduct'
        key :produced, [ 'application/json']
        key :tags, ['products']
        response 200 do
          key :description, 'All products'
          schema do
            key :'$ref', :ProductsResponse
          end
        end
      end
    end

    swagger_path '/products/:id' do
      operation :get do
        key :description, 'Get one product'
        key :operationId, 'getOneProduct'
        key :produced, [ 'application/json']
        key :tags, ['products']
        parameter do
          key :name, :id
          key :in, :path
          key :required, true
          key :description, 'An Id of product'
          key :type, :integer
          key :format, :int64
        end
        response 200 do
          key :description, 'One product'
          schema do
            key :'$ref', :ProductResponse
          end
        end
      end
    end

    before_action :set_product, only: [:show, :update, :destroy]

    # GET /products
    def index
      @products = Product.all

      render json: @products
    end

    # GET /products/1
    def show
      render json: @product
    end

    # POST /products
    def create
      @product = Product.new(product_params)

      if @product.save
        render json: @product, status: :created, location: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /products/1
    def update
      if @product.update(product_params)
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # DELETE /products/1
    def destroy
      @product.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.fetch(:product, {})
    end
  end

end

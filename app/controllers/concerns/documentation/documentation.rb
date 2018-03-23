module Documentation
  module RequestHeaders
    def self.extended(base)
      base.parameter do
        key :in, :header
        key :name, 'Authorization'
        key :description, 'Bearer token for initialize user on server'
        key :required, true
      end
    end
  end
end
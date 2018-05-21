require 'service'

module ViaCep
  class Address
    attr_reader :cep, :address, :neighborhood, :city, :state, :ibge, :gia

    # Initializes an instance of Address and fetches the CEP using the external API
    def initialize(cep, options = {})
      cep = cep.to_s.delete('^0-9')

      response = Service.fetch cep, options[:timeout]
      fill_from response
    end

    private

    def fill_from(response)
      @cep          = response['cep']
      @address      = response['logradouro']
      @neighborhood = response['bairro']
      @city         = response['localidade']
      @state        = response['uf']
      @ibge         = response['ibge']
      @gia          = response['gia']
    end
  end
end

class Api::ProsController < ApiController
  def index
    @pros = Pro.all
  end
end

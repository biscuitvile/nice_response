# Nice Response

`nice_response` allows you to easily reduce cruft from a typical Rails 4 JSON controller.

Consider the following:

``

class ShoesController < ApplicationController
  respond_to :json

  def show
    respond_with Shoe.find(params[:id])
  end

  def create
    respond_with :api, :v1, Shoe.create(shoe_params)
  end

  def update
    respond_with Shoe.update(params[:id], shoe_params)
  end

  def destroy
    respond_with Shoe.find(params[:id]).destroy
  end

  private

  def shoe_params
    params.require(:shoe).permit(:size, :brand_id)
  end
end

```

`nice_response` recommends you redefine this the following way:

```

class ApiController < ApplicationController
  include NiceResponse::ControllerSupport
end

class ShoesController < ApiController
  actions :show, :create, :update, :destroy
  permit :size, :brand_id
end

```

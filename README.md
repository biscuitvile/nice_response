# Nice Response

`nice_response` allows you to easily reduce cruft from a typical Rails 4 JSON controller.

Consider the following:

```

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

## Namespaces

`nice_response` will handle namespaces, nested namespaces, or controllers with no namespace at all. However, `nice_response` suggests you namespace and version your API like so:

```

class Api::V1::BaseController < ApplicationController
  include NiceResponse::ControllerSupport
end

class Api::V1::ShoesController < Api::V1::BaseController
  actions :show, :create, :update, :destroy
  permit :size, :brand_id
end

```

## Roadmap

Ultimatley, `nice_response` is intended to pair well with [decent_exposure](https://github.com/voxdolo/decent_exposure).

The end result should be that `nice_response` and `decent_exposure` together will let you write light, clean interfaces that scope resources:

```

class Api::V1::AppointmentsController < Api::V1::BaseController

  expose(:pets) { current_user.pets }
  expose(:appointments, ancestor: :pets)

  actions :index, :show, :create, :update, :destory
  permit :pet_id, :time

end

```
To acheive this `nice_response` should check for the appropriate exposures and use them in its action templates.

A next logical step would also include sane defaults for validation errors on `create`, `update`, and `destroy` actions, which currently are not checked for.

## Contributing

Pull requests accompanied by tests that match the existing style of the codebase are more than welcome.

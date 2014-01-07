class PetsController < ApplicationController
  include NiceResponse::ControllerSupport

  actions :index, :show, :create, :update, :destroy
  permit :name

end

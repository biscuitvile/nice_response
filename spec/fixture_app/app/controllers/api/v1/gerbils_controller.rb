class Api::V1::GerbilsController < ApplicationController
  include NiceResponse::ControllerSupport

  actions :create
  permit :name

end

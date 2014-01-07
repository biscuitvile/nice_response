require 'active_support/inflector'
require 'nice_response/model_resolver'

describe NiceResponse::ModelResolver do

  class Kitten; end
  class Doge; end
  class BigTruck; end
  class KittensController; end
  class DogeController; end
  class BigTrucksController; end

  module Herp
    module Derp
      class KittensController; end
    end
  end

  describe "#model" do

    it "returns a classified model from a plural controller name" do
      resolver = described_class.new(KittensController.new)
      resolver.model.should eq Kitten
    end

    it "returns a classified model from a singular controller name" do
      resolver = described_class.new(DogeController.new)
      resolver.model.should eq Doge
    end

    it "returns a classified model from a multi-word controller name" do
      resolver = described_class.new(BigTrucksController.new)
      resolver.model.should eq BigTruck
    end

    it "returns a classified model from a namespaced controller name" do
      resolver = described_class.new(Herp::Derp::KittensController.new)
      resolver.model.should eq Kitten
    end
  end

  describe "#symbolized_model" do

    it "returns a classified model from a plural controller name" do
      resolver = described_class.new(KittensController.new)
      resolver.symbolized_model.should eq :kitten
    end

    it "returns a classified model from a singular controller name" do
      resolver = described_class.new(DogeController.new)
      resolver.symbolized_model.should eq :doge
    end

    it "returns a classified model from a multi-word controller name" do
      resolver = described_class.new(BigTrucksController.new)
      resolver.symbolized_model.should eq :big_truck
    end

    it "returns a model name as symbol from a namespaced controller name" do
      resolver = described_class.new(Herp::Derp::KittensController.new)
      resolver.symbolized_model.should eq :kitten
    end
  end

end

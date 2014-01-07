require 'nice_response/namespace_resolver'
require 'fixtures/constants'

describe NiceResponse::NamespaceResolver do
  describe "#namespaces" do

    it "returns an array of symbols from a namespaced controller" do
      resolver = described_class.new(Herp::Derp::KittensController.new)
      resolver.namespaces.should eq [:herp, :derp]
    end

    it "returns an empty array for a non-namespaced controller" do
      resolver = described_class.new(DogeController.new)
      resolver.namespaces.should eq []
    end

  end
end

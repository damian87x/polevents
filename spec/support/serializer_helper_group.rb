module SerializerHelperGroup
  extend ActiveSupport::Concern

  included do
    metadata[:type] = :serializer

    let(:serializable_class) do
      Class.new(OpenStruct) do
        include ActiveModel::Serialization
      end
    end

    def build_serializable(attributes={})
      serializable_class.new(attributes).tap do |obj|
        #TODO: change to new syntax later
        obj.stub(:read_attribute_for_serialization) { |name| attributes[name] }
      end
    end

    def serialize(object)
      described_class.new(object).object.to_h
    end
  end

  RSpec.configure do |config|
    config.include self,
                   :type => :serializer,
                   :subhash => { :file_path => %r(spec/serializers) }
  end
end
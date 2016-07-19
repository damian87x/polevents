require 'rails_helper'

RSpec.describe Notify, type: :model do


  describe 'methods' do
    let(:event) { FactoryGirl.create(:event) }
    let(:user) { FactoryGirl.create(:user) }


    let(:notify) do
      Notify.new do |n|
        n.event = event
      end
    end

    it "should respond to event" do
      expect(notify.respond_to?(:event)).to be_truthy
    end

    it "should respond to send_emails" do
      expect(notify.respond_to?(:send_emails)).to be_truthy
    end

    it "should respond to find_users" do
      expect(notify.respond_to?(:find_users)).to be_truthy
    end

    it "should respond to clear_attribute" do
      expect(notify.send(:clear_attribute, :event)).to be_truthy
    end

    it "should respond to reset_attribute_to_default!" do
      expect(notify.send(:reset_attribute_to_default!, :event)).to be_truthy
    end

    it "should return event" do
      expect(notify.attributes).to eq({'event' => event})
    end




  end


end

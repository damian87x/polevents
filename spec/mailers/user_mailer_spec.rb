require "rails_helper"

RSpec.describe UserMailer, type: :mailer do

    describe 'instructions' do
      let(:user) { User.create(email: 'test_email@wp.pl', password: '12345678')  }
      let(:mail) { described_class.notify_user(user).deliver_now }

      it 'renders the subject' do
        expect(mail.subject).to eq('New Events waiting for you!')
      end

      it 'renders the receiver email' do
        expect(mail.to).to eq([user.email])
      end

      it 'renders the sender email' do
        expect(mail.from).to eq(['no-reply@polevents.pl'])
      end

      it 'assigns @ulr' do
        expect(mail.body.encoded).to match('localhost:3000')
      end


    end

end

require "rails_helper"

RSpec.describe NotificationsMailer, type: :mailer do
  describe "sign_up" do
    let(:mail) { NotificationsMailer.with(user: recipient).sign_up }

    let!(:recipient) do
      create(:user)
    end

    it "renders the headers" do
      expect(mail.subject).to eq("Sign up")
      expect(mail.to).to eq([recipient.email])
      expect(mail.from).to eq(["notifications@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end
end

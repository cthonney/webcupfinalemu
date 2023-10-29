class ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    success = verify_recaptcha(action: 'login', minimum_score: 0.5, secret_key: ENV['RECAPTCHA_V3_SECRET_KEY'])
    checkbox_success = verify_recaptcha unless success

    if (success || checkbox_success) && @contact.save
      redirect_to root_path, notice: "Your message has been successfully submitted."
    else
      @show_checkbox_recaptcha = !success
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone, :email, :message)
  end
end

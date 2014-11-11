class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])

    if @contact.valid?
      UserMailer.contact(@contact).deliver
      render :show
    else
      render "new"
    end
  end

  def show
  end
end

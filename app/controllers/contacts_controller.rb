class ContactsController < ApplicationController

  
  def index 
    @contacts = Contact.all
    render "index.html.erb"
  end  

  def show 
    @contact = Contact.find_by(id: params[:id])
    render "show.html.erb"
  end 

  def new 
  end 

  def search 
    search_input = params[:search_input]
    @contacts = Contact.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{search_input}%",)
    if @contacts.empty?
      flash[:info] = "No contact found" 
    end 
    render :index
  end 

  def create 
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    phone_number = params[:phone_number]
    contact = Contact.new({first_name: first_name, last_name: last_name, email: email, phone_number: phone_number})
    contact.save 
  end 

  def edit 
    @contact = Contact.find_by(id: params[:id])
  end 

  def update 
    @contact = Contact.find_by(id: params[:id])
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.phone_number = params[:phone_number]
    @contact.save  
  end 

  def destroy 
  @contact = Contact.find_by(id: params[:id])
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.phone_number = params[:phone_number]
    @contact.save  
  end  
end

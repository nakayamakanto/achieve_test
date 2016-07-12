class ContactsController < ApplicationController
    def new
        if params[:contact] && params[:back]
            @contact=Contact.new(contacts_params)
        else
            @contact=Contact.new
        end
    end
    
    def create
        @contact=Contact.new(contacts_params)
        if @contact.save
            redirect_to root_path, notice: "お問い合わせありがとうございました"
        else
            render :action => "new"
        end
    end
    
    def confirm
        @contact=Contact.new(contacts_params)
        if @contact.invalid?
            redirect_to :action => "new"
        end
    end
    
    private
    def contacts_params
       params.require(:contact).permit(:name,:email,:content) 
    end
end

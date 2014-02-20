class ContactsController < ApplicationController

  def create
    @contact = Contact.new(params.require(:contact).permit(:title, :email, :body))
    if @contact.valid?
      ActionMailer::Base.mail(
          from: @contact.email, :to => 'val.rota@hotmail.com',
          subject: "#{@contact.email}  t'as envoyé un message depuis valentin-rota.ch",
          body: "#{@contact.email} a envoyé le message suivant:\n Titre : #{@contact.title}\nMessage : #{@contact.body}"
      ).deliver
      redirect_to contact_path, flash: {success: "Votre e-mail (#{@contact.title}) a été envoyé avec succès.
Je vous répondrai au plus tôt à l'adresse: #{@contact.email}"}
    else
      render 'static_pages/contact'
    end
  end
end
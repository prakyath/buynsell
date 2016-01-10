class Logins < ApplicationMailer

    def login_mail(user,product)
        @product=product
          @user = user
        mail( :to => "#{@user['username']}@smail.iitm.ac.in",
    :subject => "#{@user['fullname'].titleize} Successfull created Product" )
    end
end

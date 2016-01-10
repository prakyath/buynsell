class Logins < ApplicationMailer

    def login_mail(user,product)
        @product=product
          @user = user
        mail( :to => "#{@user['username']}@smail.iitm.ac.in",
    :subject => "Successfull created product #{@product['name'].titleize}" )
    end
end

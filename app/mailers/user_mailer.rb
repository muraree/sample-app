class UserMailer < ApplicationMailer

  def new_product_email(product)
    @product = product
    mail(to: 'test@email.com', subject: 'New product')
  end
end

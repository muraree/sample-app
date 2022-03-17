class Api::ProductSerializer < ApplicationSerializer

  attributes :id, :name, :price, :description, :created_at, :image_url, :errors

  def created_at
    object.created_at.present? ? object.created_at.to_date.to_s(:rfc822) : nil
  end

end

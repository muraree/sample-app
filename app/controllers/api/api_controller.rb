class Api::ApiController < ApplicationController
  include Pagy::Backend

  def meta_attributes(collection, extra_meta = {})
    {
      pagination: pagy_metadata(collection)
    }.merge(extra_meta)
  end
end

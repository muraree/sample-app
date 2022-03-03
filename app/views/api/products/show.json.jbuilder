json.product do
  json.merge! @product.attributes
  json.url @product.image.thumb.url
end

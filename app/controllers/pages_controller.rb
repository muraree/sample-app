class PagesController < ApplicationController
  def index
    gon.user = { name: 'John', role: 'Admin', id: '2' }
  end
end

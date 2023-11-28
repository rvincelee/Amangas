# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  def show
    @page = Page.where("lower(name) = ?", params[:name]).first

    return if @page

    render file: "#{Rails.root.join('public/404.html')}", layout: false, status: :not_found
  end
end

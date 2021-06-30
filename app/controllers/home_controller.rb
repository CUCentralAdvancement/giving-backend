class HomeController < ApplicationController
  def show
    authorize :home, :show?
  end
end

class HomePolicy < Struct.new(:user, :home)

  def show?
    true
  end

end

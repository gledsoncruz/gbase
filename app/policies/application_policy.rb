class ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @model = model
    @permissions = @current_user.permissions rescue []
  end

  def index?
    @current_user.super?
  end

  def show?
    @current_user.super?
  end

  def create?
    @current_user.super?
  end

  def new?
    create?
  end

  def update?
    @current_user.super?
  end

  def edit?
    update?
  end

  def destroy?
    @current_user.super?
  end

  def scope
    Pundit.policy_scope!(@current_user, @model.class)
  end

  class Scope
    attr_reader :current_user, :model

    def initialize(current_user, model)
      @current_user = current_user
      @model = model
    end

    def resolve
      scope
    end
  end
end


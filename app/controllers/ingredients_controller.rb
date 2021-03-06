class IngredientsController < ApplicationController
  def index
    @q = Ingredient.ransack(params[:q])
    @ingredients = @q.result(:distinct => true).includes(:billhasingredients, :dishhasingredients, :director, :dishes, :bills).page(params[:page]).per(10)

    render("ingredient_templates/index.html.erb")
  end

  def show
    @dish_has_ingredient = DishHasIngredient.new
    @bill_has_ingredient = BillHasIngredient.new
    @ingredient = Ingredient.find(params.fetch("id_to_display"))

    render("ingredient_templates/show.html.erb")
  end

  def new_form
    @ingredient = Ingredient.new

    render("ingredient_templates/new_form.html.erb")
  end

  def create_row
    @ingredient = Ingredient.new

    @ingredient.name = params.fetch("name")
    @ingredient.quality = params.fetch("quality")
    @ingredient.food_group = params.fetch("food_group")
    @ingredient.picture = params.fetch("picture") if params.key?("picture")
    @ingredient.image = params.fetch("image")
    @ingredient.user_id = params.fetch("user_id")

    if @ingredient.valid?
      @ingredient.save

      redirect_back(:fallback_location => "/ingredients", :notice => "Ingredient created successfully.")
    else
      render("ingredient_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @ingredient = Ingredient.find(params.fetch("prefill_with_id"))

    render("ingredient_templates/edit_form.html.erb")
  end

  def update_row
    @ingredient = Ingredient.find(params.fetch("id_to_modify"))

    @ingredient.name = params.fetch("name")
    @ingredient.quality = params.fetch("quality")
    @ingredient.food_group = params.fetch("food_group")
    @ingredient.picture = params.fetch("picture") if params.key?("picture")
    @ingredient.image = params.fetch("image")
    @ingredient.user_id = params.fetch("user_id")

    if @ingredient.valid?
      @ingredient.save

      redirect_to("/ingredients/#{@ingredient.id}", :notice => "Ingredient updated successfully.")
    else
      render("ingredient_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_director
    @ingredient = Ingredient.find(params.fetch("id_to_remove"))

    @ingredient.destroy

    redirect_to("/users/#{@ingredient.user_id}", notice: "Ingredient deleted successfully.")
  end

  def destroy_row
    @ingredient = Ingredient.find(params.fetch("id_to_remove"))

    @ingredient.destroy

    redirect_to("/ingredients", :notice => "Ingredient deleted successfully.")
  end
end

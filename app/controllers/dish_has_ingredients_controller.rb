class DishHasIngredientsController < ApplicationController
  def index
    @dish_has_ingredients = DishHasIngredient.all

    render("dish_has_ingredient_templates/index.html.erb")
  end

  def show
    @dish_has_ingredient = DishHasIngredient.find(params.fetch("id_to_display"))

    render("dish_has_ingredient_templates/show.html.erb")
  end

  def new_form
    @dish_has_ingredient = DishHasIngredient.new

    render("dish_has_ingredient_templates/new_form.html.erb")
  end

  def create_row
    @dish_has_ingredient = DishHasIngredient.new

    @dish_has_ingredient.dish_id = params.fetch("dish_id")
    @dish_has_ingredient.ingredient_id = params.fetch("ingredient_id")
    @dish_has_ingredient.quantity = params.fetch("quantity")
    @dish_has_ingredient.dish_ingredient_unit = params.fetch("dish_ingredient_unit")

    if @dish_has_ingredient.valid?
      @dish_has_ingredient.save

      redirect_back(:fallback_location => "/dish_has_ingredients", :notice => "Dish has ingredient created successfully.")
    else
      render("dish_has_ingredient_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @dish_has_ingredient = DishHasIngredient.find(params.fetch("prefill_with_id"))

    render("dish_has_ingredient_templates/edit_form.html.erb")
  end

  def update_row
    @dish_has_ingredient = DishHasIngredient.find(params.fetch("id_to_modify"))

    @dish_has_ingredient.dish_id = params.fetch("dish_id")
    @dish_has_ingredient.ingredient_id = params.fetch("ingredient_id")
    @dish_has_ingredient.quantity = params.fetch("quantity")
    @dish_has_ingredient.dish_ingredient_unit = params.fetch("dish_ingredient_unit")

    if @dish_has_ingredient.valid?
      @dish_has_ingredient.save

      redirect_to("/dish_has_ingredients/#{@dish_has_ingredient.id}", :notice => "Dish has ingredient updated successfully.")
    else
      render("dish_has_ingredient_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @dish_has_ingredient = DishHasIngredient.find(params.fetch("id_to_remove"))

    @dish_has_ingredient.destroy

    redirect_to("/dish_has_ingredients", :notice => "Dish has ingredient deleted successfully.")
  end
end

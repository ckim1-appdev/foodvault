class BillHasIngredientsController < ApplicationController
  def index
    @bill_has_ingredients = BillHasIngredient.all

    render("bill_has_ingredient_templates/index.html.erb")
  end

  def show
    @bill_has_ingredient = BillHasIngredient.find(params.fetch("id_to_display"))

    render("bill_has_ingredient_templates/show.html.erb")
  end

  def new_form
    @bill_has_ingredient = BillHasIngredient.new

    render("bill_has_ingredient_templates/new_form.html.erb")
  end

  def create_row
    @bill_has_ingredient = BillHasIngredient.new

    @bill_has_ingredient.bill_id = params.fetch("bill_id")
    @bill_has_ingredient.ingredient_id = params.fetch("ingredient_id")
    @bill_has_ingredient.quantity = params.fetch("quantity")
    @bill_has_ingredient.bill_ingredient_unit = params.fetch("bill_ingredient_unit")

    if @bill_has_ingredient.valid?
      @bill_has_ingredient.save

      redirect_back(:fallback_location => "/bill_has_ingredients", :notice => "Bill has ingredient created successfully.")
    else
      render("bill_has_ingredient_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_ingredient
    @bill_has_ingredient = BillHasIngredient.new

    @bill_has_ingredient.bill_id = params.fetch("bill_id")
    @bill_has_ingredient.ingredient_id = params.fetch("ingredient_id")
    @bill_has_ingredient.quantity = params.fetch("quantity")
    @bill_has_ingredient.bill_ingredient_unit = params.fetch("bill_ingredient_unit")

    if @bill_has_ingredient.valid?
      @bill_has_ingredient.save

      redirect_to("/ingredients/#{@bill_has_ingredient.ingredient_id}", notice: "BillHasIngredient created successfully.")
    else
      render("bill_has_ingredient_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_bill
    @bill_has_ingredient = BillHasIngredient.new

    @bill_has_ingredient.bill_id = params.fetch("bill_id")
    @bill_has_ingredient.ingredient_id = params.fetch("ingredient_id")
    @bill_has_ingredient.quantity = params.fetch("quantity")
    @bill_has_ingredient.bill_ingredient_unit = params.fetch("bill_ingredient_unit")

    if @bill_has_ingredient.valid?
      @bill_has_ingredient.save

      redirect_to("/bills/#{@bill_has_ingredient.bill_id}", notice: "BillHasIngredient created successfully.")
    else
      render("bill_has_ingredient_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @bill_has_ingredient = BillHasIngredient.find(params.fetch("prefill_with_id"))

    render("bill_has_ingredient_templates/edit_form.html.erb")
  end

  def update_row
    @bill_has_ingredient = BillHasIngredient.find(params.fetch("id_to_modify"))

    @bill_has_ingredient.bill_id = params.fetch("bill_id")
    @bill_has_ingredient.ingredient_id = params.fetch("ingredient_id")
    @bill_has_ingredient.quantity = params.fetch("quantity")
    @bill_has_ingredient.bill_ingredient_unit = params.fetch("bill_ingredient_unit")

    if @bill_has_ingredient.valid?
      @bill_has_ingredient.save

      redirect_to("/bill_has_ingredients/#{@bill_has_ingredient.id}", :notice => "Bill has ingredient updated successfully.")
    else
      render("bill_has_ingredient_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_ingredient
    @bill_has_ingredient = BillHasIngredient.find(params.fetch("id_to_remove"))

    @bill_has_ingredient.destroy

    redirect_to("/ingredients/#{@bill_has_ingredient.ingredient_id}", notice: "BillHasIngredient deleted successfully.")
  end

  def destroy_row_from_bill
    @bill_has_ingredient = BillHasIngredient.find(params.fetch("id_to_remove"))

    @bill_has_ingredient.destroy

    redirect_to("/bills/#{@bill_has_ingredient.bill_id}", notice: "BillHasIngredient deleted successfully.")
  end

  def destroy_row
    @bill_has_ingredient = BillHasIngredient.find(params.fetch("id_to_remove"))

    @bill_has_ingredient.destroy

    redirect_to("/bill_has_ingredients", :notice => "Bill has ingredient deleted successfully.")
  end
end

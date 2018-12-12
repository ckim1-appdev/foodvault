class BillsController < ApplicationController
  before_action :current_user_must_be_bill_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_bill_user
    bill = Bill.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == bill.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @bills = current_user.bills.page(params[:page]).per(10)

    render("bill_templates/index.html.erb")
  end

  def show
    @bill_has_ingredient = BillHasIngredient.new
    @bill = Bill.find(params.fetch("id_to_display"))

    render("bill_templates/show.html.erb")
  end

  def new_form
    @bill = Bill.new

    render("bill_templates/new_form.html.erb")
  end

  def create_row
    @bill = Bill.new

    @bill.date_purchased = params.fetch("date_purchased")
    @bill.ingredient_count = params.fetch("ingredient_count")
    @bill.grocery_store = params.fetch("grocery_store")
    @bill.price = params.fetch("price")
    @bill.user_id = params.fetch("user_id")

    if @bill.valid?
      @bill.save

      redirect_back(:fallback_location => "/bills", :notice => "Bill created successfully.")
    else
      render("bill_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @bill = Bill.find(params.fetch("prefill_with_id"))

    render("bill_templates/edit_form.html.erb")
  end

  def update_row
    @bill = Bill.find(params.fetch("id_to_modify"))

    @bill.date_purchased = params.fetch("date_purchased")
    @bill.ingredient_count = params.fetch("ingredient_count")
    @bill.grocery_store = params.fetch("grocery_store")
    @bill.price = params.fetch("price")
    

    if @bill.valid?
      @bill.save

      redirect_to("/bills/#{@bill.id}", :notice => "Bill updated successfully.")
    else
      render("bill_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @bill = Bill.find(params.fetch("id_to_remove"))

    @bill.destroy

    redirect_to("/users/#{@bill.user_id}", notice: "Bill deleted successfully.")
  end

  def destroy_row
    @bill = Bill.find(params.fetch("id_to_remove"))

    @bill.destroy

    redirect_to("/bills", :notice => "Bill deleted successfully.")
  end
end

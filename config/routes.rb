Rails.application.routes.draw do
  root :to => "ingredients#index"
  # Routes for the Dish has ingredient resource:

  # CREATE
  get("/dish_has_ingredients/new", { :controller => "dish_has_ingredients", :action => "new_form" })
  post("/create_dish_has_ingredient", { :controller => "dish_has_ingredients", :action => "create_row" })

  # READ
  get("/dish_has_ingredients", { :controller => "dish_has_ingredients", :action => "index" })
  get("/dish_has_ingredients/:id_to_display", { :controller => "dish_has_ingredients", :action => "show" })

  # UPDATE
  get("/dish_has_ingredients/:prefill_with_id/edit", { :controller => "dish_has_ingredients", :action => "edit_form" })
  post("/update_dish_has_ingredient/:id_to_modify", { :controller => "dish_has_ingredients", :action => "update_row" })

  # DELETE
  get("/delete_dish_has_ingredient/:id_to_remove", { :controller => "dish_has_ingredients", :action => "destroy_row" })

  #------------------------------

  # Routes for the Bill has ingredient resource:

  # CREATE
  get("/bill_has_ingredients/new", { :controller => "bill_has_ingredients", :action => "new_form" })
  post("/create_bill_has_ingredient", { :controller => "bill_has_ingredients", :action => "create_row" })

  # READ
  get("/bill_has_ingredients", { :controller => "bill_has_ingredients", :action => "index" })
  get("/bill_has_ingredients/:id_to_display", { :controller => "bill_has_ingredients", :action => "show" })

  # UPDATE
  get("/bill_has_ingredients/:prefill_with_id/edit", { :controller => "bill_has_ingredients", :action => "edit_form" })
  post("/update_bill_has_ingredient/:id_to_modify", { :controller => "bill_has_ingredients", :action => "update_row" })

  # DELETE
  get("/delete_bill_has_ingredient/:id_to_remove", { :controller => "bill_has_ingredients", :action => "destroy_row" })

  #------------------------------

  # Routes for the Dish resource:

  # CREATE
  get("/dishes/new", { :controller => "dishes", :action => "new_form" })
  post("/create_dish", { :controller => "dishes", :action => "create_row" })

  # READ
  get("/dishes", { :controller => "dishes", :action => "index" })
  get("/dishes/:id_to_display", { :controller => "dishes", :action => "show" })

  # UPDATE
  get("/dishes/:prefill_with_id/edit", { :controller => "dishes", :action => "edit_form" })
  post("/update_dish/:id_to_modify", { :controller => "dishes", :action => "update_row" })

  # DELETE
  get("/delete_dish/:id_to_remove", { :controller => "dishes", :action => "destroy_row" })

  #------------------------------

  # Routes for the Bill resource:

  # CREATE
  get("/bills/new", { :controller => "bills", :action => "new_form" })
  post("/create_bill", { :controller => "bills", :action => "create_row" })

  # READ
  get("/bills", { :controller => "bills", :action => "index" })
  get("/bills/:id_to_display", { :controller => "bills", :action => "show" })

  # UPDATE
  get("/bills/:prefill_with_id/edit", { :controller => "bills", :action => "edit_form" })
  post("/update_bill/:id_to_modify", { :controller => "bills", :action => "update_row" })

  # DELETE
  get("/delete_bill/:id_to_remove", { :controller => "bills", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # Routes for the Ingredient resource:

  # CREATE
  get("/ingredients/new", { :controller => "ingredients", :action => "new_form" })
  post("/create_ingredient", { :controller => "ingredients", :action => "create_row" })

  # READ
  get("/ingredients", { :controller => "ingredients", :action => "index" })
  get("/ingredients/:id_to_display", { :controller => "ingredients", :action => "show" })

  # UPDATE
  get("/ingredients/:prefill_with_id/edit", { :controller => "ingredients", :action => "edit_form" })
  post("/update_ingredient/:id_to_modify", { :controller => "ingredients", :action => "update_row" })

  # DELETE
  get("/delete_ingredient/:id_to_remove", { :controller => "ingredients", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

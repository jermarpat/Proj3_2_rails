Proj3::Application.routes.draw do
  
  get "results/index"

  get "questions/index"

  get "questions/survey"

  get "pages/login"
  match "pages/login" => "pages#login", :via => [:get, :post]
  match "pages/admin" => "pages#admin"
  match "pages/deptAhead" => "pages#deptAhead"
  match "pages/deptBhead" => "pages#deptBhead"
  match "pages/div1head" => "pages#div1head"
  match "pages/users" => "pages#users"
  get "users/index"
  
  get "surveys/index"
  match "surveys/index" => "surveys#index"
  
  match "questions/survey" => "questions#survey"
  match "questions/updateResults" => "questions#updateResults"
  match "questions/createSurvey" => "questions#createSurvey"
end

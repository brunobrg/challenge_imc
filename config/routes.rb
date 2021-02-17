Rails.application.routes.draw do
  post '/imc', to: 'patients#imc'
end

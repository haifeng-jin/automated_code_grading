Rails.application.routes.draw do
  get 'login'              => 'sessions#new'
  post 'login'             => 'sessions#create'
  get 'logout'             => 'sessions#destroy'
  get 'signup'             => 'users#new'
  get 'show_student'       => 'users#show_student'
  get 'show_instructor'    => 'users#show_instructor'
  get 'homework_history'   => 'homeworks#homework_history'
  get 'view_assignment'    => 'homeworks#view_assignment'
  get 'edit_homework'      => 'homeworks#edit_homework'
  get 'destroy_homework'   => 'homeworks#destroy_homework'
  get 'view_student_record'  => 'homeworks#view_student_record'

  root 'sessions#new'
  get 'display_submission_file' =>'submissions#display_submission'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'submission_history' => 'submissions#submission_history'
  get 'submit_homework'    => 'submissions#submit_homework'
  get 'create_homework'    => 'homeworks#create_homework'
  get 'all_submission_history'  => 'submissions#all_submission_history'
  get 'specific_stu_hw_submissions' => 'submissions#specific_stu_hw_submissions'

  get 'create_course'      => 'courses#create_course'
  get 'edit_course'        => 'courses#edit_course'
  get 'view_students'      => 'users#view_student'
  get 'view_courses'       => 'courses#view_course'
  get 'drop_course'        => 'course_to_users#drop_course'

  post '/submissions/create'  => 'submissions#create'
  post '/homeworks/create'     => 'homeworks#create'
  post '/courses/create'     => 'courses#create'
  post '/courses/update'     => 'courses#update'
  post '/view_students'       => 'users#view_student'
  post '/announcements/create'     => 'announcements#create'

  resources :announcements
  resources :course_to_users
  resources :course_to_homeworks
  resources :submissions
  resources :homeworks
  resources :courses
  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
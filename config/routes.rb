Rails.application.routes.draw do
  # [基本的なルーティング]sessionsコントローラーのnew, create, destroyアクションに対応するGETリクエストのルートを定義している
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  #[ルートパス]アプリケーションのルートURL（/）をstatic_pagesコントローラーのtopアクションに対応させている
  root 'static_pages#top'
  #[リソースベースのルーティング]usersリソースのnewとcreateアクションに対するルートを定義しているゾ。%i[new create]はシンボルの配列
  resources :users, only: %i[new create]
  #[]sessionsリソースのnew, create, destroyアクションに対するルートを定義している
  resources :sessions, only: [:new, :create, :destroy]
  #[]boardsリソースのindex, new, create, showアクションに対するルートを定義している
  resources :boards, only: %i[index new create show edit update destroy] do
     #boardsにネストされたcommentsリソースのルートを定義しているゾ。shallow: trueは、commentsリソースのルートをネスト外にすることで、URLが短くなる
    resources :comments, only: %i[create edit destroy], shallow: true
    collection do
      get :bookmarks
    end
  end
  resources :bookmarks, only: %i[create destroy]
  #[カスタムルーティング]loginとlogoutに対応するカスタムルートを定義している。loginはuser_sessionsコントローラーのnewとcreateアクションに対応し、logoutはuser_sessionsコントローラーのdestroyアクションに対応している
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :bookmarks do
    post 'toggle_smile', on: :member
  end
end

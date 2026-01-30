# config/routes.rb
Rails.application.routes.draw do
  devise_for :users

  # ヘルスチェック / PWA
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest"       => "rails/pwa#manifest",       as: :pwa_manifest

  # ① 固定ページ（posts配下の疑似ページ）を先に定義
  root "posts#index"
  get "posts/member", to: "posts#member", as: :posts_member
  get "posts/result", to: "posts#result", as: :posts_result
  get "posts/image",  to: "posts#image",  as: :posts_image
  get "posts/video",  to: "posts#video",  as: :posts_video

  # ② 通常のCRUD。:id を数字だけに制限して衝突回避
  resources :posts, constraints: { id: /\d+/ }

  # そのほか既存ルート
  get "tweets/:id" => "tweets#show", as: :tweet
  get "users"      => "users#index"
end
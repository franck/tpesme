set :stage, :production

role :app, %{safetymotoride.fr}
role :web, %{safetymotoride.fr}
role :db, %{safetymotoride.fr}

server 'safetymotoride.fr', user: "tpesme", roles: %{web}

set :branch, 'stable'


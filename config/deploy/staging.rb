set :stage, :staging

role :app, %{safetymotoride.com}
role :web, %{safetymotoride.com}
role :db, %{safetymotoride.com}

server 'safetymotoride.com', user: "tpesme", roles: %{web}

set :branch, 'master'

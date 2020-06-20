bind "unix://#{Rails.root}/tmp/sockets/puma.sock"
rails_root = Dir.pwd
# 本番環境のみデーモン起動
if Rails.env.production?
    pidfile File.join(rails_root, 'tmp', 'pids', 'puma.pid')
    state_path File.join(rails_root, 'tmp', 'pids', 'puma.state')
    stdout_redirect(
        File.join(rails_root, 'log', 'puma.log'),
        File.join(rails_root, 'log', 'puma-error.log'),
        true
    )
    # デーモン
    daemonize
end
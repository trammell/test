https://github.com/tomnomnom/gron

CLI tool for exploring JSON documents - grep + JSON = gron

gron "https://api.github.com/repos/tomnomnom/gron/commits?er_page=1"

curl https://api.github.com/repos/tomnomnom/gron/commits?er_page=1 > sample.json
gron sample.json
gron sample.json | grep repo | gron -u



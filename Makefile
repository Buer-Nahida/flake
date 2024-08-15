updata:
	nixos-rebuild switch --use-remote-sudo --show-trace
	git add -A; git commit -am "Update"; git push

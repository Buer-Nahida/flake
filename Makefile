rebuild:
	git add -A
	nixos-rebuild switch --show-trace --use-remote-sudo

push:
	git add -A; git commit -am "Update"; git push

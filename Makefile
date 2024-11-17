rebuild:
	git add -A
	nixos-rebuild switch --show-trace --use-remote-sudo

update:
	git add -A; git commit -am "Update"; git push

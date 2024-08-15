rebuild:
	nixos-rebuild switch --use-remote-sudo --show-trace

update:
	git add -A; git commit -am "Update"; git push

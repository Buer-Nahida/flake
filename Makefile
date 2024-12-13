rebuild:
	git add -A
	nixos-rebuild switch --show-trace --use-remote-sudo

push:
	git add -A; git commit -am "Update"; git push

update:
	cp flake.lock 'flake.lock~'
	nix flake update

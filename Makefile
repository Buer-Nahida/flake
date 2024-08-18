rebuild:
	sudo nixos-rebuild switch --show-trace

update:
	git add -A; git commit -am "Update"; git push

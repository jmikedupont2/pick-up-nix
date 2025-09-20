find -name flake.nix -exec grep url {} \; > index/flake_nix_urls.txt
cut -d= -f2 index/flake_nix_urls.txt | sort | uniq -c | sort -n > index/flake_nix_urls_count.txt

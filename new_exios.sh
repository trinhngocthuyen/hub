#!/bin/bash

# Create a project from template: https://github.com/trinhngocthuyen/exios

set -e

read -p "$(printf "\033[32mProject dir (enter to use default: /tmp/projects/exios): \033[0m")" dst_dir
dst_dir=${dst_dir:-/tmp/projects/exios}

echo "dst_dir: ${dst_dir}"
if [[ -d ${dst_dir} ]]; then
	read -p "$(printf "\033[33mDir exists (${dst_dir}). Would you like to overwrite it? [Y/n]: \033[0m")"  should_cleanup_dst_dir
	case ${should_cleanup_dst_dir} in
		Y | y)
			rm -rf "${dst_dir}"
			;;
		* )
			;;
	esac
fi

git clone \
    --depth=1 \
    --branch=main \
    https://github.com/trinhngocthuyen/exios.git \
    "${dst_dir}"
git -C "${dst_dir}" remote remove origin

printf "\033[32;1mYour sample project is ready at: ${dst_dir}\n\033[0m"

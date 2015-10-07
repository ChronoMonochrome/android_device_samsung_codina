add_lunch_combo aosp_codina-eng
add_lunch_combo aosp_codina-userdebug

__codina_init_tools()
{
	local n=
	
	for n in "$(dirname "${BASH_SOURCE[1]}")"/tools/* ; do
		[ -x "${n}" ] || continue
		alias codina-"$(basename "${n}")"="$(realpath "${n}")"
	done
}

__codina_init_tools
unset __codina_init_tools

#!/bin/sh

# $1 - action
# $2 - type of file

action=$1
filetype=$2

[ -n "${MC_XDG_OPEN}" ] || MC_XDG_OPEN="xdg-open"

do_view_action() {
    filetype=$1

    case "${filetype}" in
    iso9660)
         if which isoinfo > /dev/null 2>&1; then
             isoinfo -d -i "${MC_EXT_FILENAME}" && isoinfo -l -R -J -i "${MC_EXT_FILENAME}"
         else
             7za l "${MC_EXT_FILENAME}"
         fi
        ;;
    cat)
        cat "${MC_EXT_FILENAME}" 2>/dev/null
        ;;
    ar)
        file "${MC_EXT_FILENAME}" && nm -C "${MC_EXT_FILENAME}"
        ;;
    lib)
        gplib -t "${MC_EXT_FILENAME}" | \
            /usr/local/bin/perl -e 'while (<>) { @a=split /[\s\t]+/, $_; printf ("%-30s | %10d | %s.%s.%02d | %s\n", $a[0], ($a[1]*1),$a[7], lc($a[4]), $a[5], $a[6]);}'
        ;;
    so)
        file "${MC_EXT_FILENAME}" && nm -C -D "${MC_EXT_FILENAME}"
        ;;
    elf)
        file "${MC_EXT_FILENAME}" && nm -C "${MC_EXT_FILENAME}"
        ;;
    dylib)
        file "${MC_EXT_FILENAME}" && nm -n "${MC_EXT_FILENAME}"
        ;;
    dbf)
        dbview -b "${MC_EXT_FILENAME}"
        ;;
    sqlite)
        sqlite3 "file:${MC_EXT_FILENAME}?immutable=1" .dump
        ;;
    mo)
        msgunfmt "${MC_EXT_FILENAME}" || \
            cat "${MC_EXT_FILENAME}"
        ;;
    lyx)
        lyxcat "${MC_EXT_FILENAME}"
        ;;
    torrent)
        ctorrent -x "${MC_EXT_FILENAME}" 2>/dev/null
        ;;
    javaclass)
        jad -p "${MC_EXT_FILENAME}" 2>/dev/null || \
            (file -b "${MC_EXT_FILENAME}"; javap -private "${MC_EXT_FILENAME}" 2>/dev/null)
        ;;
    *)
        ;;
    esac
}

do_open_action() {
    filetype=$1

    case "${filetype}" in
    dbf)
        dbview "${MC_EXT_FILENAME}"
        ;;
    sqlite)
        sqlite3 "${MC_EXT_FILENAME}"
        ;;
    glade)
        if which glade-3 >/dev/null 2>&1; then
            (glade-3 "${MC_EXT_FILENAME}" >/dev/null 2>&1 &)
        else
            (glade-2 "${MC_EXT_FILENAME}" >/dev/null 2>&1 &)
        fi
        ;;
    po)
        (poedit "${MC_EXT_FILENAME}" >/dev/null 2>&1 &)
        ;;
    lyx)
        lyx "${MC_EXT_FILENAME}"
        ;;
    *)
        ;;
    esac
}

case "${action}" in
view)
    do_view_action "${filetype}"
    ;;
open)
    ("${MC_XDG_OPEN}" "${MC_EXT_FILENAME}" >/dev/null 2>&1) || \
        do_open_action "${filetype}"
    ;;
*)
    ;;
esac

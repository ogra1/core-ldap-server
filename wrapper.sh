#! /bin/sh

if [ ! -d "$SNAP_DATA/ldap" ]; then
	mkdir -p $SNAP_DATA/ldap
	cp -a $SNAP/etc/ldap/* $SNAP_DATA/ldap/
	sed "s:\/etc\/ldap:${SNAP_DATA}\/ldap:;s:\/usr\/lib:${SNAP}\/usr\/lib:;s:\/var\/lib\/ldap:${SNAP_DATA}:" $SNAP/usr/share/slapd/slapd.conf >\
		$SNAP_DATA/ldap/slapd.conf
fi

exec slapd -F $SNAP_DATA/ldap -d -1 "$@"

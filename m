Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RRNmp-0007LV-VW
	for mharc-qemu-trivial@gnu.org; Fri, 18 Nov 2011 07:43:19 -0500
Received: from eggs.gnu.org ([140.186.70.92]:36109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1RRNmj-00070E-TQ
	for qemu-trivial@nongnu.org; Fri, 18 Nov 2011 07:43:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1RRNmg-0005qM-5S
	for qemu-trivial@nongnu.org; Fri, 18 Nov 2011 07:43:13 -0500
Received: from fmmailgate02.web.de ([217.72.192.227]:57138)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1RRNmX-0005ol-AR; Fri, 18 Nov 2011 07:43:01 -0500
Received: from moweb002.kundenserver.de (moweb002.kundenserver.de
	[172.19.20.108])
	by fmmailgate02.web.de (Postfix) with ESMTP id 556961BAFC2D8;
	Fri, 18 Nov 2011 13:43:00 +0100 (CET)
Received: from netbook.home ([189.116.108.37]) by smtp.web.de (mrweb002) with
	ESMTPA (Nemesis) id 0M40jS-1Qa6N93OhG-00rV94;
	Fri, 18 Nov 2011 13:42:59 +0100
Message-ID: <4EC652C8.4080903@web.de>
Date: Fri, 18 Nov 2011 10:42:48 -0200
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, 
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
References: <1321454759-19508-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1321454759-19508-1-git-send-email-armbru@redhat.com>
X-Enigmail-Version: 1.3.3
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig3F91A8B8BFA40457D40BA0A6"
X-Provags-ID: V02:K0:wiQVCMsKLltC8ui+o9XQelr7vrjwHB9fr8inz3pBnrm
	h4Avb/AhumsvHAJxmVcSWah1dwXcfGmRwlJoqwUjKlFGNXmg+8
	DqjcQRpmjRU5hhg0Vp0Ayv4cG3wufrbvjKoJjSiRRUDfHPBmVt
	YEVY+czGPXKAkYBnMgA0LXbpVBSl94on1psLsr86/kedKB8N4H
	fkCicQKwKGk9Wv4alNm5w==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.227
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] slirp: Clean up
	net_slirp_hostfwd_remove()'s use of get_str_sep()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Nov 2011 12:43:17 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig3F91A8B8BFA40457D40BA0A6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

On 2011-11-16 12:45, Markus Armbruster wrote:
> get_str_sep() can fail, but net_slirp_hostfwd_remove() doesn't check.
> Works, because it initializes buf[] to "", which get_str_sep() doesn't
> touch when it fails.  Coverity doesn't like it, and neither do I.
>=20
> Change it to work exactly like slirp_hostfwd().
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Acked-by: Jan Kiszka <jan.kiszka@siemens.com>

Stefan, can you take this? My slirp queue not fully "operative" ATM down
here in Brazil.

Thanks,
Jan

> ---
>  net/slirp.c |    9 ++++-----
>  1 files changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/net/slirp.c b/net/slirp.c
> index c6cda5d..6646ecb 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -305,7 +305,7 @@ void net_slirp_hostfwd_remove(Monitor *mon, const Q=
Dict *qdict)
>  {
>      struct in_addr host_addr =3D { .s_addr =3D INADDR_ANY };
>      int host_port;
> -    char buf[256] =3D "";
> +    char buf[256];
>      const char *src_str, *p;
>      SlirpState *s;
>      int is_udp =3D 0;
> @@ -325,11 +325,10 @@ void net_slirp_hostfwd_remove(Monitor *mon, const=
 QDict *qdict)
>          return;
>      }
> =20
> -    if (!src_str || !src_str[0])
> -        goto fail_syntax;
> -
>      p =3D src_str;
> -    get_str_sep(buf, sizeof(buf), &p, ':');
> +    if (!p || get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
> +        goto fail_syntax;
> +    }
> =20
>      if (!strcmp(buf, "tcp") || buf[0] =3D=3D '\0') {
>          is_udp =3D 0;



--------------enig3F91A8B8BFA40457D40BA0A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk7GUsgACgkQitSsb3rl5xRNGQCdGaFIqmk/sfjIbTwjYbS2qi29
v50AnjL3Y+jVRdVhpk/dGArzAKDrq8u9
=t5oC
-----END PGP SIGNATURE-----

--------------enig3F91A8B8BFA40457D40BA0A6--


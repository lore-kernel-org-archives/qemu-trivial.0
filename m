Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvVHI-0008IZ-Mq
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 10:51:48 -0500
Received: from eggs.gnu.org ([208.118.235.92]:60297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1TvVHH-0008Hs-16
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 10:51:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1TvVHD-0005pM-Nq
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 10:51:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57274)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1TvVH6-0005nE-39; Wed, 16 Jan 2013 10:51:36 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0GFpXm0025161
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 16 Jan 2013 10:51:34 -0500
Received: from [10.3.113.75] (ovpn-113-75.phx2.redhat.com [10.3.113.75])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0GFpWnM008489; Wed, 16 Jan 2013 10:51:33 -0500
Message-ID: <50F6CC84.8000908@redhat.com>
Date: Wed, 16 Jan 2013 08:51:32 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1358346998-26328-1-git-send-email-armbru@redhat.com>
	<1358346998-26328-5-git-send-email-armbru@redhat.com>
In-Reply-To: <1358346998-26328-5-git-send-email-armbru@redhat.com>
X-Enigmail-Version: 1.5.0
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="----enig2SXCTCWIIQLNHOIOCUUPB"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 04/11] readline: Fix
 unchecked strdup() by converting to g_strdup()
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
X-List-Received-Date: Wed, 16 Jan 2013 15:51:48 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2SXCTCWIIQLNHOIOCUUPB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 01/16/2013 07:36 AM, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  readline.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/readline.c b/readline.c
> index a0c9638..d6e04d4 100644
> --- a/readline.c
> +++ b/readline.c
> @@ -247,14 +247,14 @@ static void readline_hist_add(ReadLineState *rs, =
const char *cmdline)
>      }
>      if (idx =3D=3D READLINE_MAX_CMDS) {
>  	/* Need to get one free slot */
> -	free(rs->history[0]);
> +        g_free(rs->history[0]);
>  	memmove(rs->history, &rs->history[1],
>  	        (READLINE_MAX_CMDS - 1) * sizeof(char *));
>  	rs->history[READLINE_MAX_CMDS - 1] =3D NULL;
>  	idx =3D READLINE_MAX_CMDS - 1;
>      }
>      if (new_entry =3D=3D NULL)
> -	new_entry =3D strdup(cmdline);
> +        new_entry =3D g_strdup(cmdline);

As long as you are converting tabs to spaces, you should also be adding {=
}.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


------enig2SXCTCWIIQLNHOIOCUUPB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJQ9syEAAoJEKeha0olJ0Nqft4H/R6pPnt1lqZPOxHnnhUW+dTW
3Gy3vZkW4tct2Qq7Akx4YJL+jZWzmEN1JfoHv4ulOrfCkLl58Ie7nGnvhSJXWDfA
h6zEid9zvgwdclXDY3p/p48/bq0MFkSb36vZ/pZDmsN/oGr4/3bdbkPedUXyLnxI
xJ0vAcjgAoWnTuZrzrkh5lmwYsNEXCq3sy+cFCiYLga+Uq8i4i4XjMvGW5+gAbAz
5OGxdUs8k23TpkHtUxpBed+1Br5P76jhEdm8HulPpmhpm9+NCdkrT6UTVhavzWui
FBRiYJ7DiZZhHckt2+hEecuPL8yAzMIFHqUBQ2mwgcYSQHzB2WqFnsWDpUu3lDY=
=KC0b
-----END PGP SIGNATURE-----

------enig2SXCTCWIIQLNHOIOCUUPB--


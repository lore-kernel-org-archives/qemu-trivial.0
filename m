Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rc0JW-0006t9-Ge
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2011 14:52:58 -0500
Received: from eggs.gnu.org ([140.186.70.92]:44081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1Rc0JT-0006kF-Eh
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 14:52:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1Rc0JS-0004XX-7l
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 14:52:55 -0500
Received: from fmmailgate01.web.de ([217.72.192.221]:57009)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1Rc0JP-0004Wx-3I; Sat, 17 Dec 2011 14:52:51 -0500
Received: from moweb002.kundenserver.de (moweb002.kundenserver.de
	[172.19.20.108])
	by fmmailgate01.web.de (Postfix) with ESMTP id 1C82B1A523729;
	Sat, 17 Dec 2011 20:52:49 +0100 (CET)
Received: from mchn199C.mchp.siemens.de ([88.64.14.121]) by smtp.web.de
	(mrweb002) with ESMTPA (Nemesis) id 0M4Zlk-1Qm67844OS-00ye0t;
	Sat, 17 Dec 2011 20:52:47 +0100
Message-ID: <4EECF30E.9060109@web.de>
Date: Sat, 17 Dec 2011 20:52:46 +0100
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Geoffrey Thomas <geofft@ldpreload.com>
References: <alpine.DEB.2.02.1112170420460.22177@tyger.mit.edu>
In-Reply-To: <alpine.DEB.2.02.1112170420460.22177@tyger.mit.edu>
X-Enigmail-Version: 1.3.4
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig92CCAABE478684B46E840052"
X-Provags-ID: V02:K0:NXrG1fE8MSXlXR4eAEEMlC2Z/+App1q/EcAECCfkjb1
	JHnMDgHzZbDWfrgIsxMCh7f3w4DfyvE3ns5KrxAZihlveZ/tOU
	a/j/qmSLmO98/qLEVtRV3ugc5An61JLkGx6w+KYvvA6+4/s6Hx
	uM/J0rAQthfwgW7q13tUb9ZjpZSbKxfeKicAxyibYR2aYnfigb
	vtPKIm+119PldMxBmKNtQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.221
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH] slirp: Fix typo in
	net_slirp_hostfwd_remove
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
X-List-Received-Date: Sat, 17 Dec 2011 19:52:57 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig92CCAABE478684B46E840052
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 2011-12-17 10:23, Geoffrey Thomas wrote:
> Report an error when err is nonzero, not when it is zero.
>=20
> Signed-off-by: Geoffrey Thomas <geofft@ldpreload.com>
> ---
>  net/slirp.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/net/slirp.c b/net/slirp.c
> index 6646ecb..18e07ba 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -351,7 +351,7 @@ void net_slirp_hostfwd_remove(Monitor *mon, const
> QDict *qdict)
>                                 host_addr, host_port);
>=20
>      monitor_printf(mon, "host forwarding rule for %s %s\n", src_str,
> -                   err ? "removed" : "not found");
> +                   err ? "not found" : "removed");
>      return;
>=20
>   fail_syntax:

Oops, obviously. Stefan, should be another trivial one for you.

Thanks,
Jan


--------------enig92CCAABE478684B46E840052
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk7s8w4ACgkQitSsb3rl5xQswACfYyGpdStqmdspLOBfokU9rsIe
0cYAn0qsA/uWZ6fbv0j1m/EgSVbxD/UG
=MalQ
-----END PGP SIGNATURE-----

--------------enig92CCAABE478684B46E840052--


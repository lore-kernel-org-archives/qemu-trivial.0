Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aDtdL-0004xp-Fp
	for mharc-qemu-trivial@gnu.org; Tue, 29 Dec 2015 07:44:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aDtdJ-0004t5-9A
	for qemu-trivial@nongnu.org; Tue, 29 Dec 2015 07:44:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aDtdI-0001An-EF
	for qemu-trivial@nongnu.org; Tue, 29 Dec 2015 07:44:09 -0500
Received: from mail.weilnetz.de ([37.221.199.173]:57457)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1aDtdE-0001A2-2M; Tue, 29 Dec 2015 07:44:04 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id 4201811810A9;
	Tue, 29 Dec 2015 13:44:03 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id NJcpyRO8fLMD; Tue, 29 Dec 2015 13:44:01 +0100 (CET)
Received: from edv32.bib.uni-mannheim.de (p54AC8B9D.dip0.t-ipconnect.de
	[84.172.139.157])
	by mail.weilnetz.de (Postfix) with ESMTPSA id 0756B11810A3;
	Tue, 29 Dec 2015 13:44:00 +0100 (CET)
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1451392796-30956-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <5682800F.8000001@weilnetz.de>
Date: Tue, 29 Dec 2015 13:43:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.4.0
MIME-Version: 1.0
In-Reply-To: <1451392796-30956-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="bIXnDoGcIf4FdH47KPBUMO22UomrTmeMB"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, xen-devel@lists.xensource.com,
	stefano.stabellini@eu.citrix.com
Subject: Re: [Qemu-trivial] [PATCH trivial v2] xen/Makefile.objs: simplify
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
X-List-Received-Date: Tue, 29 Dec 2015 12:44:10 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bIXnDoGcIf4FdH47KPBUMO22UomrTmeMB
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

Am 29.12.2015 um 13:39 schrieb Cao jin:
> merge last two lines, keep alphabetic order.
>=20
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  hw/xen/Makefile.objs | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/hw/xen/Makefile.objs b/hw/xen/Makefile.objs
> index a9ad7e7..d367094 100644
> --- a/hw/xen/Makefile.objs
> +++ b/hw/xen/Makefile.objs
> @@ -2,5 +2,4 @@
>  common-obj-$(CONFIG_XEN_BACKEND) +=3D xen_backend.o xen_devconfig.o
> =20
>  obj-$(CONFIG_XEN_PCI_PASSTHROUGH) +=3D xen-host-pci-device.o
> -obj-$(CONFIG_XEN_PCI_PASSTHROUGH) +=3D xen_pt.o xen_pt_config_init.o x=
en_pt_msi.o
> -obj-$(CONFIG_XEN_PCI_PASSTHROUGH) +=3D xen_pt.o xen_pt_config_init.o x=
en_pt_msi.o xen_pt_graphics.o
> +obj-$(CONFIG_XEN_PCI_PASSTHROUGH) +=3D xen_pt.o xen_pt_config_init.o x=
en_pt_graphics.o xen_pt_msi.o
>=20

Thanks.

Reviewed-by: Stefan Weil <sw@weilnetz.de>



--bIXnDoGcIf4FdH47KPBUMO22UomrTmeMB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWgoAQAAoJEOCMIdVndFCt9RoP/0Cn1m1mMD1F4QsUgnkusJ3I
WWIQ1QvhvnEDKHdPUrtEO6mwpeuSWP0Lxu/VFRPs1OujAk+W/NV8EbMlcnUJarn6
6LGZfy6AKzHBakIZQVJYcYlFcoTkDpapSYlcAnQFFwKPe/CB0PD1xNY0rj9YaB/N
OBD+oI/JpILfAU/1hQR2OqkYQnZiB+DmMLBgkiAbqm3RjCevO8zwcnbY+7YKvD+a
iCZ6KdUf9eHPJ8U0+X4gUw/+voPIhUyEQgad8lvxbtYgxnxyr3RNKKIZ9fm7QKbC
/JrcEcqXFI00F7KVeaCLg9niubwNFv5eNr7HCNDfMG5hQqYwSkEZcjYzf12AQr9K
h8ZStzeCvxFR9o5Fke3CIcDbWVixoTIl7ZWldVWv4pfB8yTPZ8m65AQMgjtzmsQm
o7EqhFfOlYP7xodkYYPm+ekDhs+3Ub2IfJPickkNTa3nzjZl9RuDy6DWvYo9aL+5
asUZ4wt0r117NAiq+2cvzjzwWJcgiP+mCTG91/R/htufxWQm36RQZMP2uReVcHbI
kUL7inY9g4O+4fupfzhMwNy+RTtA8LQqQZqAnPtPQo4ePWO6MTQVnZupOSMMpf0i
1mR/ZhbC73sbb43UBopZbSZrYW9+CVyBUn2rxaLJ6inEmuyAu/UiSoKwsuzTz46V
7aeFDONAH+SonCOJbTYm
=UOek
-----END PGP SIGNATURE-----

--bIXnDoGcIf4FdH47KPBUMO22UomrTmeMB--


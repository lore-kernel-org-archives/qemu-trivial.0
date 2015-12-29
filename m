Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aDrWU-0000Em-WF
	for mharc-qemu-trivial@gnu.org; Tue, 29 Dec 2015 05:28:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aDrWS-0000DJ-NX
	for qemu-trivial@nongnu.org; Tue, 29 Dec 2015 05:28:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aDrWP-0007Gw-CE
	for qemu-trivial@nongnu.org; Tue, 29 Dec 2015 05:28:56 -0500
Received: from mail.weilnetz.de ([37.221.199.173]:56485)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aDrWP-0007Gr-61
	for qemu-trivial@nongnu.org; Tue, 29 Dec 2015 05:28:53 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id DB51B11810A9;
	Tue, 29 Dec 2015 11:28:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id eRSYRehIzYnr; Tue, 29 Dec 2015 11:28:48 +0100 (CET)
Received: from edv32.bib.uni-mannheim.de (p54AC8B9D.dip0.t-ipconnect.de
	[84.172.139.157])
	by mail.weilnetz.de (Postfix) with ESMTPSA id 9A77211810A3;
	Tue, 29 Dec 2015 11:28:48 +0100 (CET)
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1451384035-29691-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Stefan Weil <sw@weilnetz.de>
X-Enigmail-Draft-Status: N1210
Message-ID: <5682605F.100@weilnetz.de>
Date: Tue, 29 Dec 2015 11:28:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.4.0
MIME-Version: 1.0
In-Reply-To: <1451384035-29691-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="CLhNgplnT9UbBCurNJhdlkbpCBfl8hAL0"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, xen-devel@lists.xensource.com,
	stefano.stabellini@eu.citrix.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] xen/Makefile.objs:
	simplify
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
X-List-Received-Date: Tue, 29 Dec 2015 10:28:57 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CLhNgplnT9UbBCurNJhdlkbpCBfl8hAL0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

Am 29.12.2015 um 11:13 schrieb Cao jin:
> merge three lines into one line
>
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  hw/xen/Makefile.objs | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/hw/xen/Makefile.objs b/hw/xen/Makefile.objs
> index a9ad7e7..77806f0 100644
> --- a/hw/xen/Makefile.objs
> +++ b/hw/xen/Makefile.objs
> @@ -1,6 +1,4 @@
>  # xen backend driver support
>  common-obj-$(CONFIG_XEN_BACKEND) +=3D xen_backend.o xen_devconfig.o
> =20
> -obj-$(CONFIG_XEN_PCI_PASSTHROUGH) +=3D xen-host-pci-device.o
> -obj-$(CONFIG_XEN_PCI_PASSTHROUGH) +=3D xen_pt.o xen_pt_config_init.o x=
en_pt_msi.o
> -obj-$(CONFIG_XEN_PCI_PASSTHROUGH) +=3D xen_pt.o xen_pt_config_init.o x=
en_pt_msi.o xen_pt_graphics.o
> +obj-$(CONFIG_XEN_PCI_PASSTHROUGH) +=3D xen_pt.o xen_pt_config_init.o x=
en_pt_msi.o xen_pt_graphics.o xen-host-pci-device.o

Obviously commit 798141799ccd5235a928b8fc0411d7d74e706489
added duplicate .o entries which of course should be removed.

I suggest to keep the first line separate instead of merging it.
That preserves the alphabetic order and avoids a long line.

Regards,
Stefan



--CLhNgplnT9UbBCurNJhdlkbpCBfl8hAL0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWgmBfAAoJEOCMIdVndFCtm5kP/Ahq3zJuKTN4vv1bTrW8B4PB
faW+XJ43sw6TlyQnCuRD4rhOtLVAZSJJGZdEsLbVRLu6hnQ3bhtQRFDmbL5OjQxW
l0obl4Uksa0l36CSD994VJq+q9RGH+phLkchigQl6y9eUKBmklb6/ZGKNQkBFLv/
m+CrhkuO6EHprgp1bgJIqpy2lDELQp1G1By3RWVq9tGGU9bT2Q2+SLOgfHm20sYN
I1NjahPg36OXHWEZMWfq4F7YhqvL8mw4TiuUoOkmeo93pKGqTPKGd/uZKFPcaQHY
p+22rerZ2uph5kesme8maUz0m7VEK7O8Rz5QQbn0AxC1+LB3ukOvSp/m6zIIukPn
EK7ivx9JsneVkE+/w6vYk0r0gn9lF1zWWYZtl3X7g8oZFWTh72/WvEmmw7Teqxp9
Fa5w2Lu1CWIODi6FwPMe2JQpjwDwbR6EX1RPbIJV5DK6iD2GuAE4S7Mb6f2SVHuH
oDEbDs5Ogv/hu0Bh+ZpqNCZJ88nAkscD+9BNHNXlHaxHIwVVW8rYX/aRQkJR3OTa
Pgfrjr2mImuRMZSE+X3v+lSzq4TcDEPRbhNXpDciOxn5UEie0NnntZY3mlw2wVRF
esz+s1d8YkWL94otuWUfO69F8ZNZoTdsJ3fMB7YdfeuagFjQgG57gQ2DZLq1Q48M
L8RmzEKlAC+TR7Q0Ci0a
=tfgl
-----END PGP SIGNATURE-----

--CLhNgplnT9UbBCurNJhdlkbpCBfl8hAL0--


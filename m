Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aq5ZN-0000zZ-2F
	for mharc-qemu-trivial@gnu.org; Tue, 12 Apr 2016 17:09:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1aq5ZK-0000wF-8s
	for qemu-trivial@nongnu.org; Tue, 12 Apr 2016 17:09:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1aq5ZF-0006wZ-6K
	for qemu-trivial@nongnu.org; Tue, 12 Apr 2016 17:09:54 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33684)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>)
	id 1aq5ZF-0006wT-2U; Tue, 12 Apr 2016 17:09:49 -0400
Received: by mail-qk0-x244.google.com with SMTP id d3so1243066qke.0;
	Tue, 12 Apr 2016 14:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version; 
	bh=7BaRWhWk8fZ95ZLA+SiErWqJvYA+bXuPyG6e3ZzTwzs=;
	b=woySuNAXgo0pqg8bPmerczGuyf0sFPMROXkNe/SpWHShm4m9mbdyzQt6OJTAPYFITv
	er2GyP7dlT8nWZHd/psGvuT8v9uV2j5XHtyEMMEQmKB7UlVw3WERcGocFjNzOXF/xWoU
	z1LIbXBsg+d0dXTdmPxGBKN/okrvuAJAYiqSEMu1xqC1iOUb+J2LBuDo65V7NYPcNI96
	TgGdms8H4I4nD+XOGpwkmFvwgowKLToWOW8yUMUVkhakDfjCxq6wFLcIW/GjueUFARu7
	wL0C6mADENIpGLS0joHgPTOyvIsfev2zLDEUzkVEuH8HV1Rnr9L97XSZQ7vRpXIeemq+
	2J4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version;
	bh=7BaRWhWk8fZ95ZLA+SiErWqJvYA+bXuPyG6e3ZzTwzs=;
	b=HWtpA36BA3uYjd1IIrCJ86ncQ1FLtwIVbnPn7/4wDSorLoBfPqHgMAmlFVITQW4MoA
	DM1KdgC0sT/lWR/nKi230slXap6L6qGlYz/jG8be5JDrFu6B7G7zpbIii7lXD93sdwy1
	qAyVZhwEO3Lr9+wYrVkg3CHChjnlMgPM+8VdMraw0yKrc6wU1aFdxVMUVAIDePe1Aujh
	vJHCVDJPFMRL4NuQAmAyPdXPFfDpxYpp/tkp+XQfORvqleLQ1zMNFLdwbOgSgF3NDJ5O
	hdTzgsUuX3xeLCVOxJzuUy2rWFUW3F6p4EEZUqFHBijDuVuNxnVTTi/6LjG8dCQNWJOM
	XVdA==
X-Gm-Message-State: AOPr4FWsh2clCb/CuQwHKgoWsgPSesiZTeSk498mWC035p6FsiHYirZvVQU3GCl1G3+37A==
X-Received: by 10.55.163.16 with SMTP id m16mr6380294qke.75.1460495388585;
	Tue, 12 Apr 2016 14:09:48 -0700 (PDT)
Received: from [192.168.235.129] (lawn-gw.rutgers.edu. [128.6.168.245])
	by smtp.gmail.com with ESMTPSA id
	131sm12973133qhk.15.2016.04.12.14.09.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Apr 2016 14:09:48 -0700 (PDT)
Message-ID: <1460495386.7674.1.camel@gmail.com>
From: Jan Vesely <jano.vesely@gmail.com>
To: qemu-trivial@nongnu.org, QEMU <qemu-devel@nongnu.org>
Date: Tue, 12 Apr 2016 17:09:46 -0400
In-Reply-To: <1458436706-20743-1-git-send-email-jano.vesely@gmail.com>
References: <1458436706-20743-1-git-send-email-jano.vesely@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-nkzIvW5aSyMnHfU3Fq4W"
X-Mailer: Evolution 3.18.5.1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [PATCH] configure: Check if struct fsxattr is
 available from linux header
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Apr 2016 21:09:55 -0000


--=-nkzIvW5aSyMnHfU3Fq4W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2016-03-19 at 21:18 -0400, Jan Vesely wrote:
> Fixes build with new linux headers.
>=20
> Signed-off-by: Jan Vesely <jano.vesely@gmail.com>
> ---
> linux-headers-4.5 and xfsprogs-3.2.4 in my case
>=20
> =C2=A0configure | 18 ++++++++++++++++++
> =C2=A01 file changed, 18 insertions(+)
>=20
> diff --git a/configure b/configure
> index b88d0db..bb64d6c 100755
> --- a/configure
> +++ b/configure
> @@ -4474,6 +4474,21 @@ if test "$fortify_source" !=3D "no"; then
> =C2=A0=C2=A0=C2=A0fi
> =C2=A0fi
> =C2=A0
> +########################################
> +# check if struct fsxattr is available
> +
> +have_fsxattr=3Dno
> +cat > $TMPC << EOF
> +#include <linux/fs.h>
> +struct fsxattr foo;
> +int main(void) {
> +=C2=A0=C2=A0return 0;
> +}
> +EOF
> +if compile_prog "" "" ; then
> +=C2=A0=C2=A0=C2=A0=C2=A0have_fsxattr=3Dyes
> +fi
> +
> =C2=A0##########################################
> =C2=A0# End of CC checks
> =C2=A0# After here, no more $cc or $ld runs
> @@ -5137,6 +5152,9 @@ fi
> =C2=A0if test "$have_ifaddrs_h" =3D "yes" ; then
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0echo "HAVE_IFADDRS_H=3Dy" >> $config_host_m=
ak
> =C2=A0fi
> +if test "$have_fsxattr" =3D "yes" ; then
> +=C2=A0=C2=A0=C2=A0=C2=A0echo "HAVE_FSXATTR=3Dy" >> $config_host_mak
> +fi
> =C2=A0if test "$vte" =3D "yes" ; then
> =C2=A0=C2=A0=C2=A0echo "CONFIG_VTE=3Dy" >> $config_host_mak
> =C2=A0=C2=A0=C2=A0echo "VTE_CFLAGS=3D$vte_cflags" >> $config_host_mak

gentle ping.
the docs say trivial patches are collected every week. yet the last one
was in Feb.


--=-nkzIvW5aSyMnHfU3Fq4W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXDWQaAAoJEOCQZixVs7KBmB8P/RKzAWZeG0y3mnJS8w/U7AR7
DJzavoPUeEdO0JC/zpAxGWSi09Qb3ExK25+RWtZ6/g5kInSWaHR6W4hdELUnbWDy
X9/NCl68SzA1UA8NxNA7Tz/PGX2m+/0/OWEwmbT8h13aqeepo+X+3yPfeOWVDOIl
iRD8tmkLL03se4PgDds5mlWoCEoF3xA4xrlRnvfo7I86fEhuGLdoYV6P1abFtClp
w07lGxEaWwwQgAWM25QdHQYKx7CCYx2cKxv4UdJekm7/WM/WiwZNhlTEFSzYFqxd
2iWjVTkRFHPeCVZYEmeXppFe4Es4SE/B1V0/V8KSDq5U+k3shS3SYwDez1dIVPDH
+DLghXpQBSIng5Vw9vuDvuGve6VBVaLvFC8i+sQmVodqdtJFn1+UuWapNfhxBCdb
/ROmSludOBaQR//tAT6LfvMhD1MsBeTbU2madBiSWGf10Z2rKyjKf4SKdGClLQ2C
WybwzD/raS3qbZVmCNygqGodwWup473uPpIyMzycHCIWavlwi0pIy5iI0UpCLYHg
tPsMudCVUS57a4A/dwFsNBBQpR+ejqqarREii5nA+wSz4KFJHCNPJIYG30g6yR9T
8iYXxNH+CDY61VE6tGImU5MYzxASwcUlD8PqeNgx87m9xRT+tF5l3QHuhRwqjTuR
iXqH48H9d7huS75ZRtpY
=DXj3
-----END PGP SIGNATURE-----

--=-nkzIvW5aSyMnHfU3Fq4W--



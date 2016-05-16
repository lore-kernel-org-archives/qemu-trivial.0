Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b2HrO-0001Q1-39
	for mharc-qemu-trivial@gnu.org; Mon, 16 May 2016 08:42:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1b2HrI-0001FJ-SH
	for qemu-trivial@nongnu.org; Mon, 16 May 2016 08:42:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1b2HrE-0004DH-Sv
	for qemu-trivial@nongnu.org; Mon, 16 May 2016 08:42:52 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=48124 helo=mail.weilnetz.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1b2Hr6-0004B0-JJ; Mon, 16 May 2016 08:42:40 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id 17F9F11810AB;
	Mon, 16 May 2016 14:32:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 1qjLItk39hFN; Mon, 16 May 2016 14:32:36 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (p54AC8FB1.dip0.t-ipconnect.de
	[84.172.143.177])
	by mail.weilnetz.de (Postfix) with ESMTPSA id 3735511810A9;
	Mon, 16 May 2016 14:32:36 +0200 (CEST)
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1461879221-13338-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA_AGhFyNdXZkMzs2P4XzgEgPGyHhjr+vp78DBD3NnJaZA@mail.gmail.com>
	<5739AE8A.9080604@weilnetz.de> <5739BB81.8080307@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>, qemu-stable@nongnu.org
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <5739BDE3.5030301@weilnetz.de>
Date: Mon, 16 May 2016 14:32:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <5739BB81.8080307@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="fORcbp8GmNNE25FW0dUjX4IaSetoKQ4UA"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Subject: Re: [Qemu-trivial] [PATCH for 2.6] configure: Allow builds
 -Weverything
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
X-List-Received-Date: Mon, 16 May 2016 12:42:56 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fORcbp8GmNNE25FW0dUjX4IaSetoKQ4UA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 16.05.2016 um 14:22 schrieb Paolo Bonzini:
>=20
>=20
> On 16/05/2016 13:27, Stefan Weil wrote:
>> I think this patch which was too late for 2.6.0 is a candidate for
>> qemu-trivial, maybe also for qemu-stable. CC both mailing lists.
>=20
> Yes, it is confusing to have --disable-werror compilations break becaus=
e
> of warnings becoming errors.  However, the subject is imprecise, what a=
bout:
>=20
> ----
> configure: Allow builds with extra warnings
>=20
> The clang compiler supports a useful compiler option -Weverything,
> and GCC also has other warnings not enabled by -Wall.
>=20
> If glib header files trigger a warning, however, testing glib with
> -Werror will always fail. A size mismatch is also detected without
> -Werror, so simply remove it.
> ----
>=20
> Thanks,
>=20
> Paolo


Yes, that's a better description. Maybe Michael can use it when
applying the patch.

Stefan


--fORcbp8GmNNE25FW0dUjX4IaSetoKQ4UA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXOb3jAAoJEOCMIdVndFCtJ44P/3wWzN/WATCI2wy6PkwAPHsm
RT+vh+ZQl/eNxQ1xs06pDcSvwR/UyV6CqkTQjAkue+smRIfTTNuQ1J7sD6owKxQ4
qKH9nI8W5a32+4KPjG86Ood4w0WCKyi0sgeU4bKB0hRthhgamtLVQFuDz6gV8ZU4
vqmnI/2PXy8rhvku7MoMS99HpEhxhXj+9u3ySBVsrDFWiUcgXsU+i9B3TdwVwDvf
Zjyw+DLq5pzCcBTYyGoZrcclHaBSN10O9HF6dFFIFDYdxh+oB+jGYhqkB4n741dl
X2DN8u6Q/hYr1pFsNSNoBa7Ta7VlXKNeJ2Qmiv4u4EbVaYODrJmA4JE4bSh8s6fZ
dPd3jaVq1UfwxFFz5MqEGwJNz7B/CkET+p0SWUUZNatyAsg38xFpO94jMXzuVPbG
x4Y/pfW32eMcymAf3ua990xcH/HG+vXKzR8w7nfYREb1x3j7W5T13zlzSRTfZLop
Tu9Ovb0bNhJGx88cxE7MUMlma5rnOyEXOlBzPxuu/cYI9Q51pDmFPZc8B0G+Ytv/
2YGgLq5c+JVMDkiq6CcaDjQfAAe90F8Wm83Wv7qfFuC7LEnqmRGBRTq6bQAcAhPS
fj6tlTs4TqCkKtB8n6xvpcyR4vP+OSze39QhjcB1ff40fHrhS6p6zlJNEEghkeSi
6DY6lz8kJzBq5LiksZgD
=EL7P
-----END PGP SIGNATURE-----

--fORcbp8GmNNE25FW0dUjX4IaSetoKQ4UA--


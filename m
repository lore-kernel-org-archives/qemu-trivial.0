Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XtfLY-0003lP-W7
	for mharc-qemu-trivial@gnu.org; Wed, 26 Nov 2014 11:21:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XtfLR-0003Yz-9W
	for qemu-trivial@nongnu.org; Wed, 26 Nov 2014 11:21:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XtfLL-0001Mr-R2
	for qemu-trivial@nongnu.org; Wed, 26 Nov 2014 11:21:33 -0500
Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229]:48673)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1XtfL9-0001GQ-76; Wed, 26 Nov 2014 11:21:15 -0500
Received: by mail-wi0-f169.google.com with SMTP id r20so15964806wiv.0
	for <multiple recipients>; Wed, 26 Nov 2014 08:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=q+B6lwfu8fLwjkMVjqMKVeKRUMBZqbIrc2TM7RxP6v8=;
	b=cGZqc3m3l3ZQU9DKl/5dwhx8DA45KbzVMhtb3RbekDJcEEO+nlD3To9hwdKMra+ubv
	yvN7LK8uMagKxpESAMEbT7xm2N1C2KPZeQJUcV9LeECLc1RfzoKPRzRsGm4Il6ARX3P7
	13dpvmssCZBDyuQ+wTXoCsvyrYauSE7gQDyMA6Qh8K91jIYDrMoKTc3chXljopV46Mzz
	G1yE7fiX7E1Ht/Q+Nhf137J4HLS4U1pSL+M8Ic38HxHVjjdlyHMRCJel1ARqVuaaia6D
	s+8BZS89vwVrBH8TuAR8mnAM4J6NKiXcp190qmRR4XBJCVcnwlvXXO85TtA53LgcYYRZ
	r+zw==
X-Received: by 10.180.99.163 with SMTP id er3mr42346285wib.18.1417018874626;
	Wed, 26 Nov 2014 08:21:14 -0800 (PST)
Received: from localhost (96.208.115.87.dyn.plus.net. [87.115.208.96])
	by mx.google.com with ESMTPSA id pf4sm6949596wjb.36.2014.11.26.08.21.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Nov 2014 08:21:13 -0800 (PST)
Date: Wed, 26 Nov 2014 16:21:12 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Fam Zheng <famz@redhat.com>
Message-ID: <20141126162112.GF14288@stefanha-thinkpad.redhat.com>
References: <1416380832-9697-1-git-send-email-famz@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GV0iVqYguTV4Q9ER"
Content-Disposition: inline
In-Reply-To: <1416380832-9697-1-git-send-email-famz@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::229
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] tests: Use "command -v"
 instead of which(1) in shell scripts
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
X-List-Received-Date: Wed, 26 Nov 2014 16:21:39 -0000


--GV0iVqYguTV4Q9ER
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2014 at 03:07:12PM +0800, Fam Zheng wrote:
> When which(1) is not installed, we would complain "perl not found"
> because it's the first set_prog_path check. The error message is
> wrong.
>=20
> Fix it by using "command -v", a native way to query the existence of a
> command.
>=20
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Fam Zheng <famz@redhat.com>
>=20
> ---
> v2: Use "command -v" as suggested by Eric. Also change a few other
> occasions of which(1) in tests/qemu-iotests/common.
> ---
>  tests/qemu-iotests/common        | 8 ++++----
>  tests/qemu-iotests/common.config | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Thanks, applied to my block-next tree:
https://github.com/stefanha/qemu/commits/block-next

Stefan

--GV0iVqYguTV4Q9ER
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUdf34AAoJEJykq7OBq3PICZAH/2WGMoGLbvcbWQAx/12PQgVn
cgzR/+JptGVlISOvyKAdO9jc4qWkPctig6pjWA1ZWUpPjHHfGEGOuyVBpNnwkZef
FHuZsdXyuQk3oE6FS2JmtotKMIhuGeVV/QcNtdNP2TDNufPBejEMLPH3D/LYdrTN
slWjx0XIP4qODI/RR2yW5qwlHxd7ct17UGWpQ0+6660ygBSqQ3+KiVF6j/HvssYi
kFK9kpJUEeBZ1/SYFw0XUezFYKW9FulJroQsMEAKtXigg7Ujq+Ivxwdkm1Nr1iHU
gOP1QLGKlG9VoL36N33/vR9pB+BonE4RXI11GI4pcqwXeNJBakd1WP3nRI8jOvU=
=SHKR
-----END PGP SIGNATURE-----

--GV0iVqYguTV4Q9ER--


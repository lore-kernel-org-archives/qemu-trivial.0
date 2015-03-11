Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVgby-0006Sz-Ms
	for mharc-qemu-trivial@gnu.org; Wed, 11 Mar 2015 09:23:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1YVgbw-0006QJ-Ij
	for qemu-trivial@nongnu.org; Wed, 11 Mar 2015 09:23:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1YVgbv-00078Y-KA
	for qemu-trivial@nongnu.org; Wed, 11 Mar 2015 09:23:44 -0400
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230]:46840)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1YVgbp-00077B-8K; Wed, 11 Mar 2015 09:23:37 -0400
Received: by wiwh11 with SMTP id h11so11653703wiw.5;
	Wed, 11 Mar 2015 06:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1qNcelBbVpWcmThRKTc54ZkXKrXvpc/y9nLZBswxWAA=;
	b=Mb5HTmZ3FXGgMadYvP1KRMaJ0+hCKhFifq99GbSHLfcikPzTAsdpzV8Ofdw9BrLT3j
	fEvm9cEh3XOAxFE/MI+w2HeV1SPSOXdDF50UArjyHeq8dGSgtM1io2IdMPkZLl909AKQ
	+3G0xVbkLcq9mr6ICNU32+cQxtSFOWxLULQ42DW4rV2HfSNmYVQsAr2UKRG34+7iqvGQ
	zwKlVDyz2+6JMYSjp4DdxtlfeJNEPh6OMY85wmgZ19OD7ja3mnxamiwxn+aEMakuJm7u
	MATqqxSzFwk0m73SdurSXR0UoPZTwclTr6GhnwRFR5+sTtk/UwD33AN3ZLePF1tDZYze
	0P7w==
X-Received: by 10.180.83.102 with SMTP id p6mr98686448wiy.78.1426080216640;
	Wed, 11 Mar 2015 06:23:36 -0700 (PDT)
Received: from localhost (host81-156-165-240.range81-156.btcentralplus.com.
	[81.156.165.240])
	by mx.google.com with ESMTPSA id d9sm2231652wib.20.2015.03.11.06.23.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Mar 2015 06:23:35 -0700 (PDT)
Date: Wed, 11 Mar 2015 13:23:34 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150311132334.GD10493@stefanha-thinkpad.redhat.com>
References: <1425971164-9845-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mSxgbZZZvrAyzONB"
Content-Disposition: inline
In-Reply-To: <1425971164-9845-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::230
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org, Peter Wu <peter@lekensteyn.nl>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/dmg: make it modular
 if using additional library
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
X-List-Received-Date: Wed, 11 Mar 2015 13:23:45 -0000


--mSxgbZZZvrAyzONB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2015 at 10:06:04AM +0300, Michael Tokarev wrote:
> block/dmg can use additional library (libbz2) to read
> bzip2-compressed files.  Make the block driver to be
> a module if libbz2 support is requested, to avoid extra
> library dependency by default.
>=20
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> --
>=20
> This might be questionable, to make the thing to be either
> module or built-in depending on build environment, so a
> better idea may be to make it modular unconditionally.
> This block device format isn't used often.
>=20
>  block/Makefile.objs | 3 ++-
>  configure           | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)

Can you send a series to make all block drivers modules for QEMU 2.4?

A separate/later patch series can demand-load modules (and force all for
probing), but there is already a packaging advantage if block drivers
are built as modules.

Stefan

--mSxgbZZZvrAyzONB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVAEHWAAoJEJykq7OBq3PIIQ4IAI4UZo7oxm39gNa8HCTmuA+m
s1rnuW/BNQLByr+SfLwOINUJc8oeDlKNfjmoU4M8muYmjRqa2gdzHuR3PIfIChUm
GYH7PrOi5JFHmCFbpR3D9DfShJzy80DMzxL+i8bhwylTG3XVDqV4tCz5PDaF6i+I
aYeG7A3S62I0tLyY8UOb8XzoAVRwQgw8xYVlS9j4NJcoe4xTXddv/RwCaGpgfEaP
Q17jvQkKZwyeavAj9/mRtmbQp1JwlLzD511Nz5kjcDtgiH6At8ah4ut+Jp5x4xqX
mvCMRW6CKhpbRep4SxpOhGETyR1T4UwrnPnTVPyACbojevyVN3pJy8/PIeeUJ3g=
=mgBe
-----END PGP SIGNATURE-----

--mSxgbZZZvrAyzONB--


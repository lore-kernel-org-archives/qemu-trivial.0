Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f2b5K-0001dd-Hv
	for mharc-qemu-trivial@gnu.org; Sun, 01 Apr 2018 07:23:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1f2b5I-0001cR-50
	for qemu-trivial@nongnu.org; Sun, 01 Apr 2018 07:23:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1f2b5H-0003S5-Ba
	for qemu-trivial@nongnu.org; Sun, 01 Apr 2018 07:23:40 -0400
Received: from mout.web.de ([212.227.15.3]:43891)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jan.kiszka@web.de>)
	id 1f2b5D-0003PN-CK; Sun, 01 Apr 2018 07:23:35 -0400
Received: from [192.168.2.11] ([92.76.39.170]) by smtp.web.de (mrweb002
	[213.165.67.108]) with ESMTPSA (Nemesis) id 0Lh6bn-1eiRXP3cDH-00oaKE;
	Sun, 01 Apr 2018 13:23:32 +0200
To: qemu-trivial <qemu-trivial@nongnu.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
From: Jan Kiszka <jan.kiszka@web.de>
Openpgp: preference=signencrypt
Message-ID: <0dd4c8f5-d60e-e564-652f-cd0101f6ee68@web.de>
Date: Sun, 1 Apr 2018 13:23:29 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="oHqQrQThYtqZljZ0AD0MFrqMP7zIOIUsz"
X-Provags-ID: V03:K0:VPfsL34yJVqHmQb1eonATqptp3/ohrb+IYWlTP7PDMOQpdGEpFw
	S7nNj7QyRug+/H/CotvKvB92634U4jm+zuTXC50kmCFGIJcB145Wg/dMq4NwNILQqwN+KgJ
	gXDAq8PQ6VA5i48WNB72B3A7h7m8veLWwRpQnFW9en/b+NukccgKxcOM+EkkLQrsKWymTS4
	GZxOPKZBWfu3MbhDFJedg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:2v4x7XrOlsk=:jMGy1F4PRx+P9A8+KbXEyg
	yxxlBHyNM8gVQhm6QxAd0F7DpI3+RNDwqHkVnKKev+ACWijPgYelkG3pmL+g1LODi+jDDc7pN
	WFlSEbgCu621XSkRhr4cd3nXqtcKcHa+HubIJAzlQfjPcBxpzwak4yJKg4Zc+HVqCRlnQmJVX
	FnXTghYjf2gsUTJ4tqTCrxwR75x3UN20jXuzn10dFVXGUY29e1HInE0qwIVlfrD3kgT50biS0
	WBvIqXU/tWRU8le0aJ4AStDRDE6/UAsTPEessyvn/j7uri6AxFC6wcGWFfFJJv7+eTm9s/UvG
	M5gEW/XPAJKdPrsz/BYQqpL2YpTKPKr2RhMD3Evhq6+cB3NshmEUDR93/WKXOSkU2puTwaH6b
	olQspmNSK0j2Zfkl6EnnA0BiQEADlXn9Nu1N6vJM5jfSItLthIC003plgWHiXskNhwoiYuwp9
	LdG+LiSKs8F+b5X1z7RDRlRs0faw+Pix2H2JXClx9kn4LTYMRB4wXyTvxgfbG7s+wo1sbd/Sy
	JFg5MUfun3UhrRnTAnxpBj43+3S6t4QthK+QwGK35q+1aET+wrSPB9wYWquj0jxYLUioXgwrC
	N4jA4VCsQOMVto98O9gk9YS80JSeFLVJkQ9Qv8z6AR/5FNTzoMLYOJhMQnjQS9XvFRlBvcvdv
	OoS9xtcrxMjToPfpqoNGuJjyftUpMTheLjA7Pg7vm7Eaq5Jpm4esYmIoeX9+wB7WSSFU0ZnGq
	zXFBOWIzInNQosGiJU6rCcsduwWOxEf9B3WGgsQb/gz5PB0QkRNJZ1inBEXtrzPB7d1wSvvwF
	MrItsk+DGMhHnk6N8jwOyc3neqfjw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.15.3
Subject: [Qemu-trivial] [PATCH] build: Silence dtc directory creation
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
X-List-Received-Date: Sun, 01 Apr 2018 11:23:41 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oHqQrQThYtqZljZ0AD0MFrqMP7zIOIUsz
Content-Type: multipart/mixed; boundary="HX8mo3RvGUpajy7tA8EzZCcgFiUZ96Ov8";
 protected-headers="v1"
From: Jan Kiszka <jan.kiszka@web.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
Message-ID: <0dd4c8f5-d60e-e564-652f-cd0101f6ee68@web.de>
Subject: [PATCH] build: Silence dtc directory creation

--HX8mo3RvGUpajy7tA8EzZCcgFiUZ96Ov8
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

From: Jan Kiszka <jan.kiszka@siemens.com>

Align with other mkdir calls.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 727ef118f3..fc6f21001f 100644
--- a/Makefile
+++ b/Makefile
@@ -485,7 +485,7 @@ subdir-dtc: .git-submodule-status dtc/libfdt dtc/test=
s
 	$(call quiet-command,$(MAKE) $(DTC_MAKE_ARGS) CPPFLAGS=3D"$(DTC_CPPFLAG=
S)" CFLAGS=3D"$(DTC_CFLAGS)" LDFLAGS=3D"$(LDFLAGS)" ARFLAGS=3D"$(ARFLAGS)=
" CC=3D"$(CC)" AR=3D"$(AR)" LD=3D"$(LD)" $(SUBDIR_MAKEFLAGS) libfdt/libfd=
t.a,)
=20
 dtc/%: .git-submodule-status
-	mkdir -p $@
+	@mkdir -p $@
=20
 # Overriding CFLAGS causes us to lose defines added in the sub-makefile.=

 # Not overriding CFLAGS leads to mis-matches between compilation modes.
--=20
2.13.6


--HX8mo3RvGUpajy7tA8EzZCcgFiUZ96Ov8--

--oHqQrQThYtqZljZ0AD0MFrqMP7zIOIUsz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlrAwTQACgkQitSsb3rl5xQ/0QCgphvlkbG9g4MaY9daQrICGaNN
oWkAoM15oBKmN2IXjg3yA1kgdd0cvi2a
=jSb+
-----END PGP SIGNATURE-----

--oHqQrQThYtqZljZ0AD0MFrqMP7zIOIUsz--


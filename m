Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SXO0C-00080J-R0
	for mharc-qemu-trivial@gnu.org; Wed, 23 May 2012 22:42:12 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1SXO08-0007mQ-4x
	for qemu-trivial@nongnu.org; Wed, 23 May 2012 22:42:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1SXO02-0003jc-Kk
	for qemu-trivial@nongnu.org; Wed, 23 May 2012 22:42:07 -0400
Received: from fmmailgate01.web.de ([217.72.192.221]:42057)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1SXNzy-0003g3-O7; Wed, 23 May 2012 22:41:58 -0400
Received: from moweb002.kundenserver.de (moweb002.kundenserver.de
	[172.19.20.108])
	by fmmailgate01.web.de (Postfix) with ESMTP id 95B601AE9A2D8;
	Thu, 24 May 2012 04:41:56 +0200 (CEST)
Received: from mchn199C.mchp.siemens.de ([187.105.9.40]) by smtp.web.de
	(mrweb002) with ESMTPA (Nemesis) id 0Lbrk4-1RoBHD31Vs-00jIXa;
	Thu, 24 May 2012 04:41:56 +0200
Message-ID: <4FBD9FF1.9020908@web.de>
Date: Wed, 23 May 2012 23:41:53 -0300
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
X-Enigmail-Version: 1.4.1
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig265CB004D752EFDBA3FE4688"
X-Provags-ID: V02:K0:cGIvXkcWFPW4fhtAon8TTLH7xPvjA1rAlu98zaV4Crc
	0fwStiCox1LqQmSuZKuqx9IZwoP0pf0KywmcmB3x3PrwyAH7yU
	sYagYtMY/YjA6uX83C3OCgMX3zFFbBYx6zpiTyL11AWBckto0b
	bWCeriijwJfvcya2VzdNyehAIsZSXZjX1neiyNlSSu+nWGji7C
	3RT5CuJgkeD9+b0YkLfKg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.221
Subject: [Qemu-trivial] [PATCH] Clarify comments of
	tb_invalidate_phys_[page_]range
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
X-List-Received-Date: Thu, 24 May 2012 02:42:10 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig265CB004D752EFDBA3FE4688
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

From: Jan Kiszka <jan.kiszka@siemens.com>

They could suggest that all TBs of the page containing the range would
be invalidated.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 exec.c |   22 ++++++++++++----------
 1 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/exec.c b/exec.c
index efa1345..a1c12ec 100644
--- a/exec.c
+++ b/exec.c
@@ -1076,11 +1076,11 @@ TranslationBlock *tb_gen_code(CPUArchState *env,
 }
=20
 /*
- * invalidate all TBs which intersect with the target physical pages
- * starting in range [start;end[. NOTE: start and end may refer to
- * different physical pages. 'is_cpu_write_access' should be true if cal=
led
- * from a real cpu write access: the virtual CPU will exit the current
- * TB if code is modified inside this TB.
+ * Invalidate all TBs which intersect with the target physical address r=
ange
+ * [start;end[. NOTE: start and end may refer to *different* physical pa=
ges.
+ * 'is_cpu_write_access' should be true if called from a real cpu write
+ * access: the virtual CPU will exit the current TB if code is modified =
inside
+ * this TB.
  */
 void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end,
                               int is_cpu_write_access)
@@ -1092,11 +1092,13 @@ void tb_invalidate_phys_range(tb_page_addr_t star=
t, tb_page_addr_t end,
     }
 }
=20
-/* invalidate all TBs which intersect with the target physical page
-   starting in range [start;end[. NOTE: start and end must refer to
-   the same physical page. 'is_cpu_write_access' should be true if calle=
d
-   from a real cpu write access: the virtual CPU will exit the current
-   TB if code is modified inside this TB. */
+/*
+ * Invalidate all TBs which intersect with the target physical address r=
ange
+ * [start;end[. NOTE: start and end must refer to the *same* physical pa=
ge.
+ * 'is_cpu_write_access' should be true if called from a real cpu write
+ * access: the virtual CPU will exit the current TB if code is modified =
inside
+ * this TB.
+ */
 void tb_invalidate_phys_page_range(tb_page_addr_t start, tb_page_addr_t =
end,
                                    int is_cpu_write_access)
 {


--------------enig265CB004D752EFDBA3FE4688
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+9n/EACgkQitSsb3rl5xRB3QCeLrPfSUAf+n1c+syJuVZuJSXq
aeEAn19O5qGtD6Af8hyzed6V7E2Wq0IS
=f7Eh
-----END PGP SIGNATURE-----

--------------enig265CB004D752EFDBA3FE4688--


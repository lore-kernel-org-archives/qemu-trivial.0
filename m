Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YHUM3-00053v-ER
	for mharc-qemu-trivial@gnu.org; Sat, 31 Jan 2015 04:28:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1YHUM1-00052E-SM
	for qemu-trivial@nongnu.org; Sat, 31 Jan 2015 04:28:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1YHULx-0005gc-N8
	for qemu-trivial@nongnu.org; Sat, 31 Jan 2015 04:28:37 -0500
Received: from mout.web.de ([212.227.15.14]:55945)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1YHULt-0005gM-9K; Sat, 31 Jan 2015 04:28:29 -0500
Received: from md1f2u6c.ww002.siemens.net ([95.157.58.223]) by smtp.web.de
	(mrweb004) with ESMTPSA (Nemesis) id 0MVGow-1YAPDC3hj4-00YgN2;
	Sat, 31 Jan 2015 10:28:24 +0100
Message-ID: <54CCA038.8000704@web.de>
Date: Sat, 31 Jan 2015 10:28:24 +0100
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="q2KRDC0KxRJ9RQBWvqdGHvuhr8G7CKNs7"
X-Provags-ID: V03:K0:w9wCmhIxz8TbU8CoCwzPyd2w9QSM51qxgmgO4Ex9EbOQshXpQyg
	PuWprRLYVaKxOF4RhGgIMQBAKIYPD8idr01E5bu961mhOW/WP1RrSIj6BwleVlKFUH4029A
	cA4v6Pgm1tdM7PnFBaSEYMeM827hXzy1XiVOVlw1Rk+co3gL2BEh7Ru9cXmXYDxveaRO8JN
	3BOkDAHksJ8vkj9WOOXIQ==
X-UI-Out-Filterresults: notjunk:1;
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 212.227.15.14
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH 1/2] Add GDB qAttached support
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
X-List-Received-Date: Sat, 31 Jan 2015 09:28:39 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--q2KRDC0KxRJ9RQBWvqdGHvuhr8G7CKNs7
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

From: Jan Kiszka <jan.kiszka@siemens.com>

With this patch QEMU handles qAttached request from gdb. When QEMU
replies 1, GDB sends a "detach" command at the end of a debugging
session otherwise GDB sends "kill".

The default value for qAttached is 1 on system emulation and 0 on user
emulation.

Based on original version by Fabien Chouteau.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Long pending in my queue. Hope we can finally get these two in via
trivial (that's what they are).

 gdbstub.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index e4a1a79..da3e7cb 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -41,6 +41,12 @@
 #include "qemu/sockets.h"
 #include "sysemu/kvm.h"
=20
+#ifdef CONFIG_USER_ONLY
+#define GDB_ATTACHED "0"
+#else
+#define GDB_ATTACHED "1"
+#endif
+
 static inline int target_memory_rw_debug(CPUState *cpu, target_ulong add=
r,
                                          uint8_t *buf, int len, bool is_=
write)
 {
@@ -1187,6 +1193,10 @@ static int gdb_handle_packet(GDBState *s, const ch=
ar *line_buf)
             put_packet_binary(s, buf, len + 1);
             break;
         }
+        if (strncmp(p, "Attached", 8) =3D=3D 0) {
+            put_packet(s, GDB_ATTACHED);
+            break;
+        }
         /* Unrecognised 'q' command.  */
         goto unknown_command;
=20
--=20
2.1.4


--q2KRDC0KxRJ9RQBWvqdGHvuhr8G7CKNs7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTMoDgACgkQitSsb3rl5xQzNACfd64a0RgWlRFEaD2yuby9U+AP
VGsAoLlbV136SjkdMUORaizqonNLNQUs
=m+xU
-----END PGP SIGNATURE-----

--q2KRDC0KxRJ9RQBWvqdGHvuhr8G7CKNs7--


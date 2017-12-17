Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQhgE-0006KA-JK
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 17:45:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQhgA-0006Gk-Hp
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 17:45:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQhg9-0004z4-Ha
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 17:45:06 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:54241)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQhg4-0004tx-49; Sun, 17 Dec 2017 17:45:00 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4D2A941177;
	Mon, 18 Dec 2017 01:44:55 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 098FED4F;
	Mon, 18 Dec 2017 00:25:49 +0300 (MSK)
Received: (nullmailer pid 30918 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 18 Dec 2017 00:27:22 +0300
Message-Id: <cf01b9920e85fc433056d09a7675f1eafb83086e.1513545944.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 17/61] hw/registerfields: add 64-bit
 extract/deposit macros
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
X-List-Received-Date: Sun, 17 Dec 2017 22:45:07 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/hw/registerfields.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index ad9d7a82a3..f59e7f47bd 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -35,6 +35,9 @@
 #define FIELD_EX32(storage, reg, field)                                 =
  \
     extract32((storage), R_ ## reg ## _ ## field ## _SHIFT,             =
  \
               R_ ## reg ## _ ## field ## _LENGTH)
+#define FIELD_EX64(storage, reg, field)                                 =
  \
+    extract64((storage), R_ ## reg ## _ ## field ## _SHIFT,             =
  \
+              R_ ## reg ## _ ## field ## _LENGTH)
=20
 /* Extract a field from an array of registers */
 #define ARRAY_FIELD_EX32(regs, reg, field)                              =
  \
@@ -52,6 +55,14 @@
     d =3D deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,       =
    \
                   R_ ## reg ## _ ## field ## _LENGTH, v.v);             =
  \
     d; })
+#define FIELD_DP64(storage, reg, field, val) ({                         =
  \
+    struct {                                                            =
  \
+        unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;              =
  \
+    } v =3D { .v =3D val };                                             =
      \
+    uint64_t d;                                                         =
  \
+    d =3D deposit64((storage), R_ ## reg ## _ ## field ## _SHIFT,       =
    \
+                  R_ ## reg ## _ ## field ## _LENGTH, v.v);             =
  \
+    d; })
=20
 /* Deposit a field to array of registers.  */
 #define ARRAY_FIELD_DP32(regs, reg, field, val)                         =
  \
--=20
2.11.0



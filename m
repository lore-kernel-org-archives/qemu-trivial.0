Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fKHle-0008BR-63
	for mharc-qemu-trivial@gnu.org; Sun, 20 May 2018 02:24:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHlZ-0007ts-4T
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:24:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHlY-0008NF-1m
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:24:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45661)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1fKHlT-0008JL-JL; Sun, 20 May 2018 02:24:19 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E9D8841129;
	Sun, 20 May 2018 09:24:18 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id ACFF210C7;
	Sun, 20 May 2018 09:15:13 +0300 (MSK)
Received: (nullmailer pid 7399 invoked by uid 1000);
	Sun, 20 May 2018 06:15:11 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun, 20 May 2018 09:15:01 +0300
Message-Id: <54be4c42b2796ca6054cd1539d3ad4486447c789.1526796813.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 15/22] hw/timer/mt48t59: Fix bit-rotten
 NVRAM_PRINTF format strings
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
X-List-Received-Date: Sun, 20 May 2018 06:24:26 -0000

From: Thomas Huth <thuth@redhat.com>

When compiling with NVRAM_PRINTF enabled, gcc currently bails out with:

  CC      hw/timer/m48t59.o
  CC      hw/timer/m48t59-isa.o
hw/timer/m48t59.c: In function =E2=80=98NVRAM_writeb=E2=80=99:
hw/timer/m48t59.c:460:5: error: format =E2=80=98%x=E2=80=99 expects argum=
ent of type =E2=80=98unsigned int=E2=80=99, but argument 3 has type =E2=80=
=98hwaddr=E2=80=99 [-Werror=3Dformat=3D]
     NVRAM_PRINTF("%s: 0x%08x =3D> 0x%08x\n", __func__, addr, val);
     ^
hw/timer/m48t59.c:460:5: error: format =E2=80=98%x=E2=80=99 expects argum=
ent of type =E2=80=98unsigned int=E2=80=99, but argument 4 has type =E2=80=
=98uint64_t=E2=80=99 [-Werror=3Dformat=3D]
hw/timer/m48t59.c: In function =E2=80=98NVRAM_readb=E2=80=99:
hw/timer/m48t59.c:492:5: error: format =E2=80=98%x=E2=80=99 expects argum=
ent of type =E2=80=98unsigned int=E2=80=99, but argument 3 has type =E2=80=
=98hwaddr=E2=80=99 [-Werror=3Dformat=3D]
     NVRAM_PRINTF("%s: 0x%08x <=3D 0x%08x\n", __func__, addr, retval);

Fix it by using the correct format strings and while we're at it,
also change the definition of NVRAM_PRINTF so that this can not
bit-rot so easily again.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/timer/m48t59-internal.h | 9 +++------
 hw/timer/m48t59.c          | 4 ++--
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/timer/m48t59-internal.h b/hw/timer/m48t59-internal.h
index 32ae957805..d0f0caf3c7 100644
--- a/hw/timer/m48t59-internal.h
+++ b/hw/timer/m48t59-internal.h
@@ -25,13 +25,10 @@
 #ifndef HW_M48T59_INTERNAL_H
 #define HW_M48T59_INTERNAL_H 1
=20
-//#define DEBUG_NVRAM
+#define M48T59_DEBUG 0
=20
-#if defined(DEBUG_NVRAM)
-#define NVRAM_PRINTF(fmt, ...) do { printf(fmt , ## __VA_ARGS__); } whil=
e (0)
-#else
-#define NVRAM_PRINTF(fmt, ...) do { } while (0)
-#endif
+#define NVRAM_PRINTF(fmt, ...) do { \
+    if (M48T59_DEBUG) { printf(fmt , ## __VA_ARGS__); } } while (0)
=20
 /*
  * The M48T02, M48T08 and M48T59 chips are very similar. The newer '59 h=
as
diff --git a/hw/timer/m48t59.c b/hw/timer/m48t59.c
index 742c576443..f2991762ab 100644
--- a/hw/timer/m48t59.c
+++ b/hw/timer/m48t59.c
@@ -456,7 +456,7 @@ static void NVRAM_writeb(void *opaque, hwaddr addr, u=
int64_t val,
 {
     M48t59State *NVRAM =3D opaque;
=20
-    NVRAM_PRINTF("%s: 0x%08x =3D> 0x%08x\n", __func__, addr, val);
+    NVRAM_PRINTF("%s: 0x%"HWADDR_PRIx" =3D> 0x%"PRIx64"\n", __func__, ad=
dr, val);
     switch (addr) {
     case 0:
         NVRAM->addr &=3D ~0x00FF;
@@ -488,7 +488,7 @@ static uint64_t NVRAM_readb(void *opaque, hwaddr addr=
, unsigned size)
         retval =3D -1;
         break;
     }
-    NVRAM_PRINTF("%s: 0x%08x <=3D 0x%08x\n", __func__, addr, retval);
+    NVRAM_PRINTF("%s: 0x%"HWADDR_PRIx" <=3D 0x%08x\n", __func__, addr, r=
etval);
=20
     return retval;
 }
--=20
2.11.0



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ehdH9-0006yC-JL
	for mharc-qemu-trivial@gnu.org; Fri, 02 Feb 2018 10:29:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ehdG3-0005v1-Va
	for qemu-trivial@nongnu.org; Fri, 02 Feb 2018 10:29:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ehdEz-0005ZO-UL
	for qemu-trivial@nongnu.org; Fri, 02 Feb 2018 10:28:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47392)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ehdAo-0000Qe-Rr; Fri, 02 Feb 2018 10:22:42 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B9480356C3;
	Fri,  2 Feb 2018 08:15:34 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-102.ams2.redhat.com
	[10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D1545D6A6;
	Fri,  2 Feb 2018 08:15:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Fri,  2 Feb 2018 09:15:31 +0100
Message-Id: <1517559331-6388-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 02 Feb 2018 08:15:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/timer/mt48t59: Fix bit-rotten
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
X-List-Received-Date: Fri, 02 Feb 2018 15:29:14 -0000

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
---
 hw/timer/m48t59-internal.h | 9 +++------
 hw/timer/m48t59.c          | 4 ++--
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/timer/m48t59-internal.h b/hw/timer/m48t59-internal.h
index 32ae957..d0f0caf 100644
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
index 844aad5..4abb4ac 100644
--- a/hw/timer/m48t59.c
+++ b/hw/timer/m48t59.c
@@ -457,7 +457,7 @@ static void NVRAM_writeb(void *opaque, hwaddr addr, u=
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
@@ -489,7 +489,7 @@ static uint64_t NVRAM_readb(void *opaque, hwaddr addr=
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
1.8.3.1



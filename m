Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W9zsc-0007Xl-11
	for mharc-qemu-trivial@gnu.org; Sun, 02 Feb 2014 11:26:46 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9zqz-0002pQ-Sh
	for qemu-trivial@nongnu.org; Sun, 02 Feb 2014 11:26:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9zk2-0007tT-Vp
	for qemu-trivial@nongnu.org; Sun, 02 Feb 2014 11:19:05 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49970)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W9zfC-000701-MR; Sun, 02 Feb 2014 11:12:54 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CFCA740227;
	Sun,  2 Feb 2014 20:12:45 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B8F755FC;
	Sun,  2 Feb 2014 20:12:45 +0400 (MSK)
Received: (nullmailer pid 1639 invoked by uid 1000);
	Sun, 02 Feb 2014 16:12:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sun,  2 Feb 2014 20:12:37 +0400
Message-Id: <1391357563-1592-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1391357563-1592-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1391357563-1592-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Martin Husemann <martin@duskware.de>, qemu-devel@nongnu.org,
	Martin Husemann <martin@NetBSD.org>
Subject: [Qemu-trivial] [PULL 1/7] qemu 1.7.0 does not build on NetBSD
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
X-List-Received-Date: Sun, 02 Feb 2014 16:26:44 -0000

From: Martin Husemann <martin@duskware.de>

 Do not rely on int8_t (and friends) not being preprocessor
 symbols (or symbols expanding to themselves). On NetBSD (for example) th=
e
 glue(u, SDATA_TYPE) results in u__int8_t, which is undefined. There is n=
o way
 to stop cpp expanding inner macros, so just add the few lines explicitly=
 and
 get rid of the magic.

Signed-off-by: Martin Husemann <martin@NetBSD.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/exec/softmmu_template.h |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/exec/softmmu_template.h b/include/exec/softmmu_templ=
ate.h
index c6a5440..8712dcd 100644
--- a/include/exec/softmmu_template.h
+++ b/include/exec/softmmu_template.h
@@ -30,23 +30,26 @@
 #define SUFFIX q
 #define LSUFFIX q
 #define SDATA_TYPE  int64_t
+#define DATA_TYPE  uint64_t
 #elif DATA_SIZE =3D=3D 4
 #define SUFFIX l
 #define LSUFFIX l
 #define SDATA_TYPE  int32_t
+#define DATA_TYPE  uint32_t
 #elif DATA_SIZE =3D=3D 2
 #define SUFFIX w
 #define LSUFFIX uw
 #define SDATA_TYPE  int16_t
+#define DATA_TYPE  uint16_t
 #elif DATA_SIZE =3D=3D 1
 #define SUFFIX b
 #define LSUFFIX ub
 #define SDATA_TYPE  int8_t
+#define DATA_TYPE  uint8_t
 #else
 #error unsupported data size
 #endif
=20
-#define DATA_TYPE   glue(u, SDATA_TYPE)
=20
 /* For the benefit of TCG generated code, we want to avoid the complicat=
ion
    of ABI-specific return type promotion and always return a value exten=
ded
--=20
1.7.10.4



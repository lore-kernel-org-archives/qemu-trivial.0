Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b30Mw-0000G1-Hv
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 08:14:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30Mr-0000A7-Fh
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:14:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30Mq-000320-Bk
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:14:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55145)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b30Mk-00030S-I3; Wed, 18 May 2016 08:14:18 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3B422417A3;
	Wed, 18 May 2016 15:14:17 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 39F4DADE;
	Wed, 18 May 2016 15:06:11 +0300 (MSK)
Received: (nullmailer pid 12400 invoked by uid 1000);
	Wed, 18 May 2016 12:06:09 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Wei Jiangang <weijg.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 18 May 2016 15:06:05 +0300
Message-Id: <bdc3f61dec2f9c227235bb5f677a0272e1184c82.1463573089.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
References: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 10/13] accel: make configure_accelerator
 return void
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
X-List-Received-Date: Wed, 18 May 2016 12:14:29 -0000

From: Wei Jiangang <weijg.fnst@cn.fujitsu.com>

Return the negated value of accel_initialised is meaningless,
and the caller vl doesn't check it.

Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 accel.c                | 4 +---
 include/sysemu/accel.h | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/accel.c b/accel.c
index 0510b90..403eb5e 100644
--- a/accel.c
+++ b/accel.c
@@ -77,7 +77,7 @@ static int accel_init_machine(AccelClass *acc, MachineState *ms)
     return ret;
 }
 
-int configure_accelerator(MachineState *ms)
+void configure_accelerator(MachineState *ms)
 {
     const char *p;
     char buf[10];
@@ -128,8 +128,6 @@ int configure_accelerator(MachineState *ms)
     if (init_failed) {
         fprintf(stderr, "Back to %s accelerator.\n", acc->name);
     }
-
-    return !accel_initialised;
 }
 
 
diff --git a/include/sysemu/accel.h b/include/sysemu/accel.h
index a74b2fa..15944c1 100644
--- a/include/sysemu/accel.h
+++ b/include/sysemu/accel.h
@@ -56,6 +56,6 @@ typedef struct AccelClass {
 
 extern int tcg_tb_size;
 
-int configure_accelerator(MachineState *ms);
+void configure_accelerator(MachineState *ms);
 
 #endif
-- 
2.1.4



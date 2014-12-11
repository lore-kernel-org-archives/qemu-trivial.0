Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8I7-0007n8-Et
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:16:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8Hz-0007ZH-4K
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:16:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8Hu-0002um-Jy
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:16:35 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:37162)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8Hi-0002jj-8d; Thu, 11 Dec 2014 13:16:18 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7920D41D43;
	Thu, 11 Dec 2014 21:16:16 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 56B6E8C2;
	Thu, 11 Dec 2014 21:16:16 +0300 (MSK)
Received: (nullmailer pid 22958 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:15:50 +0300
Message-Id: <1a71992376792a0d11ea27688bd1a21cdffd1826.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PULL 02/20] target-s390x: fix possible out of
	bounds read
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
X-List-Received-Date: Thu, 11 Dec 2014 18:16:39 -0000

From: zhanghailiang <zhang.zhanghailiang@huawei.com>

Array index starts at 0, so the valid index of ext_queue array,
io_queue array, mchk_queue array should be MAX_EXT_QUEUE - 1,
MAX_IO_QUEUE - 1, MAX_MCHK_QUEUE - 1.

The original checks missed the invalid bound value, which will lead
possible out of bounds read in the follow codes.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-s390x/helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target-s390x/helper.c b/target-s390x/helper.c
index 09aec7b..96a4f22 100644
--- a/target-s390x/helper.c
+++ b/target-s390x/helper.c
@@ -648,7 +648,7 @@ static void do_ext_interrupt(CPUS390XState *env)
         cpu_abort(CPU(cpu), "Ext int w/o ext mask\n");
     }
 
-    if (env->ext_index < 0 || env->ext_index > MAX_EXT_QUEUE) {
+    if (env->ext_index < 0 || env->ext_index >= MAX_EXT_QUEUE) {
         cpu_abort(CPU(cpu), "Ext queue overrun: %d\n", env->ext_index);
     }
 
@@ -696,7 +696,7 @@ static void do_io_interrupt(CPUS390XState *env)
         if (env->io_index[isc] < 0) {
             continue;
         }
-        if (env->io_index[isc] > MAX_IO_QUEUE) {
+        if (env->io_index[isc] >= MAX_IO_QUEUE) {
             cpu_abort(CPU(cpu), "I/O queue overrun for isc %d: %d\n",
                       isc, env->io_index[isc]);
         }
@@ -754,7 +754,7 @@ static void do_mchk_interrupt(CPUS390XState *env)
         cpu_abort(CPU(cpu), "Machine check w/o mchk mask\n");
     }
 
-    if (env->mchk_index < 0 || env->mchk_index > MAX_MCHK_QUEUE) {
+    if (env->mchk_index < 0 || env->mchk_index >= MAX_MCHK_QUEUE) {
         cpu_abort(CPU(cpu), "Mchk queue overrun: %d\n", env->mchk_index);
     }
 
-- 
2.1.3



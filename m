Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XsjhF-0004Q6-C9
	for mharc-qemu-trivial@gnu.org; Sun, 23 Nov 2014 21:48:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XsjhA-0004Pi-0P
	for qemu-trivial@nongnu.org; Sun, 23 Nov 2014 21:48:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Xsjh5-00058i-0Z
	for qemu-trivial@nongnu.org; Sun, 23 Nov 2014 21:48:07 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:20206)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1Xsjh4-00058M-Dj; Sun, 23 Nov 2014 21:48:02 -0500
Received: from 172.24.2.119 (EHLO szxeml422-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CEX11881; Mon, 24 Nov 2014 10:47:56 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml422-hub.china.huawei.com
	(10.82.67.161) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 24 Nov 2014 10:47:44 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Mon, 24 Nov 2014 10:47:45 +0800
Message-ID: <1416797265-10308-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: agraf@suse.de, zhanghailiang <zhang.zhanghailiang@huawei.com>,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com,
	arei.gonglei@huawei.com, pbonzini@redhat.com, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH] target-s390x: fix possible out of bounds read
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
X-List-Received-Date: Mon, 24 Nov 2014 02:48:12 -0000

Array index starts at 0, so the valid index of ext_queue array,
io_queue array, mchk_queue array should be MAX_EXT_QUEUE - 1,
MAX_IO_QUEUE - 1, MAX_MCHK_QUEUE - 1.

The original checks missed the invalid bound value, which will lead
possible out of bounds read in the follow codes.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
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
1.7.12.4




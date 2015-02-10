Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4yf-0002Z5-Mp
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 02:11:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4yX-0002KQ-MM
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:11:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4yW-0007DM-OY
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:11:13 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:59313)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4yO-00077Z-PR; Tue, 10 Feb 2015 02:11:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 40A9441821;
	Tue, 10 Feb 2015 10:11:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7DC54950;
	Tue, 10 Feb 2015 09:34:46 +0300 (MSK)
Received: (nullmailer pid 9369 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:07 +0300
Message-Id: <02f292d9051f616511f482275b571c6153e3a48b.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 18/46] vl.c: fix memory leak spotted by
	valgrind
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
X-List-Received-Date: Tue, 10 Feb 2015 07:11:18 -0000

From: Christian Borntraeger <borntraeger@de.ibm.com>

valgrind complains about:
==42062== 16 bytes in 1 blocks are definitely lost in loss record 387 of 1,048
==42062==    at 0x402DCB2: malloc (vg_replace_malloc.c:299)
==42062==    by 0x40C1BE3: g_malloc (in /usr/lib64/libglib-2.0.so.0.3800.2)
==42062==    by 0x40DA133: g_slice_alloc (in /usr/lib64/libglib-2.0.so.0.3800.2)
==42062==    by 0x40DB2E5: g_slist_prepend (in /usr/lib64/libglib-2.0.so.0.3800.2)
==42062==    by 0x801637FF: object_class_get_list_tramp (object.c:690)
==42062==    by 0x40A96C9: g_hash_table_foreach (in /usr/lib64/libglib-2.0.so.0.3800.2)
==42062==    by 0x80164885: object_class_foreach (object.c:665)
==42062==    by 0x80164975: object_class_get_list (object.c:698)
==42062==    by 0x800100A5: machine_parse (vl.c:2447)
==42062==    by 0x800100A5: main (vl.c:3756)

Lets free machines in case of mc.

Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/vl.c b/vl.c
index 2573afd..8c8f142 100644
--- a/vl.c
+++ b/vl.c
@@ -2452,6 +2452,7 @@ static gint machine_class_cmp(gconstpointer a, gconstpointer b)
         mc = find_machine(name);
     }
     if (mc) {
+        g_slist_free(machines);
         return mc;
     }
     if (name && !is_help_option(name)) {
-- 
2.1.4



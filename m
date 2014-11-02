Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkuPo-0006HH-JX
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 07:37:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XkuPh-00064w-Qq
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:37:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XkuPd-0005Om-Fr
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:37:45 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48876)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XkuPO-0005Mf-5Q; Sun, 02 Nov 2014 07:37:26 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 73803402CF;
	Sun,  2 Nov 2014 15:37:23 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 158E1712;
	Sun,  2 Nov 2014 14:58:49 +0300 (MSK)
Received: (nullmailer pid 14978 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:26 +0300
Message-Id: <08a655be71d0a130a5d9bf7816d096ec31c4f055.1414929285.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 14/23] dump: Fix dump-guest-memory termination
	and use-after-close
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
X-List-Received-Date: Sun, 02 Nov 2014 12:37:50 -0000

From: Gonglei <arei.gonglei@huawei.com>

dump_iterate() dumps blocks in a loop.  Eventually, get_next_block()
returns "no more".  We then call dump_completed().  But we neglect to
break the loop!  Broken in commit 4c7e251a.

Because of that, we dump the last block again.  This attempts to write
to s->fd, which fails if we're lucky.  The error makes dump_iterate()
return failure.  It's the only way it can ever return.

Theoretical: if we're not so lucky, something else has opened something
for writing and got the same fd.  dump_iterate() then keeps looping,
messing up the something else's output, until a write fails, or the
process mercifully terminates.

The obvious fix is to restore the return lost in commit 4c7e251a.  But
the root cause of the bug is needlessly opaque loop control.  Replace it
by a clean do ... while loop.

This makes the badly chosen return values of get_next_block() more
visible.  Cleaning that up is outside the scope of this bug fix.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 dump.c |   11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/dump.c b/dump.c
index 06a4915..9c7dad8 100644
--- a/dump.c
+++ b/dump.c
@@ -604,10 +604,9 @@ static void dump_iterate(DumpState *s, Error **errp)
 {
     GuestPhysBlock *block;
     int64_t size;
-    int ret;
     Error *local_err = NULL;
 
-    while (1) {
+    do {
         block = s->next_block;
 
         size = block->target_end - block->target_start;
@@ -623,11 +622,9 @@ static void dump_iterate(DumpState *s, Error **errp)
             return;
         }
 
-        ret = get_next_block(s, block);
-        if (ret == 1) {
-            dump_completed(s);
-        }
-    }
+    } while (!get_next_block(s, block));
+
+    dump_completed(s);
 }
 
 static void create_vmcore(DumpState *s, Error **errp)
-- 
1.7.10.4



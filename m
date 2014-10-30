Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XjioE-0000zr-Tb
	for mharc-qemu-trivial@gnu.org; Thu, 30 Oct 2014 02:02:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xjio7-0000pQ-Ev
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 02:02:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xjio2-0001Ue-HN
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 02:02:03 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:20107)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xjinr-0001PS-6a; Thu, 30 Oct 2014 02:01:48 -0400
Received: from 172.24.2.119 (EHLO szxeml451-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWI50092; Thu, 30 Oct 2014 14:01:37 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml451-hub.china.huawei.com
	(10.82.67.194) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 30 Oct 2014 14:01:26 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 30 Oct 2014 14:01:17 +0800
Message-ID: <1414648877-13788-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A02020A.5451D443.000F, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: b35a3104f56e23e0d4e572b4a2275743
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, armbru@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, peter.huangpeng@huawei.com,
	lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH v2] dump: fix use-after-free for s->fd
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
X-List-Received-Date: Thu, 30 Oct 2014 06:02:08 -0000

From: Gonglei <arei.gonglei@huawei.com>

After commit 4c7e251a (), when dump memory completed,
the s->fd will be closed twice. We should return
directly when dump completed.

Using do/while block, make the badly chosen return
values of get_next_block() more visible and fix
this issue.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
v2 -> v1:
Using do/while block, make the badly chosen return
values of get_next_block() more visible and fix
this issue. (Markus)
---
 dump.c | 11 ++++-------
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
1.7.12.4




Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XjShp-0003Tq-4M
	for mharc-qemu-trivial@gnu.org; Wed, 29 Oct 2014 08:50:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XjShh-0003Oc-RE
	for qemu-trivial@nongnu.org; Wed, 29 Oct 2014 08:50:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XjShc-0006Ps-RA
	for qemu-trivial@nongnu.org; Wed, 29 Oct 2014 08:50:21 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:53623)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XjShS-00064K-Fk; Wed, 29 Oct 2014 08:50:07 -0400
Received: from 172.24.2.119 (EHLO szxeml421-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDP77474; Wed, 29 Oct 2014 20:49:54 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml421-hub.china.huawei.com
	(10.82.67.160) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 29 Oct 2014 20:49:48 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 29 Oct 2014 20:49:43 +0800
Message-ID: <1414586983-10816-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: amit.shah@redhat.com, qemu-trivial@nongnu.org,
	Gonglei <arei.gonglei@huawei.com>, weidong.huang@huawei.com,
	quintela@redhat.com
Subject: [Qemu-trivial] [PATCH] vl.c: Fix Coverity complaining for
	vmstate_dump_file
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
X-List-Received-Date: Wed, 29 Oct 2014 12:50:26 -0000

From: Gonglei <arei.gonglei@huawei.com>

commit abfd9ce3(migration: dump vmstate info as a json
file for static analysis) introduce a new command,
'-dump-vmstate', that takes a filename
as an argument.  When executed, QEMU will dump the vmstate information
for the machine type it's invoked with to the file, and quit.

Apparently, it supports one '-dump-vmstate' option,
otherwise, the vmstate_dump_file will be overwritten.

Of course, the resource will be freed when Qemu quit, but The code logic
is not good, it will make Coverity complaining.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 vl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/vl.c b/vl.c
index f6b3546..5ef3af9 100644
--- a/vl.c
+++ b/vl.c
@@ -3746,6 +3746,11 @@ int main(int argc, char **argv, char **envp)
                 configure_msg(opts);
                 break;
             case QEMU_OPTION_dump_vmstate:
+                if (vmstate_dump_file) {
+                    fprintf(stderr, "qemu: only one '-dump-vmstate' "
+                            "option may be given\n");
+                    exit(1);
+                }
                 vmstate_dump_file = fopen(optarg, "w");
                 if (vmstate_dump_file == NULL) {
                     fprintf(stderr, "open %s: %s\n", optarg, strerror(errno));
-- 
1.7.12.4




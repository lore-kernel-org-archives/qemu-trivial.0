Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XTqGv-00023h-ST
	for mharc-qemu-trivial@gnu.org; Tue, 16 Sep 2014 06:46:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XTqGm-000229-S1
	for qemu-trivial@nongnu.org; Tue, 16 Sep 2014 06:46:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XTqGh-0007qw-R7
	for qemu-trivial@nongnu.org; Tue, 16 Sep 2014 06:46:00 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:15537)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XTqGg-0007od-Uc; Tue, 16 Sep 2014 06:45:55 -0400
Received: from 172.24.2.119 (EHLO szxeml422-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BZN18742; Tue, 16 Sep 2014 18:45:45 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml422-hub.china.huawei.com
	(10.82.67.161) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 16 Sep 2014 18:45:38 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Tue, 16 Sep 2014 18:45:36 +0800
Message-ID: <1410864336-14284-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: imammedo@redhat.com, zhanghailiang <zhang.zhanghailiang@huawei.com>,
	luonengjun@huawei.com, qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH v3] vl: Print maxmem in hex format for error
	message
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
X-List-Received-Date: Tue, 16 Sep 2014 10:46:08 -0000

In error message, maxmem is printed in Dec but ram_size in Hex.
It is better to print them in same format.
Also use error_report instead of fprintf.

Reviewed-By: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 v3:
- fix an indent error
- add Reviewed-By
 v2:
- Remove redundant "qemu:" in error message, for error_report already prepend
  a variation of "qemu" (comment of Eric Blake)
---
 vl.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/vl.c b/vl.c
index 5db0d08..c64d923 100644
--- a/vl.c
+++ b/vl.c
@@ -3358,34 +3358,34 @@ int main(int argc, char **argv, char **envp)
 
                     sz = qemu_opt_get_size(opts, "maxmem", 0);
                     if (sz < ram_size) {
-                        fprintf(stderr, "qemu: invalid -m option value: maxmem "
-                                "(%" PRIu64 ") <= initial memory ("
-                                RAM_ADDR_FMT ")\n", sz, ram_size);
+                        error_report("invalid -m option value: maxmem "
+                                "(0x%" PRIx64 ") <= initial memory (0x"
+                                RAM_ADDR_FMT ")", sz, ram_size);
                         exit(EXIT_FAILURE);
                     }
 
                     slots = qemu_opt_get_number(opts, "slots", 0);
                     if ((sz > ram_size) && !slots) {
-                        fprintf(stderr, "qemu: invalid -m option value: maxmem "
-                                "(%" PRIu64 ") more than initial memory ("
+                        error_report("invalid -m option value: maxmem "
+                                "(0x%" PRIx64 ") more than initial memory (0x"
                                 RAM_ADDR_FMT ") but no hotplug slots where "
-                                "specified\n", sz, ram_size);
+                                "specified", sz, ram_size);
                         exit(EXIT_FAILURE);
                     }
 
                     if ((sz <= ram_size) && slots) {
-                        fprintf(stderr, "qemu: invalid -m option value:  %"
+                        error_report("invalid -m option value:  %"
                                 PRIu64 " hotplug slots where specified but "
-                                "maxmem (%" PRIu64 ") <= initial memory ("
-                                RAM_ADDR_FMT ")\n", slots, sz, ram_size);
+                                "maxmem (0x%" PRIx64 ") <= initial memory (0x"
+                                RAM_ADDR_FMT ")", slots, sz, ram_size);
                         exit(EXIT_FAILURE);
                     }
                     maxram_size = sz;
                     ram_slots = slots;
                 } else if ((!maxmem_str && slots_str) ||
                            (maxmem_str && !slots_str)) {
-                    fprintf(stderr, "qemu: invalid -m option value: missing "
-                            "'%s' option\n", slots_str ? "maxmem" : "slots");
+                    error_report("invalid -m option value: missing "
+                            "'%s' option", slots_str ? "maxmem" : "slots");
                     exit(EXIT_FAILURE);
                 }
                 break;
-- 
1.7.12.4




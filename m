Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XVyqR-0003Xj-FX
	for mharc-qemu-trivial@gnu.org; Mon, 22 Sep 2014 04:19:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVyqJ-0003HV-CK
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 04:19:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVyqB-0000bn-HB
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 04:19:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42369)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XVypy-0000U3-KP; Mon, 22 Sep 2014 04:19:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 73B3145D0E;
	Mon, 22 Sep 2014 12:19:04 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7861F707;
	Mon, 22 Sep 2014 12:11:19 +0400 (MSK)
Received: (nullmailer pid 16998 invoked by uid 1000);
	Mon, 22 Sep 2014 08:11:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Sep 2014 12:11:14 +0400
Message-Id: <1411373477-16938-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1411373477-16938-1-git-send-email-mjt@tls.msk.ru>
References: <1411373477-16938-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PULL 6/9] vl: Print maxmem in hex format for error
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
X-List-Received-Date: Mon, 22 Sep 2014 08:19:36 -0000

From: zhanghailiang <zhang.zhanghailiang@huawei.com>

In error message, maxmem is printed in Dec but ram_size in Hex.
It is better to print them in same format.
Also use error_report instead of fprintf.

Reviewed-By: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c |   22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/vl.c b/vl.c
index dc792fe..2695842 100644
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
1.7.10.4



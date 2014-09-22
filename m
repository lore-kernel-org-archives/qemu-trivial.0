Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XVyqQ-0003Wo-Nr
	for mharc-qemu-trivial@gnu.org; Mon, 22 Sep 2014 04:19:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVyqJ-0003J2-TZ
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 04:19:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVyqA-0000bD-U4
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 04:19:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47767)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XVypy-0000U4-KO; Mon, 22 Sep 2014 04:19:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5A4F245CD2;
	Mon, 22 Sep 2014 12:19:04 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D13D1703;
	Mon, 22 Sep 2014 12:11:18 +0400 (MSK)
Received: (nullmailer pid 16994 invoked by uid 1000);
	Mon, 22 Sep 2014 08:11:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Sep 2014 12:11:12 +0400
Message-Id: <1411373477-16938-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1411373477-16938-1-git-send-email-mjt@tls.msk.ru>
References: <1411373477-16938-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chen Gang <gang.chen.5i5j@gmail.com>
Subject: [Qemu-trivial] [PULL 4/9] xen-hvm.c: Always return -1 when failure
	occurs in xen_hvm_init()
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

From: Chen Gang <gang.chen.5i5j@gmail.com>

When failure occurs, it need to use "return -1" instead of exit(1), so
an upper layer has a chance to print failure information, too.

For simplicity, in xen_hvm_init(), also use '-1' instead of all
'-errno', since all related upper callers always exit(1) on failure.

It is not a normal function, it does not release related resources when
return -1, so need give related comments for it.

It passes common check:

  "./configure --enable-xen && make && make check"
  "echo $? == 0"

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 xen-hvm.c |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/xen-hvm.c b/xen-hvm.c
index 38059f3..05e522c 100644
--- a/xen-hvm.c
+++ b/xen-hvm.c
@@ -979,6 +979,7 @@ static void xen_wakeup_notifier(Notifier *notifier, void *data)
     xc_set_hvm_param(xen_xc, xen_domid, HVM_PARAM_ACPI_S_STATE, 0);
 }
 
+/* return 0 means OK, or -1 means critical issue -- will exit(1) */
 int xen_hvm_init(ram_addr_t *below_4g_mem_size, ram_addr_t *above_4g_mem_size,
                  MemoryRegion **ram_memory)
 {
@@ -992,15 +993,13 @@ int xen_hvm_init(ram_addr_t *below_4g_mem_size, ram_addr_t *above_4g_mem_size,
     state->xce_handle = xen_xc_evtchn_open(NULL, 0);
     if (state->xce_handle == XC_HANDLER_INITIAL_VALUE) {
         perror("xen: event channel open");
-        g_free(state);
-        return -errno;
+        return -1;
     }
 
     state->xenstore = xs_daemon_open();
     if (state->xenstore == NULL) {
         perror("xen: xenstore open");
-        g_free(state);
-        return -errno;
+        return -1;
     }
 
     state->exit.notify = xen_exit_notifier;
@@ -1070,7 +1069,7 @@ int xen_hvm_init(ram_addr_t *below_4g_mem_size, ram_addr_t *above_4g_mem_size,
     /* Initialize backend core & drivers */
     if (xen_be_init() != 0) {
         fprintf(stderr, "%s: xen backend core setup failed\n", __FUNCTION__);
-        exit(1);
+        return -1;
     }
     xen_be_register("console", &xen_console_ops);
     xen_be_register("vkbd", &xen_kbdmouse_ops);
-- 
1.7.10.4



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRgv-00047M-8r
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:57:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRgp-0003vR-OD
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:57:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRgn-0006Np-Lv
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:57:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52947)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRgi-0006Dr-Uq; Fri, 14 Jun 2013 06:57:01 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id F2FA441667;
	Fri, 14 Jun 2013 14:56:59 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id C2A1E51F; Fri, 14 Jun 2013 14:50:47 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:32 +0400
Message-Id: <1371207042-17980-17-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 16/26] hw/xen: Use g_free instead of free and
	fix potential memory leaks
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
X-List-Received-Date: Fri, 14 Jun 2013 10:57:09 -0000

From: Stefan Weil <sw@weilnetz.de>

The wrong functions and the missing calls of g_free were reported
by cppcheck.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/xen/xen_pt_config_init.c |    4 ++--
 xen-all.c                   |    8 +++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index 01872db..8ccc2e4 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -1777,12 +1777,12 @@ static int xen_pt_config_reg_init(XenPCIPassthroughState *s,
         rc = reg->init(s, reg_entry->reg,
                        reg_grp->base_offset + reg->offset, &data);
         if (rc < 0) {
-            free(reg_entry);
+            g_free(reg_entry);
             return rc;
         }
         if (data == XEN_PT_INVALID_REG) {
             /* free unused BAR register entry */
-            free(reg_entry);
+            g_free(reg_entry);
             return 0;
         }
         /* set register value */
diff --git a/xen-all.c b/xen-all.c
index bc105f1..1a1d7bb 100644
--- a/xen-all.c
+++ b/xen-all.c
@@ -389,7 +389,7 @@ static int xen_remove_from_physmap(XenIOState *state,
     if (state->log_for_dirtybit == physmap) {
         state->log_for_dirtybit = NULL;
     }
-    free(physmap);
+    g_free(physmap);
 
     return 0;
 }
@@ -1030,7 +1030,7 @@ static void xen_read_physmap(XenIOState *state)
                 xen_domid, entries[i]);
         value = xs_read(state->xenstore, 0, path, &len);
         if (value == NULL) {
-            free(physmap);
+            g_free(physmap);
             continue;
         }
         physmap->start_addr = strtoull(value, NULL, 16);
@@ -1041,7 +1041,7 @@ static void xen_read_physmap(XenIOState *state)
                 xen_domid, entries[i]);
         value = xs_read(state->xenstore, 0, path, &len);
         if (value == NULL) {
-            free(physmap);
+            g_free(physmap);
             continue;
         }
         physmap->size = strtoull(value, NULL, 16);
@@ -1069,12 +1069,14 @@ int xen_hvm_init(void)
     state->xce_handle = xen_xc_evtchn_open(NULL, 0);
     if (state->xce_handle == XC_HANDLER_INITIAL_VALUE) {
         perror("xen: event channel open");
+        g_free(state);
         return -errno;
     }
 
     state->xenstore = xs_daemon_open();
     if (state->xenstore == NULL) {
         perror("xen: xenstore open");
+        g_free(state);
         return -errno;
     }
 
-- 
1.7.10.4



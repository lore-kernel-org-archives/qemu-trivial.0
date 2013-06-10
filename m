Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um8pQ-0007h0-KY
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 16:36:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Um8pO-0007eQ-5e
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 16:36:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Um8pJ-00048F-DS
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 16:36:34 -0400
Received: from [2a03:4000:2:362::1] (port=36018
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Um8pG-00047o-IX; Mon, 10 Jun 2013 16:36:26 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 63A6C182160; Mon, 10 Jun 2013 22:36:23 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Mon, 10 Jun 2013 22:36:22 +0200
Message-Id: <1370896582-11910-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Stefan Weil <sw@weilnetz.de>, xen-devel@lists.xensource.com,
	qemu-devel <qemu-devel@nongnu.org>,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: [Qemu-trivial] [PATCH] hw/xen: Use g_free instead of free and fix
	potential memory leaks
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
X-List-Received-Date: Mon, 10 Jun 2013 20:36:35 -0000

The wrong functions and the missing calls of g_free were reported
by cppcheck.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
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



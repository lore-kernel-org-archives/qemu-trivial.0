Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTE0R-0002ij-1r
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 13:26:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTE0K-0002TP-Fb
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 13:26:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTE0J-00024v-Cw
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 13:26:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34134)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTE0A-00020i-1O; Wed, 04 Mar 2015 13:26:34 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BACE9408C5;
	Wed,  4 Mar 2015 21:26:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 77DB796A;
	Wed,  4 Mar 2015 20:07:10 +0300 (MSK)
Received: (nullmailer pid 17571 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:07:00 +0300
Message-Id: <7d085848357ec814bea63a41785635ffab512ff1.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 43/47] migration: Fix coding style (whitespace
	issues)
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
X-List-Received-Date: Wed, 04 Mar 2015 18:26:49 -0000

From: Stefan Weil <sw@weilnetz.de>

* Remove trailing whitespace (fixes 9 errors from checkpatch.pl).
  One comment line was longer than 80 characters, so wrap it
  and fix a typo, too.
* Replace tabs by blanks (fixes 1 error).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 migration/rdma.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index a8c2407..1cb14c0 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -703,7 +703,7 @@ static void qemu_rdma_dump_id(const char *who, struct ibv_context *verbs)
                 verbs->device->ibdev_path,
                 port.link_layer,
                 (port.link_layer == IBV_LINK_LAYER_INFINIBAND) ? "Infiniband" :
-                 ((port.link_layer == IBV_LINK_LAYER_ETHERNET) 
+                 ((port.link_layer == IBV_LINK_LAYER_ETHERNET)
                     ? "Ethernet" : "Unknown"));
 }
 
@@ -738,7 +738,7 @@ static void qemu_rdma_dump_gid(const char *who, struct rdma_cm_id *id)
  * and validate what time of hardware it is.
  *
  * Unfortunately, this puts the user in a fix:
- * 
+ *
  *  If the source VM connects with an IPv4 address without knowing that the
  *  destination has bound to '[::]' the migration will unconditionally fail
  *  unless the management software is explicitly listening on the the IPv4
@@ -746,13 +746,13 @@ static void qemu_rdma_dump_gid(const char *who, struct rdma_cm_id *id)
  *
  *  If the source VM connects with an IPv6 address, then we're OK because we can
  *  throw an error on the source (and similarly on the destination).
- * 
+ *
  *  But in mixed environments, this will be broken for a while until it is fixed
  *  inside linux.
  *
  * We do provide a *tiny* bit of help in this function: We can list all of the
  * devices in the system and check to see if all the devices are RoCE or
- * Infiniband. 
+ * Infiniband.
  *
  * If we detect that we have a *pure* RoCE environment, then we can safely
  * thrown an error even if the management software has specified '[::]' as the
@@ -771,17 +771,17 @@ static int qemu_rdma_broken_ipv6_kernel(Error **errp, struct ibv_context *verbs)
     /* This bug only exists in linux, to our knowledge. */
 #ifdef CONFIG_LINUX
 
-    /* 
+    /*
      * Verbs are only NULL if management has bound to '[::]'.
-     * 
+     *
      * Let's iterate through all the devices and see if there any pure IB
      * devices (non-ethernet).
-     * 
+     *
      * If not, then we can safely proceed with the migration.
      * Otherwise, there are no guarantees until the bug is fixed in linux.
      */
     if (!verbs) {
-	    int num_devices, x;
+        int num_devices, x;
         struct ibv_device ** dev_list = ibv_get_device_list(&num_devices);
         bool roce_found = false;
         bool ib_found = false;
@@ -826,8 +826,8 @@ static int qemu_rdma_broken_ipv6_kernel(Error **errp, struct ibv_context *verbs)
 
     /*
      * If we have a verbs context, that means that some other than '[::]' was
-     * used by the management software for binding. In which case we can actually 
-     * warn the user about a potential broken kernel;
+     * used by the management software for binding. In which case we can
+     * actually warn the user about a potentially broken kernel.
      */
 
     /* IB ports start with 1, not 0 */
-- 
2.1.4



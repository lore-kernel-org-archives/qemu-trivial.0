Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRlq3-0008SJ-I2
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 13:10:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YRlq0-0008L0-6S
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 13:10:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YRlpz-0006k5-0O
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 13:10:04 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:54219)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YRlps-0006ez-Tc; Sat, 28 Feb 2015 13:09:57 -0500
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 5027D1800A4; Sat, 28 Feb 2015 19:09:52 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sat, 28 Feb 2015 19:09:41 +0100
Message-Id: <1425146983-16015-2-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1425146983-16015-1-git-send-email-sw@weilnetz.de>
References: <1425146983-16015-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Amit Shah <amit.shah@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	QEMU Developer <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Subject: [Qemu-trivial] [PATCH 1/3] migration: Fix coding style (whitespace
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
X-List-Received-Date: Sat, 28 Feb 2015 18:10:05 -0000

* Remove trailing whitespace (fixes 9 errors from checkpatch.pl).
  One comment line was longer than 80 characters, so wrap it
  and fix a typo, too.
* Replace tabs by blanks (fixes 1 error).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

My editor automatically removes trailing whitespace, so before fixing code,
I had to fix the coding style.

 migration/rdma.c |   22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 6bee30c..67c5701 100644
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
@@ -2421,7 +2421,7 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
                         continue;
                     }
                 }
-                    
+
                 goto listen;
             }
         }
-- 
1.7.10.4



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGRti-0001Ww-BC
	for mharc-qemu-trivial@gnu.org; Mon, 02 Sep 2013 07:02:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGRtc-0001MS-Eu
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:02:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGRtY-0005Q7-22
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:02:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58068)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VGRtN-0005Lk-UI; Mon, 02 Sep 2013 07:01:58 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 33EF14023F;
	Mon,  2 Sep 2013 15:01:57 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1768520D;
	Mon,  2 Sep 2013 15:01:57 +0400 (MSK)
Received: (nullmailer pid 14626 invoked by uid 1000);
	Mon, 02 Sep 2013 11:01:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Mon,  2 Sep 2013 15:01:22 +0400
Message-Id: <1378119695-14568-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 02/15] misc: Fix some typos in names and
	comments
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
X-List-Received-Date: Mon, 02 Sep 2013 11:02:17 -0000

From: Stefan Weil <sw@weilnetz.de>

Most typos were found using a modified version of codespell:

accross -> across
issueing -> issuing
TICNT_THRESHHOLD -> TICNT_THRESHOLD
bandwith -> bandwidth
VCARD_7816_PROPIETARY -> VCARD_7816_PROPRIETARY
occured -> occurred
gaurantee -> guarantee
sofware -> software

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/backup.c                           |    2 +-
 hw/s390x/css.c                           |    2 +-
 hw/timer/exynos4210_rtc.c                |    4 ++--
 include/hw/bt.h                          |    8 ++++----
 libcacard/card_7816.c                    |    2 +-
 libcacard/card_7816t.h                   |    2 +-
 linux-headers/asm-powerpc/epapr_hcalls.h |    4 ++--
 migration-rdma.c                         |    6 +++---
 8 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index e12b3b1..23c7264 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -290,7 +290,7 @@ static void coroutine_fn backup_run(void *opaque)
 
                 for (i = 0; i < BACKUP_SECTORS_PER_CLUSTER;) {
                     /* bdrv_co_is_allocated() only returns true/false based
-                     * on the first set of sectors it comes accross that
+                     * on the first set of sectors it comes across that
                      * are are all in the same state.
                      * For that reason we must verify each sector in the
                      * backup cluster length.  We end up copying more than
diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 93b0b97..101da63 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -124,7 +124,7 @@ static void sch_handle_clear_func(SubchDev *sch)
     /* Path management: In our simple css, we always choose the only path. */
     path = 0x80;
 
-    /* Reset values prior to 'issueing the clear signal'. */
+    /* Reset values prior to 'issuing the clear signal'. */
     p->lpum = 0;
     p->pom = 0xff;
     s->flags &= ~SCSW_FLAGS_MASK_PNO;
diff --git a/hw/timer/exynos4210_rtc.c b/hw/timer/exynos4210_rtc.c
index 3f2c8c5..026f81a 100644
--- a/hw/timer/exynos4210_rtc.c
+++ b/hw/timer/exynos4210_rtc.c
@@ -67,7 +67,7 @@
 #define     CURTICNT        0x0090
 
 #define     TICK_TIMER_ENABLE   0x0100
-#define     TICNT_THRESHHOLD    2
+#define     TICNT_THRESHOLD     2
 
 
 #define     RTC_ENABLE          0x0001
@@ -429,7 +429,7 @@ static void exynos4210_rtc_write(void *opaque, hwaddr offset,
         s->reg_rtccon = value;
         break;
     case TICCNT:
-        if (value > TICNT_THRESHHOLD) {
+        if (value > TICNT_THRESHOLD) {
             s->reg_ticcnt = value;
         } else {
             fprintf(stderr,
diff --git a/include/hw/bt.h b/include/hw/bt.h
index 830af94..3f365bc 100644
--- a/include/hw/bt.h
+++ b/include/hw/bt.h
@@ -640,8 +640,8 @@ typedef struct {
 #define OCF_SETUP_SYNC_CONN		0x0028
 typedef struct {
     uint16_t	handle;
-    uint32_t	tx_bandwith;
-    uint32_t	rx_bandwith;
+    uint32_t	tx_bandwidth;
+    uint32_t	rx_bandwidth;
     uint16_t	max_latency;
     uint16_t	voice_setting;
     uint8_t	retrans_effort;
@@ -652,8 +652,8 @@ typedef struct {
 #define OCF_ACCEPT_SYNC_CONN_REQ	0x0029
 typedef struct {
     bdaddr_t	bdaddr;
-    uint32_t	tx_bandwith;
-    uint32_t	rx_bandwith;
+    uint32_t	tx_bandwidth;
+    uint32_t	rx_bandwidth;
     uint16_t	max_latency;
     uint16_t	voice_setting;
     uint8_t	retrans_effort;
diff --git a/libcacard/card_7816.c b/libcacard/card_7816.c
index 8d06326..c28bb60 100644
--- a/libcacard/card_7816.c
+++ b/libcacard/card_7816.c
@@ -232,7 +232,7 @@ vcard_apdu_set_class(VCardAPDU *apdu) {
     case 0xf0:
     default:
         apdu->a_gen_type =
-            (apdu->a_cla == 0xff) ? VCARD_7816_PTS : VCARD_7816_PROPIETARY;
+            (apdu->a_cla == 0xff) ? VCARD_7816_PTS : VCARD_7816_PROPRIETARY;
         break;
     }
     return VCARD7816_STATUS_SUCCESS;
diff --git a/libcacard/card_7816t.h b/libcacard/card_7816t.h
index 9333285..8eef0ce 100644
--- a/libcacard/card_7816t.h
+++ b/libcacard/card_7816t.h
@@ -43,7 +43,7 @@ typedef enum {
     VCARD_7816_ISO,
     VCARD_7816_RFU,
     VCARD_7816_PTS,
-    VCARD_7816_PROPIETARY
+    VCARD_7816_PROPRIETARY
 } VCardAPDUType;
 
 
diff --git a/linux-headers/asm-powerpc/epapr_hcalls.h b/linux-headers/asm-powerpc/epapr_hcalls.h
index 06f7247..33b3f89 100644
--- a/linux-headers/asm-powerpc/epapr_hcalls.h
+++ b/linux-headers/asm-powerpc/epapr_hcalls.h
@@ -78,7 +78,7 @@
 #define EV_SUCCESS		0
 #define EV_EPERM		1	/* Operation not permitted */
 #define EV_ENOENT		2	/*  Entry Not Found */
-#define EV_EIO			3	/* I/O error occured */
+#define EV_EIO			3	/* I/O error occurred */
 #define EV_EAGAIN		4	/* The operation had insufficient
 					 * resources to complete and should be
 					 * retried
@@ -89,7 +89,7 @@
 #define EV_ENODEV		7	/* No such device */
 #define EV_EINVAL		8	/* An argument supplied to the hcall
 					   was out of range or invalid */
-#define EV_INTERNAL		9	/* An internal error occured */
+#define EV_INTERNAL		9	/* An internal error occurred */
 #define EV_CONFIG		10	/* A configuration error was detected */
 #define EV_INVALID_STATE	11	/* The object is in an invalid state */
 #define EV_UNIMPLEMENTED	12	/* Unimplemented hypercall */
diff --git a/migration-rdma.c b/migration-rdma.c
index 3d1266f..f540366 100644
--- a/migration-rdma.c
+++ b/migration-rdma.c
@@ -756,7 +756,7 @@ static void qemu_rdma_dump_gid(const char *who, struct rdma_cm_id *id)
  * connections (both IPv4 and IPv6) if the destination machine does not have
  * a regular infiniband network available for use.
  *
- * The only way to gaurantee that an error is thrown for broken kernels is
+ * The only way to guarantee that an error is thrown for broken kernels is
  * for the management software to choose a *specific* interface at bind time
  * and validate what time of hardware it is.
  *
@@ -778,7 +778,7 @@ static void qemu_rdma_dump_gid(const char *who, struct rdma_cm_id *id)
  * Infiniband. 
  *
  * If we detect that we have a *pure* RoCE environment, then we can safely
- * thrown an error even if the management sofware has specified '[::]' as the
+ * thrown an error even if the management software has specified '[::]' as the
  * bind address.
  *
  * However, if there is are multiple hetergeneous devices, then we cannot make
@@ -801,7 +801,7 @@ static int qemu_rdma_broken_ipv6_kernel(Error **errp, struct ibv_context *verbs)
      * devices (non-ethernet).
      * 
      * If not, then we can safely proceed with the migration.
-     * Otherwise, there are no gaurantees until the bug is fixed in linux.
+     * Otherwise, there are no guarantees until the bug is fixed in linux.
      */
     if (!verbs) {
 	    int num_devices, x;
-- 
1.7.10.4



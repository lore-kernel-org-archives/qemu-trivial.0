Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bDZrw-0004M5-5t
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jun 2016 12:10:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bDZrt-0004F3-Rr
	for qemu-trivial@nongnu.org; Thu, 16 Jun 2016 12:10:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bDZrr-0007q0-Kx
	for qemu-trivial@nongnu.org; Thu, 16 Jun 2016 12:10:08 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57824)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bDZrn-0007kX-SQ; Thu, 16 Jun 2016 12:10:04 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bDZrn-0007WD-94; Thu, 16 Jun 2016 17:10:03 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-trivial@nongnu.org
Date: Thu, 16 Jun 2016 17:10:02 +0100
Message-Id: <1466093402-18143-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH] hw/bt: Don't use cpu_to_*w() and *_to_cpup()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jun 2016 16:10:11 -0000

Don't use cpu_to_*w() and *_to_cpup() to do byte-swapped loads
and stores; instead use ld*_p() and st*_p() which correctly handle
misaligned accesses.

Bring the HNDL() macro into line with how we deal with
PARAMHANDLE(), by using cpu_to_le16() rather than an ifdef
HOST_WORDS_BIGENDIAN.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/bt/hci.c   | 10 +++-------
 hw/bt/l2cap.c | 12 ++++++------
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/hw/bt/hci.c b/hw/bt/hci.c
index 7d52205..351123f 100644
--- a/hw/bt/hci.c
+++ b/hw/bt/hci.c
@@ -426,11 +426,7 @@ static void bt_submit_raw_acl(struct bt_piconet_s *net, int length, uint8_t *dat
  * be continuously allocated.  We do it though, to preserve similar
  * behaviour between hosts.  Some things, like the BD_ADDR cannot be
  * preserved though (for example if a real hci is used).  */
-#ifdef HOST_WORDS_BIGENDIAN
-# define HNDL(raw)	bswap16(raw)
-#else
-# define HNDL(raw)	(raw)
-#endif
+#define HNDL(raw) cpu_to_le16(raw)
 
 static const uint8_t bt_event_reserved_mask[8] = {
     0xff, 0x9f, 0xfb, 0xff, 0x07, 0x18, 0x00, 0x00,
@@ -1504,8 +1500,8 @@ static void bt_submit_hci(struct HCIInfo *info,
         return;
 
 #define PARAM(cmd, param)	(((cmd##_cp *) data)->param)
-#define PARAM16(cmd, param)	le16_to_cpup(&PARAM(cmd, param))
-#define PARAMHANDLE(cmd)	HNDL(PARAM(cmd, handle))
+#define PARAM16(cmd, param) lduw_le_p(&PARAM(cmd, param))
+#define PARAMHANDLE(cmd) PARAM16(cmd, handle)
 #define LENGTH_CHECK(cmd)	if (length < sizeof(cmd##_cp)) goto short_hci
     /* Note: the supported commands bitmask in bt_hci_read_local_commands_rp
      * needs to be updated every time a command is implemented here!  */
diff --git a/hw/bt/l2cap.c b/hw/bt/l2cap.c
index dfc95ed..e342045 100644
--- a/hw/bt/l2cap.c
+++ b/hw/bt/l2cap.c
@@ -526,9 +526,9 @@ static int l2cap_channel_config(struct l2cap_instance_s *l2cap,
             }
 
             /* MTU */
-            val = le16_to_cpup((void *) opt->val);
+            val = lduw_le_p(opt->val);
             if (val < ch->min_mtu) {
-                cpu_to_le16w((void *) opt->val, ch->min_mtu);
+                stw_le_p(opt->val, ch->min_mtu);
                 result = L2CAP_CONF_UNACCEPT;
                 break;
             }
@@ -543,7 +543,7 @@ static int l2cap_channel_config(struct l2cap_instance_s *l2cap,
             }
 
             /* Flush Timeout */
-            val = le16_to_cpup((void *) opt->val);
+            val = lduw_le_p(opt->val);
             if (val < 0x0001) {
                 opt->val[0] = 0xff;
                 opt->val[1] = 0xff;
@@ -987,7 +987,7 @@ static void l2cap_bframe_in(struct l2cap_chan_s *ch, uint16_t cid,
 static void l2cap_iframe_in(struct l2cap_chan_s *ch, uint16_t cid,
                 const l2cap_hdr *hdr, int len)
 {
-    uint16_t fcs = le16_to_cpup((void *) (hdr->data + len - 2));
+    uint16_t fcs = lduw_le_p(hdr->data + len - 2);
 
     if (len < 4)
         goto len_error;
@@ -1002,7 +1002,7 @@ static void l2cap_iframe_in(struct l2cap_chan_s *ch, uint16_t cid,
             /* TODO: Signal an error? */
             return;
         }
-        l2cap_sframe_in(ch, le16_to_cpup((void *) hdr->data));
+        l2cap_sframe_in(ch, lduw_le_p(hdr->data));
         return;
     }
 
@@ -1022,7 +1022,7 @@ static void l2cap_iframe_in(struct l2cap_chan_s *ch, uint16_t cid,
         if (len - 6 > ch->mps)
             goto len_error;
 
-        ch->len_total = le16_to_cpup((void *) (hdr->data + 2));
+        ch->len_total = lduw_le_p(hdr->data + 2);
         if (len >= 6 + ch->len_total)
             goto seg_error;
 
-- 
1.9.1



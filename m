Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WS0He-0003Id-GR
	for mharc-qemu-trivial@gnu.org; Mon, 24 Mar 2014 04:31:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <deepak.mk17@gmail.com>) id 1WS0HU-0002vb-Er
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 04:31:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <deepak.mk17@gmail.com>) id 1WS0HM-0007sh-0h
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 04:30:52 -0400
Received: from mail-pb0-x22c.google.com ([2607:f8b0:400e:c01::22c]:46899)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <deepak.mk17@gmail.com>)
	id 1WS0H4-0007ml-L3; Mon, 24 Mar 2014 04:30:26 -0400
Received: by mail-pb0-f44.google.com with SMTP id rp16so5125833pbb.17
	for <multiple recipients>; Mon, 24 Mar 2014 01:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5vIUq3ERuRcOb/dScGT+eNIyXypP6Y2XHMF2+ratv7A=;
	b=q+liXgA/Ydb4Un/IlLDZkOVycu6MJ31sHg3qQY2dQdJNMiIK/ZhC2HcJuyVOSFoV0E
	Bk5a4rfxC+BOx+BTMlB5G825ZmL7NpyPo3xBwxxU/yt4AqUCPXIIOC15czwI2mLwqg1n
	69w5e5gXUFHWMd4BrVP7nq+HYtnucOdZQ8saVme+VOY5a3OqTwcb0j3NqG6ScOXYRG3w
	2pFubfiyCunA/sX7hX9XenCT/huCqmYyEOLZQvGH8cZVkARMM8+LAguStEuOQwzNmV04
	36m98yMoUVJtAphX4ZJaDB3KBcuj700sFwebQ1T6B9hBCs1HwxzkL8g56kqW45S7onl1
	m9Tg==
X-Received: by 10.66.102.4 with SMTP id fk4mr69373924pab.59.1395649825797;
	Mon, 24 Mar 2014 01:30:25 -0700 (PDT)
Received: from monroe.comp.nus.edu.sg (nusnet-208-140.dynip.nus.edu.sg.
	[137.132.208.140]) by mx.google.com with ESMTPSA id
	gu11sm31716112pbd.74.2014.03.24.01.30.22 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Mar 2014 01:30:24 -0700 (PDT)
From: Deepak Kathayat <deepak.mk17@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Mar 2014 16:30:17 +0800
Message-Id: <1395649817-20742-1-git-send-email-deepak.mk17@gmail.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::22c
Cc: qemu-trivial@nongnu.org, Deepak Kathayat <deepak.mk17@gmail.com>,
	stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH] Fixed various typos
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
X-List-Received-Date: Mon, 24 Mar 2014 08:31:01 -0000


Signed-off-by: Deepak Kathayat <deepak.mk17@gmail.com>
---
 block/gluster.c  |    2 +-
 block/qcow.c     |    2 +-
 block/sheepdog.c |    8 ++++----
 block/vdi.c      |    2 +-
 block/vhdx-log.c |    2 +-
 slirp/tftp.c     |    2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/block/gluster.c b/block/gluster.c
index a44d612..8836085 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -80,7 +80,7 @@ static int parse_volume_options(GlusterConf *gconf, char *path)
  * 'server' specifies the server where the volume file specification for
  * the given volume resides. This can be either hostname, ipv4 address
  * or ipv6 address. ipv6 address needs to be within square brackets [ ].
- * If transport type is 'unix', then 'server' field should not be specifed.
+ * If transport type is 'unix', then 'server' field should not be specified.
  * The 'socket' field needs to be populated with the path to unix domain
  * socket.
  *
diff --git a/block/qcow.c b/block/qcow.c
index 1e128be..d5a7d5f 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -723,7 +723,7 @@ static int qcow_create(const char *filename, QEMUOptionParameter *options,
             backing_file = NULL;
         }
         header.cluster_bits = 9; /* 512 byte cluster to avoid copying
-                                    unmodifyed sectors */
+                                    unmodified sectors */
         header.l2_bits = 12; /* 32 KB L2 tables */
     } else {
         header.cluster_bits = 12; /* 4 KB clusters */
diff --git a/block/sheepdog.c b/block/sheepdog.c
index f7bd024..0eb33ee 100644
--- a/block/sheepdog.c
+++ b/block/sheepdog.c
@@ -909,9 +909,9 @@ static void co_write_request(void *opaque)
 }
 
 /*
- * Return a socket discriptor to read/write objects.
+ * Return a socket descriptor to read/write objects.
  *
- * We cannot use this discriptor for other operations because
+ * We cannot use this descriptor for other operations because
  * the block driver may be on waiting response from the server.
  */
 static int get_sheep_fd(BDRVSheepdogState *s)
@@ -1896,7 +1896,7 @@ static int sd_create_branch(BDRVSheepdogState *s)
 
     /*
      * Even If deletion fails, we will just create extra snapshot based on
-     * the workding VDI which was supposed to be deleted. So no need to
+     * the working VDI which was supposed to be deleted. So no need to
      * false bail out.
      */
     deleted = sd_delete(s);
@@ -2194,7 +2194,7 @@ cleanup:
  * We implement rollback(loadvm) operation to the specified snapshot by
  * 1) switch to the snapshot
  * 2) rely on sd_create_branch to delete working VDI and
- * 3) create a new working VDI based on the speicified snapshot
+ * 3) create a new working VDI based on the specified snapshot
  */
 static int sd_snapshot_goto(BlockDriverState *bs, const char *snapshot_id)
 {
diff --git a/block/vdi.c b/block/vdi.c
index ae49cd8..ac9a025 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -31,7 +31,7 @@
  * Allocation of blocks could be optimized (less writes to block map and
  * header).
  *
- * Read and write of adjacents blocks could be done in one operation
+ * Read and write of adjacent blocks could be done in one operation
  * (current code uses one operation per block (1 MiB).
  *
  * The code is not thread safe (missing locks for changes in header and
diff --git a/block/vhdx-log.c b/block/vhdx-log.c
index 02755b8..a77c040 100644
--- a/block/vhdx-log.c
+++ b/block/vhdx-log.c
@@ -578,7 +578,7 @@ static int vhdx_validate_log_entry(BlockDriverState *bs, BDRVVHDXState *s,
     total_sectors = hdr.entry_length / VHDX_LOG_SECTOR_SIZE;
 
 
-    /* read_desc() will incrememnt the read idx */
+    /* read_desc() will increment the read idx */
     ret = vhdx_log_read_desc(bs, s, log, &desc_buffer);
     if (ret < 0) {
         goto free_and_exit;
diff --git a/slirp/tftp.c b/slirp/tftp.c
index 1a79c45..a329fb2 100644
--- a/slirp/tftp.c
+++ b/slirp/tftp.c
@@ -279,7 +279,7 @@ static void tftp_handle_rrq(Slirp *slirp, struct tftp_t *tp, int pktlen)
 
   spt = &slirp->tftp_sessions[s];
 
-  /* unspecifed prefix means service disabled */
+  /* unspecified prefix means service disabled */
   if (!slirp->tftp_prefix) {
       tftp_send_error(spt, 2, "Access violation", tp);
       return;
-- 
1.7.9.5



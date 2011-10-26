Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJ9WG-0006Bn-BU
	for mharc-qemu-trivial@gnu.org; Wed, 26 Oct 2011 15:52:12 -0400
Received: from eggs.gnu.org ([140.186.70.92]:52293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ericsunshine@gmail.com>) id 1RJ9WD-00060h-B5
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2011 15:52:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ericsunshine@gmail.com>) id 1RJ9WC-0000hV-9O
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2011 15:52:09 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:44821)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ericsunshine@gmail.com>)
	id 1RJ9W8-0000h5-RD; Wed, 26 Oct 2011 15:52:04 -0400
Received: by qadc12 with SMTP id c12so2270533qad.4
	for <multiple recipients>; Wed, 26 Oct 2011 12:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=xZcu6yEnrlkallFShQaD9NdfyJHmNMJAq7ofwEGxRE8=;
	b=IQaIex4O1vDEFBp621aTdDLDvgJchG0wDEcg+FE8Igj5qkCDz1C2U8fxeSBzqurxZ8
	QMM30XslQPtttFxAFc4nsS1XartxzPCp42Kg1UqkY4mAxnOmvKkigfmRg6NVcEEJ8hOs
	iQ4KI5tDvmIWAVIHi91IB8Z1/gy0DCB1RFYFo=
Received: by 10.224.9.14 with SMTP id j14mr26365987qaj.26.1319658723589;
	Wed, 26 Oct 2011 12:52:03 -0700 (PDT)
Received: from localhost.localdomain (user-0c936tj.cable.mindspring.com.
	[24.145.155.179])
	by mx.google.com with ESMTPS id gg6sm3724746qab.3.2011.10.26.12.52.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Oct 2011 12:52:03 -0700 (PDT)
Sender: Eric Sunshine <ericsunshine@gmail.com>
From: Eric Sunshine <sunshine@sunshineco.com>
To: qemu-devel@nongnu.org
Date: Wed, 26 Oct 2011 15:51:18 -0400
Message-Id: <1319658678-18355-1-git-send-email-sunshine@sunshineco.com>
X-Mailer: git-send-email 1.7.7.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>,
	Kevin Wolf <kwolf@redhat.com>
Subject: [Qemu-trivial] [PATCH] Teach block/vdi about "discarded" (no longer
	allocated) blocks
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
X-List-Received-Date: Wed, 26 Oct 2011 19:52:10 -0000

An entry in the VDI block map will hold an offset to the actual block if
the block is allocated, or one of two specially-interpreted values if
not allocated. Using VirtualBox terminology, value VDI_IMAGE_BLOCK_FREE
(0xffffffff) represents a never-allocated block (semantically arbitrary
content).  VDI_IMAGE_BLOCK_ZERO (0xfffffffe) represents a "discarded"
block (semantically zero-filled).  block/vdi knows only about
VDI_IMAGE_BLOCK_FREE.  Teach it about VDI_IMAGE_BLOCK_ZERO.

Signed-off-by: Eric Sunshine <sunshine@sunshineco.com>
---

Without this patch, "qemu-image check" on a VDI image containing
discarded blocks reports errors such as:

  ERROR: block index 3434 too large, is 4294967294

Decimal 4294967294 is 0xfffffffe. Worse, "qemu-image convert" or direct
access of the VDI image from qemu involves reads and writes of blocks at
the bogus block offset 4294967294 within the image file.

Cc: Stefan Weil <weil@mail.berlios.de>
Cc: Kevin Wolf <kwolf@redhat.com>

 block/vdi.c |   23 ++++++++++++++---------
 1 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/block/vdi.c b/block/vdi.c
index 883046d..25790c4 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -114,8 +114,13 @@ void uuid_unparse(const uuid_t uu, char *out);
  */
 #define VDI_TEXT "<<< QEMU VM Virtual Disk Image >>>\n"
 
-/* Unallocated blocks use this index (no need to convert endianness). */
-#define VDI_UNALLOCATED UINT32_MAX
+/* A never-allocated block; semantically arbitrary content. */
+#define VDI_UNALLOCATED ((uint32_t)~0)
+
+/* A discarded (no longer allocated) block; semantically zero-filled. */
+#define VDI_DISCARDED ((uint32_t)~1)
+
+#define VDI_IS_ALLOCATED(X) ((X) < VDI_DISCARDED)
 
 #if !defined(CONFIG_UUID)
 void uuid_generate(uuid_t out)
@@ -307,10 +312,10 @@ static int vdi_check(BlockDriverState *bs, BdrvCheckResult *res)
     /* Check block map and value of blocks_allocated. */
     for (block = 0; block < s->header.blocks_in_image; block++) {
         uint32_t bmap_entry = le32_to_cpu(s->bmap[block]);
-        if (bmap_entry != VDI_UNALLOCATED) {
+        if (VDI_IS_ALLOCATED(bmap_entry)) {
             if (bmap_entry < s->header.blocks_in_image) {
                 blocks_allocated++;
-                if (bmap[bmap_entry] == VDI_UNALLOCATED) {
+                if (!VDI_IS_ALLOCATED(bmap[bmap_entry])) {
                     bmap[bmap_entry] = bmap_entry;
                 } else {
                     fprintf(stderr, "ERROR: block index %" PRIu32
@@ -472,7 +477,7 @@ static int vdi_is_allocated(BlockDriverState *bs, int64_t sector_num,
         n_sectors = nb_sectors;
     }
     *pnum = n_sectors;
-    return bmap_entry != VDI_UNALLOCATED;
+    return VDI_IS_ALLOCATED(bmap_entry);
 }
 
 static void vdi_aio_cancel(BlockDriverAIOCB *blockacb)
@@ -603,7 +608,7 @@ static void vdi_aio_read_cb(void *opaque, int ret)
     /* prepare next AIO request */
     acb->n_sectors = n_sectors;
     bmap_entry = le32_to_cpu(s->bmap[block_index]);
-    if (bmap_entry == VDI_UNALLOCATED) {
+    if (!VDI_IS_ALLOCATED(bmap_entry)) {
         /* Block not allocated, return zeros, no need to wait. */
         memset(acb->buf, 0, n_sectors * SECTOR_SIZE);
         ret = vdi_schedule_bh(vdi_aio_rw_bh, acb);
@@ -685,7 +690,7 @@ static void vdi_aio_write_cb(void *opaque, int ret)
         if (acb->header_modified) {
             VdiHeader *header = acb->block_buffer;
             logout("now writing modified header\n");
-            assert(acb->bmap_first != VDI_UNALLOCATED);
+            assert(VDI_IS_ALLOCATED(acb->bmap_first));
             *header = s->header;
             vdi_header_to_le(header);
             acb->header_modified = 0;
@@ -699,7 +704,7 @@ static void vdi_aio_write_cb(void *opaque, int ret)
                 goto done;
             }
             return;
-        } else if (acb->bmap_first != VDI_UNALLOCATED) {
+        } else if (VDI_IS_ALLOCATED(acb->bmap_first)) {
             /* One or more new blocks were allocated. */
             uint64_t offset;
             uint32_t bmap_first;
@@ -749,7 +754,7 @@ static void vdi_aio_write_cb(void *opaque, int ret)
     /* prepare next AIO request */
     acb->n_sectors = n_sectors;
     bmap_entry = le32_to_cpu(s->bmap[block_index]);
-    if (bmap_entry == VDI_UNALLOCATED) {
+    if (!VDI_IS_ALLOCATED(bmap_entry)) {
         /* Allocate new block and write to it. */
         uint64_t offset;
         uint8_t *block;
-- 
1.7.7.1



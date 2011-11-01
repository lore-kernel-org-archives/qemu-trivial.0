Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RL7kd-0001Lz-EG
	for mharc-qemu-trivial@gnu.org; Tue, 01 Nov 2011 02:23:11 -0400
Received: from eggs.gnu.org ([140.186.70.92]:57776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RL7kZ-00019q-6Z
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2011 02:23:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RL7kX-0001ww-VC
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2011 02:23:07 -0400
Received: from e23smtp01.au.ibm.com ([202.81.31.143]:57239)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>)
	id 1RL7kU-0001oE-Rf; Tue, 01 Nov 2011 02:23:03 -0400
Received: from d23relay05.au.ibm.com (d23relay05.au.ibm.com [202.81.31.247])
	by e23smtp01.au.ibm.com (8.14.4/8.13.1) with ESMTP id pA16L9Pa031506;
	Tue, 1 Nov 2011 17:21:09 +1100
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
	by d23relay05.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pA16K31K2293948; Tue, 1 Nov 2011 17:20:03 +1100
Received: from d23av04.au.ibm.com (loopback [127.0.0.1])
	by d23av04.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pA16Mqpu006710; Tue, 1 Nov 2011 17:22:53 +1100
Received: from wdongxu-T410.cn.ibm.com ([9.115.118.28])
	by d23av04.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pA16MoQe005519; Tue, 1 Nov 2011 17:22:51 +1100
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Nov 2011 14:21:53 +0800
Message-Id: <1320128513-16208-1-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.5.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 202.81.31.143
Cc: qemu-trivial@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH v2] use g_free, instead of free
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
X-List-Received-Date: Tue, 01 Nov 2011 06:23:09 -0000

From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>

Fix mismatching allocation and deallocation: g_free should be used to pair with g_malloc.
Also fix coding style.

Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
---
 block/cloop.c |  119 +++++++++++++++++++++++++++++++--------------------------
 1 files changed, 65 insertions(+), 54 deletions(-)

diff --git a/block/cloop.c b/block/cloop.c
index 775f8a9..1884b8c 100644
--- a/block/cloop.c
+++ b/block/cloop.c
@@ -30,7 +30,7 @@ typedef struct BDRVCloopState {
     CoMutex lock;
     uint32_t block_size;
     uint32_t n_blocks;
-    uint64_t* offsets;
+    uint64_t *offsets;
     uint32_t sectors_per_block;
     uint32_t current_block;
     uint8_t *compressed_block;
@@ -40,21 +40,23 @@ typedef struct BDRVCloopState {
 
 static int cloop_probe(const uint8_t *buf, int buf_size, const char *filename)
 {
-    const char* magic_version_2_0="#!/bin/sh\n"
-	"#V2.0 Format\n"
-	"modprobe cloop file=$0 && mount -r -t iso9660 /dev/cloop $1\n";
-    int length=strlen(magic_version_2_0);
-    if(length>buf_size)
-	length=buf_size;
-    if(!memcmp(magic_version_2_0,buf,length))
-	return 2;
+    const char *magic_version_2_0 = "#!/bin/sh\n"
+        "#V2.0 Format\n"
+        "modprobe cloop file=$0 && mount -r -t iso9660 /dev/cloop $1\n";
+    int length = strlen(magic_version_2_0);
+    if (length > buf_size) {
+        length = buf_size;
+    }
+    if (!memcmp(magic_version_2_0, buf, length)) {
+        return 2;
+    }
     return 0;
 }
 
 static int cloop_open(BlockDriverState *bs, int flags)
 {
     BDRVCloopState *s = bs->opaque;
-    uint32_t offsets_size,max_compressed_block_size=1,i;
+    uint32_t offsets_size, max_compressed_block_size = 1, i;
 
     bs->read_only = 1;
 
@@ -74,26 +76,28 @@ static int cloop_open(BlockDriverState *bs, int flags)
     s->offsets = g_malloc(offsets_size);
     if (bdrv_pread(bs->file, 128 + 4 + 4, s->offsets, offsets_size) <
             offsets_size) {
-	goto cloop_close;
+        goto cloop_close;
     }
     for(i=0;i<s->n_blocks;i++) {
-	s->offsets[i]=be64_to_cpu(s->offsets[i]);
-	if(i>0) {
-	    uint32_t size=s->offsets[i]-s->offsets[i-1];
-	    if(size>max_compressed_block_size)
-		max_compressed_block_size=size;
-	}
+        s->offsets[i] = be64_to_cpu(s->offsets[i]);
+        if (i > 0) {
+            uint32_t size = s->offsets[i] - s->offsets[i-1];
+            if (size > max_compressed_block_size) {
+                max_compressed_block_size = size;
+            }
+        }
     }
 
     /* initialize zlib engine */
-    s->compressed_block = g_malloc(max_compressed_block_size+1);
+    s->compressed_block = g_malloc(max_compressed_block_size + 1);
     s->uncompressed_block = g_malloc(s->block_size);
-    if(inflateInit(&s->zstream) != Z_OK)
-	goto cloop_close;
-    s->current_block=s->n_blocks;
+    if (inflateInit(&s->zstream) != Z_OK) {
+        goto cloop_close;
+    }
+    s->current_block = s->n_blocks;
 
     s->sectors_per_block = s->block_size/512;
-    bs->total_sectors = s->n_blocks*s->sectors_per_block;
+    bs->total_sectors = s->n_blocks * s->sectors_per_block;
     qemu_co_mutex_init(&s->lock);
     return 0;
 
@@ -105,27 +109,30 @@ static inline int cloop_read_block(BlockDriverState *bs, int block_num)
 {
     BDRVCloopState *s = bs->opaque;
 
-    if(s->current_block != block_num) {
-	int ret;
-        uint32_t bytes = s->offsets[block_num+1]-s->offsets[block_num];
+    if (s->current_block != block_num) {
+        int ret;
+        uint32_t bytes = s->offsets[block_num + 1]-s->offsets[block_num];
 
         ret = bdrv_pread(bs->file, s->offsets[block_num], s->compressed_block,
                          bytes);
-        if (ret != bytes)
+        if (ret != bytes) {
             return -1;
+        }
+
+        s->zstream.next_in = s->compressed_block;
+        s->zstream.avail_in = bytes;
+        s->zstream.next_out = s->uncompressed_block;
+        s->zstream.avail_out = s->block_size;
+        ret = inflateReset(&s->zstream);
+        if (ret != Z_OK) {
+            return -1;
+        }
+        ret = inflate(&s->zstream, Z_FINISH);
+        if (ret != Z_STREAM_END || s->zstream.total_out != s->block_size) {
+            return -1;
+        }
 
-	s->zstream.next_in = s->compressed_block;
-	s->zstream.avail_in = bytes;
-	s->zstream.next_out = s->uncompressed_block;
-	s->zstream.avail_out = s->block_size;
-	ret = inflateReset(&s->zstream);
-	if(ret != Z_OK)
-	    return -1;
-	ret = inflate(&s->zstream, Z_FINISH);
-	if(ret != Z_STREAM_END || s->zstream.total_out != s->block_size)
-	    return -1;
-
-	s->current_block = block_num;
+        s->current_block = block_num;
     }
     return 0;
 }
@@ -136,12 +143,15 @@ static int cloop_read(BlockDriverState *bs, int64_t sector_num,
     BDRVCloopState *s = bs->opaque;
     int i;
 
-    for(i=0;i<nb_sectors;i++) {
-	uint32_t sector_offset_in_block=((sector_num+i)%s->sectors_per_block),
-	    block_num=(sector_num+i)/s->sectors_per_block;
-	if(cloop_read_block(bs, block_num) != 0)
-	    return -1;
-	memcpy(buf+i*512,s->uncompressed_block+sector_offset_in_block*512,512);
+    for (i = 0; i < nb_sectors; i++) {
+        uint32_t sector_offset_in_block =
+            ((sector_num + i) % s->sectors_per_block),
+            block_num = (sector_num + i) / s->sectors_per_block;
+        if (cloop_read_block(bs, block_num) != 0) {
+            return -1;
+        }
+        memcpy(buf + i * 512,
+            s->uncompressed_block + sector_offset_in_block * 512, 512);
     }
     return 0;
 }
@@ -160,20 +170,21 @@ static coroutine_fn int cloop_co_read(BlockDriverState *bs, int64_t sector_num,
 static void cloop_close(BlockDriverState *bs)
 {
     BDRVCloopState *s = bs->opaque;
-    if(s->n_blocks>0)
-	free(s->offsets);
-    free(s->compressed_block);
-    free(s->uncompressed_block);
+    if (s->n_blocks > 0) {
+        g_free(s->offsets);
+    }
+    g_free(s->compressed_block);
+    g_free(s->uncompressed_block);
     inflateEnd(&s->zstream);
 }
 
 static BlockDriver bdrv_cloop = {
-    .format_name	= "cloop",
-    .instance_size	= sizeof(BDRVCloopState),
-    .bdrv_probe		= cloop_probe,
-    .bdrv_open		= cloop_open,
-    .bdrv_read          = cloop_co_read,
-    .bdrv_close		= cloop_close,
+    .format_name    = "cloop",
+    .instance_size  = sizeof(BDRVCloopState),
+    .bdrv_probe     = cloop_probe,
+    .bdrv_open      = cloop_open,
+    .bdrv_read      = cloop_co_read,
+    .bdrv_close     = cloop_close,
 };
 
 static void bdrv_cloop_init(void)
-- 
1.7.5.4



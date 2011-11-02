Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RLWL1-0005VP-C2
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2011 04:38:23 -0400
Received: from eggs.gnu.org ([140.186.70.92]:55262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RLWKx-0005J7-7d
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2011 04:38:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RLWKv-0003sH-Kv
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2011 04:38:18 -0400
Received: from e28smtp01.in.ibm.com ([122.248.162.1]:49038)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>)
	id 1RLWKr-0003mg-U7; Wed, 02 Nov 2011 04:38:14 -0400
Received: from d28relay05.in.ibm.com (d28relay05.in.ibm.com [9.184.220.62])
	by e28smtp01.in.ibm.com (8.14.4/8.13.1) with ESMTP id pA28bcJw024339;
	Wed, 2 Nov 2011 14:07:38 +0530
Received: from d28av01.in.ibm.com (d28av01.in.ibm.com [9.184.220.63])
	by d28relay05.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pA28bbFO2883694; Wed, 2 Nov 2011 14:07:37 +0530
Received: from d28av01.in.ibm.com (loopback [127.0.0.1])
	by d28av01.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pA28baFB013645; Wed, 2 Nov 2011 14:07:36 +0530
Received: from wdongxu-T410.cn.ibm.com ([9.115.118.28])
	by d28av01.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pA28bYDZ008899; Wed, 2 Nov 2011 14:07:35 +0530
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Nov 2011 16:36:20 +0800
Message-Id: <1320222981-3839-1-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by e28smtp01.in.ibm.com id
	pA28bcJw024339
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 122.248.162.1
Cc: qemu-trivial@nongnu.org, afaerber@suse.de, raywang@linux.vnet.ibm.com
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH_1/2=5D_block=3Afix_cloop=2Ec_co?=
	=?utf-8?q?ding_style?=
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
X-List-Received-Date: Wed, 02 Nov 2011 08:38:21 -0000

From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>

Fix coding style in block/cloop.c.

v3: Split to 2 patches: one for fixing coding style, one for replacing fr=
ee with
    g_free. And correct other 2 places with coding style problem.
v2: Fix spelling: gfree->g_free.
v1: Use gfree, to pair with g_malloc. Also fix coding style.

Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Reviewed_by: Ray Wang <raywang@linux.vnet.ibm.com>
Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
---
 block/cloop.c |  115 +++++++++++++++++++++++++++++++--------------------=
------
 1 files changed, 63 insertions(+), 52 deletions(-)

diff --git a/block/cloop.c b/block/cloop.c
index 775f8a9..799b6c2 100644
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
=20
 static int cloop_probe(const uint8_t *buf, int buf_size, const char *fil=
ename)
 {
-    const char* magic_version_2_0=3D"#!/bin/sh\n"
-	"#V2.0 Format\n"
-	"modprobe cloop file=3D$0 && mount -r -t iso9660 /dev/cloop $1\n";
-    int length=3Dstrlen(magic_version_2_0);
-    if(length>buf_size)
-	length=3Dbuf_size;
-    if(!memcmp(magic_version_2_0,buf,length))
-	return 2;
+    const char *magic_version_2_0 =3D "#!/bin/sh\n"
+        "#V2.0 Format\n"
+        "modprobe cloop file=3D$0 && mount -r -t iso9660 /dev/cloop $1\n=
";
+    int length =3D strlen(magic_version_2_0);
+    if (length > buf_size) {
+        length =3D buf_size;
+    }
+    if (!memcmp(magic_version_2_0, buf, length)) {
+        return 2;
+    }
     return 0;
 }
=20
 static int cloop_open(BlockDriverState *bs, int flags)
 {
     BDRVCloopState *s =3D bs->opaque;
-    uint32_t offsets_size,max_compressed_block_size=3D1,i;
+    uint32_t offsets_size, max_compressed_block_size =3D 1, i;
=20
     bs->read_only =3D 1;
=20
@@ -74,26 +76,28 @@ static int cloop_open(BlockDriverState *bs, int flags=
)
     s->offsets =3D g_malloc(offsets_size);
     if (bdrv_pread(bs->file, 128 + 4 + 4, s->offsets, offsets_size) <
             offsets_size) {
-	goto cloop_close;
+        goto cloop_close;
     }
     for(i=3D0;i<s->n_blocks;i++) {
-	s->offsets[i]=3Dbe64_to_cpu(s->offsets[i]);
-	if(i>0) {
-	    uint32_t size=3Ds->offsets[i]-s->offsets[i-1];
-	    if(size>max_compressed_block_size)
-		max_compressed_block_size=3Dsize;
-	}
+        s->offsets[i] =3D be64_to_cpu(s->offsets[i]);
+        if (i > 0) {
+            uint32_t size =3D s->offsets[i] - s->offsets[i - 1];
+            if (size > max_compressed_block_size) {
+                max_compressed_block_size =3D size;
+            }
+        }
     }
=20
     /* initialize zlib engine */
-    s->compressed_block =3D g_malloc(max_compressed_block_size+1);
+    s->compressed_block =3D g_malloc(max_compressed_block_size + 1);
     s->uncompressed_block =3D g_malloc(s->block_size);
-    if(inflateInit(&s->zstream) !=3D Z_OK)
-	goto cloop_close;
-    s->current_block=3Ds->n_blocks;
+    if (inflateInit(&s->zstream) !=3D Z_OK) {
+        goto cloop_close;
+    }
+    s->current_block =3D s->n_blocks;
=20
     s->sectors_per_block =3D s->block_size/512;
-    bs->total_sectors =3D s->n_blocks*s->sectors_per_block;
+    bs->total_sectors =3D s->n_blocks * s->sectors_per_block;
     qemu_co_mutex_init(&s->lock);
     return 0;
=20
@@ -105,27 +109,30 @@ static inline int cloop_read_block(BlockDriverState=
 *bs, int block_num)
 {
     BDRVCloopState *s =3D bs->opaque;
=20
-    if(s->current_block !=3D block_num) {
-	int ret;
-        uint32_t bytes =3D s->offsets[block_num+1]-s->offsets[block_num]=
;
+    if (s->current_block !=3D block_num) {
+        int ret;
+        uint32_t bytes =3D s->offsets[block_num + 1] - s->offsets[block_=
num];
=20
         ret =3D bdrv_pread(bs->file, s->offsets[block_num], s->compresse=
d_block,
                          bytes);
-        if (ret !=3D bytes)
+        if (ret !=3D bytes) {
             return -1;
+        }
+
+        s->zstream.next_in =3D s->compressed_block;
+        s->zstream.avail_in =3D bytes;
+        s->zstream.next_out =3D s->uncompressed_block;
+        s->zstream.avail_out =3D s->block_size;
+        ret =3D inflateReset(&s->zstream);
+        if (ret !=3D Z_OK) {
+            return -1;
+        }
+        ret =3D inflate(&s->zstream, Z_FINISH);
+        if (ret !=3D Z_STREAM_END || s->zstream.total_out !=3D s->block_=
size) {
+            return -1;
+        }
=20
-	s->zstream.next_in =3D s->compressed_block;
-	s->zstream.avail_in =3D bytes;
-	s->zstream.next_out =3D s->uncompressed_block;
-	s->zstream.avail_out =3D s->block_size;
-	ret =3D inflateReset(&s->zstream);
-	if(ret !=3D Z_OK)
-	    return -1;
-	ret =3D inflate(&s->zstream, Z_FINISH);
-	if(ret !=3D Z_STREAM_END || s->zstream.total_out !=3D s->block_size)
-	    return -1;
-
-	s->current_block =3D block_num;
+        s->current_block =3D block_num;
     }
     return 0;
 }
@@ -136,12 +143,15 @@ static int cloop_read(BlockDriverState *bs, int64_t=
 sector_num,
     BDRVCloopState *s =3D bs->opaque;
     int i;
=20
-    for(i=3D0;i<nb_sectors;i++) {
-	uint32_t sector_offset_in_block=3D((sector_num+i)%s->sectors_per_block)=
,
-	    block_num=3D(sector_num+i)/s->sectors_per_block;
-	if(cloop_read_block(bs, block_num) !=3D 0)
-	    return -1;
-	memcpy(buf+i*512,s->uncompressed_block+sector_offset_in_block*512,512);
+    for (i =3D 0; i < nb_sectors; i++) {
+        uint32_t sector_offset_in_block =3D
+            ((sector_num + i) % s->sectors_per_block),
+            block_num =3D (sector_num + i) / s->sectors_per_block;
+        if (cloop_read_block(bs, block_num) !=3D 0) {
+            return -1;
+        }
+        memcpy(buf + i * 512,
+            s->uncompressed_block + sector_offset_in_block * 512, 512);
     }
     return 0;
 }
@@ -160,20 +170,21 @@ static coroutine_fn int cloop_co_read(BlockDriverSt=
ate *bs, int64_t sector_num,
 static void cloop_close(BlockDriverState *bs)
 {
     BDRVCloopState *s =3D bs->opaque;
-    if(s->n_blocks>0)
-	free(s->offsets);
+    if (s->n_blocks > 0) {
+        free(s->offsets);
+    }
     free(s->compressed_block);
     free(s->uncompressed_block);
     inflateEnd(&s->zstream);
 }
=20
 static BlockDriver bdrv_cloop =3D {
-    .format_name	=3D "cloop",
-    .instance_size	=3D sizeof(BDRVCloopState),
-    .bdrv_probe		=3D cloop_probe,
-    .bdrv_open		=3D cloop_open,
-    .bdrv_read          =3D cloop_co_read,
-    .bdrv_close		=3D cloop_close,
+    .format_name    =3D "cloop",
+    .instance_size  =3D sizeof(BDRVCloopState),
+    .bdrv_probe     =3D cloop_probe,
+    .bdrv_open      =3D cloop_open,
+    .bdrv_read      =3D cloop_co_read,
+    .bdrv_close     =3D cloop_close,
 };
=20
 static void bdrv_cloop_init(void)
--=20
1.7.5.4



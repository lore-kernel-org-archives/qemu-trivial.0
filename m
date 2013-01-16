Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvUhk-0008PX-1i
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 10:15:04 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50713)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TvUhh-0008I9-Dd
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 10:15:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TvU6r-0002C8-2W
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 09:37:05 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:41683)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1TvU6b-00023N-7Q; Wed, 16 Jan 2013 09:36:41 -0500
Received: from blackfin.pond.sub.org (p5B32B5E9.dip.t-dialin.net
	[91.50.181.233])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id E079F9FE59;
	Wed, 16 Jan 2013 15:36:38 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5C647200A8; Wed, 16 Jan 2013 15:36:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 16 Jan 2013 15:36:28 +0100
Message-Id: <1358346998-26328-2-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1358346998-26328-1-git-send-email-armbru@redhat.com>
References: <1358346998-26328-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 01/11] g_malloc(0) and g_malloc0(0) return
	NULL; simplify
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
X-List-Received-Date: Wed, 16 Jan 2013 15:15:02 -0000

Once upon a time, it was decided that qemu_malloc(0) should abort.
Switching to glib retired that bright idea.  Some code that was added
to cope with it (e.g. in commits 702ef63, b76b6e9) is still around.
Bury it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 block/qcow2-refcount.c | 6 +-----
 block/vdi.c            | 4 +---
 hw/9pfs/virtio-9p.c    | 6 +-----
 hw/vhost.c             | 7 ++-----
 4 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 6a95aa6..bc1784c 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -737,11 +737,7 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
      * l1_table_offset when it is the current s->l1_table_offset! Be careful
      * when changing this! */
     if (l1_table_offset != s->l1_table_offset) {
-        if (l1_size2 != 0) {
-            l1_table = g_malloc0(align_offset(l1_size2, 512));
-        } else {
-            l1_table = NULL;
-        }
+        l1_table = g_malloc0(align_offset(l1_size2, 512));
         l1_allocated = 1;
         if (bdrv_pread(bs->file, l1_table_offset,
                        l1_table, l1_size2) != l1_size2)
diff --git a/block/vdi.c b/block/vdi.c
index 021abaa..8dfefdb 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -429,9 +429,7 @@ static int vdi_open(BlockDriverState *bs, int flags)
 
     bmap_size = header.blocks_in_image * sizeof(uint32_t);
     bmap_size = (bmap_size + SECTOR_SIZE - 1) / SECTOR_SIZE;
-    if (bmap_size > 0) {
-        s->bmap = g_malloc(bmap_size * SECTOR_SIZE);
-    }
+    s->bmap = g_malloc(bmap_size * SECTOR_SIZE);
     if (bdrv_read(bs->file, s->bmap_sector, (uint8_t *)s->bmap, bmap_size) < 0) {
         goto fail_free_bmap;
     }
diff --git a/hw/9pfs/virtio-9p.c b/hw/9pfs/virtio-9p.c
index 0aaf0d2..b795839 100644
--- a/hw/9pfs/virtio-9p.c
+++ b/hw/9pfs/virtio-9p.c
@@ -3101,11 +3101,7 @@ static void v9fs_xattrcreate(void *opaque)
     xattr_fidp->fs.xattr.flags = flags;
     v9fs_string_init(&xattr_fidp->fs.xattr.name);
     v9fs_string_copy(&xattr_fidp->fs.xattr.name, &name);
-    if (size) {
-        xattr_fidp->fs.xattr.value = g_malloc(size);
-    } else {
-        xattr_fidp->fs.xattr.value = NULL;
-    }
+    xattr_fidp->fs.xattr.value = g_malloc(size);
     err = offset;
     put_fid(pdu, file_fidp);
 out_nofid:
diff --git a/hw/vhost.c b/hw/vhost.c
index cee8aad..0dd2a9a 100644
--- a/hw/vhost.c
+++ b/hw/vhost.c
@@ -269,11 +269,8 @@ static inline void vhost_dev_log_resize(struct vhost_dev* dev, uint64_t size)
     vhost_log_chunk_t *log;
     uint64_t log_base;
     int r, i;
-    if (size) {
-        log = g_malloc0(size * sizeof *log);
-    } else {
-        log = NULL;
-    }
+
+    log = g_malloc0(size * sizeof *log);
     log_base = (uint64_t)(unsigned long)log;
     r = ioctl(dev->control, VHOST_SET_LOG_BASE, &log_base);
     assert(r >= 0);
-- 
1.7.11.7



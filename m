Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvULT-0002ri-MW
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 09:52:03 -0500
Received: from eggs.gnu.org ([208.118.235.92]:45581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TvULQ-0002pn-SR
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 09:52:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TvU6q-0002Bw-LP
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 09:37:03 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:41685)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1TvU6b-00023M-7O; Wed, 16 Jan 2013 09:36:41 -0500
Received: from blackfin.pond.sub.org (p5B32B5E9.dip.t-dialin.net
	[91.50.181.233])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 2FEEF9FE6C;
	Wed, 16 Jan 2013 15:36:39 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7F345200AB; Wed, 16 Jan 2013 15:36:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 16 Jan 2013 15:36:30 +0100
Message-Id: <1358346998-26328-4-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1358346998-26328-1-git-send-email-armbru@redhat.com>
References: <1358346998-26328-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 03/11] hw/9pfs: Fix unchecked strdup() by
	converting to g_strdup()
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
X-List-Received-Date: Wed, 16 Jan 2013 14:52:02 -0000


Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/9pfs/virtio-9p-device.c | 2 +-
 hw/9pfs/virtio-9p-local.c  | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
index 6eab7f7..74155fb 100644
--- a/hw/9pfs/virtio-9p-device.c
+++ b/hw/9pfs/virtio-9p-device.c
@@ -94,7 +94,7 @@ VirtIODevice *virtio_9p_init(DeviceState *dev, V9fsConf *conf)
         exit(1);
     }
 
-    s->tag = strdup(conf->tag);
+    s->tag = g_strdup(conf->tag);
     s->ctx.uid = -1;
 
     s->ops = fse->ops;
diff --git a/hw/9pfs/virtio-9p-local.c b/hw/9pfs/virtio-9p-local.c
index 1136021..f1b1c83 100644
--- a/hw/9pfs/virtio-9p-local.c
+++ b/hw/9pfs/virtio-9p-local.c
@@ -46,7 +46,7 @@ static const char *local_mapped_attr_path(FsContext *ctx,
                                           const char *path, char *buffer)
 {
     char *dir_name;
-    char *tmp_path = strdup(path);
+    char *tmp_path = g_strdup(path);
     char *base_name = basename(tmp_path);
 
     /* NULL terminate the directory */
@@ -55,7 +55,7 @@ static const char *local_mapped_attr_path(FsContext *ctx,
 
     snprintf(buffer, PATH_MAX, "%s/%s/%s/%s",
              ctx->fs_root, dir_name, VIRTFS_META_DIR, base_name);
-    free(tmp_path);
+    g_free(tmp_path);
     return buffer;
 }
 
@@ -130,7 +130,7 @@ static int local_create_mapped_attr_dir(FsContext *ctx, const char *path)
 {
     int err;
     char attr_dir[PATH_MAX];
-    char *tmp_path = strdup(path);
+    char *tmp_path = g_strdup(path);
 
     snprintf(attr_dir, PATH_MAX, "%s/%s/%s",
              ctx->fs_root, dirname(tmp_path), VIRTFS_META_DIR);
@@ -139,7 +139,7 @@ static int local_create_mapped_attr_dir(FsContext *ctx, const char *path)
     if (err < 0 && errno == EEXIST) {
         err = 0;
     }
-    free(tmp_path);
+    g_free(tmp_path);
     return err;
 }
 
-- 
1.7.11.7



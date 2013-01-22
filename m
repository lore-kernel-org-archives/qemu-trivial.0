Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Txbji-0007qq-C1
	for mharc-qemu-trivial@gnu.org; Tue, 22 Jan 2013 06:09:50 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TxamL-00086P-I9
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 05:08:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TxamC-0000EL-2m
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 05:08:25 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:48324)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1Txam6-0000AK-8h; Tue, 22 Jan 2013 05:08:14 -0500
Received: from blackfin.pond.sub.org (p5B329A82.dip.t-dialin.net
	[91.50.154.130])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 239479FE7B;
	Tue, 22 Jan 2013 11:08:07 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 38058200AF; Tue, 22 Jan 2013 11:08:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Jan 2013 11:07:58 +0100
Message-Id: <1358849286-24750-4-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1358849286-24750-1-git-send-email-armbru@redhat.com>
References: <1358849286-24750-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH v3 03/11] hw/9pfs: Fix unchecked strdup() by
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
X-List-Received-Date: Tue, 22 Jan 2013 11:09:47 -0000

Note: the allocation in virtio_9p_init() is still leaked.  To be fixed
in a followup commit.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
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



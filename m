Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRFhM-0002dL-U8
	for mharc-qemu-trivial@gnu.org; Fri, 27 Feb 2015 02:51:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRFhI-0002Qg-6C
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 02:50:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRFh8-0007Vh-OB
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 02:50:56 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:23785)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YRFh7-0007UV-Vn; Fri, 27 Feb 2015 02:50:46 -0500
Received: from 172.24.2.119 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CJZ07458; Fri, 27 Feb 2015 15:50:35 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 27 Feb 2015 15:50:29 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 27 Feb 2015 15:50:16 +0800
Message-ID: <1425023419-12244-7-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
References: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, peter.huangpeng@huawei.com,
	armbru@redhat.com
Subject: [Qemu-trivial] [PATCH 6/9] 9pfs: fix memory leak
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
X-List-Received-Date: Fri, 27 Feb 2015 07:50:57 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/9pfs/virtio-9p-local.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/hw/9pfs/virtio-9p-local.c b/hw/9pfs/virtio-9p-local.c
index a183eee..bcad4e0 100644
--- a/hw/9pfs/virtio-9p-local.c
+++ b/hw/9pfs/virtio-9p-local.c
@@ -500,7 +500,6 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
         buffer = rpath(fs_ctx, path);
         err = mknod(buffer, SM_LOCAL_MODE_BITS|S_IFREG, 0);
         if (err == -1) {
-            g_free(buffer);
             goto out;
         }
         err = local_set_xattr(buffer, credp);
@@ -513,7 +512,6 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
         buffer = rpath(fs_ctx, path);
         err = mknod(buffer, SM_LOCAL_MODE_BITS|S_IFREG, 0);
         if (err == -1) {
-            g_free(buffer);
             goto out;
         }
         err = local_set_mapped_file_attr(fs_ctx, path, credp);
@@ -526,7 +524,6 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
         buffer = rpath(fs_ctx, path);
         err = mknod(buffer, credp->fc_mode, credp->fc_rdev);
         if (err == -1) {
-            g_free(buffer);
             goto out;
         }
         err = local_post_create_passthrough(fs_ctx, path, credp);
@@ -540,8 +537,8 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
 err_end:
     remove(buffer);
     errno = serrno;
-    g_free(buffer);
 out:
+    g_free(buffer);
     v9fs_string_free(&fullname);
     return err;
 }
@@ -676,7 +673,6 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
         buffer = rpath(fs_ctx, path);
         fd = open(buffer, flags, SM_LOCAL_MODE_BITS);
         if (fd == -1) {
-            g_free(buffer);
             err = fd;
             goto out;
         }
@@ -691,7 +687,6 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
         buffer = rpath(fs_ctx, path);
         fd = open(buffer, flags, SM_LOCAL_MODE_BITS);
         if (fd == -1) {
-            g_free(buffer);
             err = fd;
             goto out;
         }
@@ -707,7 +702,6 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
         buffer = rpath(fs_ctx, path);
         fd = open(buffer, flags, credp->fc_mode);
         if (fd == -1) {
-            g_free(buffer);
             err = fd;
             goto out;
         }
@@ -725,8 +719,8 @@ err_end:
     close(fd);
     remove(buffer);
     errno = serrno;
-    g_free(buffer);
 out:
+    g_free(buffer);
     v9fs_string_free(&fullname);
     return err;
 }
-- 
1.7.12.4




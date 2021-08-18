Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGMDe-0006Za-2r
	for mharc-qemu-trivial@gnu.org; Wed, 18 Aug 2021 10:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mGMDb-0006VL-GF; Wed, 18 Aug 2021 10:06:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mGMDZ-0002ZT-Ia; Wed, 18 Aug 2021 10:06:59 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 0D8374055A;
 Wed, 18 Aug 2021 17:06:54 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id E069EE9;
 Wed, 18 Aug 2021 17:06:53 +0300 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH, trivial, for-6.1] spelling: sytem => system
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Message-ID: <fefb5f5c-82bc-05e2-b4c1-665e9d6896ff@msgid.tls.msk.ru>
Date: Wed, 18 Aug 2021 17:06:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Aug 2021 14:06:59 -0000

Signed-off-By: Michael Tokarev <mjt@tls.msk.ru>
---
It is safe for 6.1

  block/file-posix.c              | 2 +-
  tools/virtiofsd/fuse_lowlevel.h | 4 ++--
  2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index cb9bffe047..1854bfa397 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1705,7 +1705,7 @@ static int handle_aiocb_write_zeroes(void *opaque)
               */
              warn_report_once("Your file system is misbehaving: "
                               "fallocate(FALLOC_FL_PUNCH_HOLE) returned EINVAL. "
-                             "Please report this bug to your file sytem "
+                             "Please report this bug to your file system "
                               "vendor.");
          } else if (ret != -ENOTSUP) {
              return ret;
diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
index 4b4e8c9724..c55c0ca2fc 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -1603,7 +1603,7 @@ int fuse_lowlevel_notify_inval_inode(struct fuse_session *se, fuse_ino_t ino,
   * parent/name
   *
   * To avoid a deadlock this function must not be called in the
- * execution path of a related filesytem operation or within any code
+ * execution path of a related filesystem operation or within any code
   * that could hold a lock that could be needed to execute such an
   * operation. As of kernel 4.18, a "related operation" is a lookup(),
   * symlink(), mknod(), mkdir(), unlink(), rename(), link() or create()
@@ -1636,7 +1636,7 @@ int fuse_lowlevel_notify_inval_entry(struct fuse_session *se, fuse_ino_t parent,
   * that the dentry has been deleted.
   *
   * To avoid a deadlock this function must not be called while
- * executing a related filesytem operation or while holding a lock
+ * executing a related filesystem operation or while holding a lock
   * that could be needed to execute such an operation (see the
   * description of fuse_lowlevel_notify_inval_entry() for more
   * details).
-- 
2.30.2



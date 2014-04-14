Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WZWcI-00010o-8y
	for mharc-qemu-trivial@gnu.org; Sun, 13 Apr 2014 22:27:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1WZWcA-00010T-ND
	for qemu-trivial@nongnu.org; Sun, 13 Apr 2014 22:27:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1WZWc4-0005B6-FV
	for qemu-trivial@nongnu.org; Sun, 13 Apr 2014 22:27:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48759)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>)
	id 1WZWc4-0005Ar-7L; Sun, 13 Apr 2014 22:27:12 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3E2R9lB006401
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Sun, 13 Apr 2014 22:27:09 -0400
Received: from amosk.info.com (vpn1-113-228.nay.redhat.com [10.66.113.228])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s3E2R3rm010288; Sun, 13 Apr 2014 22:27:04 -0400
From: Amos Kong <akong@redhat.com>
To: qemu-trivial@nongnu.org
Date: Mon, 14 Apr 2014 10:27:00 +0800
Message-Id: <1397442420-25626-1-git-send-email-akong@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: yamahata@private.email.ne.jp, lersek@redhat.com, mjt@tls.msk.ru,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] arch_init.c: remove duplicate function
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
X-List-Received-Date: Mon, 14 Apr 2014 02:27:24 -0000

We already have a function buffer_is_zero() in util/cutils.c

Signed-off-by: Amos Kong <akong@redhat.com>
---
 arch_init.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch_init.c b/arch_init.c
index 60c975d..342e5dc 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -152,11 +152,6 @@ int qemu_read_default_config_files(bool userconfig)
     return 0;
 }
 
-static inline bool is_zero_range(uint8_t *p, uint64_t size)
-{
-    return buffer_find_nonzero_offset(p, size) == size;
-}
-
 /* struct contains XBZRLE cache and a static page
    used by the compression */
 static struct {
@@ -587,7 +582,7 @@ static int ram_save_block(QEMUFile *f, bool last_stage)
                         acct_info.dup_pages++;
                     }
                 }
-            } else if (is_zero_range(p, TARGET_PAGE_SIZE)) {
+            } else if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
                 acct_info.dup_pages++;
                 bytes_sent = save_block_hdr(f, block, offset, cont,
                                             RAM_SAVE_FLAG_COMPRESS);
@@ -983,7 +978,7 @@ static inline void *host_from_stream_offset(QEMUFile *f,
  */
 void ram_handle_compressed(void *host, uint8_t ch, uint64_t size)
 {
-    if (ch != 0 || !is_zero_range(host, size)) {
+    if (ch != 0 || !buffer_is_zero(host, size)) {
         memset(host, ch, size);
     }
 }
-- 
1.9.0



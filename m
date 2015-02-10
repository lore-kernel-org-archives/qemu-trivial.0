Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4VX-0006rP-Rr
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 01:41:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4VT-0006ir-5c
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:41:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4VS-0003q5-Ab
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:41:11 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58713)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4VM-0003ma-Kt; Tue, 10 Feb 2015 01:41:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3D9AE4182B;
	Tue, 10 Feb 2015 09:41:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B315995C;
	Tue, 10 Feb 2015 09:34:47 +0300 (MSK)
Received: (nullmailer pid 9406 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:25 +0300
Message-Id: <8b98ade31ed7994d6bcbb0600ad0ea3f3d881088.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 36/46] translate-all: Use g_try_malloc() for
	dynamic translator buffer
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
X-List-Received-Date: Tue, 10 Feb 2015 06:41:12 -0000

From: Markus Armbruster <armbru@redhat.com>

The USE_MMAP code can fail, and the caller handles the failure
already.  Let the !USE_MMAP code fail as well, for consistency.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 translate-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/translate-all.c b/translate-all.c
index 4a1b64f..9f47ce7 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -631,7 +631,7 @@ static inline void *alloc_code_gen_buffer(void)
 #else
 static inline void *alloc_code_gen_buffer(void)
 {
-    void *buf = g_malloc(tcg_ctx.code_gen_buffer_size);
+    void *buf = g_try_malloc(tcg_ctx.code_gen_buffer_size);
 
     if (buf == NULL) {
         return NULL;
-- 
2.1.4



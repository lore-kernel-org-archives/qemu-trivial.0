Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL8sY-0007lB-HX
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 06:21:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL8sU-0007cd-3O
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 06:21:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL8sQ-0007OQ-BR
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 06:21:14 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56165)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL8sL-0007ME-04; Tue, 10 Feb 2015 06:21:05 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C7D0F418E7;
	Tue, 10 Feb 2015 14:21:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 14E55956;
	Tue, 10 Feb 2015 09:34:47 +0300 (MSK)
Received: (nullmailer pid 9404 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:24 +0300
Message-Id: <4b3be73006d5d65d44bd482cc6e3cf2f4ab12c34.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 35/46] vnc: g_realloc() can't fail,
	bury dead error handling
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
X-List-Received-Date: Tue, 10 Feb 2015 11:21:17 -0000

From: Markus Armbruster <armbru@redhat.com>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 ui/vnc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index a742c90..02552ee 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -659,10 +659,6 @@ void buffer_reserve(Buffer *buffer, size_t len)
     if ((buffer->capacity - buffer->offset) < len) {
         buffer->capacity += (len + 1024);
         buffer->buffer = g_realloc(buffer->buffer, buffer->capacity);
-        if (buffer->buffer == NULL) {
-            fprintf(stderr, "vnc: out of memory\n");
-            exit(1);
-        }
     }
 }
 
-- 
2.1.4



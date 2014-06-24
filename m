Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzTI7-0005UY-2n
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 12:09:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTHy-0005Dm-Qv
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:09:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTHt-00050l-2n
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:09:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55346)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WzTHe-0004vq-Ue; Tue, 24 Jun 2014 12:09:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3768144081;
	Tue, 24 Jun 2014 20:09:22 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1C4656B4;
	Tue, 24 Jun 2014 20:09:22 +0400 (MSK)
Received: (nullmailer pid 15623 invoked by uid 1000);
	Tue, 24 Jun 2014 16:09:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 24 Jun 2014 20:09:13 +0400
Message-Id: <1403626160-15546-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [Qemu-trivial] [PULL 07/14] rng-random: NULL check not needed
	before g_free()
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
X-List-Received-Date: Tue, 24 Jun 2014 16:09:48 -0000

From: Eduardo Habkost <ehabkost@redhat.com>

g_free() is NULL-safe.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 backends/rng-random.c |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/backends/rng-random.c b/backends/rng-random.c
index 136499d..601d9dc 100644
--- a/backends/rng-random.c
+++ b/backends/rng-random.c
@@ -106,10 +106,7 @@ static void rng_random_set_filename(Object *obj, const char *filename,
         return;
     }
 
-    if (s->filename) {
-        g_free(s->filename);
-    }
-
+    g_free(s->filename);
     s->filename = g_strdup(filename);
 }
 
-- 
1.7.10.4



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL5bW-00060c-8u
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 02:51:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL5bR-0005pO-0s
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:51:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL5bM-00047v-TR
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:51:24 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46505)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL5b6-00041R-VH; Tue, 10 Feb 2015 02:51:05 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9792D4182E;
	Tue, 10 Feb 2015 10:51:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 63EC894F;
	Tue, 10 Feb 2015 09:34:46 +0300 (MSK)
Received: (nullmailer pid 9390 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:17 +0300
Message-Id: <afb30dde3ad71349fc65726946d58e5d3c61f8af.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 28/46] util/uri: URI member path can be null,
	compare more carfully
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
X-List-Received-Date: Tue, 10 Feb 2015 07:51:28 -0000

From: Markus Armbruster <armbru@redhat.com>

uri_resolve_relative() calls strcmp(bas->path, ref->path).  However,
either argument could be null!  Evidence: the code checks for null
after the comparison.  Spotted by Coverity.

I suspect this was screwed up when we stole the code from libxml2.
There the conditional reads

    xmlStrEqual((xmlChar *)bas->path, (xmlChar *)ref->path)

with

    int
    xmlStrEqual(const xmlChar *str1, const xmlChar *str2) {
	if (str1 == str2) return(1);
	if (str1 == NULL) return(0);
	if (str2 == NULL) return(0);
	do {
	    if (*str1++ != *str2) return(0);
	} while (*str2++);
	return(1);
    }

Fix by replicating libxml2's logic faithfully.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/uri.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/util/uri.c b/util/uri.c
index b9a7b54..1cfd78b 100644
--- a/util/uri.c
+++ b/util/uri.c
@@ -1935,7 +1935,8 @@ uri_resolve_relative (const char *uri, const char * base)
 	val = g_strdup (uri);
 	goto done;
     }
-    if (!strcmp(bas->path, ref->path)) {
+    if (bas->path == ref->path ||
+        (bas->path && ref->path && !strcmp(bas->path, ref->path))) {
 	val = g_strdup("");
 	goto done;
     }
-- 
2.1.4



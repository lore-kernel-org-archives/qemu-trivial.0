Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4fN-0006Jf-GE
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 01:51:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4fE-000623-6B
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:51:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4fD-0007oD-60
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:51:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39961)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4f2-0007ka-Fb; Tue, 10 Feb 2015 01:51:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 59A3A41823;
	Tue, 10 Feb 2015 09:51:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 04914938;
	Tue, 10 Feb 2015 09:34:45 +0300 (MSK)
Received: (nullmailer pid 9386 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:15 +0300
Message-Id: <c89c6e80a66aac16d7b14ff21e0aaeb99ebfe165.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 26/46] util/uri: uri_new() can't fail,
	drop dead error handling
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
X-List-Received-Date: Tue, 10 Feb 2015 06:51:20 -0000

From: Markus Armbruster <armbru@redhat.com>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/uri.c | 36 +++++++++++-------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/util/uri.c b/util/uri.c
index 918d235..aa39694 100644
--- a/util/uri.c
+++ b/util/uri.c
@@ -928,12 +928,10 @@ uri_parse(const char *str) {
     if (str == NULL)
 	return(NULL);
     uri = uri_new();
-    if (uri != NULL) {
-	ret = rfc3986_parse_uri_reference(uri, str);
-        if (ret) {
-	    uri_free(uri);
-	    return(NULL);
-	}
+    ret = rfc3986_parse_uri_reference(uri, str);
+    if (ret) {
+        uri_free(uri);
+        return(NULL);
     }
     return(uri);
 }
@@ -974,15 +972,13 @@ uri_parse_raw(const char *str, int raw) {
     if (str == NULL)
 	return(NULL);
     uri = uri_new();
-    if (uri != NULL) {
-        if (raw) {
-	    uri->cleanup |= 2;
-	}
-	ret = uri_parse_into(uri, str);
-        if (ret) {
-	    uri_free(uri);
-	    return(NULL);
-	}
+    if (raw) {
+        uri->cleanup |= 2;
+    }
+    ret = uri_parse_into(uri, str);
+    if (ret) {
+        uri_free(uri);
+        return(NULL);
     }
     return(uri);
 }
@@ -1675,8 +1671,6 @@ uri_resolve(const char *uri, const char *base) {
     else {
 	if (*uri) {
 	    ref = uri_new();
-	    if (ref == NULL)
-		goto done;
 	    ret = uri_parse_into(ref, uri);
 	}
 	else
@@ -1695,8 +1689,6 @@ uri_resolve(const char *uri, const char *base) {
 	ret = -1;
     else {
 	bas = uri_new();
-	if (bas == NULL)
-	    goto done;
 	ret = uri_parse_into(bas, base);
     }
     if (ret != 0) {
@@ -1727,8 +1719,6 @@ uri_resolve(const char *uri, const char *base) {
      *    document.
      */
     res = uri_new();
-    if (res == NULL)
-	goto done;
     if ((ref->scheme == NULL) && (ref->path == NULL) &&
 	((ref->authority == NULL) && (ref->server == NULL))) {
         res->scheme = g_strdup(bas->scheme);
@@ -1933,8 +1923,6 @@ uri_resolve_relative (const char *uri, const char * base)
      * First parse URI into a standard form
      */
     ref = uri_new ();
-    if (ref == NULL)
-	return NULL;
     /* If URI not already in "relative" form */
     if (uri[0] != '.') {
 	ret = uri_parse_into (ref, uri);
@@ -1951,8 +1939,6 @@ uri_resolve_relative (const char *uri, const char * base)
 	goto done;
     }
     bas = uri_new ();
-    if (bas == NULL)
-	goto done;
     if (base[0] != '.') {
 	ret = uri_parse_into (bas, base);
 	if (ret != 0)
-- 
2.1.4



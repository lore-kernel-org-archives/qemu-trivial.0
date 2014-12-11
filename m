Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8tm-0006wT-C7
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:55:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8te-0006kL-AS
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:55:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8tZ-00022E-4R
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:55:30 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:47001)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8tM-0001y2-Ry; Thu, 11 Dec 2014 13:55:13 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6228441D58;
	Thu, 11 Dec 2014 21:55:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 88D448F4;
	Thu, 11 Dec 2014 21:16:18 +0300 (MSK)
Received: (nullmailer pid 22972 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:15:57 +0300
Message-Id: <44c2286b5df1f50fc9fedabd7b1a5a8022e583fc.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 09/20] util: Drop superfluous conditionals
	around g_free()
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
X-List-Received-Date: Thu, 11 Dec 2014 18:55:35 -0000

From: Markus Armbruster <armbru@redhat.com>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Fam Zheng <famz@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/uri.c | 48 ++++++++++++++++++++++--------------------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/util/uri.c b/util/uri.c
index bbf2832..01dc09e 100644
--- a/util/uri.c
+++ b/util/uri.c
@@ -225,7 +225,7 @@ rfc3986_parse_scheme(URI *uri, const char **str) {
     while (ISA_ALPHA(cur) || ISA_DIGIT(cur) ||
            (*cur == '+') || (*cur == '-') || (*cur == '.')) cur++;
     if (uri != NULL) {
-	if (uri->scheme != NULL) g_free(uri->scheme);
+        g_free(uri->scheme);
 	uri->scheme = g_strndup(*str, cur - *str);
     }
     *str = cur;
@@ -262,8 +262,7 @@ rfc3986_parse_fragment(URI *uri, const char **str)
            ((uri != NULL) && (uri->cleanup & 1) && (IS_UNWISE(cur))))
         NEXT(cur);
     if (uri != NULL) {
-        if (uri->fragment != NULL)
-            g_free(uri->fragment);
+        g_free(uri->fragment);
 	if (uri->cleanup & 2)
 	    uri->fragment = g_strndup(*str, cur - *str);
 	else
@@ -298,8 +297,7 @@ rfc3986_parse_query(URI *uri, const char **str)
            ((uri != NULL) && (uri->cleanup & 1) && (IS_UNWISE(cur))))
         NEXT(cur);
     if (uri != NULL) {
-	if (uri->query != NULL)
-	    g_free (uri->query);
+        g_free(uri->query);
 	uri->query = g_strndup (*str, cur - *str);
     }
     *str = cur;
@@ -360,7 +358,7 @@ rfc3986_parse_user_info(URI *uri, const char **str)
 	NEXT(cur);
     if (*cur == '@') {
 	if (uri != NULL) {
-	    if (uri->user != NULL) g_free(uri->user);
+            g_free(uri->user);
 	    if (uri->cleanup & 2)
 		uri->user = g_strndup(*str, cur - *str);
 	    else
@@ -473,9 +471,9 @@ not_ipv4:
         NEXT(cur);
 found:
     if (uri != NULL) {
-	if (uri->authority != NULL) g_free(uri->authority);
+        g_free(uri->authority);
 	uri->authority = NULL;
-	if (uri->server != NULL) g_free(uri->server);
+        g_free(uri->server);
 	if (cur != host) {
 	    if (uri->cleanup & 2)
 		uri->server = g_strndup(host, cur - host);
@@ -585,7 +583,7 @@ rfc3986_parse_path_ab_empty(URI *uri, const char **str)
 	if (ret != 0) return(ret);
     }
     if (uri != NULL) {
-	if (uri->path != NULL) g_free(uri->path);
+        g_free(uri->path);
         if (*str != cur) {
             if (uri->cleanup & 2)
                 uri->path = g_strndup(*str, cur - *str);
@@ -631,7 +629,7 @@ rfc3986_parse_path_absolute(URI *uri, const char **str)
 	}
     }
     if (uri != NULL) {
-	if (uri->path != NULL) g_free(uri->path);
+        g_free(uri->path);
         if (cur != *str) {
             if (uri->cleanup & 2)
                 uri->path = g_strndup(*str, cur - *str);
@@ -673,7 +671,7 @@ rfc3986_parse_path_rootless(URI *uri, const char **str)
 	if (ret != 0) return(ret);
     }
     if (uri != NULL) {
-	if (uri->path != NULL) g_free(uri->path);
+        g_free(uri->path);
         if (cur != *str) {
             if (uri->cleanup & 2)
                 uri->path = g_strndup(*str, cur - *str);
@@ -715,7 +713,7 @@ rfc3986_parse_path_no_scheme(URI *uri, const char **str)
 	if (ret != 0) return(ret);
     }
     if (uri != NULL) {
-	if (uri->path != NULL) g_free(uri->path);
+        g_free(uri->path);
         if (cur != *str) {
             if (uri->cleanup & 2)
                 uri->path = g_strndup(*str, cur - *str);
@@ -769,7 +767,7 @@ rfc3986_parse_hier_part(URI *uri, const char **str)
     } else {
 	/* path-empty is effectively empty */
 	if (uri != NULL) {
-	    if (uri->path != NULL) g_free(uri->path);
+            g_free(uri->path);
 	    uri->path = NULL;
 	}
     }
@@ -812,7 +810,7 @@ rfc3986_parse_relative_ref(URI *uri, const char *str) {
     } else {
 	/* path-empty is effectively empty */
 	if (uri != NULL) {
-	    if (uri->path != NULL) g_free(uri->path);
+            g_free(uri->path);
 	    uri->path = NULL;
 	}
     }
@@ -1285,21 +1283,21 @@ static void
 uri_clean(URI *uri) {
     if (uri == NULL) return;
 
-    if (uri->scheme != NULL) g_free(uri->scheme);
+    g_free(uri->scheme);
     uri->scheme = NULL;
-    if (uri->server != NULL) g_free(uri->server);
+    g_free(uri->server);
     uri->server = NULL;
-    if (uri->user != NULL) g_free(uri->user);
+    g_free(uri->user);
     uri->user = NULL;
-    if (uri->path != NULL) g_free(uri->path);
+    g_free(uri->path);
     uri->path = NULL;
-    if (uri->fragment != NULL) g_free(uri->fragment);
+    g_free(uri->fragment);
     uri->fragment = NULL;
-    if (uri->opaque != NULL) g_free(uri->opaque);
+    g_free(uri->opaque);
     uri->opaque = NULL;
-    if (uri->authority != NULL) g_free(uri->authority);
+    g_free(uri->authority);
     uri->authority = NULL;
-    if (uri->query != NULL) g_free(uri->query);
+    g_free(uri->query);
     uri->query = NULL;
 }
 
@@ -1711,10 +1709,8 @@ uri_resolve(const char *uri, const char *base) {
 	/*
 	 * the base fragment must be ignored
 	 */
-	if (bas->fragment != NULL) {
-	    g_free(bas->fragment);
-	    bas->fragment = NULL;
-	}
+        g_free(bas->fragment);
+        bas->fragment = NULL;
 	val = uri_to_string(bas);
 	goto done;
     }
-- 
2.1.3



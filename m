Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XwWxU-0002An-4N
	for mharc-qemu-trivial@gnu.org; Thu, 04 Dec 2014 09:00:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XwWxJ-00021p-0K
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 09:00:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XwWxC-0001dD-OL
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 09:00:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40685)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XwWww-0001Ap-N0; Thu, 04 Dec 2014 09:00:06 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB4E06LG017050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 4 Dec 2014 09:00:06 -0500
Received: from blackfin.pond.sub.org (ovpn-116-62.ams2.redhat.com
	[10.36.116.62])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB4E042i014530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 4 Dec 2014 09:00:05 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8B59D303FEC9; Thu,  4 Dec 2014 15:00:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  4 Dec 2014 15:00:01 +0100
Message-Id: <1417701603-26388-2-git-send-email-armbru@redhat.com>
In-Reply-To: <1417701603-26388-1-git-send-email-armbru@redhat.com>
References: <1417701603-26388-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/3] util: Drop superfluous conditionals
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
X-List-Received-Date: Thu, 04 Dec 2014 14:00:35 -0000

Signed-off-by: Markus Armbruster <armbru@redhat.com>
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
1.9.3



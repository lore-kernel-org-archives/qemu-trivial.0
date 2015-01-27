Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YG8mV-0007vc-8F
	for mharc-qemu-trivial@gnu.org; Tue, 27 Jan 2015 11:14:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YG8mM-0007dS-9b
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 11:14:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YG8mG-0002cJ-4P
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 11:14:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39161)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YG8m3-0002ap-PX; Tue, 27 Jan 2015 11:13:55 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0RGDtbO032624
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 27 Jan 2015 11:13:55 -0500
Received: from blackfin.pond.sub.org (ovpn-116-17.ams2.redhat.com
	[10.36.116.17])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0RGDrWZ026283
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 27 Jan 2015 11:13:54 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A3824307D4ED; Tue, 27 Jan 2015 17:13:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Jan 2015 17:13:50 +0100
Message-Id: <1422375232-29283-2-git-send-email-armbru@redhat.com>
In-Reply-To: <1422375232-29283-1-git-send-email-armbru@redhat.com>
References: <1422375232-29283-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/3] util/uri: uri_new() can't fail,
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
X-List-Received-Date: Tue, 27 Jan 2015 16:14:21 -0000

Signed-off-by: Markus Armbruster <armbru@redhat.com>
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
1.9.3



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL6hC-0002bW-Ug
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 04:01:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL6h6-0002Pu-HY
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 04:01:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL6h1-00027O-Jp
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 04:01:20 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50340)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL6gq-0001zx-Mn; Tue, 10 Feb 2015 04:01:05 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9CD6F41893;
	Tue, 10 Feb 2015 12:01:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CD6DF95D;
	Tue, 10 Feb 2015 09:34:47 +0300 (MSK)
Received: (nullmailer pid 9388 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:16 +0300
Message-Id: <afd5ea3671f936f511015a71af9cd0ed23788515.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 27/46] util/uri: realloc2n() can't fail,
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
X-List-Received-Date: Tue, 10 Feb 2015 09:01:25 -0000

From: Markus Armbruster <armbru@redhat.com>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/uri.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/util/uri.c b/util/uri.c
index aa39694..b9a7b54 100644
--- a/util/uri.c
+++ b/util/uri.c
@@ -1049,14 +1049,12 @@ uri_to_string(URI *uri) {
 	while (*p != 0) {
 	    if (len >= max) {
                 temp = realloc2n(ret, &max);
-                if (temp == NULL) goto mem_error;
 		ret = temp;
 	    }
 	    ret[len++] = *p++;
 	}
 	if (len >= max) {
             temp = realloc2n(ret, &max);
-            if (temp == NULL) goto mem_error;
             ret = temp;
 	}
 	ret[len++] = ':';
@@ -1066,7 +1064,6 @@ uri_to_string(URI *uri) {
 	while (*p != 0) {
 	    if (len + 3 >= max) {
                 temp = realloc2n(ret, &max);
-                if (temp == NULL) goto mem_error;
                 ret = temp;
 	    }
 	    if (IS_RESERVED(*(p)) || IS_UNRESERVED(*(p)))
@@ -1083,7 +1080,6 @@ uri_to_string(URI *uri) {
 	if (uri->server != NULL) {
 	    if (len + 3 >= max) {
                 temp = realloc2n(ret, &max);
-                if (temp == NULL) goto mem_error;
                 ret = temp;
 	    }
 	    ret[len++] = '/';
@@ -1093,7 +1089,6 @@ uri_to_string(URI *uri) {
 		while (*p != 0) {
 		    if (len + 3 >= max) {
                         temp = realloc2n(ret, &max);
-                        if (temp == NULL) goto mem_error;
                         ret = temp;
 		    }
 		    if ((IS_UNRESERVED(*(p))) ||
@@ -1112,7 +1107,6 @@ uri_to_string(URI *uri) {
 		}
 		if (len + 3 >= max) {
                     temp = realloc2n(ret, &max);
-                    if (temp == NULL) goto mem_error;
                     ret = temp;
 		}
 		ret[len++] = '@';
@@ -1121,7 +1115,6 @@ uri_to_string(URI *uri) {
 	    while (*p != 0) {
 		if (len >= max) {
                     temp = realloc2n(ret, &max);
-                    if (temp == NULL) goto mem_error;
                     ret = temp;
 		}
 		ret[len++] = *p++;
@@ -1129,7 +1122,6 @@ uri_to_string(URI *uri) {
 	    if (uri->port > 0) {
 		if (len + 10 >= max) {
                     temp = realloc2n(ret, &max);
-                    if (temp == NULL) goto mem_error;
                     ret = temp;
 		}
 		len += snprintf(&ret[len], max - len, ":%d", uri->port);
@@ -1137,7 +1129,6 @@ uri_to_string(URI *uri) {
 	} else if (uri->authority != NULL) {
 	    if (len + 3 >= max) {
                 temp = realloc2n(ret, &max);
-                if (temp == NULL) goto mem_error;
                 ret = temp;
 	    }
 	    ret[len++] = '/';
@@ -1146,7 +1137,6 @@ uri_to_string(URI *uri) {
 	    while (*p != 0) {
 		if (len + 3 >= max) {
                     temp = realloc2n(ret, &max);
-                    if (temp == NULL) goto mem_error;
                     ret = temp;
 		}
 		if ((IS_UNRESERVED(*(p))) ||
@@ -1165,7 +1155,6 @@ uri_to_string(URI *uri) {
 	} else if (uri->scheme != NULL) {
 	    if (len + 3 >= max) {
                 temp = realloc2n(ret, &max);
-                if (temp == NULL) goto mem_error;
                 ret = temp;
 	    }
 	    ret[len++] = '/';
@@ -1185,7 +1174,6 @@ uri_to_string(URI *uri) {
 	        (!strcmp(uri->scheme, "file"))) {
 		if (len + 3 >= max) {
                     temp = realloc2n(ret, &max);
-                    if (temp == NULL) goto mem_error;
                     ret = temp;
 		}
 		ret[len++] = *p++;
@@ -1195,7 +1183,6 @@ uri_to_string(URI *uri) {
 	    while (*p != 0) {
 		if (len + 3 >= max) {
                     temp = realloc2n(ret, &max);
-                    if (temp == NULL) goto mem_error;
                     ret = temp;
 		}
 		if ((IS_UNRESERVED(*(p))) || ((*(p) == '/')) ||
@@ -1215,7 +1202,6 @@ uri_to_string(URI *uri) {
 	if (uri->query != NULL) {
 	    if (len + 1 >= max) {
                 temp = realloc2n(ret, &max);
-                if (temp == NULL) goto mem_error;
                 ret = temp;
 	    }
 	    ret[len++] = '?';
@@ -1223,7 +1209,6 @@ uri_to_string(URI *uri) {
 	    while (*p != 0) {
 		if (len + 1 >= max) {
                     temp = realloc2n(ret, &max);
-                    if (temp == NULL) goto mem_error;
                     ret = temp;
 		}
 		ret[len++] = *p++;
@@ -1233,7 +1218,6 @@ uri_to_string(URI *uri) {
     if (uri->fragment != NULL) {
 	if (len + 3 >= max) {
             temp = realloc2n(ret, &max);
-            if (temp == NULL) goto mem_error;
             ret = temp;
 	}
 	ret[len++] = '#';
@@ -1241,7 +1225,6 @@ uri_to_string(URI *uri) {
 	while (*p != 0) {
 	    if (len + 3 >= max) {
                 temp = realloc2n(ret, &max);
-                if (temp == NULL) goto mem_error;
                 ret = temp;
 	    }
 	    if ((IS_UNRESERVED(*(p))) || (IS_RESERVED(*(p))))
@@ -1257,15 +1240,10 @@ uri_to_string(URI *uri) {
     }
     if (len >= max) {
         temp = realloc2n(ret, &max);
-        if (temp == NULL) goto mem_error;
         ret = temp;
     }
     ret[len] = 0;
     return(ret);
-
-mem_error:
-    g_free(ret);
-    return(NULL);
 }
 
 /**
-- 
2.1.4



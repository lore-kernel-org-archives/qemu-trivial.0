Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YG8mg-0008Do-SO
	for mharc-qemu-trivial@gnu.org; Tue, 27 Jan 2015 11:14:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YG8mV-0007vT-By
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 11:14:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YG8mM-0002cr-B3
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 11:14:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53747)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YG8m3-0002ao-Pf; Tue, 27 Jan 2015 11:13:55 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0RGDtSg032333
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 27 Jan 2015 11:13:55 -0500
Received: from blackfin.pond.sub.org (ovpn-116-17.ams2.redhat.com
	[10.36.116.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0RGDr6h021302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 27 Jan 2015 11:13:54 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B397F30A4C16; Tue, 27 Jan 2015 17:13:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Jan 2015 17:13:51 +0100
Message-Id: <1422375232-29283-3-git-send-email-armbru@redhat.com>
In-Reply-To: <1422375232-29283-1-git-send-email-armbru@redhat.com>
References: <1422375232-29283-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 2/3] util/uri: realloc2n() can't fail,
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
X-List-Received-Date: Tue, 27 Jan 2015 16:14:30 -0000

Signed-off-by: Markus Armbruster <armbru@redhat.com>
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
1.9.3



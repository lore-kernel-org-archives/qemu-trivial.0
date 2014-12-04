Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XwSh3-0002Iv-IJ
	for mharc-qemu-trivial@gnu.org; Thu, 04 Dec 2014 04:27:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XwSgv-00029h-Pv
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 04:27:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XwSgp-0006xy-GI
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 04:27:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42301)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XwSgc-0006x2-U5; Thu, 04 Dec 2014 04:26:59 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB49Qw0a025068
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 4 Dec 2014 04:26:58 -0500
Received: from blackfin.pond.sub.org (ovpn-116-62.ams2.redhat.com
	[10.36.116.62])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB49QuJa005051
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 4 Dec 2014 04:26:57 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 89B32303FEB1; Thu,  4 Dec 2014 10:26:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  4 Dec 2014 10:26:55 +0100
Message-Id: <1417685215-5289-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] Drop superfluous conditionals around
	g_strdup()
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
X-List-Received-Date: Thu, 04 Dec 2014 09:27:24 -0000

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 backends/rng-random.c    |  6 +-----
 hw/tpm/tpm_passthrough.c |  4 +---
 util/uri.c               | 43 +++++++++++++++++--------------------------
 3 files changed, 19 insertions(+), 34 deletions(-)

diff --git a/backends/rng-random.c b/backends/rng-random.c
index 601d9dc..4f85a8e 100644
--- a/backends/rng-random.c
+++ b/backends/rng-random.c
@@ -88,11 +88,7 @@ static char *rng_random_get_filename(Object *obj, Error **errp)
 {
     RndRandom *s = RNG_RANDOM(obj);
 
-    if (s->filename) {
-        return g_strdup(s->filename);
-    }
-
-    return NULL;
+    return g_strdup(s->filename);
 }
 
 static void rng_random_set_filename(Object *obj, const char *filename,
diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
index 56e9e0f..2bf3c6f 100644
--- a/hw/tpm/tpm_passthrough.c
+++ b/hw/tpm/tpm_passthrough.c
@@ -400,9 +400,7 @@ static int tpm_passthrough_handle_device_opts(QemuOpts *opts, TPMBackend *tb)
     const char *value;
 
     value = qemu_opt_get(opts, "cancel-path");
-    if (value) {
-        tb->cancel_path = g_strdup(value);
-    }
+    tb->cancel_path = g_strdup(value);
 
     value = qemu_opt_get(opts, "path");
     if (!value) {
diff --git a/util/uri.c b/util/uri.c
index e348c17..bbf2832 100644
--- a/util/uri.c
+++ b/util/uri.c
@@ -1736,24 +1736,21 @@ uri_resolve(const char *uri, const char *base) {
 	goto done;
     if ((ref->scheme == NULL) && (ref->path == NULL) &&
 	((ref->authority == NULL) && (ref->server == NULL))) {
-	if (bas->scheme != NULL)
-	    res->scheme = g_strdup(bas->scheme);
+        res->scheme = g_strdup(bas->scheme);
 	if (bas->authority != NULL)
 	    res->authority = g_strdup(bas->authority);
 	else if (bas->server != NULL) {
-	    res->server = g_strdup(bas->server);
-	    if (bas->user != NULL)
-		res->user = g_strdup(bas->user);
-	    res->port = bas->port;
+            res->server = g_strdup(bas->server);
+            res->user = g_strdup(bas->user);
+            res->port = bas->port;
 	}
-	if (bas->path != NULL)
-	    res->path = g_strdup(bas->path);
-	if (ref->query != NULL)
+        res->path = g_strdup(bas->path);
+        if (ref->query != NULL) {
 	    res->query = g_strdup (ref->query);
-	else if (bas->query != NULL)
-	    res->query = g_strdup(bas->query);
-	if (ref->fragment != NULL)
-	    res->fragment = g_strdup(ref->fragment);
+        } else {
+            res->query = g_strdup(bas->query);
+        }
+        res->fragment = g_strdup(ref->fragment);
 	goto step_7;
     }
 
@@ -1767,13 +1764,10 @@ uri_resolve(const char *uri, const char *base) {
 	val = uri_to_string(ref);
 	goto done;
     }
-    if (bas->scheme != NULL)
-	res->scheme = g_strdup(bas->scheme);
+    res->scheme = g_strdup(bas->scheme);
 
-    if (ref->query != NULL)
-	res->query = g_strdup(ref->query);
-    if (ref->fragment != NULL)
-	res->fragment = g_strdup(ref->fragment);
+    res->query = g_strdup(ref->query);
+    res->fragment = g_strdup(ref->fragment);
 
     /*
      * 4) If the authority component is defined, then the reference is a
@@ -1787,20 +1781,17 @@ uri_resolve(const char *uri, const char *base) {
 	    res->authority = g_strdup(ref->authority);
 	else {
 	    res->server = g_strdup(ref->server);
-	    if (ref->user != NULL)
-		res->user = g_strdup(ref->user);
+            res->user = g_strdup(ref->user);
             res->port = ref->port;
 	}
-	if (ref->path != NULL)
-	    res->path = g_strdup(ref->path);
+        res->path = g_strdup(ref->path);
 	goto step_7;
     }
     if (bas->authority != NULL)
 	res->authority = g_strdup(bas->authority);
     else if (bas->server != NULL) {
-	res->server = g_strdup(bas->server);
-	if (bas->user != NULL)
-	    res->user = g_strdup(bas->user);
+        res->server = g_strdup(bas->server);
+        res->user = g_strdup(bas->user);
 	res->port = bas->port;
     }
 
-- 
1.9.3



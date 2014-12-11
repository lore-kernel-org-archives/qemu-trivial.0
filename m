Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8tk-0006u6-1n
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:55:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8td-0006jM-4d
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:55:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8tX-00021H-Ur
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:55:29 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46490)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8tM-0001y1-RP; Thu, 11 Dec 2014 13:55:13 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6223C41D57;
	Thu, 11 Dec 2014 21:55:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2B74F8C2;
	Thu, 11 Dec 2014 21:16:17 +0300 (MSK)
Received: (nullmailer pid 22970 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:15:56 +0300
Message-Id: <24588100ab39afead7b9a0e9c61182a02320a1b9.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 08/20] Drop superfluous conditionals around
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
X-List-Received-Date: Thu, 11 Dec 2014 18:55:34 -0000

From: Markus Armbruster <armbru@redhat.com>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.3



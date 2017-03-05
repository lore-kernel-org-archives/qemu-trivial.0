Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ckMLZ-0003T6-0k
	for mharc-qemu-trivial@gnu.org; Sat, 04 Mar 2017 21:56:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sauravsachidanand@gmail.com>) id 1ckMLW-0003RR-2n
	for qemu-trivial@nongnu.org; Sat, 04 Mar 2017 21:56:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sauravsachidanand@gmail.com>) id 1ckMLU-0005sX-PZ
	for qemu-trivial@nongnu.org; Sat, 04 Mar 2017 21:56:30 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:36128)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sauravsachidanand@gmail.com>)
	id 1ckMLQ-0005oO-3H; Sat, 04 Mar 2017 21:56:24 -0500
Received: by mail-pf0-x244.google.com with SMTP id j5so13842790pfb.3;
	Sat, 04 Mar 2017 18:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CxMpuFTs0Qqi2CZTT1bOYFGTHiPzlcihnnjFsB1grcA=;
	b=MlerptTPvdixSHqiWiaYey3R1syylmDjgR5OaKQMQT8fXz1C8valo+anOl+RuZx7Xh
	e3h+Vav5OTr0vcnOwTqa9aignjkr/WKsdHAML74N2unixmfY8y2qkGU23Ta7FU5bG/K3
	eag89sl41zhzrIUr/URSnOmd1UJLJLqUCechKxCOJNarfaDzruPR3Lm3+0fnXenoW1Q+
	UxEqX5tCcMTqGdgmc7bV6WZAJZZjo4V1Dy5xbJJekCe9tHtl2lFM7h3Qg+RMlyy5GtBy
	+SVlnaaAz1BfTh/QKVUvIsh+AkChGNZ1d/eXbuX3sSBSg+nMp1zopcztTKjaozcYfZUm
	jygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CxMpuFTs0Qqi2CZTT1bOYFGTHiPzlcihnnjFsB1grcA=;
	b=btEF4OTgblmlIK4Rd38+HcmMnPTz6AZ0rUmh4/3XkJUuIPWbPrlxJ/HXr7/s7MkNAm
	7ChHXLNoH/5rXGAn1M7ZG/yCEo2lBOfy/8CrIcZJ/I9yxaHfFrs+Kfhzg18qLWpRbKDS
	hBFOc9eYZQEtJmniMod72h6SU7WAjx14UEqFfuvSRcPQrJoWG/bDpP3lzx0erKazJikA
	r/AXNyugjUhn5bUXWNb6wG61MKPIiR9SuS+U3Kjqf7Wol1MrfEPNO3qzOqU5sc/ELl+D
	UsQexOxVloqxlh/M1ZWYcSIl1LYB8TksRCC0I2wS0lenuN2DATyvDu5N1RSGoJ5jqs42
	fWtA==
X-Gm-Message-State: AMke39k1Dv3PufGz23/4FOCPtydnfdl9z0iYbg52OoYaQJkFLNCWS4CjQndMdTg5QOUuZg==
X-Received: by 10.99.188.10 with SMTP id q10mr12311779pge.106.1488682582784;
	Sat, 04 Mar 2017 18:56:22 -0800 (PST)
Received: from localhost.localdomain ([49.207.50.75])
	by smtp.gmail.com with ESMTPSA id
	i15sm31408487pfj.0.2017.03.04.18.56.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Mar 2017 18:56:21 -0800 (PST)
From: Saurav Sachidanand <sauravsachidanand@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, laurent@vivier.eu,
	Saurav Sachidanand <sauravsachidanand@gmail.com>
Date: Sun,  5 Mar 2017 02:56:05 +0000
Message-Id: <20170305025605.3824-1-sauravsachidanand@gmail.com>
X-Mailer: git-send-email 2.12.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-trivial]  [PATCH v2] util: Use g_malloc/g_free in envlist.c
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Mar 2017 02:56:31 -0000

Change malloc/free to g_malloc/g_free in util/envlist.c, except for
entry->env_var which is allocated using strdup(3).

Remove NULL checks for pointers returned from g_malloc as it exits
in case of failure. Update calls to envlist_create to reflect this.

Free array returned by envlist_to_environ using g_free.

Update comments to reflect change in semantics.

Refactor nearby code to make scripts/checkpatch.pl happy.

Signed-off-by: Saurav Sachidanand <sauravsachidanand@gmail.com>
---
 bsd-user/main.c   | 12 +++---------
 linux-user/main.c |  7 ++-----
 util/envlist.c    | 34 +++++++++++++++-------------------
 3 files changed, 20 insertions(+), 33 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 714a692e6f..4d715840ff 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -744,10 +744,7 @@ int main(int argc, char **argv)
     qemu_init_cpu_list();
     module_call_init(MODULE_INIT_QOM);

-    if ((envlist = envlist_create()) == NULL) {
-        (void) fprintf(stderr, "Unable to allocate envlist\n");
-        exit(1);
-    }
+    envlist = envlist_create();

     /* add current environment into the list */
     for (wrk = environ; *wrk != NULL; wrk++) {
@@ -785,10 +782,7 @@ int main(int argc, char **argv)
                 usage();
         } else if (!strcmp(r, "ignore-environment")) {
             envlist_free(envlist);
-            if ((envlist = envlist_create()) == NULL) {
-                (void) fprintf(stderr, "Unable to allocate envlist\n");
-                exit(1);
-            }
+            envlist = envlist_create();
         } else if (!strcmp(r, "U")) {
             r = argv[optind++];
             if (envlist_unsetenv(envlist, r) != 0)
@@ -959,7 +953,7 @@ int main(int argc, char **argv)
         free(*wrk);
     }

-    free(target_environ);
+    g_free(target_environ);

     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
         qemu_log("guest_base  0x%lx\n", guest_base);
diff --git a/linux-user/main.c b/linux-user/main.c
index 10a3bb3a12..3542c899f6 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -4229,10 +4229,7 @@ int main(int argc, char **argv, char **envp)
     qemu_init_cpu_list();
     module_call_init(MODULE_INIT_QOM);

-    if ((envlist = envlist_create()) == NULL) {
-        (void) fprintf(stderr, "Unable to allocate envlist\n");
-        exit(EXIT_FAILURE);
-    }
+    envlist = envlist_create();

     /* add current environment into the list */
     for (wrk = environ; *wrk != NULL; wrk++) {
@@ -4432,7 +4429,7 @@ int main(int argc, char **argv, char **envp)
         free(*wrk);
     }

-    free(target_environ);
+    g_free(target_environ);

     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
         qemu_log("guest_base  0x%lx\n", guest_base);
diff --git a/util/envlist.c b/util/envlist.c
index e86857e70a..a42eefa5fe 100644
--- a/util/envlist.c
+++ b/util/envlist.c
@@ -17,16 +17,14 @@ static int envlist_parse(envlist_t *envlist,
     const char *env, int (*)(envlist_t *, const char *));

 /*
- * Allocates new envlist and returns pointer to that or
- * NULL in case of error.
+ * Allocates new envlist and returns pointer to it.
  */
 envlist_t *
 envlist_create(void)
 {
 	envlist_t *envlist;

-	if ((envlist = malloc(sizeof (*envlist))) == NULL)
-		return (NULL);
+  envlist = g_malloc(sizeof(*envlist));

 	QLIST_INIT(&envlist->el_entries);
 	envlist->el_count = 0;
@@ -49,9 +47,9 @@ envlist_free(envlist_t *envlist)
 		QLIST_REMOVE(entry, ev_link);

 		free((char *)entry->ev_var);
-		free(entry);
+    g_free(entry);
 	}
-	free(envlist);
+  g_free(envlist);
 }

 /*
@@ -156,15 +154,15 @@ envlist_setenv(envlist_t *envlist, const char *env)
 	if (entry != NULL) {
 		QLIST_REMOVE(entry, ev_link);
 		free((char *)entry->ev_var);
-		free(entry);
+    g_free(entry);
 	} else {
 		envlist->el_count++;
 	}

-	if ((entry = malloc(sizeof (*entry))) == NULL)
-		return (errno);
-	if ((entry->ev_var = strdup(env)) == NULL) {
-		free(entry);
+  entry = g_malloc(sizeof(*entry));
+  entry->ev_var = strdup(env);
+  if (entry->ev_var == NULL) {
+    g_free(entry);
 		return (errno);
 	}
 	QLIST_INSERT_HEAD(&envlist->el_entries, entry, ev_link);
@@ -202,7 +200,7 @@ envlist_unsetenv(envlist_t *envlist, const char *env)
 	if (entry != NULL) {
 		QLIST_REMOVE(entry, ev_link);
 		free((char *)entry->ev_var);
-		free(entry);
+    g_free(entry);

 		envlist->el_count--;
 	}
@@ -212,12 +210,12 @@ envlist_unsetenv(envlist_t *envlist, const char *env)
 /*
  * Returns given envlist as array of strings (in same form that
  * global variable environ is).  Caller must free returned memory
- * by calling free(3) for each element and for the array.  Returned
- * array and given envlist are not related (no common references).
+ * by calling free(3) for each element, and g_free for the array.
+ * Returned array and given envlist are not related (no common
+ * references).
  *
  * If caller provides count pointer, number of items in array is
- * stored there.  In case of error, NULL is returned and no memory
- * is allocated.
+ * stored there.
  */
 char **
 envlist_to_environ(const envlist_t *envlist, size_t *count)
@@ -225,9 +223,7 @@ envlist_to_environ(const envlist_t *envlist, size_t *count)
 	struct envlist_entry *entry;
 	char **env, **penv;

-	penv = env = malloc((envlist->el_count + 1) * sizeof (char *));
-	if (env == NULL)
-		return (NULL);
+  penv = env = g_malloc((envlist->el_count + 1) * sizeof(char *));

 	for (entry = envlist->el_entries.lh_first; entry != NULL;
 	    entry = entry->ev_link.le_next) {
--
2.12.0


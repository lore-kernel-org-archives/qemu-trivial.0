Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cpdgQ-0002cx-Av
	for mharc-qemu-trivial@gnu.org; Sun, 19 Mar 2017 12:27:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58838)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sauravsachidanand@gmail.com>) id 1cpdgN-0002b9-Dg
	for qemu-trivial@nongnu.org; Sun, 19 Mar 2017 12:27:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sauravsachidanand@gmail.com>) id 1cpdgM-0004jB-1E
	for qemu-trivial@nongnu.org; Sun, 19 Mar 2017 12:27:51 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:33464)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sauravsachidanand@gmail.com>)
	id 1cpdgG-0004fx-Nc; Sun, 19 Mar 2017 12:27:44 -0400
Received: by mail-pf0-x241.google.com with SMTP id p189so8621087pfp.0;
	Sun, 19 Mar 2017 09:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kbLe5H7tY2QO5nI4PVKg7ZRrObTA9rYGOMWSas/QkoE=;
	b=MPGMycKOTqTxCOVywXlgp+UE5M1MRXx70uriD7F8ddTZSfhhPUeSsRHYPlUgbcZgEB
	9kSCSY4911NcvBLMj6fOzDUWovBR2IEY2bbkSLf4wU9VE39Bo0GcsBbdJFQno2VFagsC
	sG7+vbTByWlEZnmA+fQ9glAa3GfZpijP0tPJuYoOC14U3wClG7ec4jzig/mQ57uZFOKr
	5qAjvb5Qejj8coxukHqO6y1G++NAz/kogtylxLd9rMATUqfY09uk0keVivVH6LWRf1jv
	64oCrNMY39t7rRPWCyPXcYLMytU3A7ZzCCHbcfdxQ8hUCCrI3q26E68yk8+jPH5pmK0s
	g/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kbLe5H7tY2QO5nI4PVKg7ZRrObTA9rYGOMWSas/QkoE=;
	b=fVfSPhi6ZHwMMMwXaaXxBZZnFOg241x1HPJ5qRzm413HD2V5eYNn4khbm53dEcrNVm
	oIz49FtSU0EG95Wwn8KreZQvFkui9z+kL8Ate7IYSrsMYi8eqdA6cv0p/X6zUpBZfFlF
	9OPptePt9roI6EyNHnTPuoNJd0F6BAeWC3sr5CTZ+8NdRDopP8C0HjqUsYKQSvnsfgOL
	kNiyMAVHpcX8Q46jpVuaQ8nI9IJBKVXa8UBK1dzE7Tibsi0nPXtNFSp+x89Mf/SGqOFM
	kkfrgSCi+0KUmU2eDhHvK3uGoecwlfQZPjBVPVNZJalYfrEYq8pkXgDizWKfI8nrhx5B
	zZSQ==
X-Gm-Message-State: AFeK/H1RatNjmAsze6qMxnGiI1pJ4x1a8QB4n1nuQo715RPoiHniSaAu8iSEcL6spklfPQ==
X-Received: by 10.84.211.130 with SMTP id c2mr34384845pli.82.1489940863175;
	Sun, 19 Mar 2017 09:27:43 -0700 (PDT)
Received: from localhost.localdomain ([106.51.31.118])
	by smtp.gmail.com with ESMTPSA id
	t12sm28039150pfg.14.2017.03.19.09.27.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Mar 2017 09:27:42 -0700 (PDT)
From: Saurav Sachidanand <sauravsachidanand@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, stefanha@gmail.com, laurent@vivier.eu,
	Saurav Sachidanand <sauravsachidanand@gmail.com>
Date: Sun, 19 Mar 2017 16:27:15 +0000
Message-Id: <20170319162715.2260-1-sauravsachidanand@gmail.com>
X-Mailer: git-send-email 2.12.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-trivial]  [PATCH v3] util: Use g_malloc/g_free in envlist.c
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
X-List-Received-Date: Sun, 19 Mar 2017 16:27:52 -0000

Change malloc/strdup/free to g_malloc/g_strdup/g_free in
util/envlist.c.

Remove NULL checks for pointers returned from g_malloc and g_strdup
as they exit in case of failure. Also, update calls to envlist_create
to reflect this.

Free array and array contents returned by envlist_to_environ using
g_free in bsd-user/main.c and linux-user/main.c.

Update comments to reflect change in semantics.

Signed-off-by: Saurav Sachidanand <sauravsachidanand@gmail.com>
---
 bsd-user/main.c   | 14 ++++----------
 linux-user/main.c |  9 +++------
 util/envlist.c    | 47 +++++++++++++++++++----------------------------
 3 files changed, 26 insertions(+), 44 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 714a692e6f..04f95ddd54 100644
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
@@ -956,10 +950,10 @@ int main(int argc, char **argv)
     }
 
     for (wrk = target_environ; *wrk; wrk++) {
-        free(*wrk);
+        g_free(*wrk);
     }
 
-    free(target_environ);
+    g_free(target_environ);
 
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
         qemu_log("guest_base  0x%lx\n", guest_base);
diff --git a/linux-user/main.c b/linux-user/main.c
index 10a3bb3a12..5f20769cb9 100644
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
@@ -4429,10 +4426,10 @@ int main(int argc, char **argv, char **envp)
     }
 
     for (wrk = target_environ; *wrk; wrk++) {
-        free(*wrk);
+        g_free(*wrk);
     }
 
-    free(target_environ);
+    g_free(target_environ);
 
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
         qemu_log("guest_base  0x%lx\n", guest_base);
diff --git a/util/envlist.c b/util/envlist.c
index e86857e70a..cf129340cb 100644
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
+	envlist = g_malloc(sizeof(*envlist));
 
 	QLIST_INIT(&envlist->el_entries);
 	envlist->el_count = 0;
@@ -48,10 +46,10 @@ envlist_free(envlist_t *envlist)
 		entry = envlist->el_entries.lh_first;
 		QLIST_REMOVE(entry, ev_link);
 
-		free((char *)entry->ev_var);
-		free(entry);
+		g_free(entry->ev_var);
+		g_free(entry);
 	}
-	free(envlist);
+	g_free(envlist);
 }
 
 /*
@@ -101,8 +99,7 @@ envlist_parse(envlist_t *envlist, const char *env,
 	if ((envlist == NULL) || (env == NULL))
 		return (EINVAL);
 
-	if ((tmpenv = strdup(env)) == NULL)
-		return (errno);
+	tmpenv = g_strdup(env);
     envsave = tmpenv;
 
     do {
@@ -117,7 +114,7 @@ envlist_parse(envlist_t *envlist, const char *env,
         tmpenv = envvar + 1;
     } while (envvar != NULL);
 
-    free(envsave);
+    g_free(envsave);
     return ret;
 }
 
@@ -155,18 +152,14 @@ envlist_setenv(envlist_t *envlist, const char *env)
 
 	if (entry != NULL) {
 		QLIST_REMOVE(entry, ev_link);
-		free((char *)entry->ev_var);
-		free(entry);
+		g_free(entry->ev_var);
+		g_free(entry);
 	} else {
 		envlist->el_count++;
 	}
 
-	if ((entry = malloc(sizeof (*entry))) == NULL)
-		return (errno);
-	if ((entry->ev_var = strdup(env)) == NULL) {
-		free(entry);
-		return (errno);
-	}
+	entry = g_malloc(sizeof(*entry));
+	entry->ev_var = g_strdup(env);
 	QLIST_INSERT_HEAD(&envlist->el_entries, entry, ev_link);
 
 	return (0);
@@ -201,8 +194,8 @@ envlist_unsetenv(envlist_t *envlist, const char *env)
 	}
 	if (entry != NULL) {
 		QLIST_REMOVE(entry, ev_link);
-		free((char *)entry->ev_var);
-		free(entry);
+		g_free(entry->ev_var);
+		g_free(entry);
 
 		envlist->el_count--;
 	}
@@ -212,12 +205,12 @@ envlist_unsetenv(envlist_t *envlist, const char *env)
 /*
  * Returns given envlist as array of strings (in same form that
  * global variable environ is).  Caller must free returned memory
- * by calling free(3) for each element and for the array.  Returned
- * array and given envlist are not related (no common references).
+ * by calling g_free for each element and the array.
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
@@ -225,13 +218,11 @@ envlist_to_environ(const envlist_t *envlist, size_t *count)
 	struct envlist_entry *entry;
 	char **env, **penv;
 
-	penv = env = malloc((envlist->el_count + 1) * sizeof (char *));
-	if (env == NULL)
-		return (NULL);
+	penv = env = g_malloc((envlist->el_count + 1) * sizeof(char *));
 
 	for (entry = envlist->el_entries.lh_first; entry != NULL;
 	    entry = entry->ev_link.le_next) {
-		*(penv++) = strdup(entry->ev_var);
+		*(penv++) = g_strdup(entry->ev_var);
 	}
 	*penv = NULL; /* NULL terminate the list */
 
-- 
2.12.0



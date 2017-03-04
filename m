Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ckAUS-0001QG-Ro
	for mharc-qemu-trivial@gnu.org; Sat, 04 Mar 2017 09:16:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sauravsachidanand@gmail.com>) id 1ck7KM-0000Xf-C0
	for qemu-trivial@nongnu.org; Sat, 04 Mar 2017 05:54:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sauravsachidanand@gmail.com>) id 1ck7KJ-0007u4-8u
	for qemu-trivial@nongnu.org; Sat, 04 Mar 2017 05:54:18 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:35565)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sauravsachidanand@gmail.com>)
	id 1ck7KJ-0007tz-1B
	for qemu-trivial@nongnu.org; Sat, 04 Mar 2017 05:54:15 -0500
Received: by mail-pf0-x244.google.com with SMTP id 67so7961217pfg.2
	for <qemu-trivial@nongnu.org>; Sat, 04 Mar 2017 02:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8LO0r9Cb+A80BC59WLpiH0Kl0xTTncDntaTLTHgxHYk=;
	b=gyRTnmmQqkdDi5xs4lzYfFfA815dpUBkSfrSmtsCNg/8k2/QEkt+0ZMAJZ+Ck/anZx
	oXDz1KelMJi/IAd2FE6yY105fZNdfjx2wL+R8vwG5X13tAjJt52/pe0DSHCFT0RRvECO
	DqL/LhIDqAd8UcnB8qaYfhVt/FcnDx9FQPKfFFsaW1qOqdPZQS8+648OHFvLuNJ0HJEP
	6EZAHNQAACGSgQdbLWPo4QfUVSps+eeQnbt0D8KPDmjBne7YI9IZdoFFerKyuVaYTCGZ
	NOxvYqwkz2VzhGNQw2Y4gWhqbYq/54J+pYNoVYgodmQ6f7o9BeFv4vK+oUW5eVvoiRuh
	28wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8LO0r9Cb+A80BC59WLpiH0Kl0xTTncDntaTLTHgxHYk=;
	b=FeJrlPupyAJk7TSZ2cZ4bACyOmejWRUCznzLqTXUaw1xxl+/ruCPdQHCPCUCDpT5WH
	egYwgsyPN3OoWx9NCA3sb2vyLsk28RCOUjbLSsX5QAJ36F3/4+70t0QdTb6s70rVzqPU
	5JrHP1DyE8d3gwJXM9zovD54gqF0gUeZdW135fE2/AOQhoQi4XhAhw2TEFm5Q0/kwhj4
	ZZVxp0qmVlMTAjyrxlowNJPj9Ni0TUhKUf41sFi41ulcbmxH3g8/pDVUhy2lfgVg8RL7
	5sEXjKfnodaCn1yp6U6y52pCYBcrTRjr8+iIXDdxiJRps4lqNYQDQVmZIZwNMiTPDFU/
	fAjg==
X-Gm-Message-State: AMke39kpLThD+/WWojjlRdESrFC8j7PYEgPklAnBa4aecCm1fnVvv8DcKoMotGcALwZnbw==
X-Received: by 10.98.25.202 with SMTP id 193mr9172345pfz.134.1488624853883;
	Sat, 04 Mar 2017 02:54:13 -0800 (PST)
Received: from localhost.localdomain ([49.207.50.75])
	by smtp.gmail.com with ESMTPSA id
	23sm28549752pfw.94.2017.03.04.02.54.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Mar 2017 02:54:12 -0800 (PST)
From: Saurav Sachidanand <sauravsachidanand@gmail.com>
To: qemu-trivial@nongnu.org
Cc: laurent@vivier.eu,
	Saurav Sachidanand <sauravsachidanand@gmail.com>
Date: Sat,  4 Mar 2017 10:53:55 +0000
Message-Id: <20170304105355.994-1-sauravsachidanand@gmail.com>
X-Mailer: git-send-email 2.12.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::244
X-Mailman-Approved-At: Sat, 04 Mar 2017 09:16:56 -0500
Subject: [Qemu-trivial]  [PATCH] util: Use g_malloc/g_free in envlist.c
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
X-List-Received-Date: Sat, 04 Mar 2017 10:54:19 -0000

Change malloc/free to g_malloc/g_free in util/envlist.c, except for
entry->env_var which is allocated using strdup(3).

Remove NULL checks for pointers returned from g_malloc as it exits
in case of failure. Update calls to envlist_create to reflect this.

Free array returned by envlist_to_environ using g_free.

Update comments to reflect change in semantics.

Signed-off-by: Saurav Sachidanand <sauravsachidanand@gmail.com>
---
 bsd-user/main.c   | 12 +++---------
 linux-user/main.c |  7 ++-----
 util/envlist.c    | 31 +++++++++++++------------------
 3 files changed, 18 insertions(+), 32 deletions(-)

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
index e86857e70a..bc21481b17 100644
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
+	envlist = g_malloc(sizeof (*envlist));
 
 	QLIST_INIT(&envlist->el_entries);
 	envlist->el_count = 0;
@@ -49,9 +47,9 @@ envlist_free(envlist_t *envlist)
 		QLIST_REMOVE(entry, ev_link);
 
 		free((char *)entry->ev_var);
-		free(entry);
+		g_free(entry);
 	}
-	free(envlist);
+	g_free(envlist);
 }
 
 /*
@@ -156,15 +154,14 @@ envlist_setenv(envlist_t *envlist, const char *env)
 	if (entry != NULL) {
 		QLIST_REMOVE(entry, ev_link);
 		free((char *)entry->ev_var);
-		free(entry);
+		g_free(entry);
 	} else {
 		envlist->el_count++;
 	}
 
-	if ((entry = malloc(sizeof (*entry))) == NULL)
-		return (errno);
+	entry = g_malloc(sizeof (*entry));
 	if ((entry->ev_var = strdup(env)) == NULL) {
-		free(entry);
+		g_free(entry);
 		return (errno);
 	}
 	QLIST_INSERT_HEAD(&envlist->el_entries, entry, ev_link);
@@ -202,7 +199,7 @@ envlist_unsetenv(envlist_t *envlist, const char *env)
 	if (entry != NULL) {
 		QLIST_REMOVE(entry, ev_link);
 		free((char *)entry->ev_var);
-		free(entry);
+		g_free(entry);
 
 		envlist->el_count--;
 	}
@@ -212,12 +209,12 @@ envlist_unsetenv(envlist_t *envlist, const char *env)
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
@@ -225,9 +222,7 @@ envlist_to_environ(const envlist_t *envlist, size_t *count)
 	struct envlist_entry *entry;
 	char **env, **penv;
 
-	penv = env = malloc((envlist->el_count + 1) * sizeof (char *));
-	if (env == NULL)
-		return (NULL);
+	penv = env = g_malloc((envlist->el_count + 1) * sizeof (char *));
 
 	for (entry = envlist->el_entries.lh_first; entry != NULL;
 	    entry = entry->ev_link.le_next) {
-- 
2.12.0



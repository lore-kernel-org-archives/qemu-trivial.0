Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cRp-0001iY-39
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:54:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRl-0001fV-WD
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRk-0007RS-SZ
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:26 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:36761)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRh-0007My-VT; Fri, 06 Oct 2017 19:54:22 -0400
Received: by mail-qk0-x242.google.com with SMTP id z14so12862240qkg.3;
	Fri, 06 Oct 2017 16:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nq9BCKrICxD9bnF6ixu6+BxmBS0KBKlFFaxPU6YfRjo=;
	b=srzq5j0j4YuhOSFloTzQ7x/2gRc1xfeARMJxOoj4CztezY8q0Wl6cjkhey1k8OyltR
	+grh14lyFLBPcJA18Xe7wdMHhvYcTdIjXvF9IP0tiKO6a/1vSHGpGDOzK4MJG6NGQFqk
	RIzZGNRMGerXzIqWafjDL1NAkoqcVWsCTpzk/R6Uu6HKJZ16sI4LkdwtcVsn5wK/47t3
	5w8VHeu9UhmWWQiMh2yFfCbm/DJvhSptEFFB4WShPSemFMA7+VJVafnwoWNInwSDN+Z0
	wGCOHcabasuz612aISZw2vRdiwrK4V9vcMC7NSsj/vdl+pOq+GDb7Fr0cbzyr+dRzQcq
	mmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=nq9BCKrICxD9bnF6ixu6+BxmBS0KBKlFFaxPU6YfRjo=;
	b=Qo+JrRI8PR2Kp0ziOPq+ZaURGp6KIrYsLVseNSX0HZRvEiP3YRFxDEpvyqjc73ySba
	3uZSpqRkgoYLPUW7DTtwXGRyNeSlqTZTEhLX04hpZLR6N9zr1fADGzUbeUfEqSHeGgk0
	46X/5jN4eN7OL90pxICR87Bnmab2bkyZ2+2MG4gwLcnV80PCWD/uFv01avpyFF0yGG1P
	Z5Pqtbcz4XcGq8wl+HMtbGiepZAZkIkS6mvLThkZ+LasNJ5/77IS3K93eW+wEP6o1CZ9
	ARiqfrnZzh7ijppfqohF4OPkMVOWeY5VpzYPN16CF6sxmq3OagnlfLkeHrNo7MzAtOxi
	A1Mw==
X-Gm-Message-State: AMCzsaUQDImnINOx4MmXULqZFnZozhB++jFBJf209ANObJszjXNN2Z6+
	N6cIvHVNlx/K2bMGx5FA8l4=
X-Google-Smtp-Source: AOwi7QApzWhqXHKxTHEIhjGxB0E2J10nEXJsph7n5K4TcWwSKBHLPDPugY5S4lqBUKn7GATKx++luw==
X-Received: by 10.55.183.134 with SMTP id h128mr712846qkf.96.1507334061380;
	Fri, 06 Oct 2017 16:54:21 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.54.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:54:20 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:50:00 -0300
Message-Id: <20171006235023.11952-66-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 65/88] util: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:54:27 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: more changes in util/envlist.c, more files updated]
---
 util/acl.c         | 6 +++---
 util/envlist.c     | 6 +++---
 util/error.c       | 2 +-
 util/iohandler.c   | 2 +-
 util/module.c      | 4 ++--
 util/qemu-option.c | 8 ++++----
 util/qht.c         | 2 +-
 7 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/util/acl.c b/util/acl.c
index c105addadc..f5d8295fe2 100644
--- a/util/acl.c
+++ b/util/acl.c
@@ -56,7 +56,7 @@ qemu_acl *qemu_acl_init(const char *aclname)
     if (acl)
         return acl;
 
-    acl = g_malloc(sizeof(*acl));
+    acl = g_new(qemu_acl, 1);
     acl->aclname = g_strdup(aclname);
     /* Deny by default, so there is no window of "open
      * access" between QEMU starting, and the user setting
@@ -117,7 +117,7 @@ int qemu_acl_append(qemu_acl *acl,
 {
     qemu_acl_entry *entry;
 
-    entry = g_malloc(sizeof(*entry));
+    entry = g_new(qemu_acl_entry, 1);
     entry->match = g_strdup(match);
     entry->deny = deny;
 
@@ -146,7 +146,7 @@ int qemu_acl_insert(qemu_acl *acl,
         i++;
         if (i == index) {
             qemu_acl_entry *entry;
-            entry = g_malloc(sizeof(*entry));
+            entry = g_new(qemu_acl_entry, 1);
             entry->match = g_strdup(match);
             entry->deny = deny;
 
diff --git a/util/envlist.c b/util/envlist.c
index 1eeb7fca87..5934095b7d 100644
--- a/util/envlist.c
+++ b/util/envlist.c
@@ -24,7 +24,7 @@ envlist_create(void)
 {
 	envlist_t *envlist;
 
-	envlist = g_malloc(sizeof(*envlist));
+	envlist = g_new(envlist_t, 1);
 
 	QLIST_INIT(&envlist->el_entries);
 	envlist->el_count = 0;
@@ -158,7 +158,7 @@ envlist_setenv(envlist_t *envlist, const char *env)
 		envlist->el_count++;
 	}
 
-	entry = g_malloc(sizeof(*entry));
+	entry = g_new(struct envlist_entry, 1);
 	entry->ev_var = g_strdup(env);
 	QLIST_INSERT_HEAD(&envlist->el_entries, entry, ev_link);
 
@@ -218,7 +218,7 @@ envlist_to_environ(const envlist_t *envlist, size_t *count)
 	struct envlist_entry *entry;
 	char **env, **penv;
 
-	penv = env = g_malloc((envlist->el_count + 1) * sizeof(char *));
+	penv = env = g_new(char *, envlist->el_count + 1);
 
 	for (entry = envlist->el_entries.lh_first; entry != NULL;
 	    entry = entry->ev_link.le_next) {
diff --git a/util/error.c b/util/error.c
index 3efdd69162..cfb829b1f8 100644
--- a/util/error.c
+++ b/util/error.c
@@ -56,7 +56,7 @@ static void error_setv(Error **errp,
     }
     assert(*errp == NULL);
 
-    err = g_malloc0(sizeof(*err));
+    err = g_new0(Error, 1);
     err->msg = g_strdup_vprintf(fmt, ap);
     if (suffix) {
         char *msg = err->msg;
diff --git a/util/iohandler.c b/util/iohandler.c
index 623b55b9ec..518922dcea 100644
--- a/util/iohandler.c
+++ b/util/iohandler.c
@@ -128,7 +128,7 @@ int qemu_add_child_watch(pid_t pid)
             return 1;
         }
     }
-    rec = g_malloc0(sizeof(ChildProcessRecord));
+    rec = g_new0(ChildProcessRecord, 1);
     rec->pid = pid;
     QLIST_INSERT_HEAD(&child_watches, rec, next);
     return 0;
diff --git a/util/module.c b/util/module.c
index c90973721f..1533dbdc63 100644
--- a/util/module.c
+++ b/util/module.c
@@ -65,7 +65,7 @@ void register_module_init(void (*fn)(void), module_init_type type)
     ModuleEntry *e;
     ModuleTypeList *l;
 
-    e = g_malloc0(sizeof(*e));
+    e = g_new0(ModuleEntry, 1);
     e->init = fn;
     e->type = type;
 
@@ -80,7 +80,7 @@ void register_dso_module_init(void (*fn)(void), module_init_type type)
 
     init_lists();
 
-    e = g_malloc0(sizeof(*e));
+    e = g_new0(ModuleEntry, 1);
     e->init = fn;
     e->type = type;
 
diff --git a/util/qemu-option.c b/util/qemu-option.c
index 9b1dc8093b..8a121bfc40 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -534,7 +534,7 @@ static void opt_set(QemuOpts *opts, const char *name, const char *value,
         return;
     }
 
-    opt = g_malloc0(sizeof(*opt));
+    opt = g_new0(QemuOpt, 1);
     opt->name = g_strdup(name);
     opt->opts = opts;
     if (prepend) {
@@ -564,7 +564,7 @@ void qemu_opt_set_bool(QemuOpts *opts, const char *name, bool val,
     QemuOpt *opt;
     const QemuOptDesc *desc = opts->list->desc;
 
-    opt = g_malloc0(sizeof(*opt));
+    opt = g_new0(QemuOpt, 1);
     opt->desc = find_desc_by_name(desc, name);
     if (!opt->desc && !opts_accepts_any(opts)) {
         error_setg(errp, QERR_INVALID_PARAMETER, name);
@@ -585,7 +585,7 @@ void qemu_opt_set_number(QemuOpts *opts, const char *name, int64_t val,
     QemuOpt *opt;
     const QemuOptDesc *desc = opts->list->desc;
 
-    opt = g_malloc0(sizeof(*opt));
+    opt = g_new0(QemuOpt, 1);
     opt->desc = find_desc_by_name(desc, name);
     if (!opt->desc && !opts_accepts_any(opts)) {
         error_setg(errp, QERR_INVALID_PARAMETER, name);
@@ -665,7 +665,7 @@ QemuOpts *qemu_opts_create(QemuOptsList *list, const char *id,
             return opts;
         }
     }
-    opts = g_malloc0(sizeof(*opts));
+    opts = g_new0(QemuOpts, 1);
     opts->id = g_strdup(id);
     opts->list = list;
     loc_save(&opts->loc);
diff --git a/util/qht.c b/util/qht.c
index ff4d2e6974..c5d153d573 100644
--- a/util/qht.c
+++ b/util/qht.c
@@ -331,7 +331,7 @@ static struct qht_map *qht_map_create(size_t n_buckets)
     struct qht_map *map;
     size_t i;
 
-    map = g_malloc(sizeof(*map));
+    map = g_new(struct qht_map, 1);
     map->n_buckets = n_buckets;
 
     map->n_added_buckets = 0;
-- 
2.14.2



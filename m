Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1enlPa-00085m-VM
	for mharc-qemu-trivial@gnu.org; Mon, 19 Feb 2018 08:23:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <suhang16@mails.ucas.ac.cn>) id 1enfnd-0002vH-Fx
	for qemu-trivial@nongnu.org; Mon, 19 Feb 2018 02:23:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <suhang16@mails.ucas.ac.cn>) id 1enfnX-0001XL-FJ
	for qemu-trivial@nongnu.org; Mon, 19 Feb 2018 02:23:45 -0500
Received: from smtp37.cstnet.cn ([159.226.251.37]:36455 helo=cstnet.cn)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <suhang16@mails.ucas.ac.cn>) id 1enfnV-0001Vk-Tw
	for qemu-trivial@nongnu.org; Mon, 19 Feb 2018 02:23:39 -0500
Received: from localhost.localdomain (unknown [117.151.138.252])
	by APP-12 (Coremail) with SMTP id tgCowABXX+dze4paSUwiBA--.308S3;
	Mon, 19 Feb 2018 15:23:32 +0800 (CST)
From: Su Hang <suhang16@mails.ucas.ac.cn>
To: stefanha@redhat.com
Cc: thuth@redhat.com,
	qemu-trivial@nongnu.org
Date: Mon, 19 Feb 2018 15:23:31 +0800
Message-Id: <1519025011-26416-1-git-send-email-suhang16@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: tgCowABXX+dze4paSUwiBA--.308S3
X-Coremail-Antispam: 1UD129KBjvAXoWDGr1DKw18Wr18Xw45AFW7twb_yoW7ZFWrWo
	WfX398Jwn8Gwn2gr1Sk34DXF4DXa18uwn8Jaya9Fs0ka4xZw1rW397Z3yxWayqgr18XrW3
	WF48W343Xr4xXrWfn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYO7k0a2IF6w4kM7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0
	x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
	1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0
	I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8JVW8Jr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8I
	j28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_Jr
	ylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxG
	rwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5DC7UUUUU
	U==
X-CM-SenderInfo: pvxkt0rjrwqzpdlo2hpxfd2hldfou0/
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 159.226.251.37
X-Mailman-Approved-At: Mon, 19 Feb 2018 08:23:17 -0500
Subject: [Qemu-trivial] [Qemu-devel] [PATCH RFC] util: Fix wrong indentation
 TAB with space
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
X-List-Received-Date: Mon, 19 Feb 2018 07:23:51 -0000

BiteSizedTasks: Developer conveniences

I use checkpatch.pl to find these files
(bitops.c envlist.c osdep.c qemu-sockets.c readline.c uri.c)
use TAB instead of space for indentation.

Repalcing all TABs in the beginning of lines with space, and left
the rest of file untouched.

Signed-off-by: Su Hang <suhang16@mails.ucas.ac.cn>
---
 util/bitops.c       |    4 +-
 util/envlist.c      |  202 ++++-----
 util/osdep.c        |    6 +-
 util/qemu-sockets.c |    4 +-
 util/readline.c     |  100 ++---
 util/uri.c          | 1174 +++++++++++++++++++++++++--------------------------
 6 files changed, 745 insertions(+), 745 deletions(-)

diff --git a/util/bitops.c b/util/bitops.c
index f2364015c4bf..3fe6b1c4f160 100644
--- a/util/bitops.c
+++ b/util/bitops.c
@@ -18,7 +18,7 @@
  * Find the next set bit in a memory region.
  */
 unsigned long find_next_bit(const unsigned long *addr, unsigned long size,
-			    unsigned long offset)
+                            unsigned long offset)
 {
     const unsigned long *p = addr + BIT_WORD(offset);
     unsigned long result = offset & ~(BITS_PER_LONG-1);
@@ -83,7 +83,7 @@ found_middle:
  * Linus' asm-alpha/bitops.h.
  */
 unsigned long find_next_zero_bit(const unsigned long *addr, unsigned long size,
-				 unsigned long offset)
+                                 unsigned long offset)
 {
     const unsigned long *p = addr + BIT_WORD(offset);
     unsigned long result = offset & ~(BITS_PER_LONG-1);
diff --git a/util/envlist.c b/util/envlist.c
index 1eeb7fca87c1..8c0e32f89c39 100644
--- a/util/envlist.c
+++ b/util/envlist.c
@@ -4,13 +4,13 @@
 #include "qemu/envlist.h"
 
 struct envlist_entry {
-	const char *ev_var;			/* actual env value */
-	QLIST_ENTRY(envlist_entry) ev_link;
+    const char *ev_var;			/* actual env value */
+    QLIST_ENTRY(envlist_entry) ev_link;
 };
 
 struct envlist {
-	QLIST_HEAD(, envlist_entry) el_entries;	/* actual entries */
-	size_t el_count;			/* number of entries */
+    QLIST_HEAD(, envlist_entry) el_entries;	/* actual entries */
+    size_t el_count;			/* number of entries */
 };
 
 static int envlist_parse(envlist_t *envlist,
@@ -22,14 +22,14 @@ static int envlist_parse(envlist_t *envlist,
 envlist_t *
 envlist_create(void)
 {
-	envlist_t *envlist;
+    envlist_t *envlist;
 
-	envlist = g_malloc(sizeof(*envlist));
+    envlist = g_malloc(sizeof(*envlist));
 
-	QLIST_INIT(&envlist->el_entries);
-	envlist->el_count = 0;
+    QLIST_INIT(&envlist->el_entries);
+    envlist->el_count = 0;
 
-	return (envlist);
+    return (envlist);
 }
 
 /*
@@ -38,18 +38,18 @@ envlist_create(void)
 void
 envlist_free(envlist_t *envlist)
 {
-	struct envlist_entry *entry;
+    struct envlist_entry *entry;
 
-	assert(envlist != NULL);
+    assert(envlist != NULL);
 
-	while (envlist->el_entries.lh_first != NULL) {
-		entry = envlist->el_entries.lh_first;
-		QLIST_REMOVE(entry, ev_link);
+    while (envlist->el_entries.lh_first != NULL) {
+        entry = envlist->el_entries.lh_first;
+        QLIST_REMOVE(entry, ev_link);
 
-		g_free((char *)entry->ev_var);
-		g_free(entry);
-	}
-	g_free(envlist);
+        g_free((char *)entry->ev_var);
+        g_free(entry);
+    }
+    g_free(envlist);
 }
 
 /*
@@ -66,7 +66,7 @@ envlist_free(envlist_t *envlist)
 int
 envlist_parse_set(envlist_t *envlist, const char *env)
 {
-	return (envlist_parse(envlist, env, &envlist_setenv));
+    return (envlist_parse(envlist, env, &envlist_setenv));
 }
 
 /*
@@ -78,7 +78,7 @@ envlist_parse_set(envlist_t *envlist, const char *env)
 int
 envlist_parse_unset(envlist_t *envlist, const char *env)
 {
-	return (envlist_parse(envlist, env, &envlist_unsetenv));
+    return (envlist_parse(envlist, env, &envlist_unsetenv));
 }
 
 /*
@@ -91,15 +91,15 @@ static int
 envlist_parse(envlist_t *envlist, const char *env,
     int (*callback)(envlist_t *, const char *))
 {
-	char *tmpenv, *envvar;
-	char *envsave = NULL;
+    char *tmpenv, *envvar;
+    char *envsave = NULL;
     int ret = 0;
     assert(callback != NULL);
 
-	if ((envlist == NULL) || (env == NULL))
-		return (EINVAL);
+    if ((envlist == NULL) || (env == NULL))
+        return (EINVAL);
 
-	tmpenv = g_strdup(env);
+    tmpenv = g_strdup(env);
     envsave = tmpenv;
 
     do {
@@ -110,7 +110,7 @@ envlist_parse(envlist_t *envlist, const char *env,
         if ((*callback)(envlist, tmpenv) != 0) {
             ret = errno;
             break;
-		}
+        }
         tmpenv = envvar + 1;
     } while (envvar != NULL);
 
@@ -127,42 +127,42 @@ envlist_parse(envlist_t *envlist, const char *env,
 int
 envlist_setenv(envlist_t *envlist, const char *env)
 {
-	struct envlist_entry *entry = NULL;
-	const char *eq_sign;
-	size_t envname_len;
-
-	if ((envlist == NULL) || (env == NULL))
-		return (EINVAL);
-
-	/* find out first equals sign in given env */
-	if ((eq_sign = strchr(env, '=')) == NULL)
-		return (EINVAL);
-	envname_len = eq_sign - env + 1;
-
-	/*
-	 * If there already exists variable with given name
-	 * we remove and release it before allocating a whole
-	 * new entry.
-	 */
-	for (entry = envlist->el_entries.lh_first; entry != NULL;
-	    entry = entry->ev_link.le_next) {
-		if (strncmp(entry->ev_var, env, envname_len) == 0)
-			break;
-	}
-
-	if (entry != NULL) {
-		QLIST_REMOVE(entry, ev_link);
-		g_free((char *)entry->ev_var);
-		g_free(entry);
-	} else {
-		envlist->el_count++;
-	}
-
-	entry = g_malloc(sizeof(*entry));
-	entry->ev_var = g_strdup(env);
-	QLIST_INSERT_HEAD(&envlist->el_entries, entry, ev_link);
-
-	return (0);
+    struct envlist_entry *entry = NULL;
+    const char *eq_sign;
+    size_t envname_len;
+
+    if ((envlist == NULL) || (env == NULL))
+        return (EINVAL);
+
+    /* find out first equals sign in given env */
+    if ((eq_sign = strchr(env, '=')) == NULL)
+        return (EINVAL);
+    envname_len = eq_sign - env + 1;
+
+    /*
+     * If there already exists variable with given name
+     * we remove and release it before allocating a whole
+     * new entry.
+     */
+    for (entry = envlist->el_entries.lh_first; entry != NULL;
+            entry = entry->ev_link.le_next) {
+        if (strncmp(entry->ev_var, env, envname_len) == 0)
+            break;
+    }
+
+    if (entry != NULL) {
+        QLIST_REMOVE(entry, ev_link);
+        g_free((char *)entry->ev_var);
+        g_free(entry);
+    } else {
+        envlist->el_count++;
+    }
+
+    entry = g_malloc(sizeof(*entry));
+    entry->ev_var = g_strdup(env);
+    QLIST_INSERT_HEAD(&envlist->el_entries, entry, ev_link);
+
+    return (0);
 }
 
 /*
@@ -172,34 +172,34 @@ envlist_setenv(envlist_t *envlist, const char *env)
 int
 envlist_unsetenv(envlist_t *envlist, const char *env)
 {
-	struct envlist_entry *entry;
-	size_t envname_len;
-
-	if ((envlist == NULL) || (env == NULL))
-		return (EINVAL);
-
-	/* env is not allowed to contain '=' */
-	if (strchr(env, '=') != NULL)
-		return (EINVAL);
-
-	/*
-	 * Find out the requested entry and remove
-	 * it from the list.
-	 */
-	envname_len = strlen(env);
-	for (entry = envlist->el_entries.lh_first; entry != NULL;
-	    entry = entry->ev_link.le_next) {
-		if (strncmp(entry->ev_var, env, envname_len) == 0)
-			break;
-	}
-	if (entry != NULL) {
-		QLIST_REMOVE(entry, ev_link);
-		g_free((char *)entry->ev_var);
-		g_free(entry);
-
-		envlist->el_count--;
-	}
-	return (0);
+    struct envlist_entry *entry;
+    size_t envname_len;
+
+    if ((envlist == NULL) || (env == NULL))
+        return (EINVAL);
+
+    /* env is not allowed to contain '=' */
+    if (strchr(env, '=') != NULL)
+        return (EINVAL);
+
+    /*
+     * Find out the requested entry and remove
+     * it from the list.
+     */
+    envname_len = strlen(env);
+    for (entry = envlist->el_entries.lh_first; entry != NULL;
+            entry = entry->ev_link.le_next) {
+        if (strncmp(entry->ev_var, env, envname_len) == 0)
+            break;
+    }
+    if (entry != NULL) {
+        QLIST_REMOVE(entry, ev_link);
+        g_free((char *)entry->ev_var);
+        g_free(entry);
+
+        envlist->el_count--;
+    }
+    return (0);
 }
 
 /*
@@ -215,19 +215,19 @@ envlist_unsetenv(envlist_t *envlist, const char *env)
 char **
 envlist_to_environ(const envlist_t *envlist, size_t *count)
 {
-	struct envlist_entry *entry;
-	char **env, **penv;
+    struct envlist_entry *entry;
+    char **env, **penv;
 
-	penv = env = g_malloc((envlist->el_count + 1) * sizeof(char *));
+    penv = env = g_malloc((envlist->el_count + 1) * sizeof(char *));
 
-	for (entry = envlist->el_entries.lh_first; entry != NULL;
-	    entry = entry->ev_link.le_next) {
-		*(penv++) = g_strdup(entry->ev_var);
-	}
-	*penv = NULL; /* NULL terminate the list */
+    for (entry = envlist->el_entries.lh_first; entry != NULL;
+            entry = entry->ev_link.le_next) {
+        *(penv++) = g_strdup(entry->ev_var);
+    }
+    *penv = NULL; /* NULL terminate the list */
 
-	if (count != NULL)
-		*count = envlist->el_count;
+    if (count != NULL)
+        *count = envlist->el_count;
 
-	return (env);
+    return (env);
 }
diff --git a/util/osdep.c b/util/osdep.c
index a73de0e1ba0d..d24841d7b3f0 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -469,8 +469,8 @@ void fips_set_state(bool requested)
 
 #ifdef _FIPS_DEBUG
     fprintf(stderr, "FIPS mode %s (requested %s)\n",
-	    (fips_enabled ? "enabled" : "disabled"),
-	    (requested ? "enabled" : "disabled"));
+            (fips_enabled ? "enabled" : "disabled"),
+            (requested ? "enabled" : "disabled"));
 #endif
 }
 
@@ -513,7 +513,7 @@ int socket_init(void)
 static void __attribute__((constructor)) thread_init(void)
 {
     if (!g_thread_supported()) {
-       g_thread_init(NULL);
+        g_thread_init(NULL);
     }
 }
 #endif
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index fbbef69f6275..2e8b26256e64 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -262,8 +262,8 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
     /* create socket + bind/listen */
     for (e = res; e != NULL; e = e->ai_next) {
         getnameinfo((struct sockaddr*)e->ai_addr,e->ai_addrlen,
-		        uaddr,INET6_ADDRSTRLEN,uport,32,
-		        NI_NUMERICHOST | NI_NUMERICSERV);
+                    uaddr,INET6_ADDRSTRLEN,uport,32,
+                    NI_NUMERICHOST | NI_NUMERICSERV);
 
         port_min = inet_getport(e);
         port_max = saddr->has_to ? saddr->to + port_offset : port_min;
diff --git a/util/readline.c b/util/readline.c
index ec91ee0fea6f..e8c463537923 100644
--- a/util/readline.c
+++ b/util/readline.c
@@ -179,20 +179,20 @@ static void readline_up_char(ReadLineState *rs)
     int idx;
 
     if (rs->hist_entry == 0)
-	return;
+        return;
     if (rs->hist_entry == -1) {
-	/* Find latest entry */
-	for (idx = 0; idx < READLINE_MAX_CMDS; idx++) {
-	    if (rs->history[idx] == NULL)
-		break;
-	}
-	rs->hist_entry = idx;
+        /* Find latest entry */
+        for (idx = 0; idx < READLINE_MAX_CMDS; idx++) {
+            if (rs->history[idx] == NULL)
+                break;
+        }
+        rs->hist_entry = idx;
     }
     rs->hist_entry--;
     if (rs->hist_entry >= 0) {
-	pstrcpy(rs->cmd_buf, sizeof(rs->cmd_buf),
+        pstrcpy(rs->cmd_buf, sizeof(rs->cmd_buf),
                 rs->history[rs->hist_entry]);
-	rs->cmd_buf_index = rs->cmd_buf_size = strlen(rs->cmd_buf);
+        rs->cmd_buf_index = rs->cmd_buf_size = strlen(rs->cmd_buf);
     }
 }
 
@@ -202,11 +202,11 @@ static void readline_down_char(ReadLineState *rs)
         return;
     if (rs->hist_entry < READLINE_MAX_CMDS - 1 &&
         rs->history[++rs->hist_entry] != NULL) {
-	pstrcpy(rs->cmd_buf, sizeof(rs->cmd_buf),
+        pstrcpy(rs->cmd_buf, sizeof(rs->cmd_buf),
                 rs->history[rs->hist_entry]);
     } else {
         rs->cmd_buf[0] = 0;
-	rs->hist_entry = -1;
+        rs->hist_entry = -1;
     }
     rs->cmd_buf_index = rs->cmd_buf_size = strlen(rs->cmd_buf);
 }
@@ -217,42 +217,42 @@ static void readline_hist_add(ReadLineState *rs, const char *cmdline)
     int idx;
 
     if (cmdline[0] == '\0')
-	return;
+        return;
     new_entry = NULL;
     if (rs->hist_entry != -1) {
-	/* We were editing an existing history entry: replace it */
-	hist_entry = rs->history[rs->hist_entry];
-	idx = rs->hist_entry;
-	if (strcmp(hist_entry, cmdline) == 0) {
-	    goto same_entry;
-	}
+        /* We were editing an existing history entry: replace it */
+        hist_entry = rs->history[rs->hist_entry];
+        idx = rs->hist_entry;
+        if (strcmp(hist_entry, cmdline) == 0) {
+            goto same_entry;
+        }
     }
     /* Search cmdline in history buffers */
     for (idx = 0; idx < READLINE_MAX_CMDS; idx++) {
-	hist_entry = rs->history[idx];
-	if (hist_entry == NULL)
-	    break;
-	if (strcmp(hist_entry, cmdline) == 0) {
-	same_entry:
-	    new_entry = hist_entry;
-	    /* Put this entry at the end of history */
-	    memmove(&rs->history[idx], &rs->history[idx + 1],
-		    (READLINE_MAX_CMDS - (idx + 1)) * sizeof(char *));
-	    rs->history[READLINE_MAX_CMDS - 1] = NULL;
-	    for (; idx < READLINE_MAX_CMDS; idx++) {
-		if (rs->history[idx] == NULL)
-		    break;
-	    }
-	    break;
-	}
+        hist_entry = rs->history[idx];
+        if (hist_entry == NULL)
+            break;
+        if (strcmp(hist_entry, cmdline) == 0) {
+        same_entry:
+            new_entry = hist_entry;
+            /* Put this entry at the end of history */
+            memmove(&rs->history[idx], &rs->history[idx + 1],
+                    (READLINE_MAX_CMDS - (idx + 1)) * sizeof(char *));
+            rs->history[READLINE_MAX_CMDS - 1] = NULL;
+            for (; idx < READLINE_MAX_CMDS; idx++) {
+                if (rs->history[idx] == NULL)
+                    break;
+            }
+            break;
+        }
     }
     if (idx == READLINE_MAX_CMDS) {
-	/* Need to get one free slot */
+        /* Need to get one free slot */
         g_free(rs->history[0]);
-	memmove(rs->history, &rs->history[1],
-	        (READLINE_MAX_CMDS - 1) * sizeof(char *));
-	rs->history[READLINE_MAX_CMDS - 1] = NULL;
-	idx = READLINE_MAX_CMDS - 1;
+        memmove(rs->history, &rs->history[1],
+                (READLINE_MAX_CMDS - 1) * sizeof(char *));
+        rs->history[READLINE_MAX_CMDS - 1] = NULL;
+        idx = READLINE_MAX_CMDS - 1;
     }
     if (new_entry == NULL)
         new_entry = g_strdup(cmdline);
@@ -312,7 +312,7 @@ static void readline_completion(ReadLineState *rs)
               completion_comp);
         rs->printf_func(rs->opaque, "\n");
         max_width = 0;
-        max_prefix = 0;	
+        max_prefix = 0;
         for(i = 0; i < rs->nb_completions; i++) {
             len = strlen(rs->completions[i]);
             if (i==0) {
@@ -403,9 +403,9 @@ void readline_handle_byte(ReadLineState *rs, int ch)
         case 8:
             readline_backspace(rs);
             break;
-	case 155:
+        case 155:
             rs->esc_state = IS_CSI;
-	    break;
+            break;
         default:
             if (ch >= 32) {
                 readline_insert_char(rs, ch);
@@ -426,14 +426,14 @@ void readline_handle_byte(ReadLineState *rs, int ch)
         break;
     case IS_CSI:
         switch(ch) {
-	case 'A':
-	case 'F':
-	    readline_up_char(rs);
-	    break;
-	case 'B':
-	case 'E':
-	    readline_down_char(rs);
-	    break;
+        case 'A':
+        case 'F':
+            readline_up_char(rs);
+            break;
+        case 'B':
+        case 'E':
+            readline_down_char(rs);
+        break;
         case 'D':
             readline_backward_char(rs);
             break;
diff --git a/util/uri.c b/util/uri.c
index 21b18281703a..aa1c2da00c17 100644
--- a/util/uri.c
+++ b/util/uri.c
@@ -98,17 +98,17 @@ static void uri_clean(URI *uri);
  */
 
 #define IS_MARK(x) (((x) == '-') || ((x) == '_') || ((x) == '.') ||     \
-    ((x) == '!') || ((x) == '~') || ((x) == '*') || ((x) == '\'') ||    \
-    ((x) == '(') || ((x) == ')'))
+        ((x) == '!') || ((x) == '~') || ((x) == '*') || ((x) == '\'') ||    \
+        ((x) == '(') || ((x) == ')'))
 
 /*
  * unwise = "{" | "}" | "|" | "\" | "^" | "`"
  */
 
 #define IS_UNWISE(p)                                                    \
-      (((*(p) == '{')) || ((*(p) == '}')) || ((*(p) == '|')) ||         \
-       ((*(p) == '\\')) || ((*(p) == '^')) || ((*(p) == '[')) ||        \
-       ((*(p) == ']')) || ((*(p) == '`')))
+    (((*(p) == '{')) || ((*(p) == '}')) || ((*(p) == '|')) ||         \
+     ((*(p) == '\\')) || ((*(p) == '^')) || ((*(p) == '[')) ||        \
+     ((*(p) == ']')) || ((*(p) == '`')))
 /*
  * reserved = ";" | "/" | "?" | ":" | "@" | "&" | "=" | "+" | "$" | "," |
  *            "[" | "]"
@@ -150,28 +150,28 @@ static void uri_clean(URI *uri);
 
 #define ISA_DIGIT(p) ((*(p) >= '0') && (*(p) <= '9'))
 #define ISA_ALPHA(p) (((*(p) >= 'a') && (*(p) <= 'z')) ||		\
-                      ((*(p) >= 'A') && (*(p) <= 'Z')))
+        ((*(p) >= 'A') && (*(p) <= 'Z')))
 #define ISA_HEXDIG(p)							\
-       (ISA_DIGIT(p) || ((*(p) >= 'a') && (*(p) <= 'f')) ||		\
-        ((*(p) >= 'A') && (*(p) <= 'F')))
+    (ISA_DIGIT(p) || ((*(p) >= 'a') && (*(p) <= 'f')) ||		\
+     ((*(p) >= 'A') && (*(p) <= 'F')))
 
 /*
  *    sub-delims    = "!" / "$" / "&" / "'" / "(" / ")"
  *                     / "*" / "+" / "," / ";" / "="
  */
 #define ISA_SUB_DELIM(p)						\
-      (((*(p) == '!')) || ((*(p) == '$')) || ((*(p) == '&')) ||		\
-       ((*(p) == '(')) || ((*(p) == ')')) || ((*(p) == '*')) ||		\
-       ((*(p) == '+')) || ((*(p) == ',')) || ((*(p) == ';')) ||		\
-       ((*(p) == '=')) || ((*(p) == '\'')))
+    (((*(p) == '!')) || ((*(p) == '$')) || ((*(p) == '&')) ||		\
+     ((*(p) == '(')) || ((*(p) == ')')) || ((*(p) == '*')) ||		\
+     ((*(p) == '+')) || ((*(p) == ',')) || ((*(p) == ';')) ||		\
+     ((*(p) == '=')) || ((*(p) == '\'')))
 
 /*
  *    gen-delims    = ":" / "/" / "?" / "#" / "[" / "]" / "@"
  */
 #define ISA_GEN_DELIM(p)						\
-      (((*(p) == ':')) || ((*(p) == '/')) || ((*(p) == '?')) ||         \
-       ((*(p) == '#')) || ((*(p) == '[')) || ((*(p) == ']')) ||         \
-       ((*(p) == '@')))
+    (((*(p) == ':')) || ((*(p) == '/')) || ((*(p) == '?')) ||         \
+     ((*(p) == '#')) || ((*(p) == '[')) || ((*(p) == ']')) ||         \
+     ((*(p) == '@')))
 
 /*
  *    reserved      = gen-delims / sub-delims
@@ -182,21 +182,21 @@ static void uri_clean(URI *uri);
  *    unreserved    = ALPHA / DIGIT / "-" / "." / "_" / "~"
  */
 #define ISA_UNRESERVED(p)						\
-      ((ISA_ALPHA(p)) || (ISA_DIGIT(p)) || ((*(p) == '-')) ||		\
-       ((*(p) == '.')) || ((*(p) == '_')) || ((*(p) == '~')))
+    ((ISA_ALPHA(p)) || (ISA_DIGIT(p)) || ((*(p) == '-')) ||		\
+     ((*(p) == '.')) || ((*(p) == '_')) || ((*(p) == '~')))
 
 /*
  *    pct-encoded   = "%" HEXDIG HEXDIG
  */
 #define ISA_PCT_ENCODED(p)						\
-     ((*(p) == '%') && (ISA_HEXDIG(p + 1)) && (ISA_HEXDIG(p + 2)))
+    ((*(p) == '%') && (ISA_HEXDIG(p + 1)) && (ISA_HEXDIG(p + 2)))
 
 /*
  *    pchar         = unreserved / pct-encoded / sub-delims / ":" / "@"
  */
 #define ISA_PCHAR(p)							\
-     (ISA_UNRESERVED(p) || ISA_PCT_ENCODED(p) || ISA_SUB_DELIM(p) ||	\
-      ((*(p) == ':')) || ((*(p) == '@')))
+    (ISA_UNRESERVED(p) || ISA_PCT_ENCODED(p) || ISA_SUB_DELIM(p) ||	\
+     ((*(p) == ':')) || ((*(p) == '@')))
 
 /**
  * rfc3986_parse_scheme:
@@ -214,17 +214,17 @@ rfc3986_parse_scheme(URI *uri, const char **str) {
     const char *cur;
 
     if (str == NULL)
-	return(-1);
+        return(-1);
 
     cur = *str;
     if (!ISA_ALPHA(cur))
-	return(2);
+        return(2);
     cur++;
     while (ISA_ALPHA(cur) || ISA_DIGIT(cur) ||
-           (*cur == '+') || (*cur == '-') || (*cur == '.')) cur++;
+            (*cur == '+') || (*cur == '-') || (*cur == '.')) cur++;
     if (uri != NULL) {
         g_free(uri->scheme);
-	uri->scheme = g_strndup(*str, cur - *str);
+        uri->scheme = g_strndup(*str, cur - *str);
     }
     *str = cur;
     return(0);
@@ -245,7 +245,7 @@ rfc3986_parse_scheme(URI *uri, const char **str) {
  *
  * Returns 0 or the error code
  */
-static int
+    static int
 rfc3986_parse_fragment(URI *uri, const char **str)
 {
     const char *cur;
@@ -256,15 +256,15 @@ rfc3986_parse_fragment(URI *uri, const char **str)
     cur = *str;
 
     while ((ISA_PCHAR(cur)) || (*cur == '/') || (*cur == '?') ||
-           (*cur == '[') || (*cur == ']') ||
-           ((uri != NULL) && (uri->cleanup & 1) && (IS_UNWISE(cur))))
+            (*cur == '[') || (*cur == ']') ||
+            ((uri != NULL) && (uri->cleanup & 1) && (IS_UNWISE(cur))))
         NEXT(cur);
     if (uri != NULL) {
         g_free(uri->fragment);
-	if (uri->cleanup & 2)
-	    uri->fragment = g_strndup(*str, cur - *str);
-	else
-	    uri->fragment = uri_string_unescape(*str, cur - *str, NULL);
+        if (uri->cleanup & 2)
+            uri->fragment = g_strndup(*str, cur - *str);
+        else
+            uri->fragment = uri_string_unescape(*str, cur - *str, NULL);
     }
     *str = cur;
     return (0);
@@ -281,7 +281,7 @@ rfc3986_parse_fragment(URI *uri, const char **str)
  *
  * Returns 0 or the error code
  */
-static int
+    static int
 rfc3986_parse_query(URI *uri, const char **str)
 {
     const char *cur;
@@ -292,11 +292,11 @@ rfc3986_parse_query(URI *uri, const char **str)
     cur = *str;
 
     while ((ISA_PCHAR(cur)) || (*cur == '/') || (*cur == '?') ||
-           ((uri != NULL) && (uri->cleanup & 1) && (IS_UNWISE(cur))))
+            ((uri != NULL) && (uri->cleanup & 1) && (IS_UNWISE(cur))))
         NEXT(cur);
     if (uri != NULL) {
         g_free(uri->query);
-	uri->query = g_strndup (*str, cur - *str);
+        uri->query = g_strndup (*str, cur - *str);
     }
     *str = cur;
     return (0);
@@ -314,7 +314,7 @@ rfc3986_parse_query(URI *uri, const char **str)
  *
  * Returns 0 or the error code
  */
-static int
+    static int
 rfc3986_parse_port(URI *uri, const char **str)
 {
     const char *cur = *str;
@@ -349,25 +349,25 @@ rfc3986_parse_port(URI *uri, const char **str)
  *
  * Returns 0 or the error code
  */
-static int
+    static int
 rfc3986_parse_user_info(URI *uri, const char **str)
 {
     const char *cur;
 
     cur = *str;
     while (ISA_UNRESERVED(cur) || ISA_PCT_ENCODED(cur) ||
-           ISA_SUB_DELIM(cur) || (*cur == ':'))
-	NEXT(cur);
+            ISA_SUB_DELIM(cur) || (*cur == ':'))
+        NEXT(cur);
     if (*cur == '@') {
-	if (uri != NULL) {
+        if (uri != NULL) {
             g_free(uri->user);
-	    if (uri->cleanup & 2)
-		uri->user = g_strndup(*str, cur - *str);
-	    else
-		uri->user = uri_string_unescape(*str, cur - *str, NULL);
-	}
-	*str = cur;
-	return(0);
+            if (uri->cleanup & 2)
+                uri->user = g_strndup(*str, cur - *str);
+            else
+                uri->user = uri_string_unescape(*str, cur - *str, NULL);
+        }
+        *str = cur;
+        return(0);
     }
     return(1);
 }
@@ -393,17 +393,17 @@ rfc3986_parse_dec_octet(const char **str) {
     if (!(ISA_DIGIT(cur)))
         return(1);
     if (!ISA_DIGIT(cur+1))
-	cur++;
+        cur++;
     else if ((*cur != '0') && (ISA_DIGIT(cur + 1)) && (!ISA_DIGIT(cur+2)))
-	cur += 2;
+        cur += 2;
     else if ((*cur == '1') && (ISA_DIGIT(cur + 1)) && (ISA_DIGIT(cur + 2)))
-	cur += 3;
+        cur += 3;
     else if ((*cur == '2') && (*(cur + 1) >= '0') &&
-	     (*(cur + 1) <= '4') && (ISA_DIGIT(cur + 2)))
-	cur += 3;
+            (*(cur + 1) <= '4') && (ISA_DIGIT(cur + 2)))
+        cur += 3;
     else if ((*cur == '2') && (*(cur + 1) == '5') &&
-	     (*(cur + 2) >= '0') && (*(cur + 1) <= '5'))
-	cur += 3;
+            (*(cur + 2) >= '0') && (*(cur + 1) <= '5'))
+        cur += 3;
     else
         return(1);
     *str = cur;
@@ -424,7 +424,7 @@ rfc3986_parse_dec_octet(const char **str) {
  *
  * Returns 0 or the error code
  */
-static int
+    static int
 rfc3986_parse_host(URI *uri, const char **str)
 {
     const char *cur = *str;
@@ -436,33 +436,33 @@ rfc3986_parse_host(URI *uri, const char **str)
      */
     if (*cur == '[') {
         cur++;
-	while ((*cur != ']') && (*cur != 0))
-	    cur++;
-	if (*cur != ']')
-	    return(1);
-	cur++;
-	goto found;
+        while ((*cur != ']') && (*cur != 0))
+            cur++;
+        if (*cur != ']')
+            return(1);
+        cur++;
+        goto found;
     }
     /*
      * try to parse an IPv4
      */
     if (ISA_DIGIT(cur)) {
         if (rfc3986_parse_dec_octet(&cur) != 0)
-	    goto not_ipv4;
-	if (*cur != '.')
-	    goto not_ipv4;
-	cur++;
+            goto not_ipv4;
+        if (*cur != '.')
+            goto not_ipv4;
+        cur++;
         if (rfc3986_parse_dec_octet(&cur) != 0)
-	    goto not_ipv4;
-	if (*cur != '.')
-	    goto not_ipv4;
+            goto not_ipv4;
+        if (*cur != '.')
+            goto not_ipv4;
         if (rfc3986_parse_dec_octet(&cur) != 0)
-	    goto not_ipv4;
-	if (*cur != '.')
-	    goto not_ipv4;
+            goto not_ipv4;
+        if (*cur != '.')
+            goto not_ipv4;
         if (rfc3986_parse_dec_octet(&cur) != 0)
-	    goto not_ipv4;
-	goto found;
+            goto not_ipv4;
+        goto found;
 not_ipv4:
         cur = *str;
     }
@@ -474,15 +474,15 @@ not_ipv4:
 found:
     if (uri != NULL) {
         g_free(uri->authority);
-	uri->authority = NULL;
+        uri->authority = NULL;
         g_free(uri->server);
-	if (cur != host) {
-	    if (uri->cleanup & 2)
-		uri->server = g_strndup(host, cur - host);
-	    else
-		uri->server = uri_string_unescape(host, cur - host, NULL);
-	} else
-	    uri->server = NULL;
+        if (cur != host) {
+            if (uri->cleanup & 2)
+                uri->server = g_strndup(host, cur - host);
+            else
+                uri->server = uri_string_unescape(host, cur - host, NULL);
+        } else
+            uri->server = NULL;
     }
     *str = cur;
     return(0);
@@ -500,7 +500,7 @@ found:
  *
  * Returns 0 or the error code
  */
-static int
+    static int
 rfc3986_parse_authority(URI *uri, const char **str)
 {
     const char *cur;
@@ -520,7 +520,7 @@ rfc3986_parse_authority(URI *uri, const char **str)
     if (*cur == ':') {
         cur++;
         ret = rfc3986_parse_port(uri, &cur);
-	if (ret != 0) return(ret);
+        if (ret != 0) return(ret);
     }
     *str = cur;
     return(0);
@@ -542,7 +542,7 @@ rfc3986_parse_authority(URI *uri, const char **str)
  *
  * Returns 0 or the error code
  */
-static int
+    static int
 rfc3986_parse_segment(const char **str, char forbid, int empty)
 {
     const char *cur;
@@ -550,8 +550,8 @@ rfc3986_parse_segment(const char **str, char forbid, int empty)
     cur = *str;
     if (!ISA_PCHAR(cur)) {
         if (empty)
-	    return(0);
-	return(1);
+            return(0);
+        return(1);
     }
     while (ISA_PCHAR(cur) && (*cur != forbid))
         NEXT(cur);
@@ -571,7 +571,7 @@ rfc3986_parse_segment(const char **str, char forbid, int empty)
  *
  * Returns 0 or the error code
  */
-static int
+    static int
 rfc3986_parse_path_ab_empty(URI *uri, const char **str)
 {
     const char *cur;
@@ -581,8 +581,8 @@ rfc3986_parse_path_ab_empty(URI *uri, const char **str)
 
     while (*cur == '/') {
         cur++;
-	ret = rfc3986_parse_segment(&cur, 0, 1);
-	if (ret != 0) return(ret);
+        ret = rfc3986_parse_segment(&cur, 0, 1);
+        if (ret != 0) return(ret);
     }
     if (uri != NULL) {
         g_free(uri->path);
@@ -611,7 +611,7 @@ rfc3986_parse_path_ab_empty(URI *uri, const char **str)
  *
  * Returns 0 or the error code
  */
-static int
+    static int
 rfc3986_parse_path_absolute(URI *uri, const char **str)
 {
     const char *cur;
@@ -624,11 +624,11 @@ rfc3986_parse_path_absolute(URI *uri, const char **str)
     cur++;
     ret = rfc3986_parse_segment(&cur, 0, 0);
     if (ret == 0) {
-	while (*cur == '/') {
-	    cur++;
-	    ret = rfc3986_parse_segment(&cur, 0, 1);
-	    if (ret != 0) return(ret);
-	}
+        while (*cur == '/') {
+            cur++;
+            ret = rfc3986_parse_segment(&cur, 0, 1);
+            if (ret != 0) return(ret);
+        }
     }
     if (uri != NULL) {
         g_free(uri->path);
@@ -657,7 +657,7 @@ rfc3986_parse_path_absolute(URI *uri, const char **str)
  *
  * Returns 0 or the error code
  */
-static int
+    static int
 rfc3986_parse_path_rootless(URI *uri, const char **str)
 {
     const char *cur;
@@ -669,8 +669,8 @@ rfc3986_parse_path_rootless(URI *uri, const char **str)
     if (ret != 0) return(ret);
     while (*cur == '/') {
         cur++;
-	ret = rfc3986_parse_segment(&cur, 0, 1);
-	if (ret != 0) return(ret);
+        ret = rfc3986_parse_segment(&cur, 0, 1);
+        if (ret != 0) return(ret);
     }
     if (uri != NULL) {
         g_free(uri->path);
@@ -699,7 +699,7 @@ rfc3986_parse_path_rootless(URI *uri, const char **str)
  *
  * Returns 0 or the error code
  */
-static int
+    static int
 rfc3986_parse_path_no_scheme(URI *uri, const char **str)
 {
     const char *cur;
@@ -711,8 +711,8 @@ rfc3986_parse_path_no_scheme(URI *uri, const char **str)
     if (ret != 0) return(ret);
     while (*cur == '/') {
         cur++;
-	ret = rfc3986_parse_segment(&cur, 0, 1);
-	if (ret != 0) return(ret);
+        ret = rfc3986_parse_segment(&cur, 0, 1);
+        if (ret != 0) return(ret);
     }
     if (uri != NULL) {
         g_free(uri->path);
@@ -744,7 +744,7 @@ rfc3986_parse_path_no_scheme(URI *uri, const char **str)
  *
  * Returns 0 or the error code
  */
-static int
+    static int
 rfc3986_parse_hier_part(URI *uri, const char **str)
 {
     const char *cur;
@@ -754,24 +754,24 @@ rfc3986_parse_hier_part(URI *uri, const char **str)
 
     if ((*cur == '/') && (*(cur + 1) == '/')) {
         cur += 2;
-	ret = rfc3986_parse_authority(uri, &cur);
-	if (ret != 0) return(ret);
-	ret = rfc3986_parse_path_ab_empty(uri, &cur);
-	if (ret != 0) return(ret);
-	*str = cur;
-	return(0);
+        ret = rfc3986_parse_authority(uri, &cur);
+        if (ret != 0) return(ret);
+        ret = rfc3986_parse_path_ab_empty(uri, &cur);
+        if (ret != 0) return(ret);
+        *str = cur;
+        return(0);
     } else if (*cur == '/') {
         ret = rfc3986_parse_path_absolute(uri, &cur);
-	if (ret != 0) return(ret);
+        if (ret != 0) return(ret);
     } else if (ISA_PCHAR(cur)) {
         ret = rfc3986_parse_path_rootless(uri, &cur);
-	if (ret != 0) return(ret);
+        if (ret != 0) return(ret);
     } else {
-	/* path-empty is effectively empty */
-	if (uri != NULL) {
+        /* path-empty is effectively empty */
+        if (uri != NULL) {
             g_free(uri->path);
-	    uri->path = NULL;
-	}
+            uri->path = NULL;
+        }
     }
     *str = cur;
     return (0);
@@ -799,37 +799,37 @@ rfc3986_parse_relative_ref(URI *uri, const char *str) {
 
     if ((*str == '/') && (*(str + 1) == '/')) {
         str += 2;
-	ret = rfc3986_parse_authority(uri, &str);
-	if (ret != 0) return(ret);
-	ret = rfc3986_parse_path_ab_empty(uri, &str);
-	if (ret != 0) return(ret);
+        ret = rfc3986_parse_authority(uri, &str);
+        if (ret != 0) return(ret);
+        ret = rfc3986_parse_path_ab_empty(uri, &str);
+        if (ret != 0) return(ret);
     } else if (*str == '/') {
-	ret = rfc3986_parse_path_absolute(uri, &str);
-	if (ret != 0) return(ret);
+        ret = rfc3986_parse_path_absolute(uri, &str);
+        if (ret != 0) return(ret);
     } else if (ISA_PCHAR(str)) {
         ret = rfc3986_parse_path_no_scheme(uri, &str);
-	if (ret != 0) return(ret);
+        if (ret != 0) return(ret);
     } else {
-	/* path-empty is effectively empty */
-	if (uri != NULL) {
+        /* path-empty is effectively empty */
+        if (uri != NULL) {
             g_free(uri->path);
-	    uri->path = NULL;
-	}
+            uri->path = NULL;
+        }
     }
 
     if (*str == '?') {
-	str++;
-	ret = rfc3986_parse_query(uri, &str);
-	if (ret != 0) return(ret);
+        str++;
+        ret = rfc3986_parse_query(uri, &str);
+        if (ret != 0) return(ret);
     }
     if (*str == '#') {
-	str++;
-	ret = rfc3986_parse_fragment(uri, &str);
-	if (ret != 0) return(ret);
+        str++;
+        ret = rfc3986_parse_fragment(uri, &str);
+        if (ret != 0) return(ret);
     }
     if (*str != 0) {
-	uri_clean(uri);
-	return(1);
+        uri_clean(uri);
+        return(1);
     }
     return(0);
 }
@@ -854,24 +854,24 @@ rfc3986_parse(URI *uri, const char *str) {
     ret = rfc3986_parse_scheme(uri, &str);
     if (ret != 0) return(ret);
     if (*str != ':') {
-	return(1);
+        return(1);
     }
     str++;
     ret = rfc3986_parse_hier_part(uri, &str);
     if (ret != 0) return(ret);
     if (*str == '?') {
-	str++;
-	ret = rfc3986_parse_query(uri, &str);
-	if (ret != 0) return(ret);
+        str++;
+        ret = rfc3986_parse_query(uri, &str);
+        if (ret != 0) return(ret);
     }
     if (*str == '#') {
-	str++;
-	ret = rfc3986_parse_fragment(uri, &str);
-	if (ret != 0) return(ret);
+        str++;
+        ret = rfc3986_parse_fragment(uri, &str);
+        if (ret != 0) return(ret);
     }
     if (*str != 0) {
-	uri_clean(uri);
-	return(1);
+        uri_clean(uri);
+        return(1);
     }
     return(0);
 }
@@ -893,7 +893,7 @@ rfc3986_parse_uri_reference(URI *uri, const char *str) {
     int ret;
 
     if (str == NULL)
-	return(-1);
+        return(-1);
     uri_clean(uri);
 
     /*
@@ -902,12 +902,12 @@ rfc3986_parse_uri_reference(URI *uri, const char *str) {
      */
     ret = rfc3986_parse(uri, str);
     if (ret != 0) {
-	uri_clean(uri);
+        uri_clean(uri);
         ret = rfc3986_parse_relative_ref(uri, str);
-	if (ret != 0) {
-	    uri_clean(uri);
-	    return(ret);
-	}
+        if (ret != 0) {
+            uri_clean(uri);
+            return(ret);
+        }
     }
     return(0);
 }
@@ -928,7 +928,7 @@ uri_parse(const char *str) {
     int ret;
 
     if (str == NULL)
-	return(NULL);
+        return(NULL);
     uri = uri_new();
     ret = rfc3986_parse_uri_reference(uri, str);
     if (ret) {
@@ -972,7 +972,7 @@ uri_parse_raw(const char *str, int raw) {
     int ret;
 
     if (str == NULL)
-	return(NULL);
+        return(NULL);
     uri = uri_new();
     if (raw) {
         uri->cleanup |= 2;
@@ -1047,198 +1047,198 @@ uri_to_string(URI *uri) {
     len = 0;
 
     if (uri->scheme != NULL) {
-	p = uri->scheme;
-	while (*p != 0) {
-	    if (len >= max) {
+        p = uri->scheme;
+        while (*p != 0) {
+            if (len >= max) {
                 temp = realloc2n(ret, &max);
-		ret = temp;
-	    }
-	    ret[len++] = *p++;
-	}
-	if (len >= max) {
+                ret = temp;
+            }
+            ret[len++] = *p++;
+        }
+        if (len >= max) {
             temp = realloc2n(ret, &max);
             ret = temp;
-	}
-	ret[len++] = ':';
+        }
+        ret[len++] = ':';
     }
     if (uri->opaque != NULL) {
-	p = uri->opaque;
-	while (*p != 0) {
-	    if (len + 3 >= max) {
+        p = uri->opaque;
+        while (*p != 0) {
+            if (len + 3 >= max) {
                 temp = realloc2n(ret, &max);
                 ret = temp;
-	    }
-	    if (IS_RESERVED(*(p)) || IS_UNRESERVED(*(p)))
-		ret[len++] = *p++;
-	    else {
-		int val = *(unsigned char *)p++;
-		int hi = val / 0x10, lo = val % 0x10;
-		ret[len++] = '%';
-		ret[len++] = hi + (hi > 9? 'A'-10 : '0');
-		ret[len++] = lo + (lo > 9? 'A'-10 : '0');
-	    }
-	}
+            }
+            if (IS_RESERVED(*(p)) || IS_UNRESERVED(*(p)))
+                ret[len++] = *p++;
+            else {
+                int val = *(unsigned char *)p++;
+                int hi = val / 0x10, lo = val % 0x10;
+                ret[len++] = '%';
+                ret[len++] = hi + (hi > 9? 'A'-10 : '0');
+                ret[len++] = lo + (lo > 9? 'A'-10 : '0');
+            }
+        }
     } else {
-	if (uri->server != NULL) {
-	    if (len + 3 >= max) {
+        if (uri->server != NULL) {
+            if (len + 3 >= max) {
                 temp = realloc2n(ret, &max);
                 ret = temp;
-	    }
-	    ret[len++] = '/';
-	    ret[len++] = '/';
-	    if (uri->user != NULL) {
-		p = uri->user;
-		while (*p != 0) {
-		    if (len + 3 >= max) {
+            }
+            ret[len++] = '/';
+            ret[len++] = '/';
+            if (uri->user != NULL) {
+                p = uri->user;
+                while (*p != 0) {
+                    if (len + 3 >= max) {
                         temp = realloc2n(ret, &max);
                         ret = temp;
-		    }
-		    if ((IS_UNRESERVED(*(p))) ||
-			((*(p) == ';')) || ((*(p) == ':')) ||
-			((*(p) == '&')) || ((*(p) == '=')) ||
-			((*(p) == '+')) || ((*(p) == '$')) ||
-			((*(p) == ',')))
-			ret[len++] = *p++;
-		    else {
-			int val = *(unsigned char *)p++;
-			int hi = val / 0x10, lo = val % 0x10;
-			ret[len++] = '%';
-			ret[len++] = hi + (hi > 9? 'A'-10 : '0');
-			ret[len++] = lo + (lo > 9? 'A'-10 : '0');
-		    }
-		}
-		if (len + 3 >= max) {
+                    }
+                    if ((IS_UNRESERVED(*(p))) ||
+                            ((*(p) == ';')) || ((*(p) == ':')) ||
+                            ((*(p) == '&')) || ((*(p) == '=')) ||
+                            ((*(p) == '+')) || ((*(p) == '$')) ||
+                            ((*(p) == ',')))
+                        ret[len++] = *p++;
+                    else {
+                        int val = *(unsigned char *)p++;
+                        int hi = val / 0x10, lo = val % 0x10;
+                        ret[len++] = '%';
+                        ret[len++] = hi + (hi > 9? 'A'-10 : '0');
+                        ret[len++] = lo + (lo > 9? 'A'-10 : '0');
+                    }
+                }
+                if (len + 3 >= max) {
                     temp = realloc2n(ret, &max);
                     ret = temp;
-		}
-		ret[len++] = '@';
-	    }
-	    p = uri->server;
-	    while (*p != 0) {
-		if (len >= max) {
+                }
+                ret[len++] = '@';
+            }
+            p = uri->server;
+            while (*p != 0) {
+                if (len >= max) {
                     temp = realloc2n(ret, &max);
                     ret = temp;
-		}
-		ret[len++] = *p++;
-	    }
-	    if (uri->port > 0) {
-		if (len + 10 >= max) {
+                }
+                ret[len++] = *p++;
+            }
+            if (uri->port > 0) {
+                if (len + 10 >= max) {
                     temp = realloc2n(ret, &max);
                     ret = temp;
-		}
-		len += snprintf(&ret[len], max - len, ":%d", uri->port);
-	    }
-	} else if (uri->authority != NULL) {
-	    if (len + 3 >= max) {
+                }
+                len += snprintf(&ret[len], max - len, ":%d", uri->port);
+            }
+        } else if (uri->authority != NULL) {
+            if (len + 3 >= max) {
                 temp = realloc2n(ret, &max);
                 ret = temp;
-	    }
-	    ret[len++] = '/';
-	    ret[len++] = '/';
-	    p = uri->authority;
-	    while (*p != 0) {
-		if (len + 3 >= max) {
+            }
+            ret[len++] = '/';
+            ret[len++] = '/';
+            p = uri->authority;
+            while (*p != 0) {
+                if (len + 3 >= max) {
                     temp = realloc2n(ret, &max);
                     ret = temp;
-		}
-		if ((IS_UNRESERVED(*(p))) ||
-                    ((*(p) == '$')) || ((*(p) == ',')) || ((*(p) == ';')) ||
-                    ((*(p) == ':')) || ((*(p) == '@')) || ((*(p) == '&')) ||
-                    ((*(p) == '=')) || ((*(p) == '+')))
-		    ret[len++] = *p++;
-		else {
-		    int val = *(unsigned char *)p++;
-		    int hi = val / 0x10, lo = val % 0x10;
-		    ret[len++] = '%';
-		    ret[len++] = hi + (hi > 9? 'A'-10 : '0');
-		    ret[len++] = lo + (lo > 9? 'A'-10 : '0');
-		}
-	    }
-	} else if (uri->scheme != NULL) {
-	    if (len + 3 >= max) {
+                }
+                if ((IS_UNRESERVED(*(p))) ||
+                        ((*(p) == '$')) || ((*(p) == ',')) || ((*(p) == ';')) ||
+                        ((*(p) == ':')) || ((*(p) == '@')) || ((*(p) == '&')) ||
+                        ((*(p) == '=')) || ((*(p) == '+')))
+                    ret[len++] = *p++;
+                else {
+                    int val = *(unsigned char *)p++;
+                    int hi = val / 0x10, lo = val % 0x10;
+                    ret[len++] = '%';
+                    ret[len++] = hi + (hi > 9? 'A'-10 : '0');
+                    ret[len++] = lo + (lo > 9? 'A'-10 : '0');
+                }
+            }
+        } else if (uri->scheme != NULL) {
+            if (len + 3 >= max) {
                 temp = realloc2n(ret, &max);
                 ret = temp;
-	    }
-	    ret[len++] = '/';
-	    ret[len++] = '/';
-	}
-	if (uri->path != NULL) {
-	    p = uri->path;
-	    /*
-	     * the colon in file:///d: should not be escaped or
-	     * Windows accesses fail later.
-	     */
-	    if ((uri->scheme != NULL) &&
-		(p[0] == '/') &&
-		(((p[1] >= 'a') && (p[1] <= 'z')) ||
-		 ((p[1] >= 'A') && (p[1] <= 'Z'))) &&
-		(p[2] == ':') &&
-	        (!strcmp(uri->scheme, "file"))) {
-		if (len + 3 >= max) {
+            }
+            ret[len++] = '/';
+            ret[len++] = '/';
+        }
+        if (uri->path != NULL) {
+            p = uri->path;
+            /*
+             * the colon in file:///d: should not be escaped or
+             * Windows accesses fail later.
+             */
+            if ((uri->scheme != NULL) &&
+                    (p[0] == '/') &&
+                    (((p[1] >= 'a') && (p[1] <= 'z')) ||
+                     ((p[1] >= 'A') && (p[1] <= 'Z'))) &&
+                    (p[2] == ':') &&
+                    (!strcmp(uri->scheme, "file"))) {
+                if (len + 3 >= max) {
                     temp = realloc2n(ret, &max);
                     ret = temp;
-		}
-		ret[len++] = *p++;
-		ret[len++] = *p++;
-		ret[len++] = *p++;
-	    }
-	    while (*p != 0) {
-		if (len + 3 >= max) {
+                }
+                ret[len++] = *p++;
+                ret[len++] = *p++;
+                ret[len++] = *p++;
+            }
+            while (*p != 0) {
+                if (len + 3 >= max) {
                     temp = realloc2n(ret, &max);
                     ret = temp;
-		}
-		if ((IS_UNRESERVED(*(p))) || ((*(p) == '/')) ||
-                    ((*(p) == ';')) || ((*(p) == '@')) || ((*(p) == '&')) ||
-	            ((*(p) == '=')) || ((*(p) == '+')) || ((*(p) == '$')) ||
-	            ((*(p) == ',')))
-		    ret[len++] = *p++;
-		else {
-		    int val = *(unsigned char *)p++;
-		    int hi = val / 0x10, lo = val % 0x10;
-		    ret[len++] = '%';
-		    ret[len++] = hi + (hi > 9? 'A'-10 : '0');
-		    ret[len++] = lo + (lo > 9? 'A'-10 : '0');
-		}
-	    }
-	}
-	if (uri->query != NULL) {
-	    if (len + 1 >= max) {
+                }
+                if ((IS_UNRESERVED(*(p))) || ((*(p) == '/')) ||
+                        ((*(p) == ';')) || ((*(p) == '@')) || ((*(p) == '&')) ||
+                        ((*(p) == '=')) || ((*(p) == '+')) || ((*(p) == '$')) ||
+                        ((*(p) == ',')))
+                    ret[len++] = *p++;
+                else {
+                    int val = *(unsigned char *)p++;
+                    int hi = val / 0x10, lo = val % 0x10;
+                    ret[len++] = '%';
+                    ret[len++] = hi + (hi > 9? 'A'-10 : '0');
+                    ret[len++] = lo + (lo > 9? 'A'-10 : '0');
+                }
+            }
+        }
+        if (uri->query != NULL) {
+            if (len + 1 >= max) {
                 temp = realloc2n(ret, &max);
                 ret = temp;
-	    }
-	    ret[len++] = '?';
-	    p = uri->query;
-	    while (*p != 0) {
-		if (len + 1 >= max) {
+            }
+            ret[len++] = '?';
+            p = uri->query;
+            while (*p != 0) {
+                if (len + 1 >= max) {
                     temp = realloc2n(ret, &max);
                     ret = temp;
-		}
-		ret[len++] = *p++;
-	    }
-	}
+                }
+                ret[len++] = *p++;
+            }
+        }
     }
     if (uri->fragment != NULL) {
-	if (len + 3 >= max) {
+        if (len + 3 >= max) {
             temp = realloc2n(ret, &max);
             ret = temp;
-	}
-	ret[len++] = '#';
-	p = uri->fragment;
-	while (*p != 0) {
-	    if (len + 3 >= max) {
+        }
+        ret[len++] = '#';
+        p = uri->fragment;
+        while (*p != 0) {
+            if (len + 3 >= max) {
                 temp = realloc2n(ret, &max);
                 ret = temp;
-	    }
-	    if ((IS_UNRESERVED(*(p))) || (IS_RESERVED(*(p))))
-		ret[len++] = *p++;
-	    else {
-		int val = *(unsigned char *)p++;
-		int hi = val / 0x10, lo = val % 0x10;
-		ret[len++] = '%';
-		ret[len++] = hi + (hi > 9? 'A'-10 : '0');
-		ret[len++] = lo + (lo > 9? 'A'-10 : '0');
-	    }
-	}
+            }
+            if ((IS_UNRESERVED(*(p))) || (IS_RESERVED(*(p))))
+                ret[len++] = *p++;
+            else {
+                int val = *(unsigned char *)p++;
+                int hi = val / 0x10, lo = val % 0x10;
+                ret[len++] = '%';
+                ret[len++] = hi + (hi > 9? 'A'-10 : '0');
+                ret[len++] = lo + (lo > 9? 'A'-10 : '0');
+            }
+        }
     }
     if (len >= max) {
         temp = realloc2n(ret, &max);
@@ -1310,16 +1310,16 @@ normalize_uri_path(char *path) {
     char *cur, *out;
 
     if (path == NULL)
-	return(-1);
+        return(-1);
 
     /* Skip all initial "/" chars.  We want to get to the beginning of the
      * first non-empty segment.
      */
     cur = path;
     while (cur[0] == '/')
-      ++cur;
+        ++cur;
     if (cur[0] == '\0')
-      return(0);
+        return(0);
 
     /* Keep everything we've seen so far.  */
     out = cur;
@@ -1328,46 +1328,46 @@ normalize_uri_path(char *path) {
      * Analyze each segment in sequence for cases (c) and (d).
      */
     while (cur[0] != '\0') {
-	/*
-	 * c) All occurrences of "./", where "." is a complete path segment,
-	 *    are removed from the buffer string.
-	 */
-	if ((cur[0] == '.') && (cur[1] == '/')) {
-	    cur += 2;
-	    /* '//' normalization should be done at this point too */
-	    while (cur[0] == '/')
-		cur++;
-	    continue;
-	}
-
-	/*
-	 * d) If the buffer string ends with "." as a complete path segment,
-	 *    that "." is removed.
-	 */
-	if ((cur[0] == '.') && (cur[1] == '\0'))
-	    break;
-
-	/* Otherwise keep the segment.  */
-	while (cur[0] != '/') {
+        /*
+         * c) All occurrences of "./", where "." is a complete path segment,
+         *    are removed from the buffer string.
+         */
+        if ((cur[0] == '.') && (cur[1] == '/')) {
+            cur += 2;
+            /* '//' normalization should be done at this point too */
+            while (cur[0] == '/')
+                cur++;
+            continue;
+        }
+
+        /*
+         * d) If the buffer string ends with "." as a complete path segment,
+         *    that "." is removed.
+         */
+        if ((cur[0] == '.') && (cur[1] == '\0'))
+            break;
+
+        /* Otherwise keep the segment.  */
+        while (cur[0] != '/') {
             if (cur[0] == '\0')
-              goto done_cd;
-	    (out++)[0] = (cur++)[0];
-	}
-	/* nomalize // */
-	while ((cur[0] == '/') && (cur[1] == '/'))
-	    cur++;
+                goto done_cd;
+            (out++)[0] = (cur++)[0];
+        }
+        /* nomalize // */
+        while ((cur[0] == '/') && (cur[1] == '/'))
+            cur++;
 
         (out++)[0] = (cur++)[0];
     }
- done_cd:
+done_cd:
     out[0] = '\0';
 
     /* Reset to the beginning of the first segment for the next sequence.  */
     cur = path;
     while (cur[0] == '/')
-      ++cur;
+        ++cur;
     if (cur[0] == '\0')
-	return(0);
+        return(0);
 
     /*
      * Analyze each segment in sequence for cases (e) and (f).
@@ -1397,23 +1397,23 @@ normalize_uri_path(char *path) {
         /* Find the end of the current segment.  */
         segp = cur;
         while ((segp[0] != '/') && (segp[0] != '\0'))
-          ++segp;
+            ++segp;
 
         /* If this is the last segment, we're done (we need at least two
          * segments to meet the criteria for the (e) and (f) cases).
          */
         if (segp[0] == '\0')
-          break;
+            break;
 
         /* If the first segment is "..", or if the next segment _isn't_ "..",
          * keep this segment and try the next one.
          */
         ++segp;
         if (((cur[0] == '.') && (cur[1] == '.') && (segp == cur+3))
-            || ((segp[0] != '.') || (segp[1] != '.')
-                || ((segp[2] != '/') && (segp[2] != '\0')))) {
-          cur = segp;
-          continue;
+                || ((segp[0] != '.') || (segp[1] != '.')
+                    || ((segp[2] != '/') && (segp[2] != '\0')))) {
+            cur = segp;
+            continue;
         }
 
         /* If we get here, remove this segment and the next one and back up
@@ -1425,22 +1425,22 @@ normalize_uri_path(char *path) {
 
         /* If this is the end of the buffer, we're done.  */
         if (segp[2] == '\0') {
-          cur[0] = '\0';
-          break;
+            cur[0] = '\0';
+            break;
         }
         /* Valgrind complained, strcpy(cur, segp + 3); */
         /* string will overlap, do not use strcpy */
         tmp = cur;
         segp += 3;
         while ((*tmp++ = *segp++) != 0)
-          ;
+            ;
 
         /* If there are no previous segments, then keep going from here.  */
         segp = cur;
         while ((segp > path) && ((--segp)[0] == '/'))
-          ;
+            ;
         if (segp == path)
-          continue;
+            continue;
 
         /* "segp" is pointing to the end of a previous segment; find it's
          * start.  We need to back up to the previous segment and start
@@ -1451,7 +1451,7 @@ normalize_uri_path(char *path) {
          */
         cur = segp;
         while ((cur > path) && (cur[-1] != '/'))
-          --cur;
+            --cur;
     }
     out[0] = '\0';
 
@@ -1467,17 +1467,17 @@ normalize_uri_path(char *path) {
      * We discard them from the final path.
      */
     if (path[0] == '/') {
-      cur = path;
-      while ((cur[0] == '/') && (cur[1] == '.') && (cur[2] == '.')
-             && ((cur[3] == '/') || (cur[3] == '\0')))
-	cur += 3;
-
-      if (cur != path) {
-	out = path;
-	while (cur[0] != '\0')
-          (out++)[0] = (cur++)[0];
-	out[0] = 0;
-      }
+        cur = path;
+        while ((cur[0] == '/') && (cur[1] == '.') && (cur[2] == '.')
+                && ((cur[3] == '/') || (cur[3] == '\0')))
+            cur += 3;
+
+        if (cur != path) {
+            out = path;
+            while (cur[0] != '\0')
+                (out++)[0] = (cur++)[0];
+            out[0] = 0;
+        }
     }
 
     return(0);
@@ -1485,9 +1485,9 @@ normalize_uri_path(char *path) {
 
 static int is_hex(char c) {
     if (((c >= '0') && (c <= '9')) ||
-        ((c >= 'a') && (c <= 'f')) ||
-        ((c >= 'A') && (c <= 'F')))
-	return(1);
+            ((c >= 'a') && (c <= 'f')) ||
+            ((c >= 'A') && (c <= 'F')))
+        return(1);
     return(0);
 }
 
@@ -1512,39 +1512,39 @@ uri_string_unescape(const char *str, int len, char *target) {
     const char *in;
 
     if (str == NULL)
-	return(NULL);
+        return(NULL);
     if (len <= 0) len = strlen(str);
     if (len < 0) return(NULL);
 
     if (target == NULL) {
-	ret = g_malloc(len + 1);
+        ret = g_malloc(len + 1);
     } else
-	ret = target;
+        ret = target;
     in = str;
     out = ret;
     while(len > 0) {
-	if ((len > 2) && (*in == '%') && (is_hex(in[1])) && (is_hex(in[2]))) {
-	    in++;
-	    if ((*in >= '0') && (*in <= '9'))
-	        *out = (*in - '0');
-	    else if ((*in >= 'a') && (*in <= 'f'))
-	        *out = (*in - 'a') + 10;
-	    else if ((*in >= 'A') && (*in <= 'F'))
-	        *out = (*in - 'A') + 10;
-	    in++;
-	    if ((*in >= '0') && (*in <= '9'))
-	        *out = *out * 16 + (*in - '0');
-	    else if ((*in >= 'a') && (*in <= 'f'))
-	        *out = *out * 16 + (*in - 'a') + 10;
-	    else if ((*in >= 'A') && (*in <= 'F'))
-	        *out = *out * 16 + (*in - 'A') + 10;
-	    in++;
-	    len -= 3;
-	    out++;
-	} else {
-	    *out++ = *in++;
-	    len--;
-	}
+        if ((len > 2) && (*in == '%') && (is_hex(in[1])) && (is_hex(in[2]))) {
+            in++;
+            if ((*in >= '0') && (*in <= '9'))
+                *out = (*in - '0');
+            else if ((*in >= 'a') && (*in <= 'f'))
+                *out = (*in - 'a') + 10;
+            else if ((*in >= 'A') && (*in <= 'F'))
+                *out = (*in - 'A') + 10;
+            in++;
+            if ((*in >= '0') && (*in <= '9'))
+                *out = *out * 16 + (*in - '0');
+            else if ((*in >= 'a') && (*in <= 'f'))
+                *out = *out * 16 + (*in - 'a') + 10;
+            else if ((*in >= 'A') && (*in <= 'F'))
+                *out = *out * 16 + (*in - 'A') + 10;
+            in++;
+            len -= 3;
+            out++;
+        } else {
+            *out++ = *in++;
+            len--;
+        }
     }
     *out = 0;
     return(ret);
@@ -1568,9 +1568,9 @@ uri_string_escape(const char *str, const char *list) {
     int len, out;
 
     if (str == NULL)
-	return(NULL);
+        return(NULL);
     if (str[0] == 0)
-	return(g_strdup(str));
+        return(g_strdup(str));
     len = strlen(str);
     if (!(len > 0)) return(NULL);
 
@@ -1579,30 +1579,30 @@ uri_string_escape(const char *str, const char *list) {
     in = str;
     out = 0;
     while(*in != 0) {
-	if (len - out <= 3) {
+        if (len - out <= 3) {
             temp = realloc2n(ret, &len);
-	    ret = temp;
-	}
-
-	ch = *in;
-
-	if ((ch != '@') && (!IS_UNRESERVED(ch)) && (!strchr(list, ch))) {
-	    unsigned char val;
-	    ret[out++] = '%';
-	    val = ch >> 4;
-	    if (val <= 9)
-		ret[out++] = '0' + val;
-	    else
-		ret[out++] = 'A' + val - 0xA;
-	    val = ch & 0xF;
-	    if (val <= 9)
-		ret[out++] = '0' + val;
-	    else
-		ret[out++] = 'A' + val - 0xA;
-	    in++;
-	} else {
-	    ret[out++] = *in++;
-	}
+            ret = temp;
+        }
+
+        ch = *in;
+
+        if ((ch != '@') && (!IS_UNRESERVED(ch)) && (!strchr(list, ch))) {
+            unsigned char val;
+            ret[out++] = '%';
+            val = ch >> 4;
+            if (val <= 9)
+                ret[out++] = '0' + val;
+            else
+                ret[out++] = 'A' + val - 0xA;
+            val = ch & 0xF;
+            if (val <= 9)
+                ret[out++] = '0' + val;
+            else
+                ret[out++] = 'A' + val - 0xA;
+            in++;
+        } else {
+            ret[out++] = *in++;
+        }
 
     }
     ret[out] = 0;
@@ -1647,43 +1647,43 @@ uri_resolve(const char *uri, const char *base) {
      *    URI.  Should we do that here?
      */
     if (uri == NULL)
-	ret = -1;
+        ret = -1;
     else {
-	if (*uri) {
-	    ref = uri_new();
-	    ret = uri_parse_into(ref, uri);
-	}
-	else
-	    ret = 0;
+        if (*uri) {
+            ref = uri_new();
+            ret = uri_parse_into(ref, uri);
+        }
+        else
+            ret = 0;
     }
     if (ret != 0)
-	goto done;
+        goto done;
     if ((ref != NULL) && (ref->scheme != NULL)) {
-	/*
-	 * The URI is absolute don't modify.
-	 */
-	val = g_strdup(uri);
-	goto done;
+        /*
+         * The URI is absolute don't modify.
+         */
+        val = g_strdup(uri);
+        goto done;
     }
     if (base == NULL)
-	ret = -1;
+        ret = -1;
     else {
-	bas = uri_new();
-	ret = uri_parse_into(bas, base);
+        bas = uri_new();
+        ret = uri_parse_into(bas, base);
     }
     if (ret != 0) {
-	if (ref)
-	    val = uri_to_string(ref);
-	goto done;
+        if (ref)
+            val = uri_to_string(ref);
+        goto done;
     }
     if (ref == NULL) {
-	/*
-	 * the base fragment must be ignored
-	 */
+        /*
+         * the base fragment must be ignored
+         */
         g_free(bas->fragment);
         bas->fragment = NULL;
-	val = uri_to_string(bas);
-	goto done;
+        val = uri_to_string(bas);
+        goto done;
     }
 
     /*
@@ -1700,23 +1700,23 @@ uri_resolve(const char *uri, const char *base) {
      */
     res = uri_new();
     if ((ref->scheme == NULL) && (ref->path == NULL) &&
-	((ref->authority == NULL) && (ref->server == NULL))) {
+            ((ref->authority == NULL) && (ref->server == NULL))) {
         res->scheme = g_strdup(bas->scheme);
-	if (bas->authority != NULL)
-	    res->authority = g_strdup(bas->authority);
-	else if (bas->server != NULL) {
+        if (bas->authority != NULL)
+            res->authority = g_strdup(bas->authority);
+        else if (bas->server != NULL) {
             res->server = g_strdup(bas->server);
             res->user = g_strdup(bas->user);
             res->port = bas->port;
-	}
+        }
         res->path = g_strdup(bas->path);
         if (ref->query != NULL) {
-	    res->query = g_strdup (ref->query);
+            res->query = g_strdup (ref->query);
         } else {
             res->query = g_strdup(bas->query);
         }
         res->fragment = g_strdup(ref->fragment);
-	goto step_7;
+        goto step_7;
     }
 
     /*
@@ -1726,8 +1726,8 @@ uri_resolve(const char *uri, const char *base) {
      *    scheme is inherited from the base URI's scheme component.
      */
     if (ref->scheme != NULL) {
-	val = uri_to_string(ref);
-	goto done;
+        val = uri_to_string(ref);
+        goto done;
     }
     res->scheme = g_strdup(bas->scheme);
 
@@ -1742,22 +1742,22 @@ uri_resolve(const char *uri, const char *base) {
      *    use an authority component.
      */
     if ((ref->authority != NULL) || (ref->server != NULL)) {
-	if (ref->authority != NULL)
-	    res->authority = g_strdup(ref->authority);
-	else {
-	    res->server = g_strdup(ref->server);
+        if (ref->authority != NULL)
+            res->authority = g_strdup(ref->authority);
+        else {
+            res->server = g_strdup(ref->server);
             res->user = g_strdup(ref->user);
             res->port = ref->port;
-	}
+        }
         res->path = g_strdup(ref->path);
-	goto step_7;
+        goto step_7;
     }
     if (bas->authority != NULL)
-	res->authority = g_strdup(bas->authority);
+        res->authority = g_strdup(bas->authority);
     else if (bas->server != NULL) {
         res->server = g_strdup(bas->server);
         res->user = g_strdup(bas->user);
-	res->port = bas->port;
+        res->port = bas->port;
     }
 
     /*
@@ -1765,8 +1765,8 @@ uri_resolve(const char *uri, const char *base) {
      *    the reference is an absolute-path and we skip to step 7.
      */
     if ((ref->path != NULL) && (ref->path[0] == '/')) {
-	res->path = g_strdup(ref->path);
-	goto step_7;
+        res->path = g_strdup(ref->path);
+        goto step_7;
     }
 
 
@@ -1780,9 +1780,9 @@ uri_resolve(const char *uri, const char *base) {
      */
     len = 2; /* extra / and 0 */
     if (ref->path != NULL)
-	len += strlen(ref->path);
+        len += strlen(ref->path);
     if (bas->path != NULL)
-	len += strlen(bas->path);
+        len += strlen(bas->path);
     res->path = g_malloc(len);
     res->path[0] = 0;
 
@@ -1794,18 +1794,18 @@ uri_resolve(const char *uri, const char *base) {
     cur = 0;
     out = 0;
     if (bas->path != NULL) {
-	while (bas->path[cur] != 0) {
-	    while ((bas->path[cur] != 0) && (bas->path[cur] != '/'))
-		cur++;
-	    if (bas->path[cur] == 0)
-		break;
-
-	    cur++;
-	    while (out < cur) {
-		res->path[out] = bas->path[out];
-		out++;
-	    }
-	}
+        while (bas->path[cur] != 0) {
+            while ((bas->path[cur] != 0) && (bas->path[cur] != '/'))
+                cur++;
+            if (bas->path[cur] == 0)
+                break;
+
+            cur++;
+            while (out < cur) {
+                res->path[out] = bas->path[out];
+                out++;
+            }
+        }
     }
     res->path[out] = 0;
 
@@ -1814,15 +1814,15 @@ uri_resolve(const char *uri, const char *base) {
      *    string.
      */
     if (ref->path != NULL && ref->path[0] != 0) {
-	indx = 0;
-	/*
-	 * Ensure the path includes a '/'
-	 */
-	if ((out == 0) && (bas->server != NULL))
-	    res->path[out++] = '/';
-	while (ref->path[indx] != 0) {
-	    res->path[out++] = ref->path[indx++];
-	}
+        indx = 0;
+        /*
+         * Ensure the path includes a '/'
+         */
+        if ((out == 0) && (bas->server != NULL))
+            res->path[out++] = '/';
+        while (ref->path[indx] != 0) {
+            res->path[out++] = ref->path[indx++];
+        }
     }
     res->path[out] = 0;
 
@@ -1842,11 +1842,11 @@ step_7:
 
 done:
     if (ref != NULL)
-	uri_free(ref);
+        uri_free(ref);
     if (bas != NULL)
-	uri_free(bas);
+        uri_free(bas);
     if (res != NULL)
-	uri_free(res);
+        uri_free(res);
     return(val);
 }
 
@@ -1882,7 +1882,7 @@ done:
  * Returns a new URI string (to be freed by the caller) or NULL in case
  * error.
  */
-char *
+    char *
 uri_resolve_relative (const char *uri, const char * base)
 {
     char *val = NULL;
@@ -1897,7 +1897,7 @@ uri_resolve_relative (const char *uri, const char * base)
     int remove_path = 0;
 
     if ((uri == NULL) || (*uri == 0))
-	return NULL;
+        return NULL;
 
     /*
      * First parse URI into a standard form
@@ -1905,50 +1905,50 @@ uri_resolve_relative (const char *uri, const char * base)
     ref = uri_new ();
     /* If URI not already in "relative" form */
     if (uri[0] != '.') {
-	ret = uri_parse_into (ref, uri);
-	if (ret != 0)
-	    goto done;		/* Error in URI, return NULL */
+        ret = uri_parse_into (ref, uri);
+        if (ret != 0)
+            goto done;		/* Error in URI, return NULL */
     } else
-	ref->path = g_strdup(uri);
+        ref->path = g_strdup(uri);
 
     /*
      * Next parse base into the same standard form
      */
     if ((base == NULL) || (*base == 0)) {
-	val = g_strdup (uri);
-	goto done;
+        val = g_strdup (uri);
+        goto done;
     }
     bas = uri_new ();
     if (base[0] != '.') {
-	ret = uri_parse_into (bas, base);
-	if (ret != 0)
-	    goto done;		/* Error in base, return NULL */
+        ret = uri_parse_into (bas, base);
+        if (ret != 0)
+            goto done;		/* Error in base, return NULL */
     } else
-	bas->path = g_strdup(base);
+        bas->path = g_strdup(base);
 
     /*
      * If the scheme / server on the URI differs from the base,
      * just return the URI
      */
     if ((ref->scheme != NULL) &&
-	((bas->scheme == NULL) ||
-	 (strcmp (bas->scheme, ref->scheme)) ||
-	 (strcmp (bas->server, ref->server)))) {
-	val = g_strdup (uri);
-	goto done;
+            ((bas->scheme == NULL) ||
+             (strcmp (bas->scheme, ref->scheme)) ||
+             (strcmp (bas->server, ref->server)))) {
+        val = g_strdup (uri);
+        goto done;
     }
     if (bas->path == ref->path ||
-        (bas->path && ref->path && !strcmp(bas->path, ref->path))) {
-	val = g_strdup("");
-	goto done;
+            (bas->path && ref->path && !strcmp(bas->path, ref->path))) {
+        val = g_strdup("");
+        goto done;
     }
     if (bas->path == NULL) {
-	val = g_strdup(ref->path);
-	goto done;
+        val = g_strdup(ref->path);
+        goto done;
     }
     if (ref->path == NULL) {
         ref->path = (char *) "/";
-	remove_path = 1;
+        remove_path = 1;
     }
 
     /*
@@ -1958,78 +1958,78 @@ uri_resolve_relative (const char *uri, const char * base)
      * two path components may be missing (bug 316224)
      */
     if (bas->path == NULL) {
-	if (ref->path != NULL) {
-	    uptr = ref->path;
-	    if (*uptr == '/')
-		uptr++;
-	    /* exception characters from uri_to_string */
-	    val = uri_string_escape(uptr, "/;&=+$,");
-	}
-	goto done;
+        if (ref->path != NULL) {
+            uptr = ref->path;
+            if (*uptr == '/')
+                uptr++;
+            /* exception characters from uri_to_string */
+            val = uri_string_escape(uptr, "/;&=+$,");
+        }
+        goto done;
     }
     bptr = bas->path;
     if (ref->path == NULL) {
-	for (ix = 0; bptr[ix] != 0; ix++) {
-	    if (bptr[ix] == '/')
-		nbslash++;
-	}
-	uptr = NULL;
-	len = 1;	/* this is for a string terminator only */
+        for (ix = 0; bptr[ix] != 0; ix++) {
+            if (bptr[ix] == '/')
+                nbslash++;
+        }
+        uptr = NULL;
+        len = 1;	/* this is for a string terminator only */
     } else {
-    /*
-     * Next we compare the two strings and find where they first differ
-     */
-	if ((ref->path[pos] == '.') && (ref->path[pos+1] == '/'))
+        /*
+         * Next we compare the two strings and find where they first differ
+         */
+        if ((ref->path[pos] == '.') && (ref->path[pos+1] == '/'))
             pos += 2;
-	if ((*bptr == '.') && (bptr[1] == '/'))
+        if ((*bptr == '.') && (bptr[1] == '/'))
             bptr += 2;
-	else if ((*bptr == '/') && (ref->path[pos] != '/'))
-	    bptr++;
-	while ((bptr[pos] == ref->path[pos]) && (bptr[pos] != 0))
-	    pos++;
-
-	if (bptr[pos] == ref->path[pos]) {
-	    val = g_strdup("");
-	    goto done;		/* (I can't imagine why anyone would do this) */
-	}
-
-	/*
-	 * In URI, "back up" to the last '/' encountered.  This will be the
-	 * beginning of the "unique" suffix of URI
-	 */
-	ix = pos;
-	if ((ref->path[ix] == '/') && (ix > 0))
-	    ix--;
-	else if ((ref->path[ix] == 0) && (ix > 1) && (ref->path[ix - 1] == '/'))
-	    ix -= 2;
-	for (; ix > 0; ix--) {
-	    if (ref->path[ix] == '/')
-		break;
-	}
-	if (ix == 0) {
-	    uptr = ref->path;
-	} else {
-	    ix++;
-	    uptr = &ref->path[ix];
-	}
-
-	/*
-	 * In base, count the number of '/' from the differing point
-	 */
-	if (bptr[pos] != ref->path[pos]) {/* check for trivial URI == base */
-	    for (; bptr[ix] != 0; ix++) {
-		if (bptr[ix] == '/')
-		    nbslash++;
-	    }
-	}
-	len = strlen (uptr) + 1;
+        else if ((*bptr == '/') && (ref->path[pos] != '/'))
+            bptr++;
+        while ((bptr[pos] == ref->path[pos]) && (bptr[pos] != 0))
+            pos++;
+
+        if (bptr[pos] == ref->path[pos]) {
+            val = g_strdup("");
+            goto done;		/* (I can't imagine why anyone would do this) */
+        }
+
+        /*
+         * In URI, "back up" to the last '/' encountered.  This will be the
+         * beginning of the "unique" suffix of URI
+         */
+        ix = pos;
+        if ((ref->path[ix] == '/') && (ix > 0))
+            ix--;
+        else if ((ref->path[ix] == 0) && (ix > 1) && (ref->path[ix - 1] == '/'))
+            ix -= 2;
+        for (; ix > 0; ix--) {
+            if (ref->path[ix] == '/')
+                break;
+        }
+        if (ix == 0) {
+            uptr = ref->path;
+        } else {
+            ix++;
+            uptr = &ref->path[ix];
+        }
+
+        /*
+         * In base, count the number of '/' from the differing point
+         */
+        if (bptr[pos] != ref->path[pos]) {/* check for trivial URI == base */
+            for (; bptr[ix] != 0; ix++) {
+                if (bptr[ix] == '/')
+                    nbslash++;
+            }
+        }
+        len = strlen (uptr) + 1;
     }
 
     if (nbslash == 0) {
-	if (uptr != NULL)
-	    /* exception characters from uri_to_string */
-	    val = uri_string_escape(uptr, "/;&=+$,");
-	goto done;
+        if (uptr != NULL)
+            /* exception characters from uri_to_string */
+            val = uri_string_escape(uptr, "/;&=+$,");
+        goto done;
     }
 
     /*
@@ -2043,29 +2043,29 @@ uri_resolve_relative (const char *uri, const char * base)
      * Put in as many "../" as needed
      */
     for (; nbslash>0; nbslash--) {
-	*vptr++ = '.';
-	*vptr++ = '.';
-	*vptr++ = '/';
+        *vptr++ = '.';
+        *vptr++ = '.';
+        *vptr++ = '/';
     }
     /*
      * Finish up with the end of the URI
      */
     if (uptr != NULL) {
         if ((vptr > val) && (len > 0) &&
-	    (uptr[0] == '/') && (vptr[-1] == '/')) {
-	    memcpy (vptr, uptr + 1, len - 1);
-	    vptr[len - 2] = 0;
-	} else {
-	    memcpy (vptr, uptr, len);
-	    vptr[len - 1] = 0;
-	}
+                (uptr[0] == '/') && (vptr[-1] == '/')) {
+            memcpy (vptr, uptr + 1, len - 1);
+            vptr[len - 2] = 0;
+        } else {
+            memcpy (vptr, uptr, len);
+            vptr[len - 1] = 0;
+        }
     } else {
-	vptr[len - 1] = 0;
+        vptr[len - 1] = 0;
     }
 
     /* escape the freshly-built path */
     vptr = val;
-	/* exception characters from uri_to_string */
+    /* exception characters from uri_to_string */
     val = uri_string_escape(vptr, "/;&=+$,");
     g_free(vptr);
 
@@ -2076,9 +2076,9 @@ done:
     if (remove_path != 0)
         ref->path = NULL;
     if (ref != NULL)
-	uri_free (ref);
+        uri_free (ref);
     if (bas != NULL)
-	uri_free (bas);
+        uri_free (bas);
 
     return val;
 }
@@ -2087,7 +2087,7 @@ done:
  * Utility functions to help parse and assemble query strings.
  */
 
-struct QueryParams *
+    struct QueryParams *
 query_params_new (int init_alloc)
 {
     struct QueryParams *ps;
@@ -2105,9 +2105,9 @@ query_params_new (int init_alloc)
 /* Ensure there is space to store at least one more parameter
  * at the end of the set.
  */
-static int
+    static int
 query_params_append (struct QueryParams *ps,
-               const char *name, const char *value)
+        const char *name, const char *value)
 {
     if (ps->n >= ps->alloc) {
         ps->p = g_renew(QueryParam, ps->p, ps->alloc * 2);
@@ -2122,7 +2122,7 @@ query_params_append (struct QueryParams *ps,
     return 0;
 }
 
-void
+    void
 query_params_free (struct QueryParams *ps)
 {
     int i;
@@ -2135,7 +2135,7 @@ query_params_free (struct QueryParams *ps)
     g_free (ps);
 }
 
-struct QueryParams *
+    struct QueryParams *
 query_params_parse (const char *query)
 {
     struct QueryParams *ps;
@@ -2193,7 +2193,7 @@ query_params_parse (const char *query)
         g_free(name);
         g_free(value);
 
-    next:
+next:
         query = end;
         if (*query) query ++; /* skip '&' separator */
     }
-- 
2.7.4



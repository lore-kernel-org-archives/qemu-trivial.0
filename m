Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hAETa-00039G-6q
	for mharc-qemu-trivial@gnu.org; Sat, 30 Mar 2019 09:56:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jbi.octave@gmail.com>) id 1hAC6h-0001L9-Mp
	for qemu-trivial@nongnu.org; Sat, 30 Mar 2019 07:25:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jbi.octave@gmail.com>) id 1hAC6f-0007Qa-RV
	for qemu-trivial@nongnu.org; Sat, 30 Mar 2019 07:25:03 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38360)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jbi.octave@gmail.com>)
	id 1hAC6W-0007MW-Tu; Sat, 30 Mar 2019 07:24:55 -0400
Received: by mail-wm1-x32d.google.com with SMTP id w15so5681891wmc.3;
	Sat, 30 Mar 2019 04:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sgHFhszYL9yv26fQyl72MPdabXPI7Hfvm+f/6hiXvSs=;
	b=l0XdVhfFL9NcDXrZUZGJ/jcwcALkreRnxSlZRD6a1gqV3hdxXrUs01cf5gpjlI/waj
	uoa1bvYB178+cGU7UjfPB5i4oHtk5bLzMy4gjym5d55f7VolXBKt/h5UyTX5EjUsZ/d/
	4mMA++qftmIAqmlsRpH1cqBl+fskKrSVMSERUhhZLn5bVmrpx3hS6jxkJvmogKN87QFm
	XPCKermC2J1bhD68HJ3YN4Fz8EkEn4Ny6u2ZY4/36J3S9zK8FfnU4QvrMGQbYRVzNNe7
	TNmPcum6t6gfDGPqTacAXf8daAiHm7e3X880rnSMaTj80T8xzikgo0iVqF/Ggv4Hl9HL
	GY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sgHFhszYL9yv26fQyl72MPdabXPI7Hfvm+f/6hiXvSs=;
	b=HeAQYrOzpLryXunB50zEs4qk9v6bF7oe7ksb0OI56KkHKyFyOG/Snm/Y3eMbgg37Ps
	iIQUTR2whqRTZNO4czsJjSOcDpJrLACcjEX2ksnK0SkA5bfPG/9SRhiCVKZ4+UKmHxOR
	IHOhUoucE+6y8NdNg2SXrOr+LjYoqGggmHMlU90gtNkojrnL7tvYuVFt4/oPq9ZeKwZI
	7eFGC1NgfPnW+NgXOPptAY+jKX0QpW34RRT22gpL81rRzmXVUI8H5ZVf3RJNDIh8Aaqq
	bcvdnXSlKhsLbAhioT1L62IT/yG7n5DC4BsnCZP1cAftqHf/jRigOU2y6iw/E8+0RaNX
	+oKA==
X-Gm-Message-State: APjAAAXWvQw0p64AVbz9mTt8Ii9BvaFHoQjQBJT82fqxzDLQu60/HGFo
	qOj0blzujJ2T1mFHYoG9S4cpBYQ=
X-Google-Smtp-Source: APXvYqx+GpBww7NMQsrQKRbd7glMWyuLuVgb1DkS/14btVHKPkc4/7+wa5bHZbyzF1mnh0ZMTM42cg==
X-Received: by 2002:a1c:9e96:: with SMTP id h144mr6868059wme.33.1553945086995; 
	Sat, 30 Mar 2019 04:24:46 -0700 (PDT)
Received: from localhost.localdomain
	(cpc102034-bagu16-2-0-cust471.1-3.cable.virginm.net. [81.97.71.216])
	by smtp.gmail.com with ESMTPSA id
	r196sm4492268wmf.22.2019.03.30.04.24.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 30 Mar 2019 04:24:46 -0700 (PDT)
From: Jules Irenge <jbi.octave@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Sat, 30 Mar 2019 11:21:42 +0000
Message-Id: <20190330112142.14082-1-jbi.octave@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::32d
X-Mailman-Approved-At: Sat, 30 Mar 2019 09:56:48 -0400
Subject: [Qemu-trivial] [PATCH] util/readline: Add braces to fix checkpatch
 errors
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
X-List-Received-Date: Sat, 30 Mar 2019 11:25:05 -0000

Add braces to fix errors issued by checkpatch.pl tool
"ERROR: braces {} are necessary for all arms of this statement"
Within "util/readline.c" file
---
 util/readline.c | 50 ++++++++++++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/util/readline.c b/util/readline.c
index 3eb5a66dfc..a7672b51c1 100644
--- a/util/readline.c
+++ b/util/readline.c
@@ -54,8 +54,9 @@ static void readline_update(ReadLineState *rs)
         rs->cmd_buf[rs->cmd_buf_size] = '\0';
         if (rs->read_password) {
             len = strlen(rs->cmd_buf);
-            for (i = 0; i < len; i++)
+            for (i = 0; i < len; i++) {
                 rs->printf_func(rs->opaque, "*");
+            }
         } else {
             rs->printf_func(rs->opaque, "%s", rs->cmd_buf);
         }
@@ -178,13 +179,15 @@ static void readline_up_char(ReadLineState *rs)
 {
     int idx;
 
-    if (rs->hist_entry == 0)
+    if (rs->hist_entry == 0) {
         return;
+    }
     if (rs->hist_entry == -1) {
         /* Find latest entry */
         for (idx = 0; idx < READLINE_MAX_CMDS; idx++) {
-            if (rs->history[idx] == NULL)
+            if (rs->history[idx] == NULL) {
                 break;
+            }
         }
         rs->hist_entry = idx;
     }
@@ -198,8 +201,9 @@ static void readline_up_char(ReadLineState *rs)
 
 static void readline_down_char(ReadLineState *rs)
 {
-    if (rs->hist_entry == -1)
+    if (rs->hist_entry == -1) {
         return;
+    }
     if (rs->hist_entry < READLINE_MAX_CMDS - 1 &&
         rs->history[++rs->hist_entry] != NULL) {
         pstrcpy(rs->cmd_buf, sizeof(rs->cmd_buf),
@@ -216,8 +220,9 @@ static void readline_hist_add(ReadLineState *rs, const char *cmdline)
     char *hist_entry, *new_entry;
     int idx;
 
-    if (cmdline[0] == '\0')
+    if (cmdline[0] == '\0') {
         return;
+    }
     new_entry = NULL;
     if (rs->hist_entry != -1) {
         /* We were editing an existing history entry: replace it */
@@ -230,8 +235,9 @@ static void readline_hist_add(ReadLineState *rs, const char *cmdline)
     /* Search cmdline in history buffers */
     for (idx = 0; idx < READLINE_MAX_CMDS; idx++) {
         hist_entry = rs->history[idx];
-        if (hist_entry == NULL)
+        if (hist_entry == NULL) {
             break;
+        }
         if (strcmp(hist_entry, cmdline) == 0) {
         same_entry:
             new_entry = hist_entry;
@@ -240,8 +246,9 @@ static void readline_hist_add(ReadLineState *rs, const char *cmdline)
                     (READLINE_MAX_CMDS - (idx + 1)) * sizeof(char *));
             rs->history[READLINE_MAX_CMDS - 1] = NULL;
             for (; idx < READLINE_MAX_CMDS; idx++) {
-                if (rs->history[idx] == NULL)
+                if (rs->history[idx] == NULL) {
                     break;
+                }
             }
             break;
         }
@@ -254,8 +261,9 @@ static void readline_hist_add(ReadLineState *rs, const char *cmdline)
         rs->history[READLINE_MAX_CMDS - 1] = NULL;
         idx = READLINE_MAX_CMDS - 1;
     }
-    if (new_entry == NULL)
+    if (new_entry == NULL) {
         new_entry = g_strdup(cmdline);
+    }
     rs->history[idx] = new_entry;
     rs->hist_entry = -1;
 }
@@ -297,16 +305,18 @@ static void readline_completion(ReadLineState *rs)
     g_free(cmdline);
 
     /* no completion found */
-    if (rs->nb_completions <= 0)
+    if (rs->nb_completions <= 0) {
         return;
+    }
     if (rs->nb_completions == 1) {
         len = strlen(rs->completions[0]);
         for (i = rs->completion_index; i < len; i++) {
             readline_insert_char(rs, rs->completions[0][i]);
         }
         /* extra space for next argument. XXX: make it more generic */
-        if (len > 0 && rs->completions[0][len - 1] != '/')
+        if (len > 0 && rs->completions[0][len - 1] != '/') {
             readline_insert_char(rs, ' ');
+        }
     } else {
         qsort(rs->completions, rs->nb_completions, sizeof(char *),
               completion_comp);
@@ -318,25 +328,29 @@ static void readline_completion(ReadLineState *rs)
             if (i == 0) {
                 max_prefix = len;
             } else {
-                if (len < max_prefix)
+                if (len < max_prefix) {
                     max_prefix = len;
+                }
                 for (j = 0; j < max_prefix; j++) {
-                    if (rs->completions[i][j] != rs->completions[0][j])
+                    if (rs->completions[i][j] != rs->completions[0][j]) {
                         max_prefix = j;
+                    }
                 }
             }
-            if (len > max_width)
+            if (len > max_width) {
                 max_width = len;
+            }
         }
         if (max_prefix > 0)
             for (i = rs->completion_index; i < max_prefix; i++) {
                 readline_insert_char(rs, rs->completions[0][i]);
             }
         max_width += 2;
-        if (max_width < 10)
+        if (max_width < 10) {
             max_width = 10;
-        else if (max_width > 80)
+        } else if (max_width > 80) {
             max_width = 80;
+        }
         nb_cols = 80 / max_width;
         j = 0;
         for (i = 0; i < rs->nb_completions; i++) {
@@ -383,8 +397,9 @@ void readline_handle_byte(ReadLineState *rs, int ch)
         case 10:
         case 13:
             rs->cmd_buf[rs->cmd_buf_size] = '\0';
-            if (!rs->read_password)
+            if (!rs->read_password) {
                 readline_hist_add(rs, rs->cmd_buf);
+            }
             rs->printf_func(rs->opaque, "\n");
             rs->cmd_buf_index = 0;
             rs->cmd_buf_size = 0;
@@ -495,8 +510,9 @@ void readline_restart(ReadLineState *rs)
 
 const char *readline_get_history(ReadLineState *rs, unsigned int index)
 {
-    if (index >= READLINE_MAX_CMDS)
+    if (index >= READLINE_MAX_CMDS) {
         return NULL;
+    }
     return rs->history[index];
 }
 
-- 
2.20.1



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hAmvw-0004rW-B2
	for mharc-qemu-trivial@gnu.org; Sun, 31 Mar 2019 22:44:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jbi.octave@gmail.com>) id 1hAmvu-0004pR-4W
	for qemu-trivial@nongnu.org; Sun, 31 Mar 2019 22:44:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jbi.octave@gmail.com>) id 1hAmvt-00013F-06
	for qemu-trivial@nongnu.org; Sun, 31 Mar 2019 22:44:22 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33351)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jbi.octave@gmail.com>)
	id 1hAmvq-00011i-9J; Sun, 31 Mar 2019 22:44:18 -0400
Received: by mail-wr1-x432.google.com with SMTP id q1so9843611wrp.0;
	Sun, 31 Mar 2019 19:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=oc5KkzGTUSXzkK5jWJPTEx/xxqpOEDMbdCroayzZBdc=;
	b=dQpUfINarQjUCrKMwfxwyS+/qp0mOArh9ShPC+GZjBUyXgXO7YxOgG2zsOQfGE83rK
	M0Yk+kE2f7bbOO4SYUyKlXwc4JFX+5X2AYrnx89VQF1Ah8FpIyUCtU5BPT//ZsvFvrc8
	iNsrtIW1I0EvHfZi1qgPwTV63S8bkgPI7yqRbxGT5bWjiQMJ5KybTV3pLg/EpDq+YZjJ
	Ec+XGKFxHPjcHcX78mD9sKrzPFKS/cGBGcdq3lfK8/jrcf9/bknhCeVY1vxTHIb3RgCC
	iH4OfdeghYmxAzi/IJmsMScU643WlKaUNsGE33xFvBTX39Or9SwlOg14X909MrI0V3hA
	MTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oc5KkzGTUSXzkK5jWJPTEx/xxqpOEDMbdCroayzZBdc=;
	b=VM8ntKWm1/tDEkhe+5Ed7PVXA78Uq4LhR7c5eo5/zQEmiG2GU2oaBmfitwNj9gz0JV
	SS07ZXmI6uUCZ00D3eudVJEC1uwBBQmhlCAndS2jGzJwKuSJ99ESNUREK71d5tWzfv/Z
	mF+wZhwzsvUJS1dXH2BfZlwH/fybCr12BcAOFLRR66Hu3HCZurGkcaAI0XTv198kJCZ/
	Dju6Ei1QtXHDxk+qOi/XsMQLilolfWGNrGUBqsGmJAg6qLt11SwTzv6O3rRcsUXzhnc/
	fZXQqpQEp/+7KvBCiudZGmQaAUIqmQMaFSKzKCZsHGa2qIw5qQkqX1q2dS+R63MNmmxo
	sN/A==
X-Gm-Message-State: APjAAAV6NwE45VSjbOOWCjFprceZrxc/VBO8eUMT/ibeu/gVrvMX4khO
	ElIwXL7oUYOHAQtbCWAMoEAL/y0=
X-Google-Smtp-Source: APXvYqztYncETqygIuZTHOcD9Z1KPImXbDDNEksI6Fc34s2oNIil82zhTicq7/3KsUX91EtkBe7phw==
X-Received: by 2002:a5d:4750:: with SMTP id o16mr39284748wrs.206.1554086656961;
	Sun, 31 Mar 2019 19:44:16 -0700 (PDT)
Received: from ninjatsu.lan (host-2-103-80-5.as13285.net. [2.103.80.5])
	by smtp.gmail.com with ESMTPSA id
	s189sm13627048wmf.45.2019.03.31.19.44.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 31 Mar 2019 19:44:16 -0700 (PDT)
From: Jules Irenge <jbi.octave@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Mon,  1 Apr 2019 03:44:06 +0100
Message-Id: <20190401024406.10819-3-jbi.octave@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190401024406.10819-1-jbi.octave@gmail.com>
References: <20190401024406.10819-1-jbi.octave@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::432
Subject: [Qemu-trivial] [PATCH v2 2/2] util: readline: replace tab indent by
 four spaces to fix checkpatch errors
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
X-List-Received-Date: Mon, 01 Apr 2019 02:44:23 -0000

Replace tab indent by four spaces to fix errors issued by checkpatch.pl tool
"ERROR: code indent should never use tabs" within "util/readline.c" file.

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 util/readline.c | 98 ++++++++++++++++++++++++-------------------------
 1 file changed, 49 insertions(+), 49 deletions(-)

diff --git a/util/readline.c b/util/readline.c
index db399d3948..3eb5a66dfc 100644
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
         switch (ch) {
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
+            break;
         case 'D':
             readline_backward_char(rs);
             break;
-- 
2.20.1



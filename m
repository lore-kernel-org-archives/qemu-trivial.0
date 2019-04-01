Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hAmvy-0004tN-H3
	for mharc-qemu-trivial@gnu.org; Sun, 31 Mar 2019 22:44:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jbi.octave@gmail.com>) id 1hAmvu-0004pF-0q
	for qemu-trivial@nongnu.org; Sun, 31 Mar 2019 22:44:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jbi.octave@gmail.com>) id 1hAmvs-00013A-T9
	for qemu-trivial@nongnu.org; Sun, 31 Mar 2019 22:44:21 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39937)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jbi.octave@gmail.com>)
	id 1hAmvq-00011F-4p; Sun, 31 Mar 2019 22:44:18 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h4so9802000wre.7;
	Sun, 31 Mar 2019 19:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mmoYwXAvxBngo9UYLtD0IUN1Cc3w90XyrY4QAQCwS7s=;
	b=gQy9C0/NV04h/1oAKO3j6YBkuW97buMWyiRMNnwtjHP6zf5H6HE2QRWNAsBDVstLwZ
	Zr7NRFnow1JCUEHGAPxAPFAAOzlF9Lr9YMeZttFvK4lkf7ttYaFmElOVr7I7aqpQa6nQ
	8n4dNR7WPE0SZwdo3dUtFE4o7UPYu7SmN4QTX909wfFghWWNQfF1WfvQK5BdDk2aW9pS
	rTxEiGnSf1Nh1G5CwZ+0UrNkXHcmvH5hXhl6AEUL4XcTteU/OAL4LszpDViYm0sNsWbh
	I6bGwTQPPGfGPgVZocgWpXtzhKTR5o0D3J2CqC+oSGcvwYkThEjI30lYNI/QbxtS23NG
	Zlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mmoYwXAvxBngo9UYLtD0IUN1Cc3w90XyrY4QAQCwS7s=;
	b=NmvF9LLn8oGoV9/VUmL+de0Q1zgbtliqNqhn9ceJh4zvHDlzaTO32qhQK2qQEtGv+H
	Ok8HuQC/C4t/aAlXzTKsIwszKxT/w8KXgFCqlfMfte2qAbdXjqBjyzM2unYya8LUggsE
	1b24velf7ihqRGi/X3wE/5v/cmjWryn/OBz8D0K5T4O3DyR0XEMrsk8FvPaqyEHFtV+i
	c6oKwEWqoKpz6blfpCdP7QCOsXL3PASqG0oE65dMmDS68fISYIw+glbxTeJEdugIdgsE
	OcWiRYsEZ8UjZEHtO7GH09ODEFLPWvfB+fdKKQ+dxe6ZM8+cy8llXTzW11ZDXo16Sp9c
	FZfw==
X-Gm-Message-State: APjAAAVsuI8yhEkjRkAVGeh427dEVVmvJVKr6dismPBhdOEqhvtvWRH8
	B8MTI2CBKldpsA4DLB1MsJwZxG8=
X-Google-Smtp-Source: APXvYqz1QZ+cmtBkVQybgFH1fh+rS7mHfyZHTRNO1pUcWYWV3fna9I63sWIKl6JM9aOIDW4191wvOA==
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr39802002wrw.22.1554086655851; 
	Sun, 31 Mar 2019 19:44:15 -0700 (PDT)
Received: from ninjatsu.lan (host-2-103-80-5.as13285.net. [2.103.80.5])
	by smtp.gmail.com with ESMTPSA id
	s189sm13627048wmf.45.2019.03.31.19.44.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 31 Mar 2019 19:44:15 -0700 (PDT)
From: Jules Irenge <jbi.octave@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Mon,  1 Apr 2019 03:44:05 +0100
Message-Id: <20190401024406.10819-2-jbi.octave@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190401024406.10819-1-jbi.octave@gmail.com>
References: <20190401024406.10819-1-jbi.octave@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::42a
Subject: [Qemu-trivial] [PATCH v2 1/2] util/readline: add a space to fix
 errors by checkpatch tool
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

util/readline: add a space to fix errors reported by checkpatch.pl tool
"ERROR: space required before the open parenthesis"
"ERROR: space required after that ..."
within "util/redline.c" file

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 util/readline.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/util/readline.c b/util/readline.c
index ec91ee0fea..db399d3948 100644
--- a/util/readline.c
+++ b/util/readline.c
@@ -48,13 +48,13 @@ static void readline_update(ReadLineState *rs)
 
     if (rs->cmd_buf_size != rs->last_cmd_buf_size ||
         memcmp(rs->cmd_buf, rs->last_cmd_buf, rs->cmd_buf_size) != 0) {
-        for(i = 0; i < rs->last_cmd_buf_index; i++) {
+        for (i = 0; i < rs->last_cmd_buf_index; i++) {
             rs->printf_func(rs->opaque, "\033[D");
         }
         rs->cmd_buf[rs->cmd_buf_size] = '\0';
         if (rs->read_password) {
             len = strlen(rs->cmd_buf);
-            for(i = 0; i < len; i++)
+            for (i = 0; i < len; i++)
                 rs->printf_func(rs->opaque, "*");
         } else {
             rs->printf_func(rs->opaque, "%s", rs->cmd_buf);
@@ -67,12 +67,12 @@ static void readline_update(ReadLineState *rs)
     if (rs->cmd_buf_index != rs->last_cmd_buf_index) {
         delta = rs->cmd_buf_index - rs->last_cmd_buf_index;
         if (delta > 0) {
-            for(i = 0;i < delta; i++) {
+            for (i = 0; i < delta; i++) {
                 rs->printf_func(rs->opaque, "\033[C");
             }
         } else {
             delta = -delta;
-            for(i = 0;i < delta; i++) {
+            for (i = 0; i < delta; i++) {
                 rs->printf_func(rs->opaque, "\033[D");
             }
         }
@@ -301,7 +301,7 @@ static void readline_completion(ReadLineState *rs)
         return;
     if (rs->nb_completions == 1) {
         len = strlen(rs->completions[0]);
-        for(i = rs->completion_index; i < len; i++) {
+        for (i = rs->completion_index; i < len; i++) {
             readline_insert_char(rs, rs->completions[0][i]);
         }
         /* extra space for next argument. XXX: make it more generic */
@@ -312,15 +312,15 @@ static void readline_completion(ReadLineState *rs)
               completion_comp);
         rs->printf_func(rs->opaque, "\n");
         max_width = 0;
-        max_prefix = 0;	
-        for(i = 0; i < rs->nb_completions; i++) {
+        max_prefix = 0;
+        for (i = 0; i < rs->nb_completions; i++) {
             len = strlen(rs->completions[i]);
-            if (i==0) {
+            if (i == 0) {
                 max_prefix = len;
             } else {
                 if (len < max_prefix)
                     max_prefix = len;
-                for(j=0; j<max_prefix; j++) {
+                for (j = 0; j < max_prefix; j++) {
                     if (rs->completions[i][j] != rs->completions[0][j])
                         max_prefix = j;
                 }
@@ -328,8 +328,8 @@ static void readline_completion(ReadLineState *rs)
             if (len > max_width)
                 max_width = len;
         }
-        if (max_prefix > 0) 
-            for(i = rs->completion_index; i < max_prefix; i++) {
+        if (max_prefix > 0)
+            for (i = rs->completion_index; i < max_prefix; i++) {
                 readline_insert_char(rs, rs->completions[0][i]);
             }
         max_width += 2;
@@ -339,7 +339,7 @@ static void readline_completion(ReadLineState *rs)
             max_width = 80;
         nb_cols = 80 / max_width;
         j = 0;
-        for(i = 0; i < rs->nb_completions; i++) {
+        for (i = 0; i < rs->nb_completions; i++) {
             rs->printf_func(rs->opaque, "%-*s", max_width, rs->completions[i]);
             if (++j == nb_cols || i == (rs->nb_completions - 1)) {
                 rs->printf_func(rs->opaque, "\n");
@@ -362,9 +362,9 @@ static void readline_clear_screen(ReadLineState *rs)
 /* return true if command handled */
 void readline_handle_byte(ReadLineState *rs, int ch)
 {
-    switch(rs->esc_state) {
+    switch (rs->esc_state) {
     case IS_NORM:
-        switch(ch) {
+        switch (ch) {
         case 1:
             readline_bol(rs);
             break;
@@ -425,7 +425,7 @@ void readline_handle_byte(ReadLineState *rs, int ch)
         }
         break;
     case IS_CSI:
-        switch(ch) {
+        switch (ch) {
 	case 'A':
 	case 'F':
 	    readline_up_char(rs);
@@ -444,7 +444,7 @@ void readline_handle_byte(ReadLineState *rs, int ch)
             rs->esc_param = rs->esc_param * 10 + (ch - '0');
             goto the_end;
         case '~':
-            switch(rs->esc_param) {
+            switch (rs->esc_param) {
             case 1:
                 readline_bol(rs);
                 break;
@@ -463,7 +463,7 @@ void readline_handle_byte(ReadLineState *rs, int ch)
     the_end:
         break;
     case IS_SS3:
-        switch(ch) {
+        switch (ch) {
         case 'F':
             readline_eol(rs);
             break;
-- 
2.20.1



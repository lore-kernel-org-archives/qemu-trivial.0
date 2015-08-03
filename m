Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMBqB-0005tN-IB
	for mharc-qemu-trivial@gnu.org; Mon, 03 Aug 2015 05:15:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpv-0005QG-1a
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpq-0003Gp-I7
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:10 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:32841)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpq-0003Fj-DD
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:06 -0400
Received: by wicmv11 with SMTP id mv11so127065457wic.0
	for <qemu-trivial@nongnu.org>; Mon, 03 Aug 2015 02:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=azxQZtlRzlPvW1G+LI78OCUqwENVH+FG0V+M2ArObDk=;
	b=fyQydPwu45jgXSjkw0rD7AJ+gx1A9Dzn9yHxIZ+UNz0IkmkAEcFHz2Tmye5jhthUYB
	NzWwEyCLeieKq/16njxh5OeY0GNKGtRV949shAhmAIctuNunPJWAiHdGs7gbvQc1LzMp
	E81i+LTM3jXO9cx1YU8Hq9C+M+baIfW6uAAfTGD4JlRkj4SqZC9sJ0rsqqZWrsE4/inh
	dROLGo8LTkW/fpWn1F3yYpRxI6fOCWSKIQwyUNyuJJN9BZ6VEyoE/bJUMqsK5PplaRLe
	WP4Qi/ke5s0UF43rGSWDtdgxSPnOZaVzRkJ82Bm9CCgkmdEkwXuDpAWqWZI3aJkV1qBg
	BonQ==
X-Gm-Message-State: ALoCoQlM3PfdC18IPH7xqzyilBLgcsxHiqlAiA8RIGBPafweLOHBwlIRF1Fmq26aZ5e9PTrRniC6
X-Received: by 10.181.13.36 with SMTP id ev4mr32072115wid.65.1438593305874;
	Mon, 03 Aug 2015 02:15:05 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	gw7sm12524907wib.15.2015.08.03.02.15.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Aug 2015 02:15:04 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 98C133E0817;
	Mon,  3 Aug 2015 10:15:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  3 Aug 2015 10:14:46 +0100
Message-Id: <1438593291-27109-7-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, crosthwaitepeter@gmail.com, pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v4 06/11] qemu-log: support simple pid
	substitution in logfile
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
X-List-Received-Date: Mon, 03 Aug 2015 09:15:15 -0000

When debugging stuff that occurs over several forks it would be useful
not to keep overwriting the one logfile you've set-up. This allows a
simple %d to be included once in the logfile parameter which is
substituted with getpid().

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Leandro Dorileo <l@dorileo.org>
---
 qemu-log.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/qemu-log.c b/qemu-log.c
index 7036076..77ed7bc 100644
--- a/qemu-log.c
+++ b/qemu-log.c
@@ -70,11 +70,24 @@ void do_qemu_set_log(int log_flags, bool use_own_buffers)
         qemu_log_close();
     }
 }
-
+/*
+ * Allow the user to include %d in their logfile which will be
+ * substituted with the current PID. This is useful for debugging many
+ * nested linux-user tasks but will result in lots of logs.
+ */
 void qemu_set_log_filename(const char *filename)
 {
     g_free(logfilename);
-    logfilename = g_strdup(filename);
+    if (g_strrstr(filename, "%d")) {
+        /* if we are going to format this we'd better validate first */
+        if (g_regex_match_simple("^[^%]+%d[^%]+$", filename, 0, 0)) {
+            logfilename = g_strdup_printf(filename, getpid());
+        } else {
+            g_error("Bad logfile format: %s", filename);
+        }
+    } else {
+        logfilename = g_strdup(filename);
+    }
     qemu_log_close();
     qemu_set_log(qemu_loglevel);
 }
-- 
2.5.0



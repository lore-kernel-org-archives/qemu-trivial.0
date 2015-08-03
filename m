Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMBpz-0005Wc-3g
	for mharc-qemu-trivial@gnu.org; Mon, 03 Aug 2015 05:15:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBps-0005MY-0a
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpn-000375-GZ
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:07 -0400
Received: from mail-wi0-f177.google.com ([209.85.212.177]:36781)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpn-000365-BO
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:03 -0400
Received: by wicgj17 with SMTP id gj17so95860708wic.1
	for <qemu-trivial@nongnu.org>; Mon, 03 Aug 2015 02:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=4hEeoPCTuebvo9tv27IebC8tFs6EZBeg8/90Bs51WVs=;
	b=NIzqFPoyteuT0wHyMNsAifO+If+1eHEYbTfgaUHMCgoryc9Rs/I8jH1tCsAhqLIrFt
	lWzJr9IIb429bcByXH6/4wYFIQwDfON0dV7qj+nZo4qE8GvlPuvCiTuTvJsH9so4zk12
	XIAaJqOLOfRwEtgFufh3GqhHQp9tmjeRd49hYB8rvQu/EHGT9x77KyLn3rENjafoTMcC
	Ia5NGrMYQxBwrJfwTcThLhWI4n+yMQ/Era38YoL8LvJclLjiSkMRyzjUkrji0aOJ0v4/
	JoAdh1IWfIU8NXpFvvDxA45JNEuDb2z9BTs3c68//NAwUGSB+kO7Mxq4KPQrRwXGyxOf
	BasA==
X-Gm-Message-State: ALoCoQmioLPRLZyT4Ip2vV6NuI7MSTovQGvbFOZPpPY9e1/d8eUo3vTzkooHuaYxkVwX06uMdGDs
X-Received: by 10.194.23.36 with SMTP id j4mr31485163wjf.105.1438593302573;
	Mon, 03 Aug 2015 02:15:02 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	be9sm21840198wjb.26.2015.08.03.02.15.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Aug 2015 02:15:01 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 7432B3E07A7;
	Mon,  3 Aug 2015 10:15:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  3 Aug 2015 10:14:44 +0100
Message-Id: <1438593291-27109-5-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.177
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	crosthwaitepeter@gmail.com, pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v4 04/11] qemu-log: Avoid function call for
	disabled qemu_log_mask logging
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
X-List-Received-Date: Mon, 03 Aug 2015 09:15:10 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Make qemu_log_mask() a macro which only calls the function to
do the actual work if the logging is enabled. This avoids making
a function call in possible fast paths where logging is disabled.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Andreas Färber <afaerber@suse.de>

---
v4
  - fix s-o-b tags, add r-b tag
---
 include/qemu/log.h | 13 ++++++++++---
 qemu-log.c         | 11 -----------
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index f880e66..b80f8f5 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -65,10 +65,17 @@ qemu_log_vprintf(const char *fmt, va_list va)
     }
 }
 
-/* log only if a bit is set on the current loglevel mask
+/* log only if a bit is set on the current loglevel mask:
+ * @mask: bit to check in the mask
+ * @fmt: printf-style format string
+ * @args: optional arguments for format string
  */
-void GCC_FMT_ATTR(2, 3) qemu_log_mask(int mask, const char *fmt, ...);
-
+#define qemu_log_mask(MASK, FMT, ...)                   \
+    do {                                                \
+        if (unlikely(qemu_loglevel_mask(MASK))) {       \
+            qemu_log(FMT, ## __VA_ARGS__);              \
+        }                                               \
+    } while (0)
 
 /* Special cases: */
 
diff --git a/qemu-log.c b/qemu-log.c
index be8405e..7036076 100644
--- a/qemu-log.c
+++ b/qemu-log.c
@@ -36,17 +36,6 @@ void qemu_log(const char *fmt, ...)
     va_end(ap);
 }
 
-void qemu_log_mask(int mask, const char *fmt, ...)
-{
-    va_list ap;
-
-    va_start(ap, fmt);
-    if ((qemu_loglevel & mask) && qemu_logfile) {
-        vfprintf(qemu_logfile, fmt, ap);
-    }
-    va_end(ap);
-}
-
 /* enable or disable low levels log */
 void do_qemu_set_log(int log_flags, bool use_own_buffers)
 {
-- 
2.5.0



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoHR-0003Ah-Vx
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:27:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHP-0003A4-N4
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:27:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHN-0006jx-8q
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:27:43 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:38248)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHN-0006iF-15; Mon, 05 Mar 2018 06:27:41 -0500
Received: by mail-wm0-x242.google.com with SMTP id z9so14696322wmb.3;
	Mon, 05 Mar 2018 03:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AMTZI8m6TDBbItwK/iQFgTG5IvkoHkzqwgbwZshvyZk=;
	b=V82FCTxmWaBjqrh6UIyfHjH8Dbb2/NIa6V+CLAuVp+ZXMHbhZqsghL7YTRbofF8+vu
	jmxKCe6XZFSm3eY+vUx6qsK1ZrPtvywzoY5HEpbBKrmNmb+HwWI94sN+n1a8E771wf9Y
	XJQ4ePdFCb/qxQJYHtw+XgxmHhOIqUIZGZEO7w2V1nZfNHft+k8TOaEB6xx+/QbvKDKj
	H8W/rdZMVNd69U25gi8zSOQBwLOyY/Lt5KUPwYrxXYf0p9Writ0pnXq7+EuPKc2cHBYo
	GZ6aLX5/mJ5xnXekBZs9G8UIPJMuBhTzTxoxehwgqWl83cJ6fycSafzdPL6QRn7+2V8o
	tXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=AMTZI8m6TDBbItwK/iQFgTG5IvkoHkzqwgbwZshvyZk=;
	b=O3UXkRZ6RYOZOqoGWeY5+xd/LrJe+wNP933uKIxr4aHoy/WKLE+XoFQEwFdg/pmWLn
	0Fs9S8sBsmfKzHBsLknoh7jX88LGpLyWk6XyqFis5Gmf4aihsBgqs7Fl7KU9nssUaiM1
	oFRzUctwFJUN1728rujkuma0WZvGbeSj7w7t+EvUZOksgkzUCQ+DJXwIhMnD89fmQhQR
	ce3S0sbMkKsRqja6E28C+uGppEQbHLwZY15qNrF8fnm2wKQA4PSt8jlpYN7pF7Rxoz8a
	9R8BXsQZzproVwP0fwuUoT9MelAWREjizHWmcqlDbosz7az2SybeUPZIwblko6r0pM4x
	NwWg==
X-Gm-Message-State: AElRT7EeWP5ETaYWOeh7jg5seSKQ78quc43O68KDbnKUqVciJR9WfElk
	+5ZYUd3ed9plIh9Toa0oupJSx22b
X-Google-Smtp-Source: AG47ELvUpYeAdiV2C1ka2cYigTnB4kzMcVZ5thVTRPk46FWxQLBVlGc3732zqfnSQ6SsslGjKmhQIA==
X-Received: by 10.28.228.131 with SMTP id b125mr7540296wmh.153.1520249259813; 
	Mon, 05 Mar 2018 03:27:39 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.27.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:27:39 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Date: Mon,  5 Mar 2018 08:27:03 -0300
Message-Id: <20180305112732.26471-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: [Qemu-trivial] [PATCH v2 01/30] util/cutils: extract byte-based
 definitions into a new header: "qemu/cunits.h"
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
X-List-Received-Date: Mon, 05 Mar 2018 11:27:44 -0000

(added in 076b35b5a56)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/cunits.h | 11 +++++++++++
 include/qemu/cutils.h |  8 +-------
 2 files changed, 12 insertions(+), 7 deletions(-)
 create mode 100644 include/qemu/cunits.h

diff --git a/include/qemu/cunits.h b/include/qemu/cunits.h
new file mode 100644
index 0000000000..c0207b7611
--- /dev/null
+++ b/include/qemu/cunits.h
@@ -0,0 +1,11 @@
+#ifndef QEMU_CUNITS_H
+#define QEMU_CUNITS_H
+
+#define K_BYTE     (1ULL << 10)
+#define M_BYTE     (1ULL << 20)
+#define G_BYTE     (1ULL << 30)
+#define T_BYTE     (1ULL << 40)
+#define P_BYTE     (1ULL << 50)
+#define E_BYTE     (1ULL << 60)
+
+#endif
diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index f0878eaafa..01184a70b3 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -2,6 +2,7 @@
 #define QEMU_CUTILS_H
 
 #include "qemu/fprintf-fn.h"
+#include "qemu/cunits.h"
 
 /**
  * pstrcpy:
@@ -143,13 +144,6 @@ int qemu_strtosz(const char *nptr, char **end, uint64_t *result);
 int qemu_strtosz_MiB(const char *nptr, char **end, uint64_t *result);
 int qemu_strtosz_metric(const char *nptr, char **end, uint64_t *result);
 
-#define K_BYTE     (1ULL << 10)
-#define M_BYTE     (1ULL << 20)
-#define G_BYTE     (1ULL << 30)
-#define T_BYTE     (1ULL << 40)
-#define P_BYTE     (1ULL << 50)
-#define E_BYTE     (1ULL << 60)
-
 /* used to print char* safely */
 #define STR_OR_NULL(str) ((str) ? (str) : "null")
 
-- 
2.16.2



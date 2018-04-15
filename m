Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rJ7-0004S8-1m
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:43:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJ2-0004NB-Bz
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJ1-0000CD-Jo
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:36 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:39311)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJ1-0000Bs-G5; Sun, 15 Apr 2018 19:43:35 -0400
Received: by mail-qt0-x242.google.com with SMTP id l8so9744692qtp.6;
	Sun, 15 Apr 2018 16:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=T6c7bFY2Mv1dj+VQdDWGIjV+0Z5HuzXfO128OVM48I8=;
	b=QTMhohLyVNBsv+Xa9bwZpn/XCujBEgqew3bWzyIOMd9F9WQsFfXhpVifZKQsESOz+6
	OwynYysT2Q0051kkqc5iuChnnYvGEAKDHNsm85fBhstAHEzB6DD2Yqh2bc/L4a+AsSrM
	kewY5iGrR1etT69i5q2C0NbR8/7d+BA09ws6Megc4D9mcox5WJzyvBNy4xaBj0AO9z9w
	6UqGcXvfgBJSctR1LomUo6N93FeeQ2gLASBTyQeou8R935KUGDYFJabrUqbVqFEqoImk
	S50W2kiLsq9JqYWMz2Yp9YRrcL0y1rciYaOwVaHiUMcQ88lKDF1cxl/PootzEoZoNBfu
	LuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=T6c7bFY2Mv1dj+VQdDWGIjV+0Z5HuzXfO128OVM48I8=;
	b=DKcdmGQp5QXwLZPNRch8rY5LDYEetQdFnxTHkx0noWplw2dgIXXRHKzB/iAY6OH3NR
	uZk53q5hicg5QZaX0S3EsnO+HfQ16cGqLRoStXVOk0gmhq/TuWMOScCki2JqOARqfU/f
	uNC93gYMAMJhLAeVCUY0Ccvy4KDX9OSvrJ8feJMUp1CtWDso4/IMs37ft6ClfHM1jnNe
	cD7LbtPUAqIzEgD1bPRXcKKMHHxrcumvA1XmbUMe0EpkxqlQSpLIAfdTekMst7cB8UGu
	Kn3fr/Bg+1HIdgGGOMQog6OXIjLSn74cGpknK8mjc4iS/UO9bR2CW/C0jb80htQsEwbI
	qYkA==
X-Gm-Message-State: ALQs6tAs9574CPD4X5NYv4mjG3DY5sN4ZczhoOR2mnhIMp8b96gU3prM
	i+vPcnWlzcc8UvxLF95pFSG4f7uB
X-Google-Smtp-Source: AIpwx48FT5p6PAmfXZYeDz5glk5AMdHtiDdqhkTTPRulDwGnvInwo2jiAvNW2cOrsY3tNy1lmYBY4A==
X-Received: by 10.200.57.111 with SMTP id t44mr11470473qtb.22.1523835814864;
	Sun, 15 Apr 2018 16:43:34 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.43.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:43:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Date: Sun, 15 Apr 2018 20:42:32 -0300
Message-Id: <20180415234307.28132-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v3 06/41] cutils: Extract byte-based
 definitions into a new header: "qemu/units.h"
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
X-List-Received-Date: Sun, 15 Apr 2018 23:43:39 -0000

(added in 076b35b5a56)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/qemu/cutils.h |  8 +-------
 include/qemu/units.h  | 11 +++++++++++
 2 files changed, 12 insertions(+), 7 deletions(-)
 create mode 100644 include/qemu/units.h

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index a663340b23..056e6629bb 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -2,6 +2,7 @@
 #define QEMU_CUTILS_H
 
 #include "qemu/fprintf-fn.h"
+#include "qemu/units.h"
 
 /**
  * pstrcpy:
@@ -147,13 +148,6 @@ int qemu_strtosz(const char *nptr, char **end, uint64_t *result);
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
 
diff --git a/include/qemu/units.h b/include/qemu/units.h
new file mode 100644
index 0000000000..81f5cc6f7f
--- /dev/null
+++ b/include/qemu/units.h
@@ -0,0 +1,11 @@
+#ifndef QEMU_UNITS_H
+#define QEMU_UNITS_H
+
+#define K_BYTE     (1ULL << 10)
+#define M_BYTE     (1ULL << 20)
+#define G_BYTE     (1ULL << 30)
+#define T_BYTE     (1ULL << 40)
+#define P_BYTE     (1ULL << 50)
+#define E_BYTE     (1ULL << 60)
+
+#endif
-- 
2.17.0



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rL4-0006bI-TH
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:45:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rL2-0006Yh-20
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:45:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKy-0001sb-Vw
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:45:40 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:38598)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKy-0001sN-Qy; Sun, 15 Apr 2018 19:45:36 -0400
Received: by mail-qt0-x241.google.com with SMTP id z23so13564739qti.5;
	Sun, 15 Apr 2018 16:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QQhLng2J0gl1YEdJzQ0JkwwJsq1s7xUZFn6fsLXCv3Q=;
	b=a2U/RnUOtk0ogeX3dI94E3Ho+J3pY7/YDpEuTdiek6u8Hxme/3IDtngk3cV89cklgf
	7w38yTIdDFoPKWEXQ/+np0Ud2u3E8bJVPq1u/dt8BMpMcHp3oIILiWT4bQjkcKfeak/I
	q6015hSHs9j98TU0VySJfCS3GxfXoh/sVYrMkvEJxRtCsRuhDZxw6mvjfCUuNtlMT/rH
	dzJP0vXrRhCYpgoOvLdjQ0WH2ARQJO51ae7Jqh9qy5a3e3nP4I+VhyfcAzKZCCtBF+Ms
	5it6r0t5ozAcPswp3kP8cBcvfBPifHwvYQ3aMSvEnEqqwQ2912X7XwY16VyuvpGR8E2n
	t6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=QQhLng2J0gl1YEdJzQ0JkwwJsq1s7xUZFn6fsLXCv3Q=;
	b=VVzBdCh+yZzS+jw+kSvIDMBF66Rb6CwcZ2Nz4tC4Fg+bij+3+FPTc/KaVUHAvsSBEZ
	6Th0wpmr+Kb5p8V/p6aAi55G2tg5DmP0YphF0+cGwB4ZSDUh1HCa1oNh7YenFAQWOpha
	2vMJruy38/1+rR+e2ScXC9Yvq9IwJDDYtj5vDK6a8/OV6VcmyCnFVT/pJIO/2PPq9K43
	SxUyj89DBbMDnawcVpxCo2efURHCxwD+LGpWMVm+gYFbg6x7ndcNQl9wFOqfX7zxKNPh
	zhPcbabtmQeM1QMLPnbb0ypv+/DDJ4Hynt54XwvrTYRSlquHoGfdTt0Qcxs3o2+n9PXp
	0+/w==
X-Gm-Message-State: ALQs6tDVO8EQgriYAtBZZ6dy7egDme9cH0KsOI1EGO+ltnBRCCWc5z4y
	XkNOClyS+eROiH9MGvOzakVG4lNkcf4=
X-Google-Smtp-Source: AIpwx485BpRmsXQs0ObmlPB6N3fskEstjkoLfUxVgAbwLpRjegJbbw0nWp7qBa81K1+8IGigbYzSDw==
X-Received: by 10.237.47.229 with SMTP id m92mr626497qtd.232.1523835936235;
	Sun, 15 Apr 2018 16:45:36 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.45.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:45:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>
Date: Sun, 15 Apr 2018 20:43:07 -0300
Message-Id: <20180415234307.28132-42-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v3 41/41] cutils: Do not include
 "qemu/units.h" directly
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
X-List-Received-Date: Sun, 15 Apr 2018 23:45:41 -0000

All files using "qemu/units.h" definitions already include it directly,
we can now remove it from "qemu/cutils.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu/cutils.h | 1 -
 hw/core/machine.c     | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index 056e6629bb..cdb0f0db75 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -2,7 +2,6 @@
 #define QEMU_CUTILS_H
 
 #include "qemu/fprintf-fn.h"
-#include "qemu/units.h"
 
 /**
  * pstrcpy:
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 2040177664..8f70c5ad94 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -19,7 +19,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/numa.h"
 #include "qemu/error-report.h"
-#include "qemu/cutils.h"
+#include "qemu/units.h"
 #include "sysemu/qtest.h"
 
 static char *machine_get_accel(Object *obj, Error **errp)
-- 
2.17.0



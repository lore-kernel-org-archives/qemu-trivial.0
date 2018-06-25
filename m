Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQqJ-0001JM-MR
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:43:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqF-0001Gn-W0
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqF-0007dG-0Q
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:36 -0400
Received: from mail-qk0-x234.google.com ([2607:f8b0:400d:c09::234]:45214)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqC-0007bf-0M; Mon, 25 Jun 2018 08:43:32 -0400
Received: by mail-qk0-x234.google.com with SMTP id c198-v6so7348297qkg.12;
	Mon, 25 Jun 2018 05:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=iSBXdjYq7cTSR9GfO+r6S/xluTUDYmMxrohSbewgYr4=;
	b=D2c7/w4T0tL8s6Slml+zdJRKPzrJf4cJ6zjRLphsRQvoe8OHtjtkbSPxsinvtJOxpE
	984DxxbgyOp4A8/4bJQiinXnOajAziSLKIsxFcP/Iph0wmYy4fcDCfUY21HKXyshIB/a
	fYy8Xk29JDBECsvtBv2GQz/YNK8MKfq/vtMuMuyqumKDCh0sFZhFbuBJkmn414qChFZt
	7Ru+CFodR9BIGl+15Hp8q6f+BwdI5Q5ihRhyoTsgwXYwp34weLQEEa12GhJL+jvl4Fl6
	mZEn5hSOZc4uwzlaoN+xQbvTEU7jbzRD3TSTMXB7bY0pZJlJ0iyDGzSwSsFIkud5NP1d
	2U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=iSBXdjYq7cTSR9GfO+r6S/xluTUDYmMxrohSbewgYr4=;
	b=nvE886T3alWE6POlZYvVkqMNsdkbh5rNsxAVwdkC/m6ypE+2vRbckhmrXDisCwOyTe
	lK/4fMa9VLLyjMyhlBvfbfleSa6PbeHBu3RWaLbUrFN3NWz/kXZ3+s5YVhG69zK8D2BE
	Mcr2yAdssRrrNNCmIX75yx8EMq+4O93t6quONX7TYP3qeGiNkEB5Bh47e2/IJqDKFW8i
	hZ+BppU8x/djJ/kUYOxQPNrIvSDQAJkhr0iX0wrqvuBdUsIPaFd3broCIXfNFv5un5nM
	xi2fQBN+MG5BuI1x062HAJZb0KLdBQqxsQzL+bkubWkbCXbErYLibAIkL782mur6X7jz
	qZhQ==
X-Gm-Message-State: APt69E0TugR+393ButDsKVV+PxHPxWo6yS1sJkWnUSRmqFg2bNao7vQE
	tj3eDKwapzxx/cCEL3ddgC0=
X-Google-Smtp-Source: ADUXVKJnGfVRI7mbsUqfhnb+C4n9zppaVLSlzIYWa/Xh2TCPKWqGbrOk/fDaszQOq1ERer7TzO1A0w==
X-Received: by 2002:a37:849:: with SMTP id
	70-v6mr10383402qki.200.1529930611485; 
	Mon, 25 Jun 2018 05:43:31 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.43.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:43:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <famz@redhat.com>
Date: Mon, 25 Jun 2018 09:42:01 -0300
Message-Id: <20180625124238.25339-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::234
Subject: [Qemu-trivial] [PATCH v5 09/46] hw/scsi: Use the IEC binary prefix
 definitions
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
X-List-Received-Date: Mon, 25 Jun 2018 12:43:37 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/scsi/scsi-disk.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index aeaf611854..311134482f 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -29,6 +29,7 @@ do { printf("scsi-disk: " fmt , ## __VA_ARGS__); } while (0)
 #endif
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "hw/scsi/scsi.h"
@@ -44,13 +45,13 @@ do { printf("scsi-disk: " fmt , ## __VA_ARGS__); } while (0)
 #include <scsi/sg.h>
 #endif
 
-#define SCSI_WRITE_SAME_MAX         524288
-#define SCSI_DMA_BUF_SIZE           131072
+#define SCSI_WRITE_SAME_MAX         (512 * KiB)
+#define SCSI_DMA_BUF_SIZE           (128 * KiB)
 #define SCSI_MAX_INQUIRY_LEN        256
 #define SCSI_MAX_MODE_LEN           256
 
-#define DEFAULT_DISCARD_GRANULARITY 4096
-#define DEFAULT_MAX_UNMAP_SIZE      (1 << 30)   /* 1 GB */
+#define DEFAULT_DISCARD_GRANULARITY (4 * KiB)
+#define DEFAULT_MAX_UNMAP_SIZE      (1 * GiB)
 #define DEFAULT_MAX_IO_SIZE         INT_MAX     /* 2 GB - 1 block */
 
 #define TYPE_SCSI_DISK_BASE         "scsi-disk-base"
-- 
2.18.0



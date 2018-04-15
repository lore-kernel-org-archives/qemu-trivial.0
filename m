Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rJD-0004Xd-Qx
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:43:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJA-0004VC-5L
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJ9-0000M5-Bq
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:44 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37447)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJ9-0000Lv-6p; Sun, 15 Apr 2018 19:43:43 -0400
Received: by mail-qk0-x244.google.com with SMTP id d74so668341qkg.4;
	Sun, 15 Apr 2018 16:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TBTMIfjhRyPOzAmdXkPzScwcb8JcoL2N3SqHuL2eY7c=;
	b=OAugExeZqfglgNuy4cuNMAfwyZbb/dd5H2rYfFUXcaSpHHxmnqVSMPk7iu44VS6LL1
	rBioOhSWZw8Z2utz+/YCQR4xDW6/TmPgd3aAYwN41/lxG55QntLVMInWuljh0/Ew17wR
	RAo2dAn8ELHUJwa9OZziKvafs2uGKcogtJvnB56RPNgAWblwY4MJ1cWhp1OUl6q4oOxE
	3sGIKAV8I189Bs6O6vxdRmRlC7jdTJDZ6MN0FWaXjh1ew+HF1HHAbPVpO6mTYvfdWPeo
	3ddy32TgrQiFl6RZb5CfPLRpaZlaYkotV7tKYkPJiRJfc28ck/QRhLGkfP1WxLyY3Ibp
	+L0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=TBTMIfjhRyPOzAmdXkPzScwcb8JcoL2N3SqHuL2eY7c=;
	b=TOOPp20rWUjpyCYcykhWnQaHrsZpfjKOcA94KOgANb4WjG+hbILZZbctUu2A/IYTCP
	WpaVJ8v5LwKIErjbZrEyNIemNrU/yVvmkcKChCvhd4YPectq4OO7bFshaYOPxBDXzOOJ
	K+w5oDAR0ffd73yer/Q7imbAk1hTjlB0wWwnmGad9Pe2wJddw07VKCs5LchbBMPWiXN8
	DdxLXG2XY91Qikp/0f307E8PBXR+EmnCMjyip1fqB7nCLhL1CNxdis7lPHG3qEHrwfWn
	p/UkL6aD/1LLsHwsDpl/gxl7tGKdKrzrsvCp6NVj39l0lvDY0wzflcFStcqq4f2pVFOI
	X3bQ==
X-Gm-Message-State: ALQs6tC1OYSHG4vFkSALep2qraE86CGjvZK8HM2W7R1XimEV2iPGBBKt
	pMsqgRFOpfE0PBVD2sCL3X0crWD9
X-Google-Smtp-Source: AIpwx48xPa7YvbEeMi4QZZHQrY1/G/FfbS+qOd27PcX033LMSIuaL/VvkxjFs7G6/2T4YPzhx4OsbQ==
X-Received: by 10.55.49.8 with SMTP id x8mr14397415qkx.66.1523835822607;
	Sun, 15 Apr 2018 16:43:42 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.43.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:43:42 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Fam Zheng <famz@redhat.com>
Date: Sun, 15 Apr 2018 20:42:35 -0300
Message-Id: <20180415234307.28132-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v3 09/41] hw/scsi: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:43:46 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/scsi/scsi-disk.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index ded23d36ca..a67e7ffce5 100644
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
+#define SCSI_WRITE_SAME_MAX         (512 * K_BYTE)
+#define SCSI_DMA_BUF_SIZE           (128 * K_BYTE)
 #define SCSI_MAX_INQUIRY_LEN        256
 #define SCSI_MAX_MODE_LEN           256
 
-#define DEFAULT_DISCARD_GRANULARITY 4096
-#define DEFAULT_MAX_UNMAP_SIZE      (1 << 30)   /* 1 GB */
+#define DEFAULT_DISCARD_GRANULARITY (4 * K_BYTE)
+#define DEFAULT_MAX_UNMAP_SIZE      (1 * G_BYTE)
 #define DEFAULT_MAX_IO_SIZE         INT_MAX     /* 2 GB - 1 block */
 
 #define TYPE_SCSI_DISK_BASE         "scsi-disk-base"
-- 
2.17.0



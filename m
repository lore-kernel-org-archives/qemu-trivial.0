Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBRC-000501-Sw
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:16:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRA-0004xB-DX
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBR9-0002if-FA
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:00 -0400
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:42489)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBR7-0002hD-9g; Sun, 10 Jun 2018 21:15:57 -0400
Received: by mail-qt0-x229.google.com with SMTP id y31-v6so18837193qty.9;
	Sun, 10 Jun 2018 18:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=G1TJOuGeCM/sX0MP4L0B7rLOEQ4M5WxP9k7w9FqKd+k=;
	b=kDl8yDsRFb5f3BE7g3ebjrVHBtISmnVSR/2uEpZlSfAle3vr+vc+v73cOLkcW9SNDP
	GfryWVNbTCfVuD7Th4Ocj9KEjOjiuVwOEJpqMNdrnmVy3Ojz2mebCKh7U6wCc0KTF3Fh
	Hp1ljjhdehyls1a4o7HdtNAHT69Xd6oNuxkiIihD81laOmBPE8gUmTYD2ZoIC0tCghSf
	ECeRmFqfEqJPj9zAxmIGdzBahrRA/B6ySP0lrYmXIORvIdckRC0+uxoqB1kZ2boM+Z30
	mGbwOBYygIQ14790C5Zl69YfxtYEkXCVWUsNazDBVKEOmBXbmFPYD348dgB5aHZfwgyF
	TgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=G1TJOuGeCM/sX0MP4L0B7rLOEQ4M5WxP9k7w9FqKd+k=;
	b=reMAigaYz2aHbaIseAqZgwC1iheVhaMU7YyRyj8KKSbfPosg8Tt6CQsUn+fqzcYV8c
	3Q+y+DyJQm6/FPGzZgqhSQTl26hV0tp31N6F7HRtXz2SgSZEBDpQFcjDjui/My/WKKQN
	NbILMsB3s1HpvqSE1ITNZsvy7WyOyL6sH5k00RtFgJoG7bb18seIWtxCiqYgu+WTXMNu
	UpPTytLQic1vAuxWql54J+ZBFR5H7nVNmjKewQcTTR6QKeib26R3bMCS9tWRbGTIaSfI
	ReasbtAK9gScNtUhp3eRtLc31sdYX9ynSJ5Y5WcPXzgvGQooHPuRQSHxQr+U7AahUqnQ
	87RA==
X-Gm-Message-State: APt69E0+S4Y8o5HYUVUADt2bMz//TlJHe6uc4vjZ7ZOwrKd9brRpeeVo
	o2MZ57VHRQ8LiTLRtND+1zs=
X-Google-Smtp-Source: ADUXVKLTv9IfbUZdptgeEZ2VbvBEbhNclh6ncSM5nS8S/DE2KHPAp4EVP3+Ioo/KANgm4mOKgtS5dg==
X-Received: by 2002:ac8:1bee:: with SMTP id
	m43-v6mr14742840qtk.339.1528679756870; 
	Sun, 10 Jun 2018 18:15:56 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.15.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:15:56 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <famz@redhat.com>
Date: Sun, 10 Jun 2018 22:14:30 -0300
Message-Id: <20180611011501.10235-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: [Qemu-trivial] [PATCH v4 09/40] hw/scsi: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 11 Jun 2018 01:16:01 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/scsi/scsi-disk.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index ded23d36ca..00c8fc571a 100644
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
2.17.1



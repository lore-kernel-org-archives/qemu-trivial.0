Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoHy-0003s7-QY
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHv-0003jr-2U
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHu-0007DU-6h
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:15 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:38255)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHt-0007D2-Vv; Mon, 05 Mar 2018 06:28:14 -0500
Received: by mail-wm0-x242.google.com with SMTP id z9so14699600wmb.3;
	Mon, 05 Mar 2018 03:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=C9MlX7olMSRCJMYhoNTcDXHx9ew1KLDHPWhJVZ4yDPI=;
	b=MC35k9eRTypVpa/zngU6mhs6tTioMe/CfD2I8Er578ieWreUuMHhQ7bmGmGKb5MU4F
	/tvB+vZ8FdBVcaDol3EJunyxWJTDu9E2Ki+qG5kGem3cvM/X5M7Tc4+lp2f65iy0oO+e
	QIfjRg8ImtkpHp1wG9LJhABgZAEVmjWJN8YQ+LkOvve75fnw2pG6oe6KIfQcJKRPOjfQ
	ucXp0v0Fms8AZVq69jwwfS6iVmsgIPdESue4Qk7ifuuOdgBsYfT677N4klHjnj/5mKxX
	by1nrGQzNtoXl+YSxABVIY5UHCkiOKQ1QEXdYns+NchwAtRqKrwqfzZ/0/HHZlcVbZmf
	MXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=C9MlX7olMSRCJMYhoNTcDXHx9ew1KLDHPWhJVZ4yDPI=;
	b=no2jSeI355+GJQxycc9mFhYge/Bhipnd/SpRB6+5Ri5B6AIhPe/P94t1am88HvRKoz
	KsbcimSBN/XXjDd6wjFLL636VPpklXgL8VuFV+P4HfKeu/bFD/3KjYZMd0RAvl+dOK8w
	43myqy8mQxnOKARF76smZNJG3EAFvkCIWUlyJy6IDMGAq/55jj7MEv3d5gV82i/xVv3i
	4iRGUBCPHsvN0GjQ7yPmk9weWk3gcdT+Urb6c2UUe7U8D/+7BxUfJwV+zn++UW2R+SQz
	pllaJlXF6IONk7CarXX86tCy31aoxZn2/gumrwTYavRzPNofwl6M2SmfzielnG3l/ZAH
	83mA==
X-Gm-Message-State: AElRT7EVlU7Ot7EFxaiwBCrVCcm7VC57z1hv5GIN+H+queRG8pUz7Pe9
	vn6kCo8Al64a4GhO7SntkyBmaQ7sVr4=
X-Google-Smtp-Source: AG47ELt3EwdBPrmAFqe3WqXT0cY25Q5cupZDGyjmgp1qoEtn3Vt39EsCT4rlK123iZ+st1HhHpKl4g==
X-Received: by 10.28.20.84 with SMTP id 81mr8572092wmu.70.1520249292811;
	Mon, 05 Mar 2018 03:28:12 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.28.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:28:12 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Fam Zheng <famz@redhat.com>
Date: Mon,  5 Mar 2018 08:27:27 -0300
Message-Id: <20180305112732.26471-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: [Qemu-trivial] [PATCH v2 25/30] hw/scsi: use the BYTE-based
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
X-List-Received-Date: Mon, 05 Mar 2018 11:28:16 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/scsi/scsi-disk.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 49d2559d93..bfdb34a71c 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -44,13 +44,13 @@ do { printf("scsi-disk: " fmt , ## __VA_ARGS__); } while (0)
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
2.16.2



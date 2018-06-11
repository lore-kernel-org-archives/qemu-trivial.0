Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBSt-0006S3-L4
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:17:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSq-0006NA-PQ
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSp-0003n7-NY
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:44 -0400
Received: from mail-qt0-x22f.google.com ([2607:f8b0:400d:c0d::22f]:42499)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSl-0003l4-D1; Sun, 10 Jun 2018 21:17:39 -0400
Received: by mail-qt0-x22f.google.com with SMTP id y31-v6so18839613qty.9;
	Sun, 10 Jun 2018 18:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YvskLKcW3MrZvOPmeq+nHoW6QUPr1YWSMOQ8q7iM6To=;
	b=vdxHpkJjhxPMhbX8bAI/o5cCfbWC6ltcQWocO+j1UUhVmzFOs+/wvjWvZUEDVdMFAp
	adCcZh/nJuXslyPIc8QmI6szIL8OtlxhTtbvzrCFUZsaIxZnPJ1rkoItDb8S5OHXyLwW
	rHHan1zbO3FbgivnoMZY6rSO0+Uo27tAsbH0t0LtOX+BiFALRs4cxh2ke8yYn4A57Xpe
	KGl+L01JewAvtvTNFqgqgVp6JkURHFdj/wYFOj7g48jGKvqoFmtmz8HhkHT5dh0/c5Dp
	TnVvJOUEVYFG6vkpWf60BvguElxf50PtdiM5O6qbHPAn68dmh4H05IPLX1hchtYoXuvs
	zrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=YvskLKcW3MrZvOPmeq+nHoW6QUPr1YWSMOQ8q7iM6To=;
	b=iUTD69Y/UaWcltYVFUaKiDbneSJ/2C1jFk9x0N3drX1dV7qE2K8GttoTS66ByPepj9
	KS7QDaZ4seh6tJjpTqhtOe+zHpmsjsyNPVCUMQV5Z2dM2tlPOJY7LQLMemZtPo/igFN2
	iMY0ZazlUorMRryg9B7LfyWlIGeYupCF941+amfznt+AO8fEw1pD8Nw0khZzFFdVTWHQ
	KVdrMBDkIgQ0T97SyTDyTfo1eErXMsH57BKl/YQiEJw8Jafl5HJTyubLF93pHv5qg0jv
	JygHnoUw6rrhKo82YQoQBrHvgFQl+DCi6XmFIAabagiA7x49SNDtYwLFMIQn0wSg1HsG
	X2TQ==
X-Gm-Message-State: APt69E3mVdF0LkzJXaQ3lr4o54KtHshzbpcSlHg9AJl4rc40wzxI3OQL
	OG/IxjsTcfK5WL8rhQx4IFE=
X-Google-Smtp-Source: ADUXVKIh/mJ9SqnhuqrF1avrOSGpKDLLZUVqyT9AQyX/CqPH14QwRSW8E3vnomGqzP6knOhhEbmAfg==
X-Received: by 2002:ac8:1bee:: with SMTP id
	m43-v6mr14746276qtk.339.1528679859012; 
	Sun, 10 Jun 2018 18:17:39 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.17.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:17:38 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Sun, 10 Jun 2018 22:15:00 -0300
Message-Id: <20180611011501.10235-40-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22f
Subject: [Qemu-trivial] [PATCH v4 39/40] hw/rdma: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 11 Jun 2018 01:17:45 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>
Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>
---
 hw/rdma/vmw/pvrdma.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/rdma/vmw/pvrdma.h b/hw/rdma/vmw/pvrdma.h
index 0b46dc5a9b..81e0e0e99c 100644
--- a/hw/rdma/vmw/pvrdma.h
+++ b/hw/rdma/vmw/pvrdma.h
@@ -16,6 +16,7 @@
 #ifndef PVRDMA_PVRDMA_H
 #define PVRDMA_PVRDMA_H
 
+#include "qemu/units.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/msix.h"
 
@@ -30,7 +31,7 @@
 #define RDMA_MSIX_BAR_IDX    0
 #define RDMA_REG_BAR_IDX     1
 #define RDMA_UAR_BAR_IDX     2
-#define RDMA_BAR0_MSIX_SIZE  (16 * 1024)
+#define RDMA_BAR0_MSIX_SIZE  (16 * KiB)
 #define RDMA_BAR1_REGS_SIZE  64
 #define RDMA_BAR2_UAR_SIZE   (0x1000 * MAX_UCS) /* each uc gets page */
 
-- 
2.17.1



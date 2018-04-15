Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rKv-0006UK-Lp
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:45:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKs-0006Rf-RD
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:45:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKq-0001me-Ky
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:45:30 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:43681)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKp-0001lO-BS; Sun, 15 Apr 2018 19:45:27 -0400
Received: by mail-qt0-x241.google.com with SMTP id l11so4361096qtj.10;
	Sun, 15 Apr 2018 16:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=in8/xg9vc9vf6jc63L00DLTKegZdBvQB/umtltw08Cw=;
	b=NopIsClW1r2vdhwuYMpu9fCt1niVlF9llWve7dJSAt2LWZTBWi9crfVL4c4HhYS4ke
	FMmc4XYPkSRxK0QsXwFkFLXAGrM37RVUjt+WwIr/vxoxhQ8p8eHXS0LaAykwI/ubfI+L
	TGyYqahH1EGWjS/R7jWoZQYLtFTLJ7Nyc54+SiqHRnawYEPNMgfsNV483Us1gjn/0XuN
	uz5uy/KagIK0VA3JMKToklcvu8griEgZ8BnQ0f2RQhginOp33utPQ3zePWGsj5tvR6+l
	yTS8pRgbV1T+F4KgHLJ0uVgVy9uO74OxhnhW2VLn/EfLtE/4gipvfOglfNltL+GSlw5f
	DbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=in8/xg9vc9vf6jc63L00DLTKegZdBvQB/umtltw08Cw=;
	b=Xz84ERndG/zUMSm8IIuU7F8CxToy/xLB/O82KHAYFnsQG3spi2dJ/IGf+3H1kIx5DV
	A+YQVIy2zUl/IKfDXsCFfCdGIHpjaNAzMhezBhizf8hVrya2l0eEtxi/vTltq+vIH7jd
	rtK4aha2KMuRKdaYQfo6ZCVMWSXwhjzp3MMmuLE7QuFHQVoBo58M5ZSmls3aqZCuU2Bq
	SkGSW/B9WjFar+g0KYVkXp4Qqb0z56L9qiYxIxw83r71IJby/17d8ERaIu9evOTP8AE4
	+xCxn8IdKjZbcMARtQbuW5EANi9nDO34antRXUgdlB7F+j+AEThiZRhSI85NKMMVbPPU
	uJAQ==
X-Gm-Message-State: ALQs6tCzN/VtcvEZ+T8A5VqI3oadSyiVkRaOjQhhRZxvF4CdSCSpT9pR
	RhetQ471mB8S6vQMsntfpnj4rdvwGI8=
X-Google-Smtp-Source: AIpwx485UEzf3QccfuIZ4wYeQNvWMSlnF1d+jE1Ja8qwoti8F/gdpZl35kk8Q2DuaxPaaMjKJb0Bdg==
X-Received: by 10.200.1.79 with SMTP id f15mr13807079qtg.177.1523835926671;
	Sun, 15 Apr 2018 16:45:26 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.45.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:45:26 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Yuval Shaia <yuval.shaia@oracle.com>,
	Marcel Apfelbaum <marcel@redhat.com>
Date: Sun, 15 Apr 2018 20:43:04 -0300
Message-Id: <20180415234307.28132-39-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v3 38/41] hw/rdma: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:45:31 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/rdma/vmw/pvrdma.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/rdma/vmw/pvrdma.h b/hw/rdma/vmw/pvrdma.h
index 8c173cb824..f17143f0e6 100644
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
+#define RDMA_BAR0_MSIX_SIZE  (16 * K_BYTE)
 #define RDMA_BAR1_REGS_SIZE  256
 #define RDMA_BAR2_UAR_SIZE   (0x1000 * MAX_UCS) /* each uc gets page */
 
-- 
2.17.0



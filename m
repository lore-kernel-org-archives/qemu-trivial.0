Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aWmpl-0000b6-1R
	for mharc-qemu-trivial@gnu.org; Fri, 19 Feb 2016 10:19:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aWmpe-0000OP-Qx
	for qemu-trivial@nongnu.org; Fri, 19 Feb 2016 10:19:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aWmpa-0004vL-Ma
	for qemu-trivial@nongnu.org; Fri, 19 Feb 2016 10:18:58 -0500
Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241]:36756)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>)
	id 1aWmpY-0004ue-KU; Fri, 19 Feb 2016 10:18:52 -0500
Received: by mail-pa0-x241.google.com with SMTP id a7so962511pax.3;
	Fri, 19 Feb 2016 07:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nzNxRU5+J3GdZrnbb5Lze4dSY1gEN+rXLZB4uqFz0vs=;
	b=k2ADTdbDc1I/K9GPRpzZ3mpyO6xrOQIFsZJQT3WznA4nCmiu+WFqJYM39mAPb8hy0T
	mdEbftIFHuGX+Huk56VUHopDeV0UFTGa1Rr671K4WpJVzralgSfyaOvVW653vFwvlT2+
	SL9QPmTZIRUzp/ck+tQ4T55dTvmB1sGKLIe+gmYMI3DR8tGXuAVR2uIb6U1kQC7cnW+2
	jUH+rFu8GqXOR2xczI5TaO8rbYl/x1dWkcQjJY9CV4ymjMC1qmd7D0jeg364dDl0J9Qe
	6j/JkL3+5lrcnLC72PPbd4ZNBueHNwMwqcr6MTBBT+LdCcIY/sQU2rnzzcM/tIypakKs
	1PMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nzNxRU5+J3GdZrnbb5Lze4dSY1gEN+rXLZB4uqFz0vs=;
	b=mv7QsT48xnOjuetciuvrOP6Ldwb6mzRq1Kp+9IZAUIi2f8x+knLLSNa96NKST754gy
	CYkRvFkvA+0cobswgclX5gcKJu/J5bEi1BCSPiyhOkrEllAVUPZqWeHoIYbqXVdHWcYj
	kiQwWq4FAODzmHw57Kof64qKYbNcYwWQB2gx7GHSV5HLAygNhWvkTsxSeA7xP8BLsAjI
	loCGy9r7hgRTip0j+o00biFDHnuRhXRNGe6Div5nhPnJ+IwYSyjn2j9/Q+YcinEN56+B
	VyvBRVDyc34bKXwGwrJYYkiW1mphHau5jlHtCn7Bpcuh6jQSfi2nir3pZF4WmKD16KOh
	l8fg==
X-Gm-Message-State: AG10YOQxeLMP0Iw0/8fULmdxzDEhhluf/1gX1Q1Aqaa+ywh6BODjQSbrV+XovPOvUn64Vw==
X-Received: by 10.66.100.196 with SMTP id fa4mr18806783pab.37.1455895131894;
	Fri, 19 Feb 2016 07:18:51 -0800 (PST)
Received: from localhost ([45.32.44.20]) by smtp.gmail.com with ESMTPSA id
	u5sm18608268pfi.15.2016.02.19.07.18.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Feb 2016 07:18:51 -0800 (PST)
From: Wei Yang <richard.weiyang@gmail.com>
To: 
Date: Fri, 19 Feb 2016 15:18:11 +0000
Message-Id: <1455895091-7589-3-git-send-email-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455895091-7589-1-git-send-email-richard.weiyang@gmail.com>
References: <1455895091-7589-1-git-send-email-richard.weiyang@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::241
Cc: qemu-trivial@nongnu.org, Cornelia Huck <cornelia.huck@de.ibm.com>,
	qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [Qemu-trivial] [PATCH 2/2] s390x/pci: use PCI_MSIX_FLAGS on
	retrieving the MSIX entries
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
X-List-Received-Date: Fri, 19 Feb 2016 15:19:04 -0000

Even PCI_CAP_FLAGS has the same value as PCI_MSIX_FLAGS, the later one is
the more proper on retrieving MSIX entries.

This patch uses PCI_MSIX_FLAGS to retrieve the MSIX entries.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
CC: Cornelia Huck <cornelia.huck@de.ibm.com>
CC: Christian Borntraeger <borntraeger@de.ibm.com>
---
 hw/s390x/s390-pci-bus.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 132588b..9d40039 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -523,7 +523,7 @@ static int s390_pcihost_setup_msix(S390PCIBusDevice *pbdev)
         return 0;
     }
 
-    ctrl = pci_host_config_read_common(pbdev->pdev, pos + PCI_CAP_FLAGS,
+    ctrl = pci_host_config_read_common(pbdev->pdev, pos + PCI_MSIX_FLAGS,
              pci_config_size(pbdev->pdev), sizeof(ctrl));
     table = pci_host_config_read_common(pbdev->pdev, pos + PCI_MSIX_TABLE,
              pci_config_size(pbdev->pdev), sizeof(table));
-- 
1.7.9.5



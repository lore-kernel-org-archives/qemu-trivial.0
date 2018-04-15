Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rJ9-0004Us-Ik
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:43:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJ7-0004Sq-Mi
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJ6-0000J8-Ih
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:41 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:46037)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJ6-0000Ht-Br; Sun, 15 Apr 2018 19:43:40 -0400
Received: by mail-qk0-x242.google.com with SMTP id f9so6879997qkm.12;
	Sun, 15 Apr 2018 16:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wXUXZCYeU3i4eWNmHY1DWsjK+9jzZGGtHBBnu6K8x8c=;
	b=fSSDKLKpbMvkIJ129yK63RwCBCNM3WFpq98ikW9WQhdklGhQP3JnHvlkoHzCWrYEVM
	9B8jPjeg8J4yo8M8LHsfrLInFDCyfVuWSida8NQ1VYJ+XGznQwq4unyP1YXTj14lb9zp
	ewmDm8jMmdqFHjMBvdsh17iPJOMi+YTQ0yO1NuWa7KikVYai/Jctp4tiJrjhz/D4NGoV
	FZ4HUp4FnYR4h5AmVLP6AuxnFx/B1lGsEmDF0SB26vEBvSjfWb8oarYboF6POfhAxdmg
	eEnh0FeAagy8O3JAIqEHehAZyYQRqykkECd17HcS/UuFRHVSyPpq66VQ++v2jqOkqiFK
	bDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=wXUXZCYeU3i4eWNmHY1DWsjK+9jzZGGtHBBnu6K8x8c=;
	b=FtbAhFN9Tiv+7MNS0NpnKs/k4EkmzCQ7LCiBgr9J2+nwcyDU8vEvCI3zEfWQOQTqbV
	L3Bvat2/TZAB+dpFEwo1eXYYwoq1o98vZ62Db7Aw8myKESYrb1qh0sKvRa/QBTSczb3D
	xi4ZFoM5AjdInEOXnJ15dtfem7/36CUKB0AXlfvCXpce/SG58AW+bBFHK1NdaOX6hR68
	9x2a0CZOqLxcUpgJBgrhzE88CJm8co00ASBjLw0BurnLOKSwr1Hn1enUWSI9N+ZpKi9A
	87qXRz6x514qu4y3pMyYTRfqamRfmRreAMsgStfClu43Mxrfwa6f6i9sDyWa+6UHGoQu
	6z0Q==
X-Gm-Message-State: ALQs6tDdQ+3P0WRahpEmxEDAsnaZysVHN2kxnJ/OW4/ph6VZWVuay7F8
	1tjfxRM8SQyqWm8lHRHS/F6ZSCMY
X-Google-Smtp-Source: AIpwx4/8R0LkzxeM9/rFqwGJSW3pZ/1nIzKgmy9BeU2lhsOuOXgplDmhzLDs+TFqj2A4XMVA7v+LYA==
X-Received: by 10.55.180.197 with SMTP id d188mr1999506qkf.36.1523835819704;
	Sun, 15 Apr 2018 16:43:39 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.43.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:43:39 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Alberto Garcia <berto@igalia.com>
Date: Sun, 15 Apr 2018 20:42:34 -0300
Message-Id: <20180415234307.28132-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v3 08/41] hw/ipack: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:43:42 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 hw/ipack/tpci200.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/ipack/tpci200.c b/hw/ipack/tpci200.c
index da05c8589d..8451bf8ad3 100644
--- a/hw/ipack/tpci200.c
+++ b/hw/ipack/tpci200.c
@@ -9,6 +9,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/ipack/ipack.h"
 #include "hw/pci/pci.h"
 #include "qemu/bitops.h"
@@ -597,9 +598,9 @@ static void tpci200_realize(PCIDevice *pci_dev, Error **errp)
     memory_region_init_io(&s->las1, OBJECT(s), &tpci200_las1_ops,
                           s, "tpci200_las1", 1024);
     memory_region_init_io(&s->las2, OBJECT(s), &tpci200_las2_ops,
-                          s, "tpci200_las2", 1024*1024*32);
+                          s, "tpci200_las2", 32 * M_BYTE);
     memory_region_init_io(&s->las3, OBJECT(s), &tpci200_las3_ops,
-                          s, "tpci200_las3", 1024*1024*16);
+                          s, "tpci200_las3", 16 * M_BYTE);
     pci_register_bar(&s->dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->mmio);
     pci_register_bar(&s->dev, 1, PCI_BASE_ADDRESS_SPACE_IO,     &s->io);
     pci_register_bar(&s->dev, 2, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->las0);
-- 
2.17.0



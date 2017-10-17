Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FVW-0006I8-2y
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVS-0006ED-0n
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVR-000444-3W
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:13 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:46396)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVN-000424-8d; Mon, 16 Oct 2017 20:13:09 -0400
Received: by mail-qt0-x243.google.com with SMTP id 1so67472qtn.3;
	Mon, 16 Oct 2017 17:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=eyQjXyKBBwMJacP0N1mGGtdpK3BzWxv0bVtmICB0IfY=;
	b=K4lOEKSQMdoe7nxynnOzzNgVR0l5Y+jYBZAV5YfoeRLaubTCou4uZF0RjMHd6dAlmT
	cn02P53rHHoxsnSexJhjk/mEULR5v2XJ3hah8wUitHqhOSuMpzWy/U5i2QggvBrXf+Tx
	28yq3rBdlEQxFq8kiXkUM0IP9GZRwwUKazYxsddQFl+xVuA1orhTP9KShGhM6nHwoeW4
	l12PhMO4irE9+D/3WYg6tGInSjuAgKG2bF757Um3JEpM4JxEWL/LeR4S8qVKQY9TXt80
	bonMYyyN0hg31gZA0h0vn3M95POUHIc6uMimCoibHJ0B5pUWQ9NXyMuFVbOBIewBE/gy
	17KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=eyQjXyKBBwMJacP0N1mGGtdpK3BzWxv0bVtmICB0IfY=;
	b=PikSWwKD4sFashm5tFiM78muM/SVm0Y2vE2CTRwMPcmxhKVCew1y+NtQfHF1WymD6j
	aAL+NZEln7SK6BsBemol/ehVnwuRInPsCcZAbD2ryvKyB7R4DSBhyGb2lzD/rVtqb1Gn
	LkXT55yMdfv2EVj9+B7Ri+SN2OxoTXU4aLM2SkbK+TDduUNHoL2vpwOg45NdsDIJTZFg
	nu7oX2zkClKaVbiTrgmWeMK/0nwtlV2KJmcp1o3Qnpm8gMkdbgl4pH8CklI12EzE+RZL
	TzE3DIoYZRrkkrozZ3ZI+J6uJ2amIWkO939ECUQbQ4Us4XKiHVYvmts6aKNVh4yNIeVZ
	D/yw==
X-Gm-Message-State: AMCzsaUnqZ+1GUUxDDJKi4sEaqPZRo3akaAv9xHI+ThBiF4QFvNXhTnY
	hX5aZIoiHC4mVqSTQKT14eM=
X-Google-Smtp-Source: ABhQp+R5VLUHEySninKSN8HVGnfZAQ7NlQQ6Yj3OqkzhN+n4XM7b7kXYzWDktORD8gy0S2NlU6ZfFw==
X-Received: by 10.237.57.228 with SMTP id m91mr12121213qte.267.1508199188851; 
	Mon, 16 Oct 2017 17:13:08 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.13.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:13:08 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:43 -0300
Message-Id: <20171017001209.32276-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v2 13/39] ppc: remove duplicated includes
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
X-List-Received-Date: Tue, 17 Oct 2017 00:13:17 -0000

applied using ./scripts/clean-includes

not needed since 7ebaf795560

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_hcall.c | 1 -
 target/ppc/kvm.c     | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 8d72bb7c1c..61e2fcb77d 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -13,7 +13,6 @@
 #include "trace.h"
 #include "kvm_ppc.h"
 #include "hw/ppc/spapr_ovec.h"
-#include "qemu/error-report.h"
 #include "mmu-book3s-v3.h"
 
 struct SPRSyncState {
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 171d3d8040..f4f4f20960 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -47,9 +47,6 @@
 #include "sysemu/hostmem.h"
 #include "qemu/cutils.h"
 #include "qemu/mmap-alloc.h"
-#if defined(TARGET_PPC64)
-#include "hw/ppc/spapr_cpu_core.h"
-#endif
 #include "elf.h"
 #include "sysemu/kvm_int.h"
 
-- 
2.15.0.rc0



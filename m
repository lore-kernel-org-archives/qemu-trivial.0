Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V0H-0001qq-6u
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0C-0001ld-4b
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0B-0003Im-Gj
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:00 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:45156)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V07-0003GZ-QA; Tue, 17 Oct 2017 12:45:55 -0400
Received: by mail-qt0-x241.google.com with SMTP id p1so4929950qtg.2;
	Tue, 17 Oct 2017 09:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=eyQjXyKBBwMJacP0N1mGGtdpK3BzWxv0bVtmICB0IfY=;
	b=UCKa81mfzS8G8EsxNoKdxGsbKlp0M9u+ProwZVE3k/1rGscRzCGDAEbcYEpaO0pLxA
	kZuVvroPh50oQzTnyQk/tLTfBSE50f/VxlHczk4KU+wMdIZ8n158py4RDTANdvjYKwam
	QZzmQutrXQiSXLsGbdBqFAFmVpPg5APQmAErBMJ9ZaZV+56yt9NRFHNUz9fHIJmRXTKp
	y0WEVskwig7tvhu0u9GCaaidI93p2lSpwzPFniVk51lILs65QbVAce0+Kla9wpTNUycZ
	kjB1o+zUI150fEOy2Nr+ZhzEKDCMxIburf7S2Kd4T+e5bnp7duvGcVonO8r3LqSrvQcd
	G4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=eyQjXyKBBwMJacP0N1mGGtdpK3BzWxv0bVtmICB0IfY=;
	b=IY/b70uQkfNcOvG95qR85gtce9dNWWC9d4LharpB80GyLkxcIXalshEC63IKG9K4i0
	Hxn+Kl2Gm77cuaZkgdPszmaTIlVl15lRmhI+L6edAa81G8JJAslSsPXo2NGfVyRI+gTV
	v1BfuUcTS3cqIX+f3aueeypneYiyRwlEqfU7hRluuovRiw8Q1FuDmzCDbFUxIjbLQdAw
	SAl6FQ0QzJ8Lox7ti2ALvMoEj4ySsUGywgXflDrP/pBRdVLPjeQf2YI8cbquaOc6L+rw
	/NZx7yHKIbz7TS6y0uP8H8TvG+uS50JpBY1/gmX02+k3+UInJSBFbqQP7Z7AbwOOMFfF
	WTiw==
X-Gm-Message-State: AMCzsaXrFebR78MeBqRcoWS4ds0UEuTr85mInt49k1aIRctqEQWtHUSk
	XM222FCwAdjAQKp+BuI+NH7E+34a
X-Google-Smtp-Source: AOwi7QAJpIxwyQm9x3oYlEwhYbTJR0xMHWwGvEC90zi4chcxiYyrvC/wwptf1ExmACX+jw8aY2fPmg==
X-Received: by 10.237.62.53 with SMTP id l50mr21197677qtf.270.1508258755292;
	Tue, 17 Oct 2017 09:45:55 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.45.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:45:54 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:43:58 -0300
Message-Id: <20171017164426.25277-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v3 14/42] ppc: remove duplicated includes
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:04 -0000

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



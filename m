Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V0p-0002Ue-0P
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0j-0002I8-OI
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0e-0003Y7-Nq
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:29 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:51919)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0c-0003XG-LR; Tue, 17 Oct 2017 12:46:26 -0400
Received: by mail-qt0-x241.google.com with SMTP id h4so4903464qtk.8;
	Tue, 17 Oct 2017 09:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ch+CPk9GmAp5UkOliFCycMyQwiY2+nO8rnq0N+MEPzk=;
	b=hX/FJPMdCGiYrwbfvzurw59k0xOX9BcL0SmqLwFT3b8pKcBHnVJRAM5gWySzYHvXRQ
	ytLXpy33lonQjwZBcvv8kyxqr5Hg4LSmiRGVodKNUIEmV/zT/1VRyjf6E84YJjD4nwJ6
	XAbg5SPLZw0pQ9kqZL2262Al8w1Gg+wQsxfHn8DqYe2kAbGCLQr0dcliK4cYaBwS/z1f
	PAFP4WJVipIwjGovXOOdERrQzaldM1vL+kvmEeOO2A2Rnm1+j33NW4hp922ZqkFpBcps
	UG7AjfB8M1MuUadUdaLgIyGZP7qSeXreN7hsfXRYGAFTFxAPb1wZkFSNJx+nLdvvDtto
	oBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Ch+CPk9GmAp5UkOliFCycMyQwiY2+nO8rnq0N+MEPzk=;
	b=Vur0ZK29Zohf7uhmzGK6YCsUX322nGldnYtgPLj1dAGCSaTmY2oNsF57n2wKAA9MjM
	Hs5rvaYOh0EXI3wKRQuE3pgbSykJXgO39ilAJc1zvxDZTb3qmuSYy7/X/sm/GLdEU1QE
	TQTbCNjGI/Ny4Sw98s0XjQPaZi9Cnz2RgYF+yAsUxU4JljYjHoc2lhvgapvbAEcS6+ze
	kGV8aLUU+JpKKqSUESQ0rvsm8LghTqSTxKZ03kNM8smHNKH59nEU9qiBgmoIuzBDWHO/
	SMmth31n3l1+wLfGwoO+epR3lIhGMuaqF8nBsVR7eeCJuTN5Dy17VNfCyoiNU/nz9PWX
	B6oQ==
X-Gm-Message-State: AMCzsaXXPS7MThVj7Y14HBio2LYIVKbm2FBuGdLF677mi6YHAC92Zf+m
	GlOjB59q517qM3rnRlFIATk=
X-Google-Smtp-Source: ABhQp+QBKQout5imUecQyE9OyCJACBzYQOIF0l1lUNFu0vPud/WYsWlfzOYwpf90Bczimjj93pA3JQ==
X-Received: by 10.200.50.15 with SMTP id x15mr19040504qta.302.1508258786160;
	Tue, 17 Oct 2017 09:46:26 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.46.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:25 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>,
	Corey Minyard <cminyard@mvista.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:10 -0300
Message-Id: <20171017164426.25277-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v3 26/42] hw/ipmi: remove old i386 dependency
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:37 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Corey Minyard <cminyard@mvista.com>
Tested-by: Corey Minyard <cminyard@mvista.com>
---
no IPMI entry!

 hw/ipmi/isa_ipmi_bt.c  | 1 -
 hw/ipmi/isa_ipmi_kcs.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
index 2fcc3d2e7c..e098fd5206 100644
--- a/hw/ipmi/isa_ipmi_bt.c
+++ b/hw/ipmi/isa_ipmi_bt.c
@@ -26,7 +26,6 @@
 #include "hw/hw.h"
 #include "hw/ipmi/ipmi.h"
 #include "hw/isa/isa.h"
-#include "hw/i386/pc.h"
 
 /* Control register */
 #define IPMI_BT_CLR_WR_BIT         0
diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c
index 80444977a0..689587b65d 100644
--- a/hw/ipmi/isa_ipmi_kcs.c
+++ b/hw/ipmi/isa_ipmi_kcs.c
@@ -26,7 +26,6 @@
 #include "hw/hw.h"
 #include "hw/ipmi/ipmi.h"
 #include "hw/isa/isa.h"
-#include "hw/i386/pc.h"
 
 #define IPMI_KCS_OBF_BIT        0
 #define IPMI_KCS_IBF_BIT        1
-- 
2.15.0.rc0



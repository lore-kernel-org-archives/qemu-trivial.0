Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V1A-0002rn-6C
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:47:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47496)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V18-0002pR-37
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V17-0003n3-Hb
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:58 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:57081)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V12-0003jr-8S; Tue, 17 Oct 2017 12:46:52 -0400
Received: by mail-qt0-x243.google.com with SMTP id z28so4901458qtz.13;
	Tue, 17 Oct 2017 09:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=D0yehFZ4d7mxtj+wQQM9jqZIrD4Bnz1YvAosT1Vk0o8=;
	b=OfohoXZAKvioi16nWa7ZXIouhu3BkbwR8jszhhhnYwuFrtLXry8x0gbePDnxs/Zc5D
	1mbRbIep43oGz1aJe1YWAPCMEbhvq5A5kPMPq/vw6d1KNKvjUwD/VtdcYKEo/raDVL2X
	p5RaivTAadOeFuEuOTEcEOk3y1onla1nwdVdhuGqSUR5ZURQhPHUll0dRpt/saQYDeAa
	oX2jFMk+MRYWl4sOVjRenzPojaAQJIoh3VFjlLkcZWbpEIkb3dLOjmttCKjMGDjUK8sg
	rneV0wrvWx2uwim1sTVeiquMmrUjgH0n9957zkDUzE0w+tHxeguVYZp/y1r6pRUcQUEO
	VYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=D0yehFZ4d7mxtj+wQQM9jqZIrD4Bnz1YvAosT1Vk0o8=;
	b=agBnr5cN+VzHKInN1bFH9Zov3FaAOa4RuOSDiIlAOciLUTlJA3pRxgHZ3dicz2UGME
	PByB3ie0yJdwoi4txJshXqdRZUt02/63ssEzlFz2/B5OxrBlkbVkVxdWjYToHBMflf/U
	xBGEwslrGTVHANorH8xgz6Trs8dKMa6/zB+G5XgpMzSc++wYpBpbR8HdZRNJwZHEtLfM
	Q5nd9pW1x4+H/f3f4qJDW0dd+9r+hK4COl7xZOi6KolFJIXmMhr3HH0STO+ev9pX6fpt
	G3n6xy81/jMHGjc0yp1/KNYDIwU4Y0RdXbG9BjAjm2Sbd7MzhcngGCGpD94s0Z/Gzcgy
	zWuQ==
X-Gm-Message-State: AMCzsaU/dvSuRh1ICiLIeO3vGa87Gm5d5zblDS/EcD/i9MGf+39qLohU
	LHnk/r0h/uZpwo9GBGeXwUs=
X-Google-Smtp-Source: AOwi7QBeA3OFx99nrZnzXlN3hW79W3QI+EHsmJCXLFSqkJ7FAoT4RDdiwrYRtltvNHw8ZiMjbB9W5Q==
X-Received: by 10.200.44.46 with SMTP id d43mr21444594qta.283.1508258811776;
	Tue, 17 Oct 2017 09:46:51 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.46.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:51 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>, Yongbok Kim <yongbok.kim@imgtec.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:19 -0300
Message-Id: <20171017164426.25277-36-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v3 35/42] hw/display/vga: "vga.h" only
 contains registers defs, rename it "vga_regs.h"
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:59 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/{vga.h => vga_regs.h} | 0
 hw/display/vga.c                 | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/display/{vga.h => vga_regs.h} (100%)

diff --git a/hw/display/vga.h b/hw/display/vga_regs.h
similarity index 100%
rename from hw/display/vga.h
rename to hw/display/vga_regs.h
diff --git a/hw/display/vga.c b/hw/display/vga.c
index ed24ef7076..35696b6fdd 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -24,11 +24,11 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
-#include "vga.h"
 #include "ui/console.h"
 #include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 #include "vga_int.h"
+#include "vga_regs.h"
 #include "ui/pixel_ops.h"
 #include "qemu/timer.h"
 #include "hw/xen/xen.h"
-- 
2.15.0.rc0



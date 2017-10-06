Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cQd-0000aS-Ai
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:53:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQa-0000XF-2y
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQZ-0006TH-Bv
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:12 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:51472)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQX-0006Qk-3S; Fri, 06 Oct 2017 19:53:09 -0400
Received: by mail-qt0-x241.google.com with SMTP id q4so34332092qtq.8;
	Fri, 06 Oct 2017 16:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QnSAemlhAlxePX2Db1XfE+qraoQWJcXTmefuRFTkacs=;
	b=uea+WMpgJ2R3yhnRA7aE+r7vHGeU4xHH/Xsq+f7M2cr8VjuTEV9iCpX8u40e5xN0D1
	VHPErV9NVm7w6a1khNF7IvKfHtScci+4f/gWIL1Ds734Sz1xKItYn9a0qpbn0qUJ04xL
	1LTlO0BGPKhZVuzgqPasPA82QS/VM/09Oz+ooDKhOQwLydfVOWv+XCgU1VLzw7TLVP55
	tC1Mbvl7YLc7OjDS2mZbZvBqEuK6gC3sZE2QR5ARMvjrGk/QdKcpto1H6Sjr62U5Cnen
	GBb+U2qlbMabERi4v+sLYa9kdxrxKVvV4xCvU9EYOaPe1Qy3jkoK6CmLJmkzFThWVbv/
	Wfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=QnSAemlhAlxePX2Db1XfE+qraoQWJcXTmefuRFTkacs=;
	b=d3YRwrTV+xD5lnrQlb22D5j9j3cq1kMedpcpmVn9CMDklvFPGPh5QDmnm/Sj7XPSb1
	nkSsyM7aEjbKXwRk8q4WjselpAOh7/Z9b3qSzXzu+nceU6SCOHTGvOYKWQ2fqwMD6lsg
	aBe/+tug27cYGGZwGzxNmuTyeAGCOktM6rQER/dXhura68xOD3HQnS2DJ6BgC9WmpBa/
	S0H7/IDRKp33lYt2YjKq2bDIJ0ILY5iV1f40NHKm9g2ClzEadYv2hSR6HzhylHKT2+UZ
	B0QZRHNzagjXvpeK+iuvM/hpN1pe2cADpNTIaFLJBp6huEg1ZDullvZ9xmq9/bDUdiGZ
	Rm3A==
X-Gm-Message-State: AMCzsaWG2qezMmbDqFid1u67iV+mrp8GRa0vJqgMtklMNxBigpNtRFWt
	TuNzBTilTh5yLSbAvo7dXjg=
X-Google-Smtp-Source: AOwi7QBm4i8k6Z/+UAqZRtzUQKQBxF6BurSmrLZMTKfIxQkVYrnRZFw7CFplYAlUn0O/EFKl3O/WlQ==
X-Received: by 10.237.60.101 with SMTP id u34mr5153388qte.153.1507333988567;
	Fri, 06 Oct 2017 16:53:08 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.53.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:53:08 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:40 -0300
Message-Id: <20171006235023.11952-46-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 45/88] hw/display: use g_new() family of
 functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:53:13 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: squashed pxa2xx_lcd.c]
---
Andrzej should the tc6393xb files go under the PXA2XX section in MAINTAINERS?

 hw/display/pxa2xx_lcd.c | 2 +-
 hw/display/tc6393xb.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index 845521c5b2..0ca997cae2 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -1006,7 +1006,7 @@ PXA2xxLCDState *pxa2xx_lcdc_init(MemoryRegion *sysmem,
     PXA2xxLCDState *s;
     DisplaySurface *surface;
 
-    s = (PXA2xxLCDState *) g_malloc0(sizeof(PXA2xxLCDState));
+    s = g_new0(PXA2xxLCDState, 1);
     s->invalidated = 1;
     s->irq = irq;
     s->sysmem = sysmem;
diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 74d10af3d4..2bd73a27e0 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -570,7 +570,7 @@ TC6393xbState *tc6393xb_init(MemoryRegion *sysmem, uint32_t base, qemu_irq irq)
         },
     };
 
-    s = (TC6393xbState *) g_malloc0(sizeof(TC6393xbState));
+    s = g_new0(TC6393xbState, 1);
     s->irq = irq;
     s->gpio_in = qemu_allocate_irqs(tc6393xb_gpio_set, s, TC6393XB_GPIOS);
 
-- 
2.14.2



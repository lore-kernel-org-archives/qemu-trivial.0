Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kF6Nk-00062u-RV
	for mharc-qemu-trivial@gnu.org; Sun, 06 Sep 2020 21:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kF6Ni-00060X-TH; Sun, 06 Sep 2020 21:55:42 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kF6Nh-0007IF-Dn; Sun, 06 Sep 2020 21:55:42 -0400
Received: by mail-wm1-x342.google.com with SMTP id e17so12876177wme.0;
 Sun, 06 Sep 2020 18:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xNSWRDcvmAyUx6UsL/JgHCLjynBWkV6qzS6fjCc2u/4=;
 b=Ub12186lydpQdjQDobPDaDVAcemBEmB5K40dMvKJkSB4NPwZe+ePaSCTfAtLdNC6FI
 bPKAbNK2I1GZdMocOGUEF2FmGJ+Q3UxXfYMtixrAhgaQyVzopbKZmw49NoxW+YqAZBBU
 hcMRo07l0cTCY+sSYslnlDHhfMkcI+j71dS+KfYkb36Nn8sTXQAZfUjIJNMGPZUMcvU3
 nH67StjksCps87QX2UiWtnwqvQtwPPPplnVekeRLaGnF/eauSn5Cz8pHlLPUjLLu7XIW
 L254QH11I365LiZyXqtLL10amJCV9NfsB6laJDf3NHG9gOcaXwTDKTFpy+r0M7B4qh7o
 5mXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xNSWRDcvmAyUx6UsL/JgHCLjynBWkV6qzS6fjCc2u/4=;
 b=s2k/WFkM2woEp6JYsQtEQpqu1DboM7RewyH715a1kN/7LKeDORcqQL2aBPoLxgSgtM
 XfyjHhBFpNbOMOjz9twZlP2JsOdt4n4mw9rjnQOUeNU5EoWuZzAYfOiP6lyx7tF+bisi
 kYyqpeX4iUp3Dp3GzPHG5HQE+dQhEP7gaEE81cacvUA1a+AbwEGOx6O6BeOyh3CdSTrt
 FIHNGifunPjGazEa7R41x1e1gZxZNhn63uj/EG+qQ2lcegj8oXzKvyE9OtBXfhSB59DU
 9idaAkKKoALecajGTjmlzFMLp27O9skga8DPmk/9hd5qFa47zTuD0quNUSPLpGjembpn
 hDhw==
X-Gm-Message-State: AOAM531BwSUtca61HoJQryfaKhNSSqhYU60CCrh7ubXPfuYZnqmEZR5n
 GmoZceOoBLZeoYje9kTbyM95aMT2NPE=
X-Google-Smtp-Source: ABdhPJyEeJ8ovfrWSFuAWleTJVWWUnUmlW/AmXhxIIay8RbNE7WPmBWQfXBf3cMkU1RSw28/co5dWA==
X-Received: by 2002:a1c:40a:: with SMTP id 10mr18965790wme.61.1599443739377;
 Sun, 06 Sep 2020 18:55:39 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id b84sm29377773wmd.0.2020.09.06.18.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 18:55:38 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 1/7] hw/char/serial: Assert serial_ioport_read/write offset
 fits 8 bytes
Date: Mon,  7 Sep 2020 03:55:29 +0200
Message-Id: <20200907015535.827885-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200907015535.827885-1-f4bug@amsat.org>
References: <20200907015535.827885-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Sep 2020 01:55:43 -0000

The serial device has 8 registers, each 8-bit. The MemoryRegionOps
'serial_io_ops' is initialized with max_access_size=1, and all
memory_region_init_io() callers correctly set the region size to
8 bytes:
- serial_io_realize
- serial_isa_realizefn
- serial_pci_realize
- multi_serial_pci_realize

It is safe to assert the offset argument of serial_ioport_read()
and serial_ioport_write() is always less than 8.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/serial.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 23864794929..a855ef66ea2 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -344,7 +344,7 @@ static void serial_ioport_write(void *opaque, hwaddr addr, uint64_t val,
 {
     SerialState *s = opaque;
 
-    addr &= 7;
+    assert(size == 1 && addr < 8);
     trace_serial_ioport_write(addr, val);
     switch(addr) {
     default:
@@ -485,7 +485,7 @@ static uint64_t serial_ioport_read(void *opaque, hwaddr addr, unsigned size)
     SerialState *s = opaque;
     uint32_t ret;
 
-    addr &= 7;
+    assert(size == 1 && addr < 8);
     switch(addr) {
     default:
     case 0:
-- 
2.26.2



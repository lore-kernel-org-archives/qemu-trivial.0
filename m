Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cPO-0007xI-Jw
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:51:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPM-0007vI-E4
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPL-0005QM-IQ
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:56 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:44688)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPJ-0005Nw-DQ; Fri, 06 Oct 2017 19:51:53 -0400
Received: by mail-qt0-x244.google.com with SMTP id v28so25500449qtv.1;
	Fri, 06 Oct 2017 16:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7ChP/X3F7l2FIOjI9t12T0W22s/6umZOBD0cRFaavIk=;
	b=kzgRpWxTimwklnJxSEw6ST+/z0rzFNDw1IuryW4Xw9C6bNK9wSsaF+dWoxv9yh56SD
	+/H+u16CGlV7BDUuqYq3cRczcwNVdg6nw2fu0ZHfArL8rMqd+YCtzh9siaNBkX9rKxAI
	D8piijA3mQhH0KO5D5rPegJiQNKbLUZdZovWo4Ypc3wZCXiVK0KWTwODCDOxgT0bhYT3
	R+4EeVuCwVEttVRa6Wtc4kwcg6IDLJyqvNeGi3AOsUVeG15oCWGrVamnnv3CSvgzPZ0q
	lejn5x/KKCC3o3+9YEZynWxTqzjE9mpAkd5zJGP5yujPxtsgy3hcrWZSCGCArjrXnMmo
	jO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=7ChP/X3F7l2FIOjI9t12T0W22s/6umZOBD0cRFaavIk=;
	b=HIS3/nMfCtuZ1Lxt6t+1iFi9wQbJEr30Bco1G+kK6kHBsZFkdOJpVRL/OUmTWKQrmh
	M/LWmQA89tcMphsfQXCQPr0GS1Rm3rv0eXLGzVHLASxOv7fBeXhIGsPCnuIyE0Gbt4l/
	16i3xQEHYm9UrNOQ4MnrVx3E3lmm90QMTRNga5TYsHMCEey1XheZuy9P/2+9sYK1Sgy2
	+boeD/YlbAimvGkWFaeUnXcn8uKOrBrBHmpRzEzQND17XNAgr52nHpbZfH2839LCl0G3
	JW3zVdBPEwoF/dKhO1qeSJsyaupsPaa3Q+EJveXeEjUHK1/tebdkCWJJjPkCt4g/VmSP
	iycQ==
X-Gm-Message-State: AMCzsaVZhtiike/J5u3ly9SZ4jQkx6+9TK8P6KoziRFB6tRSht5WbhBK
	yCyzaSon1i2YgeMOqljkjTM=
X-Google-Smtp-Source: AOwi7QB6CGTFEnMIQ5qNZv0T3XF0SIIwUFyMg+mYJstm15z2sYiU1Ho1L30SGnrpbDgZgDpu6Sz6Dg==
X-Received: by 10.237.36.145 with SMTP id t17mr5204456qtc.162.1507333912865;
	Fri, 06 Oct 2017 16:51:52 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.51.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:51:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Thomas Huth <huth@tuxfamily.org>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:18 -0300
Message-Id: <20171006235023.11952-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 23/88] M68K: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:51:57 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: squashed commits]
---
 hw/m68k/mcf5206.c | 4 ++--
 hw/m68k/mcf5208.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index b81901fdfd..df45e99547 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -137,7 +137,7 @@ static m5206_timer_state *m5206_timer_init(qemu_irq irq)
     m5206_timer_state *s;
     QEMUBH *bh;
 
-    s = (m5206_timer_state *)g_malloc0(sizeof(m5206_timer_state));
+    s = g_new0(m5206_timer_state, 1);
     bh = qemu_bh_new(m5206_timer_trigger, s);
     s->timer = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
     s->irq = irq;
@@ -533,7 +533,7 @@ qemu_irq *mcf5206_init(MemoryRegion *sysmem, uint32_t base, M68kCPU *cpu)
     m5206_mbar_state *s;
     qemu_irq *pic;
 
-    s = (m5206_mbar_state *)g_malloc0(sizeof(m5206_mbar_state));
+    s = g_new0(m5206_mbar_state, 1);
 
     memory_region_init_io(&s->iomem, NULL, &m5206_mbar_ops, s,
                           "mbar", 0x00001000);
diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index b9dde75106..9b93af5fbd 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -183,7 +183,7 @@ static void mcf5208_sys_init(MemoryRegion *address_space, qemu_irq *pic)
     memory_region_add_subregion(address_space, 0xfc0a8000, iomem);
     /* Timers.  */
     for (i = 0; i < 2; i++) {
-        s = (m5208_timer_state *)g_malloc0(sizeof(m5208_timer_state));
+        s = g_new0(m5208_timer_state, 1);
         bh = qemu_bh_new(m5208_timer_trigger, s);
         s->timer = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
         memory_region_init_io(&s->iomem, NULL, &m5208_timer_ops, s,
-- 
2.14.2



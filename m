Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hHVdJ-0000nQ-MX
	for mharc-qemu-trivial@gnu.org; Fri, 19 Apr 2019 11:40:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stephen.checkoway@oberlin.edu>) id 1hHVdH-0000mQ-0w
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2019 11:40:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stephen.checkoway@oberlin.edu>) id 1hHVdG-0001dO-2K
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2019 11:40:54 -0400
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142]:40188)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stephen.checkoway@oberlin.edu>)
	id 1hHVdF-0001cq-P7
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2019 11:40:54 -0400
Received: by mail-it1-x142.google.com with SMTP id k64so8745823itb.5
	for <qemu-trivial@nongnu.org>; Fri, 19 Apr 2019 08:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oberlin-edu.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7zqS2468sT/HtISYB7AAYD8azC667R2g/p5gFYHkaPE=;
	b=RA/J0VnLQievAa8YV5gFDgDFEDG+GF0UvMGCw8OO/4W3MWuGI548yNG3L3vGmkcFPA
	KrytLgINElecr0gGSKWpRcLJSPc7FifO/2dtgOzodIutrF08lSU7T8SiZrH3zR9+6ZJW
	GA1nr3yeIvp2GhCe8HeREdNN7Odg+9OcymbTVeR/yIs1A57RplG0Wbx96dbRVis/1xez
	PzyVUg7QAxz3e5kAJkBlUfZpti2pJ0je5ffif5d1u9rfzUnNODITxfsyv2C3rwFfeD92
	PJ0CJ+y438y6jFx1uPWt7BYMIGzpw3SXDvfmEsy0P/TBK6H81/yPM/eBeCyUeLhbt/32
	CHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7zqS2468sT/HtISYB7AAYD8azC667R2g/p5gFYHkaPE=;
	b=tdoIvcCbIOXdMcwvMVlCHPe2Ox0SxBlfmpSrI1fic/UmIk6KwCvzFtRv5Ilp5GKw+p
	NZTo1JuoO0THPCrFDXwL9O6n0YBbYoE6pvxfZHaEA3pWNb1MQD2dmfwsrNePsMUy4HgR
	EKpwNioTAdllQunOclbR5HZ8DdSQ98qGnNn5I8j2VwVPykzo33uSbGDnF/5/H0k+r3mQ
	p6HmPFid5PCxKKmjVDEwS8X9EMhOOIJAcH7vkFranL/8CjdlRDm/R6i/DKHvX27MZSZj
	7Erz0coorHVqP/itlRlASjd8uMTeZBLs3vKazvp9FxQWhuA9sQ1ovfjXZcYRbjaqWDEr
	VE4A==
X-Gm-Message-State: APjAAAXnSG8qz25wLZIpGFj90YRWKFBG+sPOWwmes+n1OYj28GVWYD53
	fJ8p64NkXoB4UsslnlMV5M/6IQ==
X-Google-Smtp-Source: APXvYqxfEOYKQz7U56VO37UbsLPATlQlt8gjVfj0UOhpvmZwXNDRzSpWY0yOoVAQfhwy/8lo+oExeg==
X-Received: by 2002:a24:ee83:: with SMTP id b125mr3801829iti.43.1555688452779; 
	Fri, 19 Apr 2019 08:40:52 -0700 (PDT)
Received: from worksec.wireless.oberlin.edu (ip-70-93.wireless.oberlin.edu.
	[132.162.70.93]) by smtp.gmail.com with ESMTPSA id
	t67sm2487587ita.35.2019.04.19.08.40.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Apr 2019 08:40:52 -0700 (PDT)
From: Stephen Checkoway <stephen.checkoway@oberlin.edu>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Date: Fri, 19 Apr 2019 11:40:41 -0400
Message-Id: <20190419154041.77802-1-stephen.checkoway@oberlin.edu>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::142
Subject: [Qemu-trivial] [PATCH v3] hw/char/escc: Lower irq when transmit
 buffer is filled
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
X-List-Received-Date: Fri, 19 Apr 2019 15:40:56 -0000

The SCC/ESCC will briefly stop asserting an interrupt when the
transmit FIFO is filled.

This code doesn't model the transmit FIFO/shift register so the
pending transmit interrupt is never deasserted which means that an
edge-triggered interrupt controller will never see the low-to-high
transition it needs to raise another interrupt. The practical
consequence of this is that guest firmware with an interrupt service
routine for the ESCC that does not send all of the data it has
immediately will stop sending data if the following sequence of
events occurs:
1. Disable processor interrupts
2. Write a character to the ESCC
3. Add additional characters to a buffer which is drained by the ISR
4. Enable processor interrupts

In this case, the first character will be sent, the interrupt will
fire and the ISR will output the second character. Since the pending
transmit interrupt remains asserted, no additional interrupts will
ever fire.

This behavior was triggered by firmware for an embedded system with a
Z85C30 which necessitated this patch.

This patch fixes that situation by explicitly lowering the IRQ when a
character is written to the buffer and no other interrupts are currently
pending.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---

I added a sentence about the Z85C30 necessitating this to the commit message.

 hw/char/escc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/char/escc.c b/hw/char/escc.c
index 628f5f81f7..c5b05a63f1 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -509,6 +509,13 @@ static void escc_mem_write(void *opaque, hwaddr addr,
         break;
     case SERIAL_DATA:
         trace_escc_mem_writeb_data(CHN_C(s), val);
+        /*
+         * Lower the irq when data is written to the Tx buffer and no other
+         * interrupts are currently pending. The irq will be raised again once
+         * the Tx buffer becomes empty below.
+         */
+        s->txint = 0;
+        escc_update_irq(s);
         s->tx = val;
         if (s->wregs[W_TXCTRL2] & TXCTRL2_TXEN) { // tx enabled
             if (qemu_chr_fe_backend_connected(&s->chr)) {
-- 
2.20.1 (Apple Git-117)



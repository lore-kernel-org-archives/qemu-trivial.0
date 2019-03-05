Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h12LV-0000X4-K0
	for mharc-qemu-trivial@gnu.org; Tue, 05 Mar 2019 00:10:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stephen.checkoway@oberlin.edu>) id 1h12LT-0000Wl-GY
	for qemu-trivial@nongnu.org; Tue, 05 Mar 2019 00:10:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stephen.checkoway@oberlin.edu>) id 1h12LS-0004kU-LS
	for qemu-trivial@nongnu.org; Tue, 05 Mar 2019 00:10:27 -0500
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144]:37043)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stephen.checkoway@oberlin.edu>)
	id 1h12LS-0004hP-B7
	for qemu-trivial@nongnu.org; Tue, 05 Mar 2019 00:10:26 -0500
Received: by mail-it1-x144.google.com with SMTP id z124so2513388itc.2
	for <qemu-trivial@nongnu.org>; Mon, 04 Mar 2019 21:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oberlin-edu.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=PK7QaXcW2z3RLKlFr1TIfOFVNgtL+K1a3H3n3C2YYkM=;
	b=G48hdU9oikaG2h2oS2OZ/J6UGIzG+oS6/ky5kItGoKFeW3B8RgbdSZvWtMCgX9Uqou
	2TdtnEY6FQsv49LTnUY3UvFLCsZZtWpW9qPq4jO0HvLkn4ccgBcDC4qzb576GVNnF5uC
	GkdWiu+RxVlXDEXb1M1MaguRBmlmFidhphPcUaE9Q2BIW6vqq05VZNFYC89CtRzzR58q
	FcaqHA1Dx4Zkwfxp229YVF80yPkKIYMza0j/1ZNRKm6CHGj+nQQY2aWBZ5FwIFrmY7vm
	xulokV1gOHWjptWGexkQgk8F0oH9gZB4XKx+YiESSuteg4VDC3GJDSuKFT9Dgmk+CW3I
	IgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PK7QaXcW2z3RLKlFr1TIfOFVNgtL+K1a3H3n3C2YYkM=;
	b=BMONwOPr4oYhfeYZ+aXEE9b70NYYuqeh86PylPXN/bLcEFwJ/ufMT5MwlgVcZwawOl
	dKDorhAoEWWzRSXjEoxdFUPofgH+JFd678GXxuYTXeDdLyCT+LkKOK76uJMpMKFsL46N
	Niwmr3G1qb4e117dA+KOnp+8pl+dnMOb07ybfbsEBdJxfu7AFdPttDqrTzb2q5f2Tb/c
	wNWoXK9K//m7anraFGAEXy1zaz2iTJwG5KMVb63aRVPdBWqHoGSdwWTnfFiZOFO1vefo
	OKVNg6R2uLT4cWX2Bf0wgVVBUAyssX9crTPnLvED04zGKbS7fIkdbmfm6VWy6GuVemVh
	W7Cw==
X-Gm-Message-State: APjAAAVYU0bb17TyF0Z9XCuhOuEg/lpl4M+9HUltRPxYGUayRk4E6FUo
	w3ed/BdsrZCyS/DvHu4jKNu/MA==
X-Google-Smtp-Source: APXvYqxXA3bzbg6ryyzNIEnEqiavtI2b+PpmvhfvSJKkQhgpOvgTAwQwvnyBtOEaD+jwe46XDpMBWA==
X-Received: by 2002:a02:228f:: with SMTP id o137mr168736jao.76.1551762623849; 
	Mon, 04 Mar 2019 21:10:23 -0800 (PST)
Received: from worksec.oberlin.net (ip-210-181.oberlin.net. [208.66.210.181])
	by smtp.gmail.com with ESMTPSA id
	b16sm4231545itb.26.2019.03.04.21.10.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Mar 2019 21:10:23 -0800 (PST)
From: Stephen Checkoway <stephen.checkoway@oberlin.edu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stephen Checkoway <stephen.checkoway@oberlin.edu>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Tue,  5 Mar 2019 00:10:07 -0500
Message-Id: <20190305051007.56009-1-stephen.checkoway@oberlin.edu>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::144
Subject: [Qemu-trivial] [PATCH] hw/char/escc: Lower irq when transmit buffer
 is filled
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
X-List-Received-Date: Tue, 05 Mar 2019 05:10:28 -0000

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

This fixes that situation by explicitly lowering the IRQ when a
character is written to the buffer.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
---
 hw/char/escc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/escc.c b/hw/char/escc.c
index 628f5f81f7..bea55ad8da 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -509,6 +509,7 @@ static void escc_mem_write(void *opaque, hwaddr addr,
         break;
     case SERIAL_DATA:
         trace_escc_mem_writeb_data(CHN_C(s), val);
+        qemu_irq_lower(s->irq);
         s->tx = val;
         if (s->wregs[W_TXCTRL2] & TXCTRL2_TXEN) { // tx enabled
             if (qemu_chr_fe_backend_connected(&s->chr)) {
-- 
2.17.2 (Apple Git-113)



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cEkBU-0006WA-LG
	for mharc-qemu-trivial@gnu.org; Wed, 07 Dec 2016 16:55:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.gacek@gmail.com>) id 1cEjXr-000515-Mn
	for qemu-trivial@nongnu.org; Wed, 07 Dec 2016 16:14:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.gacek@gmail.com>) id 1cEjXq-00059o-Ru
	for qemu-trivial@nongnu.org; Wed, 07 Dec 2016 16:14:31 -0500
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36526)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.gacek@gmail.com>)
	id 1cEjXl-00052k-PT; Wed, 07 Dec 2016 16:14:25 -0500
Received: by mail-wm0-f65.google.com with SMTP id m203so30378882wma.3;
	Wed, 07 Dec 2016 13:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=483TAA4zPLa0qMvCW5kqgy7nh8VaQNJNzUPFIZekY38=;
	b=FWEBptjV55QDNCRsGpY5/yfvSaE2Rw++13/Kd7m+XLbvefbknR9fMSdADlRH5Gpqa4
	N9BmP6vGVdBt2K5x4LphV02qqxLawXMqYpzHPsK8D0S2Dge47V9XwfW3jiT6QUnbmeUX
	k5A2/HDZIrHjZbm9f79J6ZnJTO23vlUpn0/vBC0M1zCT0mUZ9gFd15h4Xjp1HoA4Dt5c
	uwByRc39w3zN9sswm77NUSaeAQ6PGXMQaJ/j/SR0L4X88XhvBnGO3ZSHTluzeQMvzBJT
	Rh94NeGkpCi7U5KprHY+5CuQ5HWmtDda448UgGtByqBhOrZXZGypkR+kJL+X8pxkQTtz
	rAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=483TAA4zPLa0qMvCW5kqgy7nh8VaQNJNzUPFIZekY38=;
	b=eE3dbgQagHLa2qaeQrnP/dFtCDqARsktqeMV2CvgPzWQeYUDi6oMtUSDE+CDOnwUra
	OMk5ssdu6xS8XOyQtC8w2BXEYnQKLakJWubecm1O8YkYex/sdFxo7vtEgozv81KWGGF0
	GVOPriGPvIv8ekhWL1Wn8H5T4cPd/bmdfx1fREZ4Tyv8R2jON+081WB0GOtklm/OnF7o
	FsLHCygJ445VNWFqrs2B/P8pA8pLEzx8k2P7NBAPhX2gdkQ4pYyWkK/ODPd2rIqFBSw2
	Jn1tX4meyXsrR9VGcUTOW6Jg7CmfgZAuRtShV4AiYSDJ5VyrPTZBPxpw9pjA66pY0NuL
	K4Sg==
X-Gm-Message-State: AKaTC02LoPADvoOdig5xP7KJKKX4EMqRUfnGLhxOwxZm4tljksEkfmrOlSuQTcCbujbxFZSRXJ6oaqGRGjy86w==
X-Received: by 10.46.77.17 with SMTP id a17mr31829359ljb.34.1481145183036;
	Wed, 07 Dec 2016 13:13:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.114.173.102 with HTTP; Wed, 7 Dec 2016 13:12:42 -0800 (PST)
From: Andrew Gacek <andrew.gacek@gmail.com>
Date: Wed, 7 Dec 2016 15:12:42 -0600
Message-ID: <CAHgzvFi2wjPtJzU9hXzdaZsbYr085VCbjfsiUeVc5XnUR8arHw@mail.gmail.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.65
X-Mailman-Approved-At: Wed, 07 Dec 2016 16:55:27 -0500
Subject: [Qemu-trivial] [PATCH] cadence_uart: Check if receiver timeout
 counter is disabled
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
X-List-Received-Date: Wed, 07 Dec 2016 21:14:32 -0000

When register Rcvr_timeout_reg0 (R_RTOR in cadence_uart.c) is set to
0, the receiver timeout counter should be disabled. See page 1801 of
"Zynq-7000 AP SoC Technical Reference Manual". This commit adds a
such a check before setting the receive timeout interrupt.

Signed-off-by: Andrew Gacek <andrew.gacek@gmail.com>
---
 hw/char/cadence_uart.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 0215d65..54194b1 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -138,7 +138,9 @@ static void fifo_trigger_update(void *opaque)
 {
     CadenceUARTState *s = opaque;

-    s->r[R_CISR] |= UART_INTR_TIMEOUT;
+    if (s->r[R_RTOR]) {
+        s->r[R_CISR] |= UART_INTR_TIMEOUT;
+    }

     uart_update_status(s);
 }
-- 
2.7.4


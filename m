Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fpxb8-0007z5-FG
	for mharc-qemu-trivial@gnu.org; Wed, 15 Aug 2018 11:20:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hans-erik.floryd@rt-labs.com>) id 1fpwHW-0006Hx-FP
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2018 09:56:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hans-erik.floryd@rt-labs.com>) id 1fpwHS-0003xF-Ud
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2018 09:56:14 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:42987)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hans-erik.floryd@rt-labs.com>)
	id 1fpwHS-0003pE-7u
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2018 09:56:10 -0400
Received: by mail-lf1-x143.google.com with SMTP id 95-v6so931054lfy.9
	for <qemu-trivial@nongnu.org>; Wed, 15 Aug 2018 06:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rt-labs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Kb7aWsu8zS2IOeSg5ko2TIUgTzGM9dkgU/rT5SsqMLM=;
	b=MhD4+XCQj0BrIes7LClbQxbrP/ngDMfp7Rbizj13fpbfCB6EIsrEe+IgmXzeYpMfYn
	OHsPCJ388iy5hr8CcZ4sLTo5fZzwC29EwrYSZ3mbZLRe7us1EQKe/fGcIaEBDzqFfps0
	MyceSAVmvI9x0GXfnLzcYGLRlgE3/vM9T8NaYuvuSYh2o//TXi53MPqyffcZqCoJ4KP/
	7qjfsBLfoVBk2YM7qWs2tmap6Dudd3FbGUPvuDipesLjc80oVj4Tbkp/3K9qL5QL6dXd
	wYHIJaxI29lml0wli9dv6uZIGP8hMUAn2KpRlDWNLgXg+mprN13I6XcIQrte9c7nsJvA
	nv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Kb7aWsu8zS2IOeSg5ko2TIUgTzGM9dkgU/rT5SsqMLM=;
	b=kzq7nrVkCdFuXRT5YtkA4Awi68PVmUNdbjdZ2vJ1BrHgr2/KkUXDnh6XaAoXwYsn3V
	84YpiuTFMdvgK44asscNcpe2n8yWBJDHekbQZMVq3ulevEPMeX/xgu9VBsqxVi+Kov9K
	x6PPB+YuutYHsPBVziah3B4ZFelYSQs3vXNlFbglvYCzzr3HYLpdLMYIx7lhzTe28IPD
	8bnITHpAi1mx3FTqrZiGzwoOxVaeXy19dGRMFmZmLkRV+CGwzolM87JSsXZ7beW/aFze
	QvjL4e0m1jNus2r+j1vMzfVOek1n2T9AoOhFP8yQV+S96OVMu4B1eIFeAoyV2SIAspXQ
	kwpQ==
X-Gm-Message-State: AOUpUlFu+/ad5M5i7hWAkSGKtUgF1PaU/14WPwo5oVrCYusriLkKPsNd
	5Pabn71MGOBxgwZ1PP7nFIxgE2tKSGk=
X-Google-Smtp-Source: AA+uWPy/wvH3nxdnS9xPg8r1bqFO4rcb0WSLW9R7ujBPx22euIjoVrJcvXEB/K0bPiph1YQVHCOcvw==
X-Received: by 2002:a19:a705:: with SMTP id
	q5-v6mr17832662lfe.148.1534341368484; 
	Wed, 15 Aug 2018 06:56:08 -0700 (PDT)
Received: from rtlap25.rt-labs.intra (h-72-195.A137.corp.bahnhof.se.
	[212.116.72.195]) by smtp.gmail.com with ESMTPSA id
	d4-v6sm339900lfc.57.2018.08.15.06.56.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Aug 2018 06:56:07 -0700 (PDT)
From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
To: qemu-trivial@nongnu.org
Cc: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org (open list:i.MX31),
	qemu-devel@nongnu.org (open list:All patches CC here)
Date: Wed, 15 Aug 2018 15:55:54 +0200
Message-Id: <1534341354-11956-1-git-send-email-hans-erik.floryd@rt-labs.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
X-Mailman-Approved-At: Wed, 15 Aug 2018 11:20:33 -0400
Subject: [Qemu-trivial] [PATCH] imx_serial: Generate interrupt on receive
 data ready if enabled
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
X-List-Received-Date: Wed, 15 Aug 2018 13:56:15 -0000

Generate an interrupt if USR2_RDR and UCR4_DREN are both set.

Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
---
 hw/char/imx_serial.c         | 3 ++-
 include/hw/char/imx_serial.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index 0747db9..1e36319 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -74,8 +74,9 @@ static void imx_update(IMXSerialState *s)
     mask = (s->ucr1 & UCR1_TXMPTYEN) ? USR2_TXFE : 0;
     /*
      * TCEN and TXDC are both bit 3
+     * RDR and DREN are both bit 0
      */
-    mask |= s->ucr4 & UCR4_TCEN;
+    mask |= s->ucr4 & (UCR4_TCEN | UCR4_DREN);
 
     usr2 = s->usr2 & mask;
 
diff --git a/include/hw/char/imx_serial.h b/include/hw/char/imx_serial.h
index ee80da1..c8b7428 100644
--- a/include/hw/char/imx_serial.h
+++ b/include/hw/char/imx_serial.h
@@ -68,6 +68,7 @@
 #define UCR2_RXEN       (1<<1)    /* Receiver enable */
 #define UCR2_SRST       (1<<0)    /* Reset complete */
 
+#define UCR4_DREN       BIT(0)    /* Receive Data Ready interrupt enable */
 #define UCR4_TCEN       BIT(3)    /* TX complete interrupt enable */
 
 #define UTS1_TXEMPTY    (1<<6)
-- 
2.7.4



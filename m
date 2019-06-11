Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1haigR-00060V-7n
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2019 11:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48303)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rfried.dev@gmail.com>) id 1haiFZ-0007ho-Sj
 for qemu-trivial@nongnu.org; Tue, 11 Jun 2019 10:59:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rfried.dev@gmail.com>) id 1haiCA-000200-K3
 for qemu-trivial@nongnu.org; Tue, 11 Jun 2019 10:56:19 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40779)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rfried.dev@gmail.com>)
 id 1haiC9-0001z7-HA; Tue, 11 Jun 2019 10:56:17 -0400
Received: by mail-wr1-x444.google.com with SMTP id p11so13401719wre.7;
 Tue, 11 Jun 2019 07:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b8QxGLK6EVt7cbCYgVtj1jSDrG4K14o9KcZtEODesBA=;
 b=ZYMOEX4zTFZPD17SXfo4vTcVyh779cTHfYlRemdj9zF0aEhXQrf7s6EmncsEiiY9hI
 PV7v3hCLwNP0JZnFc8alVDW2Cd/6stlfUVpIdlbMdk1OCyqaMcZDOqpnEunz5JU2FY7l
 k+rkHMt7MzSI9qan3mIDDLUj6cmu0T8CjtsN84HMTjm9h/iSi8AhAhWEWu7rH/jcaA1e
 3FZ0pZ749M4s9BKySPW93ctUbMa9SbBgwF98/p2ZJw9mXkesOzTpxwwX4uhLlVj500ra
 6P62p9Xsc5wDL0HeTYclYZCeWVClMYFLyfZwJfCtGNbt54mAo8VLFDTZATm6xN5+eSYC
 ncsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b8QxGLK6EVt7cbCYgVtj1jSDrG4K14o9KcZtEODesBA=;
 b=sEMkUTR8eYp+mnOx96bAeHFPcLaq2Ty+n+YNCKlLufMH4ylxDh5VFF4qpsuZPzHiP3
 e8eCsDz/u9ecElYL9bV9HPM7cFjAFEefEQ3aKt7Nok3e2Tut7qY+XNOzeursJVnXj15n
 e8D4hBQ7s+Gp80LywdKN76NKSCe78PQI+5W400UtzCL9yTGz/sqtmF9RddZqlf8ncgYu
 WJHQfc85gElhQjRNVeKFORzBYU+n542HcO/80lMwssuctoqSucH8m1aZccEeLAq/yexR
 KwTxNiwJK/rmE74NtWt4cFXVmRukqsPl7F6CHuCyN/6xa7aSmmCsBQuc2kz7eQHOUTph
 eV5g==
X-Gm-Message-State: APjAAAXbP/BYCOg5vxRPlDstbytGLR/vsv5U9RM9iOkdG/ojdytSXam3
 gejxBKG13xEypdTu9k82H7h68N2tzTg=
X-Google-Smtp-Source: APXvYqxd+yONIAO8l3krTtlBPd4Qy0u1tMLozFUfpu5L1DfNBHrw8uaXTWqeomKbodFeNp8kFJeEEg==
X-Received: by 2002:a5d:6190:: with SMTP id j16mr1300461wru.49.1560264976135; 
 Tue, 11 Jun 2019 07:56:16 -0700 (PDT)
Received: from localhost.localdomain ([141.226.31.91])
 by smtp.gmail.com with ESMTPSA id v3sm1806137wmh.31.2019.06.11.07.56.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:56:15 -0700 (PDT)
From: Ramon Fried <rfried.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Ramon Fried <rfried.dev@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq)
Date: Tue, 11 Jun 2019 17:55:56 +0300
Message-Id: <20190611145556.12940-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
X-Mailman-Approved-At: Tue, 11 Jun 2019 11:27:28 -0400
Subject: [Qemu-trivial] [PATCH v2] net: cadence_gem: fix compilation error
 when debug is on
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
X-List-Received-Date: Tue, 11 Jun 2019 14:59:51 -0000

defining CADENCE_GEM_ERR_DEBUG causes compilation
errors, fix that.

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
v2: change %lx to HWADDR_PRIx and %lx to %zdx

 hw/net/cadence_gem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 7f63411430..e9b1b1e2eb 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -982,8 +982,8 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
             return -1;
         }
 
-        DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize),
-                rx_desc_get_buffer(s->rx_desc[q]));
+        DB_PRINT("copy %d bytes to 0x%" HWADDR_PRIx "\n", MIN(bytes_to_copy, rxbufsize),
+                rx_desc_get_buffer(s, s->rx_desc[q]));
 
         /* Copy packet data to emulated DMA buffer */
         address_space_write(&s->dma_as, rx_desc_get_buffer(s, s->rx_desc[q]) +
@@ -1156,7 +1156,7 @@ static void gem_transmit(CadenceGEMState *s)
             if (tx_desc_get_length(desc) > sizeof(tx_packet) -
                                                (p - tx_packet)) {
                 DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space " \
-                         "0x%x\n", (unsigned)packet_desc_addr,
+                         "0x%zdx\n", (unsigned)packet_desc_addr,
                          (unsigned)tx_desc_get_length(desc),
                          sizeof(tx_packet) - (p - tx_packet));
                 break;
-- 
2.21.0



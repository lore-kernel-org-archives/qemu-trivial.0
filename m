Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW39P-00051e-92
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 13:13:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW39M-0004yI-7S
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW39L-0002EX-Dv
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:36 -0400
Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c]:44956)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW39F-0002Au-KN; Thu, 21 Jun 2018 13:13:29 -0400
Received: by mail-qk0-x22c.google.com with SMTP id 185-v6so2162513qkk.11;
	Thu, 21 Jun 2018 10:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wSP6w8ohT2gfRXsFROSFrxCscONP4h6pn9+UEY1nQCg=;
	b=Oz1Psqwzay0kRNRR4yC2KHxvIABj7Q3fKuHF2ppXGj8p1oweV+3Kwsj8VWwFJpwz0e
	4SjGII7pZGcvt9q+EUJgfeF05vU4NopfRJz+hKoCKJjjdN64LwXcjyzgCSE7iwS+D1sj
	gM19OrDHEcJcIFpdPtXGwn/+LoYUvH2w20JJbsupEvNA0oLeyRSZvvaJJ+I5inXlw+UZ
	Liq3IS4xdXWMJNf7iYEv9VQRI/d3hpREsz3NIgb5jX1rvsPGEM70NKbm3dT2MS91MFxV
	mP0NS+WevHXNQkj8zufUKkK7ljut5sh1AGtU6Cyuan1AARTOTpPcsv0UCIiSZU4Z+yby
	v3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=wSP6w8ohT2gfRXsFROSFrxCscONP4h6pn9+UEY1nQCg=;
	b=FJI/S1d/NvqnjIq9FEuExAdlitQmKEQ5MdjoZqHGupcIksWQCEIKaHgaYGbN5R2RcU
	bq6F4WqxSz81dNjoZYDQgyLl4g7FBK0gB6OCwP2+LLXNcboDuUSYUMRdJ3x2i4LrS2Zl
	gVt0Otab4FOZFyPx/4yvXhLduh8RNnGOTZHM8rylq2Rca4Mmr+IPEkZGTLaC81pUYz8/
	XB19q6cjtowre9/mUBGLV6zl+Fddgx+lpEmDDOVt10PGdyZjSLrfJzRglHP4hChYb8ed
	8QE/sWDIuQOSOVfW2FvOepH5pjRpryc81pXjREvX5KEK7Ey+9jspx1HW/SrUNa3k5/LG
	28tw==
X-Gm-Message-State: APt69E1CHr2efxgt5s8Cwvf6rOI5VyNvRUKdnZ1YG85n2/YycLuqYdiS
	nyH6U0AHfyAaOJSKiG2ZnvY=
X-Google-Smtp-Source: ADUXVKJ9A7akUGhy6SOCzAncvMRD2YCxS0q6+AVwoKv7wmiGD/As44FCwESJLqRRlb0eaEYvDIvrwA==
X-Received: by 2002:a37:c24d:: with SMTP id
	j13-v6mr22269669qkm.210.1529601209019; 
	Thu, 21 Jun 2018 10:13:29 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	t14-v6sm3166159qtp.65.2018.06.21.10.13.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 10:13:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Date: Thu, 21 Jun 2018 14:12:54 -0300
Message-Id: <20180621171257.14897-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621171257.14897-1-f4bug@amsat.org>
References: <20180621171257.14897-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22c
Subject: [Qemu-trivial] [PATCH 08/11] hw/net/ne2000: Convert printf() calls
 to trace events
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
X-List-Received-Date: Thu, 21 Jun 2018 17:13:37 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/ne2000.c     | 8 ++------
 hw/net/trace-events | 2 ++
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
index 26b234b7eb..07d79e317f 100644
--- a/hw/net/ne2000.c
+++ b/hw/net/ne2000.c
@@ -277,9 +277,7 @@ static void ne2000_ioport_write(void *opaque, uint32_t addr, uint32_t val)
     int offset, page, index;
 
     addr &= 0xf;
-#ifdef DEBUG_NE2000
-    printf("NE2000: write addr=0x%x val=0x%02x\n", addr, val);
-#endif
+    trace_ne2000_ioport_write(addr, val);
     if (addr == E8390_CMD) {
         /* control register */
         s->cmd = val;
@@ -442,9 +440,7 @@ static uint32_t ne2000_ioport_read(void *opaque, uint32_t addr)
             break;
         }
     }
-#ifdef DEBUG_NE2000
-    printf("NE2000: read addr=0x%x val=%02x\n", addr, ret);
-#endif
+    trace_ne2000_ioport_read(addr, ret);
     return ret;
 }
 
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 95a1de01e9..f57010df37 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -26,6 +26,8 @@ mipsnet_irq(uint32_t isr, uint32_t intctl) "set irq to %d (0x%02x)"
 # hw/net/ne2000.c
 ne2000_read(uint64_t addr, uint64_t val) "read addr=0x%" PRIx64 " val=0x%" PRIx64
 ne2000_write(uint64_t addr, uint64_t val) "write addr=0x%" PRIx64 " val=0x%" PRIx64
+ne2000_ioport_read(uint64_t addr, uint64_t val) "io read addr=0x%02" PRIx64 " val=0x%02" PRIx64
+ne2000_ioport_write(uint64_t addr, uint64_t val) "io write addr=0x%02" PRIx64 " val=0x%02" PRIx64
 
 # hw/net/opencores_eth.c
 open_eth_mii_write(unsigned idx, uint16_t v) "MII[0x%02x] <- 0x%04x"
-- 
2.18.0.rc2



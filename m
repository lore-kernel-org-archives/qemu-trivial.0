Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoHz-0003yM-V9
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHs-0003gs-S6
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHr-0007BL-Ti
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:12 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:36237)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHr-0007AJ-Mp; Mon, 05 Mar 2018 06:28:11 -0500
Received: by mail-wm0-x242.google.com with SMTP id 188so14712854wme.1;
	Mon, 05 Mar 2018 03:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CAb+wta0wEs2+Mdeu4nRoeUEL/WV+6Oly8onn57JaZY=;
	b=g0uKD8Bz41lLLpCdd7h2n1k/d/ABz17jHPoLxsT0pojJ/Jz5vXTr2/9WRAa/7t3maU
	lL7PEGK1rI3BOeW1D1Q8pXtncg/l4ExrA6JD6NXvuJPetWELCg1xzOXHsdaBihslca5H
	tmiYPgRYG5BXrxyWgKfxvf/8QN78ZEvnsoorHVhuzpRbXsNXffr4fw/tas01JPaU49cS
	3hK0xSle69AQWb7Ns439u5d6Ddi+j1t0/ITB630LnZ0Wuwv8La8cFAKuV3QMZhoaKAbH
	fIYjZuTHzoH1vhftxNLmVXw74r2mcitb08iITiGEsR9vwURRtckytRv5AO/oceDj+9XZ
	xc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=CAb+wta0wEs2+Mdeu4nRoeUEL/WV+6Oly8onn57JaZY=;
	b=YCgAqhLJKBjTo6dzXghc0LLdEMQ+y0+GG41iIrf/yR6u7zGAzvA643pybNfVQpUU89
	/LyZ9XcO2oQZzeytTtnitb0I28cjEHPV1++qhxWXWQ6/soBN3YE4o0eYOPNkxb4Nb8Nl
	55d+aeGMKcHN+eDzzaZMUzdVkBn+lRt678ewlf1/MHAKD3n4vufZR92UzWu1VzIAQvkY
	p4ZuAb6c5b6nRB6H6tbNOG1trc864CivvOrEX76+KE/YPX/5EJs0arYycK04O4wk/NfZ
	askSuBVk3ryWHEq2p/Zda9kb5dWpNtdEcQk8wUpI42RCboU7oVuiirx0sXbddvUPlLd7
	ACkA==
X-Gm-Message-State: AElRT7EZmTKYwTuGFIobn8pvNt6+OFZyukZp/wVDkJbzI+YKpyHJgX8x
	TyQD7Wqi6EzRVv1qjaBp9ffMOv/mZQs=
X-Google-Smtp-Source: AG47ELu2tnAC0mco3mDAFVzU7v42opkTpmZMd+/6tI2SWGR7zpbz+B/MATvXU2Is2d9TvVWds++AEg==
X-Received: by 10.28.223.212 with SMTP id w203mr8465248wmg.96.1520249290532;
	Mon, 05 Mar 2018 03:28:10 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.28.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:28:09 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Beniamino Galvani <b.galvani@gmail.com>,
	qemu-arm@nongnu.org (open list:Allwinner-a10)
Date: Mon,  5 Mar 2018 08:27:25 -0300
Message-Id: <20180305112732.26471-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: [Qemu-trivial] [PATCH v2 23/30] hw/net: use the BYTE-based
 definitions
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
X-List-Received-Date: Mon, 05 Mar 2018 11:28:18 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/net/allwinner_emac.h | 4 ++--
 hw/net/e1000e.c                 | 6 +++---
 hw/net/eepro100.c               | 6 ++----
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/include/hw/net/allwinner_emac.h b/include/hw/net/allwinner_emac.h
index 4cc8aab7ec..93ec0e7067 100644
--- a/include/hw/net/allwinner_emac.h
+++ b/include/hw/net/allwinner_emac.h
@@ -125,8 +125,8 @@
 #define EMAC_INT_RX         (1 << 8)
 
 /* Due to lack of specifications, size of fifos is chosen arbitrarily */
-#define TX_FIFO_SIZE        (4 * 1024)
-#define RX_FIFO_SIZE        (32 * 1024)
+#define TX_FIFO_SIZE        (4 * K_BYTE)
+#define RX_FIFO_SIZE        (32 * K_BYTE)
 
 #define NUM_TX_FIFOS        2
 #define RX_HDR_SIZE         8
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index 16a9417a85..767b35fca8 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -81,10 +81,10 @@ typedef struct E1000EState {
 #define E1000E_IO_IDX       2
 #define E1000E_MSIX_IDX     3
 
-#define E1000E_MMIO_SIZE    (128 * 1024)
-#define E1000E_FLASH_SIZE   (128 * 1024)
+#define E1000E_MMIO_SIZE    (128 * K_BYTE)
+#define E1000E_FLASH_SIZE   (128 * K_BYTE)
 #define E1000E_IO_SIZE      (32)
-#define E1000E_MSIX_SIZE    (16 * 1024)
+#define E1000E_MSIX_SIZE    (16 * K_BYTE)
 
 #define E1000E_MSIX_TABLE   (0x0000)
 #define E1000E_MSIX_PBA     (0x2000)
diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index a07a63247e..6fdeb05259 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -60,8 +60,6 @@
  * changed to pad short packets itself. */
 #define CONFIG_PAD_RECEIVED_FRAMES
 
-#define KiB 1024
-
 /* Debug EEPRO100 card. */
 #if 0
 # define DEBUG_EEPRO100
@@ -104,9 +102,9 @@
 /* Use 64 word EEPROM. TODO: could be a runtime option. */
 #define EEPROM_SIZE     64
 
-#define PCI_MEM_SIZE            (4 * KiB)
+#define PCI_MEM_SIZE            (4 * K_BYTE)
 #define PCI_IO_SIZE             64
-#define PCI_FLASH_SIZE          (128 * KiB)
+#define PCI_FLASH_SIZE          (128 * K_BYTE)
 
 #define BITS(n, m) (((0xffffffffU << (31 - n)) >> (31 - n + m)) << m)
 
-- 
2.16.2



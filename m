Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7sFj-0004zN-AL
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 19:39:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFb-0004t0-Oc
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:39:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFb-0002B8-33
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:39:35 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:36018)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFY-00028t-TL; Mon, 08 May 2017 19:39:32 -0400
Received: by mail-qk0-x242.google.com with SMTP id y128so12357635qka.3;
	Mon, 08 May 2017 16:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+CUNShpX2u3nBqTURsBCdZuQUIxj0BMRH+Wn9WYG7zM=;
	b=Q5vZz8Th8thm39Vhe/acgFYoXHRRq8YggIng+46QdUjs2QxUxwSsb8YKnydQgpddt3
	UBhHcMU/vjhHfjq8t8a8HF0YD+rYNIQxTye4qh7EZ8wpLphJFG0aBi7Dn+HVPlX5W94L
	tDILGq89nBqK9DdF+V/wskDhzQx1EDKiZ87LHH+33/ZvsJbOfAlqpY9uJSPHWW7w7GeX
	tMjwIisu+ZVXngOD3nDVip4B1PYfQjVDn4jwUEDDHA4JICFTWaYr4reT0Mkm+nz35PcU
	EXvIz4XkhbZcPiQxAMxnMQfrs8ce35aUrP1B/hiN+cGAnwrUZLyrA+7J1P8n/wjFe9nz
	2qOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=+CUNShpX2u3nBqTURsBCdZuQUIxj0BMRH+Wn9WYG7zM=;
	b=Elv4lENYYJaOWJ87H5C13ZXCyPo57MUcK7umCa2DzhtpoAUqaEQEyqa/0o2of3nORi
	QKwJOlOrPfbD/D1c9tScjMv8UYDLpkO/HzYZbdquUHL1NvGITB/G/yMpbp+LrBQQzkjt
	CJjWBaoiw5/cH6JwGtoezVWXj8C34ke2dyQmKT/ymn4OX5nJcsfM9FZbhsg3xLMnpE2K
	6590CkeJWFMdddTdQCQCeCI0119WdHB0c41B1ZPIXUJroUSzquNgT3QAbo0qqtBAgLkb
	K4gCLONx55ZTQda/xF9xOQ56JVwB5rS65iiyrMAUH80u13f2yPhfzZ9UL6z0/yPTHble
	ofKg==
X-Gm-Message-State: AODbwcBp2n7JI8C942/aWJddc/Iz8jghjik4ylch9MM1aObxwvMX08Rc
	omxo22JtDp4p6KteUQDfxQ==
X-Received: by 10.55.198.89 with SMTP id b86mr25726520qkj.188.1494286772211;
	Mon, 08 May 2017 16:39:32 -0700 (PDT)
Received: from localhost.localdomain ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	v64sm13556099qkg.38.2017.05.08.16.39.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 May 2017 16:39:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Mon,  8 May 2017 20:39:08 -0300
Message-Id: <20170508233918.9043-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170508233918.9043-1-f4bug@amsat.org>
References: <20170508233918.9043-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 01/11] hw/net: removed obsolete comments
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
X-List-Received-Date: Mon, 08 May 2017 23:39:36 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/pcnet-pci.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/net/pcnet-pci.c b/hw/net/pcnet-pci.c
index 0acf8a4879..bdb533436e 100644
--- a/hw/net/pcnet-pci.c
+++ b/hw/net/pcnet-pci.c
@@ -38,14 +38,6 @@
 
 #include "pcnet.h"
 
-//#define PCNET_DEBUG
-//#define PCNET_DEBUG_IO
-//#define PCNET_DEBUG_BCR
-//#define PCNET_DEBUG_CSR
-//#define PCNET_DEBUG_RMD
-//#define PCNET_DEBUG_TMD
-//#define PCNET_DEBUG_MATCH
-
 #define TYPE_PCI_PCNET "pcnet"
 
 #define PCI_PCNET(obj) \
@@ -239,8 +231,6 @@ static const VMStateDescription vmstate_pci_pcnet = {
     }
 };
 
-/* PCI interface */
-
 static const MemoryRegionOps pcnet_mmio_ops = {
     .old_mmio = {
         .read = { pcnet_mmio_readb, pcnet_mmio_readw, pcnet_mmio_readl },
-- 
2.11.0



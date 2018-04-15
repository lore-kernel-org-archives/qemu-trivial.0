Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rKd-000696-7s
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:45:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52318)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKa-00065A-FF
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:45:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKY-0001Tw-VJ
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:45:12 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:39893)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKY-0001Tc-Qd; Sun, 15 Apr 2018 19:45:10 -0400
Received: by mail-qk0-x243.google.com with SMTP id j73so14799144qke.6;
	Sun, 15 Apr 2018 16:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=86o8dKC93x01hL9xCcRHnNJazGc4w4JtLIf3gq6jfbs=;
	b=kU5mZHGyhsIGeqpHAszZ64Y5Lz57g4t9CG4wwPV7gPpOWJI6VfWTSyqn1JOiwyRMun
	85ppD4/R2XURtQMT7eCfLjlvUi91NZwW8LIBduujLGwDjd3n25+rTSPoOV4GZRazcF7T
	NxcbhUa4xYuTHLXB7jmQfwcMhiQW4pF6+RR5tP6My+bX+fLfUKXTo8+D32bm/2Vy8nH4
	mkMX24VM1FRAKc8+wr4munlYj6rAhASOupgTk4MXYb4PZsQ4k6Ux+rTvQhwi96T30JxI
	NExKlSis3ydfusIevqKssR71J9+Fp+VzPds/EeSTWXeUrUj2O4yEnqfR/Vm+QHOJRE1+
	Io5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=86o8dKC93x01hL9xCcRHnNJazGc4w4JtLIf3gq6jfbs=;
	b=SCtENUfZRM+5FUrBwsXlxHmSiX+Sbf5Vnhj+q2C6birv+RiwWhluulmghP1Paphp+K
	kCJbGgvOB5nkEPmeYgu1jQzdKmqnErEM4XDH929QsM97Y6KWvAQEokQcOLXN+a0y1c2n
	Nbi4vo436RgDgEqaFi71Wam5QnCyKnASKv940k2Cd66FFzn7Rus7SiDv98Myw3o7Y8fF
	Hv0lAAT5EE+e6e9KRtNdU3pU41U6Ogxz8GR/B+V1y5QKyquRiAEwtVqtmuvo+NzXuAmM
	dZNAJDYfLQltrFU24tEulM6N+/4erjT7aE5FB4EYyR62DrVYfeABDG5Iyyu7uD82y7Xx
	IuAw==
X-Gm-Message-State: ALQs6tCrXCH/0Gd8QROTsyyx9FeL2bsF3uCnxa0z/T0c37x8uVQmsgSU
	wz/XllBNpeSzq/v4VwbeBR4m6lZfWYU=
X-Google-Smtp-Source: AIpwx4991B9QEMwf8JoTfj4r9rm69l6KlQ4eb0ezENI4ff7LtRsc8vjsULgX+D0p23no3o1uOdYJig==
X-Received: by 10.55.195.217 with SMTP id r86mr7514017qkl.267.1523835909939;
	Sun, 15 Apr 2018 16:45:09 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.45.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:45:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Beniamino Galvani <b.galvani@gmail.com>,
	qemu-arm@nongnu.org (open list:Allwinner-a10)
Date: Sun, 15 Apr 2018 20:42:59 -0300
Message-Id: <20180415234307.28132-34-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v3 33/41] hw/net: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:45:13 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/net/allwinner_emac.h | 5 +++--
 hw/net/e1000e.c                 | 7 ++++---
 hw/net/e1000x_common.c          | 3 ++-
 hw/net/eepro100.c               | 7 +++----
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/include/hw/net/allwinner_emac.h b/include/hw/net/allwinner_emac.h
index 4cc8aab7ec..4b53b6485c 100644
--- a/include/hw/net/allwinner_emac.h
+++ b/include/hw/net/allwinner_emac.h
@@ -23,6 +23,7 @@
 #ifndef ALLWINNER_EMAC_H
 #define ALLWINNER_EMAC_H
 
+#include "qemu/units.h"
 #include "net/net.h"
 #include "qemu/fifo8.h"
 #include "hw/net/mii.h"
@@ -125,8 +126,8 @@
 #define EMAC_INT_RX         (1 << 8)
 
 /* Due to lack of specifications, size of fifos is chosen arbitrarily */
-#define TX_FIFO_SIZE        (4 * 1024)
-#define RX_FIFO_SIZE        (32 * 1024)
+#define TX_FIFO_SIZE        (4 * K_BYTE)
+#define RX_FIFO_SIZE        (32 * K_BYTE)
 
 #define NUM_TX_FIFOS        2
 #define RX_HDR_SIZE         8
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index 16a9417a85..101efe7c83 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -34,6 +34,7 @@
 */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "net/net.h"
 #include "net/tap.h"
 #include "qemu/range.h"
@@ -81,10 +82,10 @@ typedef struct E1000EState {
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
diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
index eb0e097137..58c8db77e9 100644
--- a/hw/net/e1000x_common.c
+++ b/hw/net/e1000x_common.c
@@ -23,6 +23,7 @@
 */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/hw.h"
 #include "hw/pci/pci.h"
 #include "net/net.h"
@@ -111,7 +112,7 @@ bool e1000x_is_oversized(uint32_t *mac, size_t size)
     static const int maximum_ethernet_vlan_size = 1522;
     /* this is the size past which hardware will
        drop packets when setting LPE=1 */
-    static const int maximum_ethernet_lpe_size = 16384;
+    static const int maximum_ethernet_lpe_size = 16 * K_BYTE;
 
     if ((size > maximum_ethernet_lpe_size ||
         (size > maximum_ethernet_vlan_size
diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index a07a63247e..a02e2b55e8 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -41,6 +41,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/hw.h"
 #include "hw/pci/pci.h"
 #include "net/net.h"
@@ -60,8 +61,6 @@
  * changed to pad short packets itself. */
 #define CONFIG_PAD_RECEIVED_FRAMES
 
-#define KiB 1024
-
 /* Debug EEPRO100 card. */
 #if 0
 # define DEBUG_EEPRO100
@@ -104,9 +103,9 @@
 /* Use 64 word EEPROM. TODO: could be a runtime option. */
 #define EEPROM_SIZE     64
 
-#define PCI_MEM_SIZE            (4 * KiB)
+#define PCI_MEM_SIZE            (4 * K_BYTE)
 #define PCI_IO_SIZE             64
-#define PCI_FLASH_SIZE          (128 * KiB)
+#define PCI_FLASH_SIZE          (128 * K_BYTE)
 
 #define BITS(n, m) (((0xffffffffU << (31 - n)) >> (31 - n + m)) << m)
 
-- 
2.17.0



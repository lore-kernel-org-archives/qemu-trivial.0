Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoHm-0003ZW-5E
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHh-0003To-8t
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHe-0006y8-98
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:01 -0500
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:37785)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHe-0006xA-2l; Mon, 05 Mar 2018 06:27:58 -0500
Received: by mail-wr0-x244.google.com with SMTP id z12so16870748wrg.4;
	Mon, 05 Mar 2018 03:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GrYTHGWZZxj3PFoz1XsOLL9eIrqWuaK/gk0iisz1uHw=;
	b=SIpQLUVhASDU7l7hXUs+thmMTqX/YHZX4s9TyV65aVd82pLNvUsgkD13ympyj7AiZD
	8XHdyR33USxAj0aJWnI7buhBcKUG9rhSYpcvQGz2XpIvTEg5tZJXn+VSuZ2gdlqsmfTp
	AuoGa/EvwNfgPtRSAN1A6JqR2o0kHh6ZRlM/e/Nv0zc1dtYxDtMK5yD98nGQjN1oYUaA
	atsh2Dk9umLMDTOnSXPWVGO84KwDpIzHMlGMcaoqUr382p+qsn2urWb1NkKpWxLeHsX4
	4MXYfI1vulfERvrGbV+uiVUuc86mxXUkM7Wa0lsvlZLRAx3zY/olTmZS5sGtWggQ5hQt
	FssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=GrYTHGWZZxj3PFoz1XsOLL9eIrqWuaK/gk0iisz1uHw=;
	b=kmSKiowgV9QCcfHKfJ+LTOZvIuzssZvdkeYqhZa84Ke53H3yLZV9bGnsIeEv8SAXbT
	sMCbiqwBUWO8zvivXcK4bhjoga8V3Cbv2Ilv8cJvFaXgfoCtByWbC1qFTbs/X7KWT0US
	qlqPfbIC4xUodugnX4rOXArcYA475OaLNrdtBgipaES3eAmnsXtMWY2kDEoU1OoMAGDZ
	Ws+nhpHTq9vAJql4oxH2PEBsfS7P9D9eSF11l7EipSKJ13oc8i88ZHyIPBeIO/DDEvdK
	HU6QG+S9QqxxBQi8v+5AN8FuTGt67vEC3isSMdVSjcY3jHy3AZ9J0yAUgpeo5PcaQnOf
	rTTg==
X-Gm-Message-State: APf1xPCtP6YAjUE4wAr/3ISv+RLdOEDRgEh1oP2PDCtWm6v/8PX/Tc97
	qYvkrszeQwSt7xGgQ4Hys8Ov54HJ
X-Google-Smtp-Source: AG47ELv8Sy/V0MVn5BfVFUgjmDLdH09DCx6cadLjPTgx/+7B01/RTxNAgCQJMJbaMy87vGwyU/8Kig==
X-Received: by 10.223.224.199 with SMTP id e7mr11418231wri.263.1520249276924; 
	Mon, 05 Mar 2018 03:27:56 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.27.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:27:56 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Date: Mon,  5 Mar 2018 08:27:14 -0300
Message-Id: <20180305112732.26471-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: [Qemu-trivial] [PATCH v2 12/30] hw/hppa: use the BYTE-based
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
X-List-Received-Date: Mon, 05 Mar 2018 11:28:02 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/hppa/dino.c    | 2 +-
 hw/hppa/machine.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 15aefde09c..7728123cc8 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -76,7 +76,7 @@
 /* #define xxx    0x200 - bit 9 not used */
 #define RS232INT  0x400
 
-#define DINO_MEM_CHUNK_SIZE (8 * 1024 * 1024) /* 8MB */
+#define DINO_MEM_CHUNK_SIZE (8 * M_BYTE)
 
 #define DINO_PCI_HOST_BRIDGE(obj) \
     OBJECT_CHECK(DinoState, (obj), TYPE_DINO_PCI_HOST_BRIDGE)
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 22a15112df..8fd364ad43 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -177,8 +177,8 @@ static void machine_hppa_init(MachineState *machine)
         }
         qemu_log_mask(CPU_LOG_PAGE, "Kernel loaded at 0x%08" PRIx64
                       "-0x%08" PRIx64 ", entry at 0x%08" PRIx64
-                      ", size %ld kB.\n",
-                      kernel_low, kernel_high, kernel_entry, size / 1024);
+                      ", size %llu kB\n",
+                      kernel_low, kernel_high, kernel_entry, size / K_BYTE);
 
         if (kernel_cmdline) {
             cpu[0]->env.gr[24] = 0x4000;
@@ -202,8 +202,8 @@ static void machine_hppa_init(MachineState *machine)
                (1) Due to sign-extension problems and PDC,
                put the initrd no higher than 1G.
                (2) Reserve 64k for stack.  */
-            initrd_base = MIN(ram_size, 1024 * 1024 * 1024);
-            initrd_base = initrd_base - 64 * 1024;
+            initrd_base = MIN(ram_size, 1 * G_BYTE);
+            initrd_base = initrd_base - 64 * K_BYTE;
             initrd_base = (initrd_base - initrd_size) & TARGET_PAGE_MASK;
 
             if (initrd_base < kernel_high) {
-- 
2.16.2



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBRt-0005an-Ha
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:16:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRr-0005XR-JM
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRq-0003Ch-JM
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:43 -0400
Received: from mail-qk0-x230.google.com ([2607:f8b0:400d:c09::230]:35581)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRo-0003A3-7v; Sun, 10 Jun 2018 21:16:40 -0400
Received: by mail-qk0-x230.google.com with SMTP id d130-v6so12074926qkc.2;
	Sun, 10 Jun 2018 18:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Zecdqlx+t+QjL5kIVXQiXiPtE7455TcRO//qafDt234=;
	b=lR49vALo/mpNJ6/IjzRaxMgto1ADnjWNIjOIb8tissJ1Rcz9XHRQ/T80CPs/yhBq/T
	Dt0fcZyLyxemeVh6cM9ooTm/Zk9mnaA9IerZ2Ww+HboZhz+ncQPwSlsF1dAaTA2piwcd
	GMNlo9UhVHEx3LMnELCS57MM8E/rGIv7X9YJF9sWp8MP5uSXRVLtsxfWX2bFE1A8ve4B
	QFm+j3YNJTOoAU0z8z+JbuaD9qmTyseKM8fQf6RyqC++Y4NvcNIr/e3cLbGyjhJKXWxt
	mQw6/6ZH59LqvlFvROLHjtuu0haML1EEo3pDSJK5a7kF1kzAPblGgxw+AGmOc2f3eVpi
	Ojnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Zecdqlx+t+QjL5kIVXQiXiPtE7455TcRO//qafDt234=;
	b=SEKWmQy/JVW1OYYBNlbFCylujjZjC+TN0oSpuVnQwAuHPqCwj8r3ae7+zRBRnHofSG
	sYo57t3b1oTXHSVzxtPXTJ20spxK3ntsefsOmHZ2y9cGtYJR9aKdZOLf99N+Fu6sb+/5
	tyFDpKTrYWjnVluffDW5v/308GpqOwmOhwRbPL5K0V5v6qLM7x+L5BKM0pQD3MD7AH24
	vqIN6OzZVUMqxPXU3Df5asitWwSrNEVCpLTZ7utSMSuMVKiRuGY6H1lqn/kPDx9IMwjd
	fM1QRScSYjcSpCRsMl6+OmrqqDOG/+jlfZx+zD8TDpkuR7TQ1MLgOx8DGiQFQETq7ZJ6
	zDGQ==
X-Gm-Message-State: APt69E1/b6wm7e/n7u/bRLNnZ9EYRNEgKilFZi9da9nqqJm4t/KODyBz
	meDtpGlyzvDS/ejwjEAf7Bk=
X-Google-Smtp-Source: ADUXVKIoEYO87o0LYxBtDCmsspzbIlIdzsMVMJpW3ajSyb0IcH0xWYWEi8tA9aUhqwouLvHBCdLUNQ==
X-Received: by 2002:a37:5f01:: with SMTP id
	t1-v6mr2745758qkb.231.1528679799843; 
	Sun, 10 Jun 2018 18:16:39 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.16.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:16:39 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Date: Sun, 10 Jun 2018 22:14:41 -0300
Message-Id: <20180611011501.10235-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::230
Subject: [Qemu-trivial] [PATCH v4 20/40] hw/hppa: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 11 Jun 2018 01:16:44 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/hppa/dino.c    |  3 ++-
 hw/hppa/machine.c | 10 +++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 26f2704cd5..564b938e3a 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/hw.h"
@@ -76,7 +77,7 @@
 /* #define xxx    0x200 - bit 9 not used */
 #define RS232INT  0x400
 
-#define DINO_MEM_CHUNK_SIZE (8 * 1024 * 1024) /* 8MB */
+#define DINO_MEM_CHUNK_SIZE (8 * MiB)
 
 #define DINO_PCI_HOST_BRIDGE(obj) \
     OBJECT_CHECK(DinoState, (obj), TYPE_DINO_PCI_HOST_BRIDGE)
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 2ba26962f9..77513223b0 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -17,7 +17,7 @@
 #include "hw/timer/i8254.h"
 #include "hw/char/serial.h"
 #include "hppa_sys.h"
-#include "qemu/cutils.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
 
@@ -178,8 +178,8 @@ static void machine_hppa_init(MachineState *machine)
         }
         qemu_log_mask(CPU_LOG_PAGE, "Kernel loaded at 0x%08" PRIx64
                       "-0x%08" PRIx64 ", entry at 0x%08" PRIx64
-                      ", size %ld kB.\n",
-                      kernel_low, kernel_high, kernel_entry, size / 1024);
+                      ", size %llu kB\n",
+                      kernel_low, kernel_high, kernel_entry, size / KiB);
 
         if (kernel_cmdline) {
             cpu[0]->env.gr[24] = 0x4000;
@@ -203,8 +203,8 @@ static void machine_hppa_init(MachineState *machine)
                (1) Due to sign-extension problems and PDC,
                put the initrd no higher than 1G.
                (2) Reserve 64k for stack.  */
-            initrd_base = MIN(ram_size, 1024 * 1024 * 1024);
-            initrd_base = initrd_base - 64 * 1024;
+            initrd_base = MIN(ram_size, 1 * GiB);
+            initrd_base = initrd_base - 64 * KiB;
             initrd_base = (initrd_base - initrd_size) & TARGET_PAGE_MASK;
 
             if (initrd_base < kernel_high) {
-- 
2.17.1



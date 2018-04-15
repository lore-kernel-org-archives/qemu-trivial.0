Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rJt-0005JA-A0
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:44:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJq-0005Fb-9R
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJp-0000qJ-Ev
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:26 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:42169)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJp-0000q8-Bg; Sun, 15 Apr 2018 19:44:25 -0400
Received: by mail-qt0-x244.google.com with SMTP id j3so13553814qtn.9;
	Sun, 15 Apr 2018 16:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rVC9VqmrMvbt7ZRacympbhaqpB1uH5DcXeBsV7uVTBs=;
	b=PKy3uVes9rZiONlWxiKmIbRFiqCdt1BuNuqKCJoet89INS7USPn/nr2Ez5KTF6MamJ
	Nww6yxQuHyXe0OsU9JBji6NfRvpcpY1G10PsOe/YNDg4uT1u5dQbXAAi1MrU1zYJpKTM
	GQ2v8X1KuHMGVj6J6fbldtZOgwOXi/HiYfA94h7kWM7WOF1ScaYNpAJwyzT/rla/7LJR
	pO9VmkdkM+s+XYVo4HwP7jKt6gIVuTWtNyE933pwUdpfs57GT6OS1YcGEUVMurnpHEY0
	SHeXeRpiC28Ge71/votP0k4yEGHn4XE/BWRdNhin1r1j3H7vQLEWxQUDeI8Lf6PVBKyV
	pmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=rVC9VqmrMvbt7ZRacympbhaqpB1uH5DcXeBsV7uVTBs=;
	b=b8bKqVvX3zwU/whWY5H9nArq9OVhUKAUuexOXNJMqwwh2D+I0YZNkiqJN5wNG8DM1k
	cW/2je36Wy5390m3vkszzpbSuJdsd426JWmhbZuYRlJhdniQZPlcwS4yAZRp6jovUPio
	PJFvdFsfQruOSFuJbJBjza9JRWqQaKK+TUXyPi10v4wPN9OfyZRlbVlZa+NxgBPptINv
	sJREBjNW1KD+3VqskHISS3Zy9NcyvwSyTyS0tuod6r7dQC4jX9Tb113i6C8SXbSMQirj
	ZqBmy5Q2G5lhOflaBpVYhxihDvedUqgYqWicOEdAlvDJjo16Irpqrz6Z6auewxcX6M4f
	SNhQ==
X-Gm-Message-State: ALQs6tBC5ZQHsAOLE2adJXWAg+A4PGlptwDKajqEPWD9DPkms8HZifHk
	2U0eIpACH8bDXEphsvMBh5A/JNsL
X-Google-Smtp-Source: AIpwx49z5pMob+xbA9FoIacDxkGdlFDGc97EQ/kmI8VWzTWio4XoGPLxUmdm8hSKP93hzMXLJHS0IA==
X-Received: by 10.237.46.130 with SMTP id k2mr6546005qtd.128.1523835864794;
	Sun, 15 Apr 2018 16:44:24 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.44.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:44:24 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 15 Apr 2018 20:42:47 -0300
Message-Id: <20180415234307.28132-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v3 21/41] hw/xtensa: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:44:27 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
---
 hw/xtensa/xtfpga.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 70686a2eb1..2d1cce1d31 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "sysemu/sysemu.h"
@@ -153,7 +154,7 @@ static void xtfpga_net_init(MemoryRegion *address_space,
             sysbus_mmio_get_region(s, 1));
 
     ram = g_malloc(sizeof(*ram));
-    memory_region_init_ram_nomigrate(ram, OBJECT(s), "open_eth.ram", 16384,
+    memory_region_init_ram_nomigrate(ram, OBJECT(s), "open_eth.ram", 16 * K_BYTE,
                            &error_fatal);
     vmstate_register_ram_global(ram);
     memory_region_add_subregion(address_space, buffers, ram);
@@ -230,7 +231,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
     const char *kernel_cmdline = qemu_opt_get(machine_opts, "append");
     const char *dtb_filename = qemu_opt_get(machine_opts, "dtb");
     const char *initrd_filename = qemu_opt_get(machine_opts, "initrd");
-    const unsigned system_io_size = 224 * 1024 * 1024;
+    const unsigned system_io_size = 224 * M_BYTE;
     int n;
 
     for (n = 0; n < smp_cpus; n++) {
-- 
2.17.0



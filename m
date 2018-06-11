Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBS0-0005fr-P2
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:16:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRt-0005c1-N2
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRs-0003Dp-Og
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:45 -0400
Received: from mail-qk0-x22a.google.com ([2607:f8b0:400d:c09::22a]:43722)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRq-0003CT-K9; Sun, 10 Jun 2018 21:16:42 -0400
Received: by mail-qk0-x22a.google.com with SMTP id g126-v6so12065814qke.10;
	Sun, 10 Jun 2018 18:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ugcctDB+RuF0zIz7Ajg2Ab8yWZTVhrpaUyzohoHk0jU=;
	b=ncQjOB3uLen1nJbwoMBVDAckk0OcGR24d3cBUK5sRVmk1uqg7BKLYXuNcCNZI4RwAv
	rnmxNVhBbLwrO7RP0egbnUzhaLDiEupuy8xaDswx0BaV60Z0Azoko44FHKI5lMonv88E
	VGLzXFqns4bdyQEpg3jt4XQ+RDbX04+XobqlTwsjb0c5+zn+A9IcJs9mMatxVvWHCzxp
	9n8QyFTqwgRRr4nA5QOpSzepGmWnKFd8vquZQPuLZfJ/ZroHxsXcWdpWLCO2ODejpCM8
	jvlT+8ZeIGuiN9Mv1XUNpnMd9oekoaqkMxGvFSxFXQQ2IdeqwfImF9rulATd7eHO/bQj
	vtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ugcctDB+RuF0zIz7Ajg2Ab8yWZTVhrpaUyzohoHk0jU=;
	b=CYYwIHhjJErb35g8FC8XEGHQxNqTjaMKQ548/c8BYgnf8UGUv9sHlILSTvm2rVInba
	MviESbpkMaivEhgVJhlpVGfZeh7S5lHeheb+iaokRMlfaY8XdxGOq/ny7xzNn4jQli3v
	62QdXTrMNO9xwBEcXDVs7sMuSR4CIDRsSD/wBj3DfndeJUfJ26Kj4DY5BeZf3RK6Etge
	7h6OVyQXe3Jz+ZK3ZSIFrBAk8zNOPm8ZsbcTwj51L64ULY9uRhQjfvgxe5uJjQAi9Clj
	ZYQbQUGLjKGoN9b9oAO1Aj5DUypGBa2XpG00tWRxtCxIfNvJiP/bztvPuBWOLCNeQ9HU
	Bo3w==
X-Gm-Message-State: APt69E3CLN8MLk1BmRzdYOfniFW362ISsPQWd8dxR5I42K/4HP/YKI2B
	4YbD30QFmsfT7uQLxCaHkdQ=
X-Google-Smtp-Source: ADUXVKKp0DSn6f0mPJ7fA6fyb2JyYN/0Ov8SfjczUDitriQIX6v4qm8hA5lxXH1nrjkCEDOZWS+xIQ==
X-Received: by 2002:a37:b506:: with SMTP id
	e6-v6mr12596951qkf.80.1528679802165; 
	Sun, 10 Jun 2018 18:16:42 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.16.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:16:41 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 10 Jun 2018 22:14:42 -0300
Message-Id: <20180611011501.10235-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22a
Subject: [Qemu-trivial] [PATCH v4 21/40] hw/xtensa: Use the IEC binary
 prefix definitions
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
X-List-Received-Date: Mon, 11 Jun 2018 01:16:49 -0000

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
index 5dc13034f9..918cdadbb4 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "sysemu/sysemu.h"
@@ -152,7 +153,7 @@ static void xtfpga_net_init(MemoryRegion *address_space,
             sysbus_mmio_get_region(s, 1));
 
     ram = g_malloc(sizeof(*ram));
-    memory_region_init_ram_nomigrate(ram, OBJECT(s), "open_eth.ram", 16384,
+    memory_region_init_ram_nomigrate(ram, OBJECT(s), "open_eth.ram", 16 * KiB,
                            &error_fatal);
     vmstate_register_ram_global(ram);
     memory_region_add_subregion(address_space, buffers, ram);
@@ -229,7 +230,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
     const char *kernel_cmdline = qemu_opt_get(machine_opts, "append");
     const char *dtb_filename = qemu_opt_get(machine_opts, "dtb");
     const char *initrd_filename = qemu_opt_get(machine_opts, "initrd");
-    const unsigned system_io_size = 224 * 1024 * 1024;
+    const unsigned system_io_size = 224 * MiB;
     int n;
 
     for (n = 0; n < smp_cpus; n++) {
-- 
2.17.1



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBS9-0005n7-FT
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:17:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBS6-0005kT-Vz
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBS3-0003Jf-RA
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:58 -0400
Received: from mail-qt0-x22f.google.com ([2607:f8b0:400d:c0d::22f]:33484)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBS1-0003IF-OX; Sun, 10 Jun 2018 21:16:53 -0400
Received: by mail-qt0-x22f.google.com with SMTP id l10-v6so13656826qtj.0;
	Sun, 10 Jun 2018 18:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nh51WnvB2CGj4NcWumgTICBRoOxVMIfP8Qv/r23Xz6U=;
	b=Dv67ROM9i5oNkw+vAQ0UasjxNckCsy+EroCJNDO/wHRGcNCs3wHN3jIb1Fgk+P/y/n
	X7639qCj9lAZvugsrnwJQV7ol2tWXvdqdWCN2SNZSkVr1d67sj0q6F66SLMUya8M0jrP
	7aSIO6/XJ6126IUSO3/tBpBYIELBN11YxnS/NNPjAzcKmn3iE4YACXqu+Ep8N7Cx3dRI
	5z/oF5RXHNqW8i3OwCSvIcZHggf0Ij5+DWuvh5Z93FPvrNF0C2NctNDSpsANvNTPnjtu
	RyMhtSVuumfVjcjwi/+nZx7204srytGVXsMGULk9GT+lwMOo25Zk+p/U/fK0fHBKj2vg
	OfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=nh51WnvB2CGj4NcWumgTICBRoOxVMIfP8Qv/r23Xz6U=;
	b=ev9c8M3FRjCVb0xDSxn+usTMNrDrpotd0+GPiCV9shNgSB1LTADNpz9n3WSXq7SNEz
	CyJpw169K2EuLGOvwRRqVcYfEjXBhEMz65x28VgWgaNPTTUg3bejRGolZoXdSJjwrlmz
	d4q6L47T9RVyeYQrdO+SRpsslG4wVdiaRKOmkfX0XnJS1e1djZafj7Ew6V4Fkdbp3W3F
	7VE92TO5SEeMQUj/eLP1wORlwijMj+6EQ559lbcwPaA0wfc0hRlUW0U+dBFA+XL0mEJi
	mUyDVjvWp1qVK85bkn2IDQNzewcPpSH3j91x7hlGum0a4kRYRvsXu6w1lLn1Gac/fn+t
	DgyQ==
X-Gm-Message-State: APt69E333wzP9i6IlFm0OpqCOGquHZS/dHf0bNyCgoG/X2WdoAtVAZ9Z
	jhz6iY4EuwYFf5oENDQOUlA=
X-Google-Smtp-Source: ADUXVKLBpIT6W6kj3oe335e5jC/6gk4rUGuDs2jtgnzGoLnq/5ywDJmbGQrICHMrhynbSACrpWBoxg==
X-Received: by 2002:ac8:1bee:: with SMTP id
	m43-v6mr14744762qtk.339.1528679813330; 
	Sun, 10 Jun 2018 18:16:53 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.16.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:16:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Date: Sun, 10 Jun 2018 22:14:46 -0300
Message-Id: <20180611011501.10235-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22f
Subject: [Qemu-trivial] [PATCH v4 25/40] hw/nios2: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 11 Jun 2018 01:17:00 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/nios2/boot.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 94f436e7fb..4bb5b601d3 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -29,6 +29,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu-common.h"
 #include "cpu.h"
 #include "qemu/option.h"
@@ -38,7 +39,6 @@
 #include "sysemu/sysemu.h"
 #include "hw/loader.h"
 #include "elf.h"
-#include "qemu/cutils.h"
 
 #include "boot.h"
 
@@ -177,7 +177,7 @@ void nios2_load_kernel(Nios2CPU *cpu, hwaddr ddr_base,
             high = ddr_base + kernel_size;
         }
 
-        high = ROUND_UP(high, 1024 * 1024);
+        high = ROUND_UP(high, 1 * MiB);
 
         /* If initrd is available, it goes after the kernel, aligned to 1M. */
         if (initrd_filename) {
@@ -213,7 +213,7 @@ void nios2_load_kernel(Nios2CPU *cpu, hwaddr ddr_base,
         high += fdt_size;
 
         /* Kernel command is at the end, 4k aligned. */
-        boot_info.cmdline = ROUND_UP(high, 4096);
+        boot_info.cmdline = ROUND_UP(high, 4 * KiB);
         if (kernel_cmdline && strlen(kernel_cmdline)) {
             pstrcpy_targphys("cmdline", boot_info.cmdline, 256, kernel_cmdline);
         }
-- 
2.17.1



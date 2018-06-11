Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBRj-0005SW-8X
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:16:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRg-0005Q3-IU
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRf-00032z-Hd
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:32 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:41614)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRb-00030x-Kf; Sun, 10 Jun 2018 21:16:27 -0400
Received: by mail-qt0-x241.google.com with SMTP id y20-v6so18862972qto.8;
	Sun, 10 Jun 2018 18:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7bVTiSVu+UWhOWC+PqanAHeZhjQ/cdQ2iLBIKH31zbk=;
	b=exl9itLum9ashP0LbqXkPmAbLz3+Ajju2Aldh/geXJRZ5/0H6eU9ySYmzenqC9cjg+
	QDfoxtoBEyo5lrj391DfvGfHtYFNIbqBqBjCFpYZgrznJoTHd0tQquy8A+Z6UEmW7lmG
	lJGLOvkmk/nSkTT9EPlmDT+F9vDg3KBnKIgmiCFGz6z58RxknFi+W3kcLUOrJ4UAyALM
	i01l06CFvFAIDVx9SbMLGTcdgBgau9IWoIKazZbXC0blCSCKmYqzFULy8fh3g05cOvXq
	AkZHkoMme/qMsq+14XeGWYvRuNi4mN/wmJfq4J71tyU1GleWYjf2smvNOHw8fIUs4oho
	Woag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=7bVTiSVu+UWhOWC+PqanAHeZhjQ/cdQ2iLBIKH31zbk=;
	b=GBdLQbG9uTob/WQe+Q932exy0usFPCvDafNdStUOMf7VEJVb4c4pEcmdEAEYZbONrz
	QntzDC4a8stL74HRpRNasrav1oU/NCrcWtHxjo8kNqY7yLp7CVKgc7lHiw5+IqkIlnK+
	g9c1unJQN/K+4SdLA4Xo8oVP8KwomrGibRje6dGV0j5BAUYb2kzVmqhLdriUpIkMX27K
	fxICIYCBORgaCVSl6XXeIdx0d2leSmZRSnjMkIyon5V1JLbYYBGMQl8gHTzucH9XxzsW
	n5f66R8uPxUSfzoGlcCemwCWui/+WRBymrWy61QgbG2clJHQi0ajmZ7vk7bc8yaNzz8D
	Ru0w==
X-Gm-Message-State: APt69E3sIIiiBAiroLAwhvG/PtcX1JsAf75GcY4wOIyPI16PXsH9ltsb
	deOqAAYRqhaWcpcNXWG5bSA=
X-Google-Smtp-Source: ADUXVKKluzbIMcCwpVm0Eedmq/iVpgPP7I6AFx0ffB/jcrBWZpmjtTPPFFpa40uZpK06Ie14JdpflQ==
X-Received: by 2002:a0c:f612:: with SMTP id
	r18-v6mr13648968qvm.38.1528679787254; 
	Sun, 10 Jun 2018 18:16:27 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.16.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:16:26 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Michael Clark <mjc@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Date: Sun, 10 Jun 2018 22:14:37 -0300
Message-Id: <20180611011501.10235-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v4 16/40] hw/riscv: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 11 Jun 2018 01:16:33 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/riscv/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ad03113e0f..34d48993a2 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
@@ -84,7 +85,7 @@ static hwaddr load_initrd(const char *filename, uint64_t mem_size,
      * halfway into RAM, and for boards with 256MB of RAM or more we put
      * the initrd at 128MB.
      */
-    *start = kernel_entry + MIN(mem_size / 2, 128 * 1024 * 1024);
+    *start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
 
     size = load_ramdisk(filename, *start, mem_size - *start);
     if (size == -1) {
-- 
2.17.1



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rJd-00052C-QB
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:44:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJb-0004zC-0F
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJa-0000fM-8B
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:11 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:42167)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJa-0000ey-4V; Sun, 15 Apr 2018 19:44:10 -0400
Received: by mail-qt0-x243.google.com with SMTP id j3so13553458qtn.9;
	Sun, 15 Apr 2018 16:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FtCI02OOp1f91OMWl4dHikPMqOGAAoYRGJUPpLBDgtI=;
	b=BWeMiN7gYp6DD/hXa3s1NVsEo/BA+aP5ii+asy3aEnoUujng8uQMqaSu7OtS1/EYl/
	vJV+Tq1AMrh7IClAQyeuWQsWFKgYasUbV2JQEbK0/N5IIKlWVkyjsNQLLIJZSCV1kDcO
	NbyBcGL4uxWl+xkqLSRxmSFBvXkDWFBxezfwmyj5iIbedHi7M0eb2Vrcyutiejwjz9NY
	iXynNRPRv0fqX8yxgRVGknIkv2czds2sWvVJdHZfUODuIapscgxoVzW1QsU9cUxZdl0r
	GdR0MiVS6ulFhuaKNbwDA4qu2hoyU+HSVnAthUH6vHRzpuGoAz3E9n98sDkaa1JEYKyo
	u1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=FtCI02OOp1f91OMWl4dHikPMqOGAAoYRGJUPpLBDgtI=;
	b=n/6l2JHrmprNVd93qD1OWlPfvjNwFDD+M6GCT7RPjwa1tuhqRpuoFqoLvfz+/oHmd3
	DV0AqNwzQSSMYCqKgkRwe+KFYcrINjXhAqrzZd8zEmJ0NGythIwtJNrEMJYvaezzQbXO
	B8cEAV932Immt4ItKHsIVD0gEAqvn4rZDYWeB+Y2qTK46eDrDTG5wQazc+9RRxC6PcQ7
	HeoTv5snIuUKKYsEPPc7GVset316WXVotokymjkZTzGKQ4y6Rd6+nU7oIajS7Kt8OePy
	3xVGA7p+g3vvRjdNX8R4ljdZPcbN79ACemlYwcOlxxpjIJMAjRnTS8hctdJswRFeHKv2
	n6Jg==
X-Gm-Message-State: ALQs6tDuvRhsz70TSy1HNbVVFFcqFPo6KNR4HyFxBIvFXMCUS7f5qucE
	nLd2uRULG5PdcmEk6Bd0p507UWxs
X-Google-Smtp-Source: AIpwx4+9cLccZzKWR3Rsr/47nufAXEtHZQV1Tu9S6tLQJbLIHutLx6/Zjxvu9raWFnZjZZ30lcpqpw==
X-Received: by 10.200.20.2 with SMTP id k2mr13496832qtj.142.1523835849324;
	Sun, 15 Apr 2018 16:44:09 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.44.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:44:08 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Michael Clark <mjc@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Date: Sun, 15 Apr 2018 20:42:42 -0300
Message-Id: <20180415234307.28132-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v3 16/41] hw/riscv: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:44:12 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/riscv/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index e2c214e86a..eb465a0158 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
@@ -95,7 +96,7 @@ static hwaddr load_initrd(const char *filename, uint64_t mem_size,
      * halfway into RAM, and for boards with 256MB of RAM or more we put
      * the initrd at 128MB.
      */
-    *start = kernel_entry + MIN(mem_size / 2, 128 * 1024 * 1024);
+    *start = kernel_entry + MIN(mem_size / 2, 128 * M_BYTE);
 
     size = load_ramdisk(filename, *start, mem_size - *start);
     if (size == -1) {
-- 
2.17.0



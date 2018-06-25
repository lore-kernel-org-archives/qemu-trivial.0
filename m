Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQr4-000217-2H
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:44:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQr1-0001yC-4h
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQr0-00082b-8t
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:23 -0400
Received: from mail-qk0-x22f.google.com ([2607:f8b0:400d:c09::22f]:42890)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqx-00081W-Vt; Mon, 25 Jun 2018 08:44:20 -0400
Received: by mail-qk0-x22f.google.com with SMTP id u62-v6so4824275qkf.9;
	Mon, 25 Jun 2018 05:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=X12l4Aoe2kRtlEABqCKPMZ0wxEOwnCu+oNzwaXBv9H4=;
	b=EHY6yLzJAQFMA5QiX/ifdQGfJWOz3blpNTximpV3k4pbGXm4hBqCZC6CbRWIefHZtE
	uBkR22S4579VZpjarPxJDtxGm1akKSn8j1+pUNe0stAgvZubfCOjKAJk8Vm5j4OhjDKJ
	9wKtRfCG6l5RXBSgT6g1BNHnpSmWKYfCUb0DSWV/ublDe5m0NlZHvTCSh584VleWu2pf
	ib2dGyoOvdG/7G+bG8QV8Pard+hxcd4uejQCh5KjhFpfq4R7R8PQ4VQIF/GpaU/P5FkL
	UoTXpP4GcT8Cb3znylAPY17W2bs1TjPak8V89o6rqDFCA3xY5+3VLiXxouMO4T6Cx7jp
	XBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=X12l4Aoe2kRtlEABqCKPMZ0wxEOwnCu+oNzwaXBv9H4=;
	b=kM8IrbyWp9++ZDgUtHZM+clL1Zvh3iKNx08SuW6lFYDAf0Hi8j2gjVeCIz1uWIdoGR
	ZkpIpw/uFSXn2HXdqsk3w4Do4XK0vwrHssBu1NC7+80F2qGVkzmQyj9a7Z/pb2NmGGS7
	toYD3DlI7DnUGsaE9wYr5+qyY2IoLOOufu9Rby3G3og8MOM41gYjocuHYMxlTnqd9iNs
	hpiBNb/P9EKQ5vXDjQe+vCuBnCPWAX2JfX2cuUx78IQYpnsxMgngikJij/L0DnyLyPAv
	A1nOu8LeioVZgNckfYZtngAFLbl6uzph/6RCQLGLLGFQRflyIceJC6AbzA4kkR6vXDOY
	pbJg==
X-Gm-Message-State: APt69E1vqngOdBxv4EmgqRJmbtRBOL0PVGa1f44QItuQbMsCeX5PkWRH
	gnYASMh8scY4QE9XwEcKYTo=
X-Google-Smtp-Source: AAOMgpeY7glr45BWpm6BbTTf0FcHZai0eBVAr+r6ybzr6IziH1WIAvye7Vbx2dvEAPbmvbAZYHgmLg==
X-Received: by 2002:a37:b91:: with SMTP id 139-v6mr511174qkl.429.1529930659496;
	Mon, 25 Jun 2018 05:44:19 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.44.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:44:19 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Date: Mon, 25 Jun 2018 09:42:17 -0300
Message-Id: <20180625124238.25339-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22f
Subject: [Qemu-trivial] [PATCH v5 25/46] hw/nios2: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 25 Jun 2018 12:44:24 -0000

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
2.18.0



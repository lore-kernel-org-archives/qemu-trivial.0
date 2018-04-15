Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rJz-0005Rf-Np
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:44:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJv-0005My-FX
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJu-0000wQ-Gm
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:31 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:46900)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJu-0000vs-Cm; Sun, 15 Apr 2018 19:44:30 -0400
Received: by mail-qk0-x241.google.com with SMTP id l16so13888724qke.13;
	Sun, 15 Apr 2018 16:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xspTMRx7ZYXGf08UIQieTQGAgddlTzaxpkHGqf8dMEs=;
	b=fCmpsADhP9Llnb3M1NvRt48dBPdLWkWGyVgFrIPzU//1GApAVQ+gZli+UYOJZd5vAX
	t9chPMJArecJrYL/2yAQ/AxxDe4kVh30wMPYcxJNUqFMtJJOgHwOKjSxdw4JcX6ITxFQ
	pph8L5NaO8nHzczRPKVrtRXF6BcrC15NFUTlBypHlVqzKUflyM/xZVCqwrdtOJjdTp+C
	dquicz6o8tXWH8tJblRBL3TP0/fw61ck2yjBN5Rth/c+vOqH+3OYCWlZcdGbKYpQdNQa
	2vBMlv1m16kDuNcNwSUTVrtpLtMjkfV1q8n6Nf/tQ/Q9NMWfZBY6U9Zct1cxWzUqNhwp
	ApRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=xspTMRx7ZYXGf08UIQieTQGAgddlTzaxpkHGqf8dMEs=;
	b=PK5pPfsIPq3AxOfWUVonoMZ6Gcf4Q6ZWpl8xBCwkdZzjJfn44WiXhAb9RnRs3Pa3YD
	HBTQVLzlb8bBL4H2G1nLSwry7TcC/LzHjha2D6MVWKCHKsvfQnCCqOssSLL9ej+6w/I2
	I9e2Avxx8jtkqL7CsavVbJKmmFbYwimde4UZyJkViLwrsi7JJpFgzRrY1FeG3ow78hP2
	vmTccPb9oTieNeCy4iGFT5HhbzdQ3WNXh9Pc9/9MGtdERfTrB1lYiwCXKcO9reU/tswM
	kKFSEmO+PiIx3izfm89OR8by/SmwKg6OqZS6n0D7/UjTR5gczqU9cINi7Hbtp/5ssmKZ
	cPVA==
X-Gm-Message-State: ALQs6tBUFndYOT5z4cKV1M7EBCQgMJf2OZYXCSjmuEv+BJ1BLLkm+fhv
	K3Dyuy16Dt9ssZnW8qumqByC+Gq7
X-Google-Smtp-Source: AIpwx4+WppC2UBv3ZsC2OA/WbQrF/phY3CLhVdHGPCr9Dg2zvxfqXn2NZbxFtiqlB7DPF7ufip0noQ==
X-Received: by 10.55.16.91 with SMTP id a88mr10493984qkh.199.1523835869700;
	Sun, 15 Apr 2018 16:44:29 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.44.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:44:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Date: Sun, 15 Apr 2018 20:42:49 -0300
Message-Id: <20180415234307.28132-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v3 23/41] hw/tricore: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:44:34 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 hw/tricore/tricore_testboard.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboard.c
index 8e61dfc3e6..a30a2f8345 100644
--- a/hw/tricore/tricore_testboard.c
+++ b/hw/tricore/tricore_testboard.c
@@ -19,6 +19,7 @@
 
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -72,17 +73,17 @@ static void tricore_testboard_init(MachineState *machine, int board_id)
     cpu = TRICORE_CPU(cpu_create(machine->cpu_type));
     env = &cpu->env;
     memory_region_init_ram(ext_cram, NULL, "powerlink_ext_c.ram",
-                           2 * 1024 * 1024, &error_fatal);
+                           2 * M_BYTE, &error_fatal);
     memory_region_init_ram(ext_dram, NULL, "powerlink_ext_d.ram",
-                           4 * 1024 * 1024, &error_fatal);
-    memory_region_init_ram(int_cram, NULL, "powerlink_int_c.ram", 48 * 1024,
+                           4 * M_BYTE, &error_fatal);
+    memory_region_init_ram(int_cram, NULL, "powerlink_int_c.ram", 48 * K_BYTE,
                            &error_fatal);
-    memory_region_init_ram(int_dram, NULL, "powerlink_int_d.ram", 48 * 1024,
+    memory_region_init_ram(int_dram, NULL, "powerlink_int_d.ram", 48 * K_BYTE,
                            &error_fatal);
     memory_region_init_ram(pcp_data, NULL, "powerlink_pcp_data.ram",
-                           16 * 1024, &error_fatal);
+                           16 * K_BYTE, &error_fatal);
     memory_region_init_ram(pcp_text, NULL, "powerlink_pcp_text.ram",
-                           32 * 1024, &error_fatal);
+                           32 * K_BYTE, &error_fatal);
 
     memory_region_add_subregion(sysmem, 0x80000000, ext_cram);
     memory_region_add_subregion(sysmem, 0xa1000000, ext_dram);
-- 
2.17.0



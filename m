Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQr2-0001zj-Kl
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:44:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqz-0001vk-4r
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqy-00081f-8t
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:21 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:39701)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqs-0007za-TH; Mon, 25 Jun 2018 08:44:14 -0400
Received: by mail-qt0-x244.google.com with SMTP id c23-v6so2827495qtn.6;
	Mon, 25 Jun 2018 05:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rK2vkEZJ3UQToBCwCmEfXL0x21NcGMSFEBZy9FMBB+s=;
	b=Zjt1BDtrsLYnY7sLMgn1CpdLIzXiQAVQQP7RMu33nTgzPF9vXu4aOcQu0ift7OXmlI
	8aYSnds7q5Aubz5e+k2otEAFf3Kq/AmUmivdTn8ZCj+WHaUvnJnXviyicZTKx2B3AuCh
	WZ5QM/jCzVlFWA5lYY997Dujo7eLyyd/ss4VgOPtxiYQS1ZFSQvphVVo0UdPymksz9aM
	BE9LG8eDU93Zsi/Vkghe6DCPh7Q6qskOmmuxqdN/NpspSvogGJuCIWM2cldQITiBnmaB
	4CzK2jNErGpXivYo3pC2UYguUgfLKF/oURrIUEEGjViXxeF9cnpzshLODOQBiY38tPaS
	gMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=rK2vkEZJ3UQToBCwCmEfXL0x21NcGMSFEBZy9FMBB+s=;
	b=YxPUk0nqmV9lUFhUvyc1mzLJXRH7mjse9N36m2AZbs1yBmi24Ga7KykX2MRPzDrovg
	j7+EOg2f79zPXm56HARvn7AbYpxZVRS62E9pq9K9/XHmTQq7SkNiuRdCBEFSJ8MekG1m
	pcooZmkceRvYiGthPgqCkraPExZoHkkMGkAIcxa8m25oiBjb/r0e0XpBkLxbJbGXF23D
	NsA83DvGuev+zqrJMKdyld8PkQwnsdDsxDDPhOZ9/VJcIV4XZbVAPNvNJXrJQQkmbl6x
	OKJ5jNLKcFLqChdmEzq6Nr+eXjA8jrRZc2J6FTSyTyDaNdoL1PZhQi/xf476+F9f5y3w
	8krg==
X-Gm-Message-State: APt69E2ljP6lPRiAsnHS5B9la0/JnDE+IZ1vBjdhKiuq4WBhPc8AxpON
	23pGMVH9Nm3Ja7le6NYJHMc=
X-Google-Smtp-Source: AAOMgpf0VWfYlzvtcSKr3BknmlSExr59HGcHs22DMnQrVsYh70/7hMFHm028en0H5qR5DU+qCdpZVA==
X-Received: by 2002:ac8:1a57:: with SMTP id
	q23-v6mr10942846qtk.297.1529930654423; 
	Mon, 25 Jun 2018 05:44:14 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.44.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:44:13 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Date: Mon, 25 Jun 2018 09:42:15 -0300
Message-Id: <20180625124238.25339-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v5 23/46] hw/tricore: Use the IEC binary
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
X-List-Received-Date: Mon, 25 Jun 2018 12:44:22 -0000

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
index 8e61dfc3e6..a58096f05e 100644
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
+                           2 * MiB, &error_fatal);
     memory_region_init_ram(ext_dram, NULL, "powerlink_ext_d.ram",
-                           4 * 1024 * 1024, &error_fatal);
-    memory_region_init_ram(int_cram, NULL, "powerlink_int_c.ram", 48 * 1024,
+                           4 * MiB, &error_fatal);
+    memory_region_init_ram(int_cram, NULL, "powerlink_int_c.ram", 48 * KiB,
                            &error_fatal);
-    memory_region_init_ram(int_dram, NULL, "powerlink_int_d.ram", 48 * 1024,
+    memory_region_init_ram(int_dram, NULL, "powerlink_int_d.ram", 48 * KiB,
                            &error_fatal);
     memory_region_init_ram(pcp_data, NULL, "powerlink_pcp_data.ram",
-                           16 * 1024, &error_fatal);
+                           16 * KiB, &error_fatal);
     memory_region_init_ram(pcp_text, NULL, "powerlink_pcp_text.ram",
-                           32 * 1024, &error_fatal);
+                           32 * KiB, &error_fatal);
 
     memory_region_add_subregion(sysmem, 0x80000000, ext_cram);
     memory_region_add_subregion(sysmem, 0xa1000000, ext_dram);
-- 
2.18.0



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBS5-0005jg-2U
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:16:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRz-0005fX-W3
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRz-0003H8-3g
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:51 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:37752)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRw-0003Fh-88; Sun, 10 Jun 2018 21:16:48 -0400
Received: by mail-qk0-x242.google.com with SMTP id j12-v6so12069978qkk.4;
	Sun, 10 Jun 2018 18:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gabkRwX319qNdsb1xHKKvJzuy1TWkD5TfnWuTJONwdc=;
	b=Fti5MMwATMGYccshwDyz6MBBF4kOuIprw+x+zQ8plyKDAZwLNRl6+eCZ/2AAra0LES
	sLNkxGb61tgN8RgjwRnOEsG6U+jga2RT9boWbWmowNlCKqEP1Z/acZIFqimmnZqkKDag
	j8QZX7R4XiHKQojDi8YagTSDGBPY1wO4mlEVYXpCFVAGLyJUx5XCN0ZJ4wacj8PjaTQE
	pkW+rFNQjO3bCTOMLSD8H1RbOMB3TVsqdcmc1dNpur5ChR9t4xHE+9FUbbPfkxGtuO3k
	5eMDg2dyH6YxTg1BDZ7JWQmjsbiIfdXxE/AuyiPwCpUZ9Z/1Y7UeZHpa8AGtv7EwCS/h
	9D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=gabkRwX319qNdsb1xHKKvJzuy1TWkD5TfnWuTJONwdc=;
	b=Fs5nKMuLq2cZPHcKetByqu8VBNjGG69zG+AwHxH3fsgTbjNPddzJtWCCcS0d5WnhFy
	BEDecTpcf/72YfFZlvP1qBt9Nx5ZXTnmWJZXwrvytSEK2g6oiDxpsCz5ydGB1NuUqjCX
	25zDX8I5l81fFDbw5wrg5rqZt4s9nKGpOtzez54MyOEJwBDQCOc7xW6VcKD/nJWbkbDI
	Muw3ibiXuN88Vlfccry8rwc4yNr7mzIdz3JFw/nWFdbUtbm9b1VEvLxQDqyL2EgtIQUE
	NNe9O+0wbpwd6Wgj2GbpCYyoAEJyz3QjLzitXWT6Tvg4EsHkPmu/1ZMv7Wtm3hOTsNa3
	vp+g==
X-Gm-Message-State: APt69E1D2U92uL8jQabGQQI7bAxuVZqcga+J5Ztgxar6l/n0mBGWwGuz
	ASW4ksd66pHRLxRgnkkRlII=
X-Google-Smtp-Source: ADUXVKJheC7QixtVpWSoE2G+5yRimclM5Aknw40h1fTK68HciNod5sILslXFsh+vLrLNRx/2fmnrsw==
X-Received: by 2002:a37:8ac3:: with SMTP id
	m186-v6mr13392117qkd.6.1528679807871; 
	Sun, 10 Jun 2018 18:16:47 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.16.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:16:47 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Date: Sun, 10 Jun 2018 22:14:44 -0300
Message-Id: <20180611011501.10235-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v4 23/40] hw/tricore: Use the IEC binary
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
X-List-Received-Date: Mon, 11 Jun 2018 01:16:53 -0000

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
2.17.1



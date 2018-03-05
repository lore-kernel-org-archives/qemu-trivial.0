Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoHn-0003bl-UI
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHl-0003YL-6c
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHk-00073v-4S
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:05 -0500
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:37784)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHj-00072x-TL; Mon, 05 Mar 2018 06:28:04 -0500
Received: by mail-wr0-x241.google.com with SMTP id z12so16871106wrg.4;
	Mon, 05 Mar 2018 03:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kOIm2lUMwivZjQy8r/MLvTGi/BQD/c0Hby3HssmLRI8=;
	b=hkwTJ8gjtoG1DJ/pzF9qANebUgdK2OdvWEi+weBU65LE6L6FwS9Bc34Fj8ZeyYg2/f
	npX8gDJEAIeDFJvpJpcP126aI7UfHVxgTgW8sO9SWEjzBKDebbhSypv75QCaMynWL53V
	xbmEI7yQrAxOHms7pOAXkYA7cicSidRgiRoNxDmEwvemJb5kWkLpEjrNJjR7Zc028CR7
	7LqpA3263T7rLDrDFzSgZlcRdpxO7jeajWlKPtQbOWfDI3jcAuzPDf+jla9GeTKUQ4b3
	ZFTsr+Kqm4k2eIf59yj6uA0PeLa1WIyBtJ099tqFZlcIAYs9vWdTPGofohL3C8DkyPPr
	HaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=kOIm2lUMwivZjQy8r/MLvTGi/BQD/c0Hby3HssmLRI8=;
	b=G5j0+mpdOl88UyfoRC3r+3bbII2ux5y6zu4q68FtIxO8xSJkb56KP6dWEU01i1XQlx
	ldWrRlppUJ3wJb9WwjDu5Mu0mfnZwY9AI87SZzVS7ZcMUQy4tGR+EwdE8ql7CjWETRUE
	Pi4cz+TWnSEIYsB4+fqcdXx+UTHvCaXTcuv+coImBMwrYhVsUmI+bP2JzXMOjG7plXrM
	ADkLKKweaVBuGqoaDaKkXrM2leT5CuIHi1bOwAeRE7riFUUObKtVC+AYlivY7pABka3Q
	/5cOGLbUbpwCK8nh4SjCguHeWi22bBmpGSYq7uBKewilahhccZUr9vfkKfAHaoLBhSfW
	L5ww==
X-Gm-Message-State: APf1xPCmOP/ObL2+92FSYYiPRd3mBOdcl930JkJQfdMcBbFRwFvmkxzt
	H2h3GWIoKvL2oXPFVCDunxJON7Io
X-Google-Smtp-Source: AG47ELsadpZm4RI3Sm4zzZnygKDSaEC1oFrXcjc4iq5/zyTo/8l/O7Iwim72fAAQswPRiwSrZMQeQQ==
X-Received: by 10.223.178.206 with SMTP id g72mr11599612wrd.135.1520249282705; 
	Mon, 05 Mar 2018 03:28:02 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.28.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:28:02 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Date: Mon,  5 Mar 2018 08:27:19 -0300
Message-Id: <20180305112732.26471-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: [Qemu-trivial] [PATCH v2 17/30] hw/tricore: use the BYTE-based
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
X-List-Received-Date: Mon, 05 Mar 2018 11:28:06 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 hw/tricore/tricore_testboard.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboard.c
index ac75eb2128..032bcc8efb 100644
--- a/hw/tricore/tricore_testboard.c
+++ b/hw/tricore/tricore_testboard.c
@@ -74,17 +74,17 @@ static void tricore_testboard_init(MachineState *machine, int board_id)
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
2.16.2



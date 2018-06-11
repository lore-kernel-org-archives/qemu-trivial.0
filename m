Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBSK-0005yb-PR
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:17:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSF-0005uz-EW
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSC-0003PQ-8i
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:07 -0400
Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232]:40786)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSA-0003Mn-6O; Sun, 10 Jun 2018 21:17:02 -0400
Received: by mail-qt0-x232.google.com with SMTP id q6-v6so18856709qtn.7;
	Sun, 10 Jun 2018 18:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XRMx06sNGn9QD4msAAo4yEa2rjRv6gP9d/QzD9YEWVA=;
	b=h3jOfM4sdILXj5A7rTpw1PNegx8a/FkAJIVALG/Hewb0g0vWtVAncHxEJ6bjGZ7b/Y
	D4P/ITnQdmBSNNP+ZMsTL20uUnIDC277crs+RAHNHwt+rWp9nElbfylnrBWgxFSlXs5u
	r9f8SF7ANPVGqa5DAGrdzi4wrE+5Dg8iL49yVF7Pv/xR7sg/I5SMl5eaI0zrsQ/E158N
	Vy0Bc54x2xQG9bk+jmrm7o2dHto8pwTqM82hwiY/+WAA9vg95fbJjIBgKaZc6QO4Al92
	yrwt9rJlZ91JHdc+STYkz7hda6w+bGqyFJfY10o8MggslItPlQN998w1D7+f0q7LxFUH
	899g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=XRMx06sNGn9QD4msAAo4yEa2rjRv6gP9d/QzD9YEWVA=;
	b=QXIlKzC1piOUFaxJoz4mZuVvyGXjafe6becPEHG86ynWhSF1ltxeYEbDkPBIjZdiL3
	RluVMJ+56xNMtzlzaYoP6xkhbPfeDzNfpHYrcve4v1SmgI7gkS45R6mUeNVn27MyvdhF
	ozLFdD/hFZ/ayG+2FQCm4gdpmzCbEQT0FV3mERngb1gcaKz9LLAJ40i4FDtwHWXqc9ru
	QR+EDUj9usK0caFNKS43JrWnDT6FwUOZg83hWr+R4dzEPnMnWcSBUKK1sPfbjNkFcKLy
	0Bz3Zdm5U5PExq8h/+3fV1aZPJhCOBm7tNGRv/sdvNzoyPgfOpDFslQuFZuRT4Zc7cQ4
	yTKA==
X-Gm-Message-State: APt69E1nGl35vN9IleS4aqVl/gEj84aIs50tE1bpiwoL2KFOC68NynrW
	fsmN8SD73d1LKBIY8zFQeuk=
X-Google-Smtp-Source: ADUXVKLFwferTXBPSh8LwBxrq5Va1cSttFE2klLsla1brVLcNhljnupFW/zK885DX9WwV/K1J/zL2A==
X-Received: by 2002:ac8:2d6c:: with SMTP id
	o41-v6mr14435186qta.107.1528679821798; 
	Sun, 10 Jun 2018 18:17:01 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.16.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:17:01 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Date: Sun, 10 Jun 2018 22:14:49 -0300
Message-Id: <20180611011501.10235-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::232
Subject: [Qemu-trivial] [PATCH v4 28/40] hw/sh4: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 11 Jun 2018 01:17:08 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sh4/r2d.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 8fe8766eb9..6a5fc46a47 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -291,7 +292,7 @@ static void r2d_init(MachineState *machine)
     dinfo = drive_get(IF_PFLASH, 0, 0);
     pflash_cfi02_register(0x0, NULL, "r2d.flash", FLASH_SIZE,
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          (16 * 1024), FLASH_SIZE >> 16,
+                          16 * KiB, FLASH_SIZE >> 16,
                           1, 4, 0x0000, 0x0000, 0x0000, 0x0000,
                           0x555, 0x2aa, 0);
 
-- 
2.17.1



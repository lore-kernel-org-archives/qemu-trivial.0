Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rJi-00057B-BO
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:44:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJd-00051p-E8
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJc-0000h7-MH
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:13 -0400
Received: from mail-qt0-x233.google.com ([2607:f8b0:400d:c0d::233]:41577)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJc-0000gw-Hw; Sun, 15 Apr 2018 19:44:12 -0400
Received: by mail-qt0-x233.google.com with SMTP id d3so13550279qth.8;
	Sun, 15 Apr 2018 16:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NS6kuGGNOszLMRacyerCPiwBYscCC1qHvmL3qXECWpY=;
	b=nKIw/1fE88HM1N/3lkkD3yFxJhNFXZ4buPUB+jIK7DwrNzzicmqWmhmnKDvMRQ9tGt
	5N8TI7fu9QePxdy5rH4BiUqietDYe4lGnNQTIGWpwXlVEaedkC1/YEkQ2/vDHwhWcc8B
	C3ztevO01Ci4Um8+xLh/cy3kOtBv6Xk2eBqA9eWdz3RTwKPaAcJAV/vWIw+q7JE3Ag/j
	Hc5xCFJwoPtVfZvnOMIfkU9jRt8e43yc/XupKkRrPUdCR909UOIRaWLhelCE534DSO8v
	qsMUFth6rmLzuTqkwmjDGTngUqEqXBG3ZvZTc4DE67xTcZR/33KC7fd3A3+mViMZRocN
	vE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=NS6kuGGNOszLMRacyerCPiwBYscCC1qHvmL3qXECWpY=;
	b=ptZ06K9lXq4H8hiapOlSN0RtBzNG1CqQQCHS29BrrKwnzbHTnvVQqvlR2XJwA4nWpo
	9AdLsJycicdcX+XlK8V9L86auFjjYToy+vGTVglUlck9zyLVH7n5fdlKCgVPYYWIElqf
	znpgv8J7vVAnA/5wvN0wNYI54j1UjaIwVhlZkOyQ7kI6bI9nedYQFizd/2Cg/G/WzyJ3
	az26gDnlTRiPtu1w792TortLBDvd0I+VOQGwIovDyf+5eDwkkBP8RZyMHrq+p8Dchusa
	HOhZ5emD72HPCxfhmyOdRqGcoLgF1Bbue7E80zDEtwGJMBKtGgQ00BPDRpUfjIUbRhNa
	KLpA==
X-Gm-Message-State: ALQs6tAtnlSpxSub3BQ9V5G1/diq6Y13bxKos1BEyz1eUgl/vFQMDkrF
	BlrATKnSlBnrwpPDI1BytpwPWoTb
X-Google-Smtp-Source: AIpwx489LWGMC8HAEVHdzSENrOOAv4xGAbkk/TqpVJAFgLanGYeoeyjopKTI6I05for8N4AcCAkSsg==
X-Received: by 10.200.102.131 with SMTP id d3mr14368474qtp.305.1523835851853; 
	Sun, 15 Apr 2018 16:44:11 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.44.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:44:11 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Thomas Huth <huth@tuxfamily.org>
Date: Sun, 15 Apr 2018 20:42:43 -0300
Message-Id: <20180415234307.28132-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::233
Subject: [Qemu-trivial] [PATCH v3 17/41] hw/m68k: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:44:16 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/m68k/mcf5208.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index fac0d09cbc..673d65f8fd 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -6,6 +6,7 @@
  * This code is licensed under the GPL
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
@@ -241,7 +242,7 @@ static void mcf5208evb_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, 0x40000000, ram);
 
     /* Internal SRAM.  */
-    memory_region_init_ram(sram, NULL, "mcf5208.sram", 16384, &error_fatal);
+    memory_region_init_ram(sram, NULL, "mcf5208.sram", 16 * K_BYTE, &error_fatal);
     memory_region_add_subregion(address_space_mem, 0x80000000, sram);
 
     /* Internal peripherals.  */
-- 
2.17.0



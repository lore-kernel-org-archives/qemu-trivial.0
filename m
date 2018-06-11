Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBRl-0005Uj-8X
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:16:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRi-0005RP-B9
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRh-000340-FF
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:34 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:43219)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRe-000324-99; Sun, 10 Jun 2018 21:16:30 -0400
Received: by mail-qt0-x241.google.com with SMTP id y89-v6so18853568qtd.10;
	Sun, 10 Jun 2018 18:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EPlJKkwR19zn0ufeJQi2AEIxY5hMqZr5frIwkDyD2j4=;
	b=AVZUy1ZYeqEXPVOHxO8KfQOJrGNFDyVy5l86te0xb5mEKVOhjHjtTfz1KoU0Tn18cY
	xJErY6oTfOOqq4V/Up00IaxoRhc9Rg+LVsw08cDorCVxtgAE+TRBTCSveaDanFYwkxXC
	ecrcsqfUUtXaqVteuBMjKkLiiLA0bvr0M8HndFXJsdxqaXNsV1bJv8ZkZjKFDRNuHYxB
	ix+jI+QBZpJQmM3r8tRLniMo2+h3WihNm5j+uEYgqTpo4c6C0DBi5GJ4cuatPMaEZaOv
	x75tmYKWCFyxIBaxe4aQ+Nj+skh/29L62is878EyAIm8NRuVIECBaArTWiV+3XeNApIT
	juxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=EPlJKkwR19zn0ufeJQi2AEIxY5hMqZr5frIwkDyD2j4=;
	b=W/xTpvR88VQ8Ku/b/+SQNG5V9PrEgID0pOvhBmbDE9vYzStf1EjGU4and/hMa5IrCg
	Ax1PC8CqFYvWLbtDYYUkOTHUlIE+FdlYMuU2IlH+LhYA2NxqFPksLpNMbC1GrVXxQOWK
	cJiiprFF9nHqaa74cS7q2UDCh8bfwbetiJFMD+inaV3bwwPmB9wy82M6OHmc0p+/2jh0
	/vwXQks1y/mZTEtqZDDdmCe4+YsXQtAhlqrN4NiIT615uDqZ+wgKEuZePbcPghomJhtr
	W3Lj48L+RuC98oHnN4WTwxB6zyOotSFq6gGvBqfxVhQJPfCwTYt/EnT6ovhAPGzWUgZB
	y5jg==
X-Gm-Message-State: APt69E0h5jfPwyj1zaU/UBbsy+NkXT2g9VOlMoGpytcDCPqx2g3ePiAj
	Mg28ZtJeiw+cmVHC8XAtaf0=
X-Google-Smtp-Source: ADUXVKI7nvm8CCAascHQq4ddOyB34hg6ZZYYhd6Bc9R3FGtAfLR3OCD20eE/fGbQdJahVp7nuVg5mg==
X-Received: by 2002:a0c:c584:: with SMTP id a4-v6mr9239010qvj.11.1528679789898;
	Sun, 10 Jun 2018 18:16:29 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.16.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:16:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Thomas Huth <huth@tuxfamily.org>
Date: Sun, 10 Jun 2018 22:14:38 -0300
Message-Id: <20180611011501.10235-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v4 17/40] hw/m68k: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 11 Jun 2018 01:16:35 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@tuxfamily.org>
---
 hw/m68k/mcf5208.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index ae3dcc98c3..0f2245dd81 100644
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
+    memory_region_init_ram(sram, NULL, "mcf5208.sram", 16 * KiB, &error_fatal);
     memory_region_add_subregion(address_space_mem, 0x80000000, sram);
 
     /* Internal peripherals.  */
-- 
2.17.1



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQrA-00027O-Lx
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:44:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQr8-00025M-JH
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQr7-00085Y-Pd
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:30 -0400
Received: from mail-qt0-x236.google.com ([2607:f8b0:400d:c0d::236]:40061)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQr5-00084b-PO; Mon, 25 Jun 2018 08:44:27 -0400
Received: by mail-qt0-x236.google.com with SMTP id x23-v6so1560307qto.7;
	Mon, 25 Jun 2018 05:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=19cBcMWK/hzR8d2Dsnno3+HmJyy0GnwFw6ac/J8Nnuk=;
	b=G/rrkqlK0TAj/gnOcmBksD+otPmXoPjIb1ovmxdeqeaar4iT5E2IZXfuB3laUwbuN9
	KFX6cVtYFH0skPif/SQeyFI5HEUm+Mq6zz1soKEWRjG/Yl0E+vQbgu+Uy9UTdOoK3ALC
	RdroMVOMS5m+GrNnmGUrpraWVz+RWcXDn/FbLkcCTIto7pBUtHUIMhMwJD/Kdq7S9RBy
	jaqQuIwmjg2hcbhltFuD4JrwGDi4ZvvuJ1QbA2jvxGkmNkrp3cUFUu36uL5E9WXiPn1P
	FAoXa9XC2xy0exEEZ2Xh2nsVXEhvPQ0KZ6UEzicA23/VNSv88Uz9aOfP41ELQewytvjy
	yhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=19cBcMWK/hzR8d2Dsnno3+HmJyy0GnwFw6ac/J8Nnuk=;
	b=OQHxqLSAD2n5OBAAMMGR29IsfP+fNwieBRs74AQNKab2J820KlK7X5ZWp7CNzAI4Fu
	yhNe9CSH9hIE/L6TE8iiYzS1XOq4wMIyT70d/Wp0oUTlmG7B7ve/h0qxyWZJoaDN9/2b
	aykdSGqtuROWzON3S9rKqVieF/pOOGnLQIm9ugVh5IWz1PbJf/KomP1IE8MVCXKmy0Zt
	jY8B1WFq+Rswaw5OamCx4wWt6e9yjDXDXuCnH+crN9qF3NLSOiBDgB9gXYxKUWde3TIj
	pr1wKaPIQx70mYkPE59sN5SplcK6DqQoWN+CwlVUExsDLgm4gmlkGKXBuY6Xv3unwLkX
	4OIg==
X-Gm-Message-State: APt69E2v9qZoasrhzn/6ZSfjRMbVemsbTsbYplMhwVfqPa9a7PTEuYkK
	TC171qDThRuBRtSlPm3PJaY=
X-Google-Smtp-Source: ADUXVKLF93iFN9wrP7PGJK0yJ4kUrXQyEGSdeeeNuw7Hwc0HZowtLYs8hIyAYNzKwpPl82LRyhABFQ==
X-Received: by 2002:aed:3c78:: with SMTP id
	u53-v6mr10871341qte.201.1529930667194; 
	Mon, 25 Jun 2018 05:44:27 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.44.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:44:26 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Date: Mon, 25 Jun 2018 09:42:20 -0300
Message-Id: <20180625124238.25339-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::236
Subject: [Qemu-trivial] [PATCH v5 28/46] hw/sh4: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 25 Jun 2018 12:44:31 -0000

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
2.18.0



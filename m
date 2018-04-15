Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rKD-0005iQ-Fn
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:44:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKB-0005df-3W
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKA-0001Bh-Af
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:47 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:46635)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKA-0001BT-5G; Sun, 15 Apr 2018 19:44:46 -0400
Received: by mail-qt0-x242.google.com with SMTP id h4so13547028qtn.13;
	Sun, 15 Apr 2018 16:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bJb/S6njg5FkQ1s+XJZO8fLy4KJHFyEpU1L1v+N6DJs=;
	b=Zrq4vfESr+Jhc/FdnHTgAxz1VvlpB/3CFEWNRC0aucp2tHPZAczBx2RmY826Y/T5Q4
	TZozuz4LUcHZCEVfjs8UydAVcraaS/l9vdexHDPZXNBDlZfalG8KmuoNS1pkA0rOz520
	fb5qRTUfwDep3S4BKZsOqYFmzZNqhIEQV2jiOKsPTqhXnlhXHblRXtQo6DSpCzpJKQyL
	lnfECV+106HimUvIAH+hH6STqAvwdMfwJzospuO2413kdFDVsQr7hsZWdzb1GrWXdOKi
	P0E/U1lpNvmQ0GlppFDCHvtIEa+qQHkYKwpgttupIPgKNVmSeHFGaVFJDVxxdT6CPt2c
	7ynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=bJb/S6njg5FkQ1s+XJZO8fLy4KJHFyEpU1L1v+N6DJs=;
	b=IN/jg+YbLKoK1sLNpRzNOpWe8rqerEEtCkdW769QRl20u2DgWYymv9vzatKJpOqSPT
	g2n3bWCO8zw+tNoWg1Pl9IsQ4HM9HoYAS6wTdNThTCEWiODViuKo7fgLoKy0dC9ch+Mo
	fIISpCLh0nuPrXnc9IlTdK+CA+6MmGZ4j7uAu+gRKrHRtNMe5oMvZvEsO5gB2COBqkFd
	T/5HkloaL27aKwMxNgIEQNc+yOOUECclT6cMAyc8mihwNKN+CeQKoBYE/9inAD6JqG1S
	tUWJY7yYg/rQ3z8w0m5SWXrCwZBxiuJXf7K3zi7sZOm1WJjmCWEvBUwe0VxXNRsQGiNO
	3EWA==
X-Gm-Message-State: ALQs6tCUt0KRyXW3o+u4H2VM0TvMW4wuHQNPPZy56EN8Zxa7RseP7zuV
	0dz3JuSgqKkeLrh/7Km7pCog/GlF
X-Google-Smtp-Source: AIpwx4/rgIi1SD77qlJor41Xq+s5WCmMWaU4NIl5+ZIvCRrnWlttVr0eJSQINUO3jbMX35n2HpsfFg==
X-Received: by 10.200.102.131 with SMTP id d3mr14370087qtp.305.1523835885547; 
	Sun, 15 Apr 2018 16:44:45 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.44.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:44:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Date: Sun, 15 Apr 2018 20:42:54 -0300
Message-Id: <20180415234307.28132-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v3 28/41] hw/sh4: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:44:48 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sh4/r2d.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index f5f3deab37..e488fd49b1 100644
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
+                          16 * K_BYTE, FLASH_SIZE >> 16,
                           1, 4, 0x0000, 0x0000, 0x0000, 0x0000,
                           0x555, 0x2aa, 0);
 
-- 
2.17.0



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQr7-00024U-T6
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:44:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQr5-000225-Nu
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQr2-00083Y-Kx
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:27 -0400
Received: from mail-qk0-x230.google.com ([2607:f8b0:400d:c09::230]:42891)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQr0-00082f-Hy; Mon, 25 Jun 2018 08:44:22 -0400
Received: by mail-qk0-x230.google.com with SMTP id u62-v6so4824354qkf.9;
	Mon, 25 Jun 2018 05:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bCdZdki+FpDloqz02q7J0g7sSirFO9erYi+TTCX6QF8=;
	b=gJVSWbk9jvtqS/TeiqLky7YYX0pT+R430vBBptuk5DuA3CSfoN0cRjuBYaxkxKlf+r
	gQkH0NBpWgU8IUwyEOUNzEz4QNc7+62CtgrWmLRJ9rtSvBCAnSs8eK2rLuWkYUivgceu
	1gpFNao89VqEQ7DLR+HzkPl3LJcLnTuJ0nPrdgaFlAK6BZSPPrivpJUzb/NxLw4MBR4Z
	2VjPUL6noxHFJtUIzvUiZSxSMinUTfKAt/5/XoVvUdrCalVYhsUP5ah1TmdgnCG+gjka
	1ScDTcAGXkVIubiE9K6pORzE0z0TvG/pLKea+zcwnI+gPlKvh0nKF/473SzabjG2j6Zx
	9xJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=bCdZdki+FpDloqz02q7J0g7sSirFO9erYi+TTCX6QF8=;
	b=DitByo//4gaKGk28cXAdQMlAs6nW7vaDFuKH0rB7p+6JnIMG682Np7NgINM+BSPND2
	op9vqeNVit9qb8BBggEw0XAnBLOti/YfGfggLYAhg6DY8IwzS9MQavbP+qupSvdwJg2C
	W9tw7O7kN5xKjwnRBSiGzBLRG2h2DDhPFlUt9ow2w26JWZ7dsbZzUBiV/FR7tzK5juo9
	3sxVeIogPi1iWDJ9H+F5CTFoKFr9BbEOfFSFct5CKktzWUcHlAUP0FtA13ncJFX6ezKS
	oMWXKWW82dVJIMWWpnZmlI1YH7DxSDiA9uaE3owGh/yBTm+XP48zAPrS4VYfqzyMrqyB
	oZHw==
X-Gm-Message-State: APt69E3MeeaJOSXwJGtsHHwiU5zSeIEFvwaS1BoqRASOHivLeKUCmp7v
	lGTAvmLBMF8WPsHG8nbBUAA=
X-Google-Smtp-Source: AAOMgpdMpnYrY66gxVRi1+QDcp0Y7+jzdkSivPWAAeNiaqfp0TaeyGMiasEm8tlxhc83xwk639MUnA==
X-Received: by 2002:a37:3a45:: with SMTP id
	h66-v6mr3695760qka.118.1529930662061; 
	Mon, 25 Jun 2018 05:44:22 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.44.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:44:21 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon, 25 Jun 2018 09:42:18 -0300
Message-Id: <20180625124238.25339-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::230
Subject: [Qemu-trivial] [PATCH v5 26/46] hw/cris: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 25 Jun 2018 12:44:28 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/cris/axis_dev88.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
index 56ee398ee5..191292eebf 100644
--- a/hw/cris/axis_dev88.c
+++ b/hw/cris/axis_dev88.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -242,7 +243,7 @@ static const MemoryRegionOps gpio_ops = {
     },
 };
 
-#define INTMEM_SIZE (128 * 1024)
+#define INTMEM_SIZE (128 * KiB)
 
 static struct cris_load_info li;
 
-- 
2.18.0



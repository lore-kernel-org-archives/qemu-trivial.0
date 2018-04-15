Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rK8-0005ak-JL
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:44:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rK3-0005WX-Uf
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rK2-00014O-TE
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:39 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:35756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rK2-00013y-OS; Sun, 15 Apr 2018 19:44:38 -0400
Received: by mail-qk0-x244.google.com with SMTP id c188so14805643qkg.2;
	Sun, 15 Apr 2018 16:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JK0GdKYrr8nqLXq6/gk+uBwsRSsTrdp7Z0lIruQwAM0=;
	b=jMglwN5TKYi1wLTb1WDIEDghi1EpgNvN+KGTefwjcXHbYDeUFp/CpvwCbAUwuaW0xb
	SgyN4KfI9+Rc1x4SznzHvFGc0lnNZw9zrypmPlnfwva+Oo5zqOt/PxjW/K8C9mbsVpSG
	G7c5C9yd2X4rg9LO+e+IcmbjsUhhJvxZrLd+bDRR1pfGQSorCYnb61SUOzNULnPO6MxL
	bXI/i0pHqz1AecIsmoUAmRvItHAFGWPX1iBuxkT2iptO6+6b/4PnnPJitDxkdFDYKpiM
	hw3gearf9WsiAbHM38dYPAe9TYqmPyiuCfz2t7p8qCETIfRiHCvmWRLL8Daysa5r9dOp
	pwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=JK0GdKYrr8nqLXq6/gk+uBwsRSsTrdp7Z0lIruQwAM0=;
	b=XFBPadCBNnsTNSwzoU1XV/HuVzNXcpt+B0PJDHqQKHDVTebdhMuzzD30c/GFulAJF1
	rqOoUImwNjnyuhBxGQT1Kx+9l6bIGVFYOGKxojR5EnYGVmTspPuA/3EZqk0bmuAUSkwX
	jVUTuEYHxTzITwA246NlOKI3X6Ri/zpQUDrpWlNsKWH0NJE/o4KGtQGSZzEoAJqxZH98
	iMOy/YIxQuBRJh5bpVHZozAj1yY0+jLOMcMujQsyGZoISs1patl791PtH8tj+ZFM+XWx
	9YgNzUS0HUQrCOQQ/D9/5McJYOwfTa5oxVboU8dV78pHyokcpgXf6RiEpW1H1c2xClxh
	NBPg==
X-Gm-Message-State: ALQs6tAkIqdS0X/6sJK2XRm0KVRlEYH/PydiCP+cgAH/9buCvJtqRg6L
	RcU5+hp2GaKKeXfetP17TjBlOUSA
X-Google-Smtp-Source: AIpwx49V6UcYv3Gkirutj+8UUs9y6OYWUyOWZNSjloEyTpMBJ16TAdYefVCmCLvs3ktaRJFwdeDEqg==
X-Received: by 10.55.167.23 with SMTP id q23mr15062906qke.329.1523835878110;
	Sun, 15 Apr 2018 16:44:38 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.44.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:44:37 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Sun, 15 Apr 2018 20:42:52 -0300
Message-Id: <20180415234307.28132-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v3 26/41] hw/cris: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:44:43 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/cris/axis_dev88.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
index 1775e53e25..a0f83f53d2 100644
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
+#define INTMEM_SIZE (128 * K_BYTE)
 
 static struct cris_load_info li;
 
-- 
2.17.0



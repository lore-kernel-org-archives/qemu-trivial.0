Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQqt-0001sA-89
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:44:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqq-0001od-60
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqp-0007x8-4C
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:12 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:39699)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqi-0007u0-PV; Mon, 25 Jun 2018 08:44:04 -0400
Received: by mail-qt0-x243.google.com with SMTP id c23-v6so2826978qtn.6;
	Mon, 25 Jun 2018 05:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=aQ3j/YvZkmWMsIul5k1XIP5Icic3DirFF7HExLy1BdA=;
	b=CwzGmZAfzfbSyVSvYbHCrk8WVdvk7lJq56bd85eAuM9LHSn/YMiLudXG8PGIIA3S4/
	H4dUX7abMmSYIHX4fH6tRhu6lUCXS5E27+g4GBjqjK6Asu3Z5z1TFhaQKwEawtTV4vFa
	piyoqdwN/xSdXd+7coITvfYR3SMJo7R4HQZQzPG1MKPgzuDP1dOctPbNneg+ksfUfaaW
	aFrj3CDPpGAXT4gfyuAiEgOkHhKSZTPU6GvyexikyE/R2DBXWTw+VSPGjj55RXPWK0CF
	wpGH/7SdJIuwiRusAAlUvg0c93gatuV9hgJgxW+wUJF741TCfOQnjp/twfGMwBgkSFtj
	BF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=aQ3j/YvZkmWMsIul5k1XIP5Icic3DirFF7HExLy1BdA=;
	b=kCpEe00bpVOdk24T15y5+tvIE+xrT0vR59XTSq6/PmYsQ3VvoSSUZf1joThHyRd1WV
	IyuOQTZpRd+iBWa/U+k182IX8FVUM4bqlH3SdemtLM15sZjkHOWt6Vqxk/Qy6qPFg0ET
	9kpc1WHA7cPymdmHn2NfJPfgdEXl2pGUu18ySKTMY4dY4oTsPmrrW0MY6egwhnHoV0RT
	WcphsEK+x/nF5JR8vtbFwgEhWu8NdyrVJgM7BvwkbuY9VOCB0KckUWHYqrqTy0mbzj8C
	z7uA87DtfqOCflsYbJ+vpl3mn/Lz1s4jxr/A+ImDe5PZpOYDGryIkyvZ9XgY6vveXJk/
	wByQ==
X-Gm-Message-State: APt69E28HdUigAEIneQraXvH25ROzngRSKVvdNXIeaesOEShGcPkJUgH
	i9B7s2eHu1DB1TLmpiJouwg=
X-Google-Smtp-Source: AAOMgpfhT5kQ86KhXdXyE1am9VgJD50T48zBjVNnqpE8kvdCQJBz1/jRoUDq/1uQ4CEWRi5T1VZ4Zg==
X-Received: by 2002:a0c:e24a:: with SMTP id
	x10-v6mr10837209qvl.244.1529930644201; 
	Mon, 25 Jun 2018 05:44:04 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.44.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:44:03 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Richard Henderson <rth@twiddle.net>, Alexander Graf <agraf@suse.de>,
	David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org (open list:S390)
Date: Mon, 25 Jun 2018 09:42:11 -0300
Message-Id: <20180625124238.25339-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v5 19/46] hw/s390x: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 25 Jun 2018 12:44:13 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/s390-skeys.c    | 3 ++-
 hw/s390x/s390-stattrib.c | 3 ++-
 hw/s390x/sclp.c          | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
index 76241c240e..15f7ab0e53 100644
--- a/hw/s390x/s390-skeys.c
+++ b/hw/s390x/s390-skeys.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/boards.h"
 #include "hw/s390x/storage-keys.h"
 #include "qapi/error.h"
@@ -19,7 +20,7 @@
 #include "sysemu/kvm.h"
 #include "migration/register.h"
 
-#define S390_SKEYS_BUFFER_SIZE 131072  /* Room for 128k storage keys */
+#define S390_SKEYS_BUFFER_SIZE (128 * KiB)  /* Room for 128k storage keys */
 #define S390_SKEYS_SAVE_FLAG_EOS 0x01
 #define S390_SKEYS_SAVE_FLAG_SKEYS 0x02
 #define S390_SKEYS_SAVE_FLAG_ERROR 0x04
diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index 70b95550a8..5161a1659b 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/boards.h"
 #include "cpu.h"
 #include "migration/qemu-file.h"
@@ -20,7 +21,7 @@
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
 
-#define CMMA_BLOCK_SIZE  (1 << 10)
+#define CMMA_BLOCK_SIZE  (1 * KiB)
 
 #define STATTR_FLAG_EOS     0x01ULL
 #define STATTR_FLAG_MORE    0x02ULL
diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index 047d577313..bd2a024efd 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -13,6 +13,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "sysemu/sysemu.h"
@@ -289,7 +290,7 @@ static void sclp_realize(DeviceState *dev, Error **errp)
     ret = s390_set_memory_limit(machine->maxram_size, &hw_limit);
     if (ret == -E2BIG) {
         error_setg(&err, "host supports a maximum of %" PRIu64 " GB",
-                   hw_limit >> 30);
+                   hw_limit / GiB);
     } else if (ret) {
         error_setg(&err, "setting the guest size failed");
     }
-- 
2.18.0



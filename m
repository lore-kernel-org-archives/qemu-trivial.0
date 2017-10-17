Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V0u-0002ak-6c
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0q-0002Wd-LF
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0q-0003cw-1T
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:40 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:47830)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0j-0003YI-FH; Tue, 17 Oct 2017 12:46:33 -0400
Received: by mail-qk0-x244.google.com with SMTP id m189so2835451qke.4;
	Tue, 17 Oct 2017 09:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jsSYnS+pieiKhjh0pSRYsozy3igSZBWnMnniuZZM2w8=;
	b=L9fg4mK+LLolERNY5yFQjhRiKvE2s5VYvXj1K7RbC7JkG3gFPGNRVesh/hF4zKaLV9
	3lN6zdgeTfM96McpMUtRv0tptmJEB2oO5R+kvTjb8ucYI9sqdlFPU6fzylJtIqoBbzmZ
	KoFfvBj/UjtjsuXosDUvZCqSxA1K5i0o+3N5lBAtu1nb5rHcqh+VVRa84KoZ0U+0PLwN
	hPskl05TIHTGRcb63jdATt6vZvu0ilTm9FxMrdJtzK4wflv8hD2CemOrbHjWAovdNCQM
	fhrP6xilL1pLp4UOqNK1Mko3lMORyyl/VLXxuN1LSBny2fPY0kcpcq0SQiT6vUILOs2R
	7gCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=jsSYnS+pieiKhjh0pSRYsozy3igSZBWnMnniuZZM2w8=;
	b=E47cAQfed7j0g6zzL0rsgC5D5p1LLmg+FgsziBfdAMsNYhLDiwaNjbWm7/xRPYngGY
	ma370NinwEmeC3IdUC7OEBDEHf9Uen89ll6L2NePKxUqJidCwxkGus4zaIaqEAT6BKAd
	P/CfdDBFm94dGKXOkKncUIinRhDadlOcnAVhXBulUB47B5S1B+sDotS4M3zkJOSLq6YM
	W0E6kal7Z8upgQCbaxcsjC+JOji7idguFzfm1oQgqPyzHblt00bD7m5pxo845TJ+ti1E
	zlEZWOx02/DzrDp2cYzy21mfLyBFmtf2Y4mLOJBBz4CL/GLzgt419HK6zBRB5DwZQs10
	DgCg==
X-Gm-Message-State: AMCzsaVHYPGanl9fopBPS1zuV++h4uaMUfuzlaoTKEBX/Eve42xCq5T8
	Wd/hQuj/Tpn7Ml3E18jmF/c=
X-Google-Smtp-Source: ABhQp+RoAhxeH+UADYiT99Y6eIUJ6WJGztO3jVR+L2k1J0X5W4piESSBipx0kbw26enGKitX0ceRQQ==
X-Received: by 10.55.20.151 with SMTP id 23mr20310793qku.78.1508258788647;
	Tue, 17 Oct 2017 09:46:28 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.46.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:27 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:11 -0300
Message-Id: <20171017164426.25277-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v3 27/42] hw/i2c: remove old i386 dependency
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:41 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/i2c/pm_smbus.c   | 1 -
 hw/i2c/smbus_ich9.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c
index 6fc3923f56..a044dd1b27 100644
--- a/hw/i2c/pm_smbus.c
+++ b/hw/i2c/pm_smbus.c
@@ -19,7 +19,6 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/i2c/pm_smbus.h"
 #include "hw/i2c/smbus.h"
 
diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
index e47556c9d8..007cb6701d 100644
--- a/hw/i2c/smbus_ich9.c
+++ b/hw/i2c/smbus_ich9.c
@@ -26,7 +26,6 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/i2c/pm_smbus.h"
 #include "hw/pci/pci.h"
 #include "sysemu/sysemu.h"
-- 
2.15.0.rc0



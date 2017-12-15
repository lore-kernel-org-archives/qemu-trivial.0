Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgjP-00030c-Vv
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:32:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjK-0002xE-Oa
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjJ-0005iU-Ri
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:10 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:46948)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjF-0005bT-Sk; Thu, 14 Dec 2017 22:32:05 -0500
Received: by mail-qt0-x241.google.com with SMTP id r39so10550952qtr.13;
	Thu, 14 Dec 2017 19:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kZwSWy+0w/3nkrftjAoF+oKkwRprkBzGmbydUSLaGgo=;
	b=HtPsG2lKJyIW4lhXXEAaN3W0KjygPz8hwwBTUnzqJ167amMSqgZptzOVrvojgDqX25
	n7UVWkImDsbhtyqu1z4zO3eu8L8q86t5llGGh11A2jtcqzUA4lrRIVjvfZJDnsrk5aCR
	0UKZOuVDH3fgzJ58zhivAGUcVI8IydQn7UlSanZ5J0pK+CQhm+umdAMhpokpXOWoP8+e
	FrQ0QxMryZMeitguwA0lohtUXhnoC1d5EnpLSsAIEzczjsUqflfMQAnox+aMrfBubnaP
	/dXGtGhiDb/KRpcyeL6ipgys+C2J6cmYGxyVR7h5E2JR/S/ZVFVbjX0BazrpIdai5YnX
	J/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=kZwSWy+0w/3nkrftjAoF+oKkwRprkBzGmbydUSLaGgo=;
	b=frNlIj+Yw4LpstUnW9NnZdlh3kU7exjYMge0thuhD/P0AVpgb00svv8KUwlvCxsQ+L
	aZT3dz1pIi1qqRk2Qwl9TfP3ypraweVB7R7l+2J4BgmFNTyDGWhdGAgHMKM7kXk9uD8o
	54KS/tdESIaLPBbwBp4O6pS1Ufc0KPaA0g9PqChn+nIEMkJ9dR0dVqWw/MMFTfYQGFoa
	oEPlmSa+D5qPSj8vNLZw8ocd59ngTbm8FNxlAXkZpCX5XyltVb6ykC8qnraD/v59+Tfp
	ukluXu5wRAMZ9gfbdP+QhLcR+DC0EnYCXCTnd5aDlBdu1dmkonmyar4s0PAfon6DNRKM
	evKQ==
X-Gm-Message-State: AKGB3mIWyJ1dGw7jBz8BGwsou69TQm+HsFko5WU9gKQERyXGU9+B8oXA
	NQq2CoW1KrhTS46E3eHaPXA4RRMQ7yI=
X-Google-Smtp-Source: ACJfBosDH39azUZ6LjUVqKLESDEK86pHPWvKTMWL+S1ZMgL7eQ6Ji4GJjwsN3Fh+ovuN16VxvRsU6w==
X-Received: by 10.200.45.215 with SMTP id q23mr18987595qta.134.1513308725396; 
	Thu, 14 Dec 2017 19:32:05 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.32.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:32:04 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
Date: Fri, 15 Dec 2017 00:29:59 -0300
Message-Id: <20171215033015.738-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v4 27/43] hw/i2c: remove old i386 dependency
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
X-List-Received-Date: Fri, 15 Dec 2017 03:32:11 -0000

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
2.15.1



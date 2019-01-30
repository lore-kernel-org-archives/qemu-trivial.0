Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gopq6-0001nS-Dm
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 08:23:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gopq2-0001l5-2U
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gopq0-0006oe-O1
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:34 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:38059)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1goppq-0006YW-Va; Wed, 30 Jan 2019 08:23:23 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1M7auL-1gnTqt2BnZ-0083YG; Wed, 30 Jan 2019 14:22:46 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Jiri Slaby <jslaby@suse.cz>, qemu-s390x@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Igor Mammedov <imammedo@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Stefan Hajnoczi <stefanha@redhat.com>,
	Stafford Horne <shorne@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Max Reitz <mreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>
Date: Wed, 30 Jan 2019 14:22:08 +0100
Message-Id: <20190130132214.25493-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130132214.25493-1-laurent@vivier.eu>
References: <20190130132214.25493-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:30tfK/C5JSjPV503bJ0vILLNphX9WMot1YR4vKoSk28BbhC1aPW
	Q07fuuwb6YISr+yGDHrsdd4PVFwLmIFeoDqhFejyA1pXiXBi7cpphhrlciamtqsxYkuihOr
	aH9wWE1HQfhH8nqflaTxsD5HSi2gf0VUG/pYAxHmyTlR+WoJvTL8nsVfqp8aQbs+hgdT/S9
	4gpejSjDf4Sz/uJn2Ft5Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ACFTFALz8aI=:2zE6WxAisP/gE96lyr2EFo
	QQMQShy7QpDX4Mpxwifz2q/ehVOdnm3VTqLG0w2aeTi2nwbFBZ+nhglUCTME2Vh7W2G1Bf22q
	cxn80wYSIBN9gKg39EcQC8R/x1dEx99P7qFsL/QVRNeSXCGp+yw4pTUQ+WlYGUcrxf/+WnAZ4
	0NVMiDcNwXCCUnVQ/Pq2XSbpQIKZw5bf1h0fGvQ9JrY6tKX9toWWMvGx+xBX/YUi907+aRait
	MfLVd/f5VAHvfl8/bmK5ShcverzMGfPBwbkSOu0Jv7ov/+gHOVo1RdgGGUWifot8w5kzLZItE
	Sm6U/3imW/YTnTEtv7FKCjmDwR45v1Pe5Fdb3sYDKFAWf80dPQwMZzAk2RNKUYH4Vt81I8KKk
	r0k9tfUnCv5LXJ9EhIfjOk3JW7BZcWOlj4hQL7Xc76CPN5QldLnguYpxR3rFZ7m3PbDtU6PTv
	BIfpLf/wurffoAMtNhk5broQBRe6ppnu6DVICRxck+f1l4C0h7YMjYwqY/X1P0aI9vY8oi669
	GWy7wD4BUclMTNON9H5YOou5oFL1HPNjqcboRGOHLOxg4gaQ0gObwzsGXgLtehX6lwYxqzMKY
	ZyjGzF2+sOUCLy7vxDb/RglzpAVpBZFGx2Rwee8PU+2y/6yr3zAzAahT5WsxCwq2pm9jBgMcI
	Tg0H4f92PByZ/jkiDP5ZgUpGVK/eNSCLdmoRDpQYUztMT/uE/7p3Y6kPWoB7PFDVD1cn/LIGR
	uMWDc6NpX7w9zK6T/qTSS5BcEPU3BmKxVdILtg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL 07/13] target/openrisc: Fix LGPL version number
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
X-List-Received-Date: Wed, 30 Jan 2019 13:23:35 -0000

From: Thomas Huth <thuth@redhat.com>

It's either "GNU *Library* General Public version 2" or "GNU Lesser
General Public version *2.1*", but there was no "version 2.0" of the
"Lesser" library. So assume that version 2.1 is meant here.

Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1548252536-6242-3-git-send-email-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/openrisc/cpu.c              | 2 +-
 target/openrisc/exception.h        | 2 +-
 target/openrisc/gdbstub.c          | 2 +-
 target/openrisc/helper.h           | 2 +-
 target/openrisc/interrupt_helper.c | 2 +-
 target/openrisc/sys_helper.c       | 2 +-
 target/openrisc/translate.c        | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index fb7cb5c507..541b2a66c7 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/openrisc/exception.h b/target/openrisc/exception.h
index 4ec56b4653..c9c4e471d2 100644
--- a/target/openrisc/exception.h
+++ b/target/openrisc/exception.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/openrisc/gdbstub.c b/target/openrisc/gdbstub.c
index f9af6507f3..43b1a18d4b 100644
--- a/target/openrisc/gdbstub.c
+++ b/target/openrisc/gdbstub.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/openrisc/helper.h b/target/openrisc/helper.h
index 9db9bf3963..96d79a8113 100644
--- a/target/openrisc/helper.h
+++ b/target/openrisc/helper.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/openrisc/interrupt_helper.c b/target/openrisc/interrupt_helper.c
index 9c5489f5f7..ab4ea88b69 100644
--- a/target/openrisc/interrupt_helper.c
+++ b/target/openrisc/interrupt_helper.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index b66a45c1e0..05f66c455b 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index c089914d6a..89680f882d 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
-- 
2.20.1



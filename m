Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCVW9-0001UJ-1Y
	for mharc-qemu-trivial@gnu.org; Thu, 12 Mar 2020 17:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58261)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jCVW6-0001S9-Em
 for qemu-trivial@nongnu.org; Thu, 12 Mar 2020 17:37:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jCVW5-0008Cd-C1
 for qemu-trivial@nongnu.org; Thu, 12 Mar 2020 17:37:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30148
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jCVW5-0008Bz-8h
 for qemu-trivial@nongnu.org; Thu, 12 Mar 2020 17:37:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584049040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XSLtg8+/hwx1FP2CBxks339VRaKsowB8UJ+IEyCg+AA=;
 b=AMmCOkBD1+P8B3q4hBBXRBT1HfHjkstXH3+tOHfRO/9rbQurEc6rrdFL2cpb6sHNh0Zu/C
 o5yL+i8VGgLESoFHdVA7M+5Yra65jRMTcEzI0WYhiWGuh1b0ianKBgkJuNFgjhI2GKDkeX
 5A2aa8MiqVYPsKxCGHPXcxe1BBP7bBs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-Sjv6J8b3MBepexjemTjdfg-1; Thu, 12 Mar 2020 17:37:16 -0400
X-MC-Unique: Sjv6J8b3MBepexjemTjdfg-1
Received: by mail-wm1-f69.google.com with SMTP id z26so2739380wmk.1
 for <qemu-trivial@nongnu.org>; Thu, 12 Mar 2020 14:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iZUKff7bmGNZbqvkRQLIUE/XadVZPiKqPEvIfB3p32I=;
 b=NIsldHevZ+kqmDDcCzK3RrhjkZVo5+R9tE6gF26/c4Tbs5i79+FShl9HiXonDCiwM6
 FvUTcL9i4AEwXM+g0PZ3WvVd/193h7rnQhfMwN1D2UPjCKO4EcFYHqk0lFcmCj/KFCOe
 qYeEG1K/NVClrtRk0aeX4nHxwa/qWZjXcdIMAmNOFrW0y+qADCSC1uvBvj/5IBTBLKp/
 CchvGwyT3JQVIy4IL/7e2cDamtajU3y58B1wRfFbibWZ68DAYjJc8bf0qIHGOEYoA1/q
 ba69BIdqn7sip/8NDkymSG4llsjJ9IZASPkyNTaLuLXWlK/48fi7FGNl+yVLIKaZ1icF
 mBzA==
X-Gm-Message-State: ANhLgQ1IfsS0u/crMcZLCoiw0RjRVWjdFN7LmMbAs+9Co5hb2XjOd3+i
 q1V/Rb2Bpp1xs6A+0SVVR3V2fSEReZOZ6Xh5W74B2UZ8gNiItKnpd+j8JQrhkyKjGNyUlpw6AIe
 jllnZjHl4wXqp36Z+zA==
X-Received: by 2002:a1c:1b0e:: with SMTP id b14mr6733014wmb.8.1584049034914;
 Thu, 12 Mar 2020 14:37:14 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtd0yGnGm0j4uXuLvbdgZXGwh6gr9Wf+xTcZI6WAYwHyxl0mErLyTBBjS7yHzgjc26dzsQXRw==
X-Received: by 2002:a1c:1b0e:: with SMTP id b14mr6732996wmb.8.1584049034613;
 Thu, 12 Mar 2020 14:37:14 -0700 (PDT)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id p10sm75905122wrx.81.2020.03.12.14.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 14:37:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/isa/superio: Correct the license text
Date: Thu, 12 Mar 2020 22:37:12 +0100
Message-Id: <20200312213712.16671-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Mar 2020 21:37:23 -0000

The license is the 'GNU General Public License v2.0 or later',
not 'and':

  This program is free software; you can redistribute it and/ori
  modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 2 of
  the License, or (at your option) any later version.

Fix the license comment.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/isa/superio.h   | 2 +-
 hw/isa/isa-superio.c       | 2 +-
 hw/isa/smc37c669-superio.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/isa/superio.h b/include/hw/isa/superio.h
index b151dcd753..147cc0a7b7 100644
--- a/include/hw/isa/superio.h
+++ b/include/hw/isa/superio.h
@@ -3,7 +3,7 @@
  *
  * Copyright (c) 2018 Philippe Mathieu-Daud=C3=A9
  *
- * This code is licensed under the GNU GPLv2 and later.
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
  * See the COPYING file in the top-level directory.
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
diff --git a/hw/isa/isa-superio.c b/hw/isa/isa-superio.c
index c4e391916c..180a8b9625 100644
--- a/hw/isa/isa-superio.c
+++ b/hw/isa/isa-superio.c
@@ -5,7 +5,7 @@
  * Copyright (c) 2011-2012 Andreas F=C3=A4rber
  * Copyright (c) 2018 Philippe Mathieu-Daud=C3=A9
  *
- * This code is licensed under the GNU GPLv2 and later.
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
  * See the COPYING file in the top-level directory.
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
diff --git a/hw/isa/smc37c669-superio.c b/hw/isa/smc37c669-superio.c
index 901a9f8e65..18287741cb 100644
--- a/hw/isa/smc37c669-superio.c
+++ b/hw/isa/smc37c669-superio.c
@@ -3,7 +3,7 @@
  *
  * Copyright (c) 2018 Philippe Mathieu-Daud=C3=A9
  *
- * This code is licensed under the GNU GPLv2 and later.
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
  * See the COPYING file in the top-level directory.
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
--=20
2.21.1



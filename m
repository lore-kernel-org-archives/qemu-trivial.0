Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNRYB-0006k1-GI
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 19:27:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRY9-0006in-Df
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:27:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRY6-0000SK-Bv
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:27:35 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:38710)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRY4-0000Pp-9i; Mon, 28 May 2018 19:27:32 -0400
Received: by mail-qt0-x243.google.com with SMTP id x34-v6so3250886qtk.5;
	Mon, 28 May 2018 16:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MolqtkoJWN2HaOXBWCDtrtTY/ZoLxlR9JpIa43OT99A=;
	b=B0lNnDmPdGkmlxQFadveMwNl/HfSSJUjcWbs08gnb/CilHrtGwvZpyDU8CdAGsAVbI
	CgvkrPk5h+oiKgxfATMUhUsYRJxQvvQ/fPAFYQGd/V16nvc5Aqn4CU+QEfpx4dUdINe6
	ZXZswFvmZE6ilq7thBSl4JMbfCIYAQLJUn3fjh+XI7LWUHk/MOubXabAB1ydPG7k66Qk
	jjOVPD40LrkPjQ1ylfmNUUYfGQvaLl0RGsL2f5Bk2t2TFkdOtZWEBFNZTD4/cD47JwfK
	+z/s/2SVPRmE/0wbPzEmz6zaboVr6ggVPcWRLKDegm16psIsi2QlFn5cHS0KOXgY0lZV
	pt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=MolqtkoJWN2HaOXBWCDtrtTY/ZoLxlR9JpIa43OT99A=;
	b=aZpyBc2TOYx0rbTm41aNh442ZPsN9QN5MK4WTXvgUy/hA6CoWuHzV/Up7x/YYoMtHH
	lf8tS+Z3i2NkSy6dRK+DAwMZnwtvCZFg+cVV3zU0hqLwwugVqsA1lIklhYmrSXLwvAQl
	02QzTpEIt2pZtNGGrEY/LmIO8DLRJiXVx6HMzY5TRkdAUfZHzM+ez+2eOFf9NZx4tNme
	HQLW01EPgW377v0MZJCOsLcPOruDFbJ5m3wE/CZcdkf0xlHK6ovg6Z40rbhogAo6dtKN
	OQbwk3nLVvZBA+aH9QxpFWaOPcuON8127+BKNVV3aNJzdKXoQe1kCY1CnQltK9vOtfn0
	hsdg==
X-Gm-Message-State: ALKqPweXuga78en2wbeSqhH7vR0puBRJdC+m2g/Hgt4NZnEeNMhP7bO0
	scVPISVoTbmP2YgRtofHovM=
X-Google-Smtp-Source: ADUXVKKCSpYjfME50cizMDrU3BMa/ZUShbm8DpEJ9eqyACKeqYaaswvRczH/PgyLm7RbI339Y2G3Lw==
X-Received: by 2002:aed:3704:: with SMTP id
	i4-v6mr13714553qtb.234.1527550051787; 
	Mon, 28 May 2018 16:27:31 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm23756182qki.62.2018.05.28.16.27.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 16:27:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-s390x@nongnu.org (open list:S390)
Date: Mon, 28 May 2018 20:26:59 -0300
Message-Id: <20180528232719.4721-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528232719.4721-1-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v4 01/21] vfio: Include
 "exec/address-spaces.h" directly in the source file
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
X-List-Received-Date: Mon, 28 May 2018 23:27:38 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/vfio/vfio-common.h | 1 -
 hw/vfio/ccw.c                 | 1 +
 hw/vfio/platform.c            | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index d9360148e6..8264a65fa5 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -22,7 +22,6 @@
 #define HW_VFIO_VFIO_COMMON_H
 
 #include "qemu-common.h"
-#include "exec/address-spaces.h"
 #include "exec/memory.h"
 #include "qemu/queue.h"
 #include "qemu/notify.h"
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index e67392c5f9..76e4e8c652 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -22,6 +22,7 @@
 #include "hw/vfio/vfio-common.h"
 #include "hw/s390x/s390-ccw.h"
 #include "hw/s390x/ccw-device.h"
+#include "exec/address-spaces.h"
 #include "qemu/error-report.h"
 
 #define TYPE_VFIO_CCW "vfio-ccw"
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index 5c921c27ba..57c4a0ee2b 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -24,6 +24,7 @@
 #include "qemu/range.h"
 #include "sysemu/sysemu.h"
 #include "exec/memory.h"
+#include "exec/address-spaces.h"
 #include "qemu/queue.h"
 #include "hw/sysbus.h"
 #include "trace.h"
-- 
2.17.0



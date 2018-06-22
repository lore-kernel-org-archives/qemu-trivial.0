Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWMJX-0006Oq-06
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 09:41:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJR-0006JP-W5
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:41:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJR-0003eL-7F
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:41:18 -0400
Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230]:38342)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJO-0003an-LN; Fri, 22 Jun 2018 09:41:14 -0400
Received: by mail-qt0-x230.google.com with SMTP id e11-v6so5336129qtp.5;
	Fri, 22 Jun 2018 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YUhN8bGDi0zHsya44e31XrtEa0WibSxdo5h7xdErdEQ=;
	b=MV8TekmsTYJqvCJmQ9/Yhxv9wpMyQwjpjG6jESanVPBgpsq7wcKUqtKNN89vRdac3X
	r8CVqFJ3G18+IVtjJyd9Iwu/7Eri53xbe+1ePy7MvXCGyAa68re80KJkl4IoWarv/NOF
	7G9La3ubRN33zZfj7HX/phVTT7uzHCLEQXK+ucvJpyKJmspta3MSoqYTbqmZs1F19UFG
	MFrAFckEYA+lQYx6544kF3EE3496gUZ8p/mbC9+u/2yZ3uh/dh7uPeLdr59QVdHfnkMz
	qAeB5ZhzzCuonyUAXIfDEqnz4UpZsYj4XcFDZEjbR/LECrEorpvz5TfZN6jAWYXtW1xA
	qcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=YUhN8bGDi0zHsya44e31XrtEa0WibSxdo5h7xdErdEQ=;
	b=WHwmydxKKEHMjJeGtIYD3BLGoAMt5rXelWfTkDzZYT/DY+fxvTphXzlGQmiDa96WOw
	NNnh9VYuRQjDMSNOov/ojlKNKecvz4ozfAmnYnnZJ0HsORs9vudjNOj24tuvo3HWhDLU
	0lNZvjFxOxTS6DWwe2FPWaTZFW5RNd/UiaPnpNTwgEO476uFBDFLOe6O4rfogaxEv9wE
	O69hWeM5z7ST5KrQ3APVnmlocp3pf9I7Qxq9tJNYOI1FKFWTV/MHnjY5hBSomgrI69L3
	e+Sn0gxpZxoLbESRV0p7d3jDsltTG6f0iqkWVCRgCKLm5YaRK8AKyYlsNBAe6zYe+TDH
	5Cmw==
X-Gm-Message-State: APt69E0E9CRoRP5uv9Dg28yuvQZwHJ6DW+HZf1978YaBDozK0jVnMmAQ
	ATF85mhrW5vtjZebQhu5usQ=
X-Google-Smtp-Source: ADUXVKLfcvixlDQt/1x152sdiJe7/PzauTxX9vYNrYcGrFQlGT3PFHOB71edk4Mu9308FRkNB/lw0w==
X-Received: by 2002:ac8:27e1:: with SMTP id
	x30-v6mr1385691qtx.51.1529674874059; 
	Fri, 22 Jun 2018 06:41:14 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.41.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:41:13 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Date: Fri, 22 Jun 2018 10:40:33 -0300
Message-Id: <20180622134036.23182-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::230
Subject: [Qemu-trivial] [PATCH v2 11/14] hw/net/stellaris_enet: Use
 qemu_log_mask(GUEST_ERROR) instead of hw_error
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
X-List-Received-Date: Fri, 22 Jun 2018 13:41:22 -0000

hw_error() finally calls abort(), but there is no need to abort here.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/stellaris_enet.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 04bd10ada3..f8edebdecd 100644
--- a/hw/net/stellaris_enet.c
+++ b/hw/net/stellaris_enet.c
@@ -9,6 +9,7 @@
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
 #include "net/net.h"
+#include "qemu/log.h"
 #include <zlib.h>
 
 //#define DEBUG_STELLARIS_ENET 1
@@ -343,7 +344,9 @@ static uint64_t stellaris_enet_read(void *opaque, hwaddr offset,
     case 0x3c: /* Undocuented: Timestamp? */
         return 0;
     default:
-        hw_error("stellaris_enet_read: Bad offset %x\n", (int)offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "stellaris_enet_rd%d: Illegal register"
+                                       " 0x02%" HWADDR_PRIx "\n",
+                      size << 2, offset);
         return 0;
     }
 }
@@ -442,7 +445,9 @@ static void stellaris_enet_write(void *opaque, hwaddr offset,
         /* Ignored.  */
         break;
     default:
-        hw_error("stellaris_enet_write: Bad offset %x\n", (int)offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "stellaris_enet_wr%d: Illegal register"
+                                       " 0x02%" HWADDR_PRIx " = 0x%lx\n",
+                      size << 2, offset, value);
     }
 }
 
-- 
2.18.0.rc2



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V0S-00023K-EM
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46889)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0Q-00021M-JT
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0P-0003PH-1I
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:14 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:57074)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0K-0003Mf-5m; Tue, 17 Oct 2017 12:46:08 -0400
Received: by mail-qt0-x243.google.com with SMTP id z28so4896505qtz.13;
	Tue, 17 Oct 2017 09:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jUJhEuy+XIuC/oXCtoHkrHZlRd1DJtmdg7Wax4ceGvY=;
	b=LvxoGt4ZR0YhCepsn81VPW9+/SuSU++STctsayv6CgbMe7paLmhZKG8Ve+0EXvEK44
	B03OrpZql93QUIIIcuJStc29Sy0wDNNt7eQ3UPvIgUj9prFcKz1ZRdQgXE0VtyXKTiqW
	IFZBDYuHYeX8kC5DwLByn8lbWK+mDnupbtSETX+GbyqqBpJIGaVo6BsGWYePExIvcFgg
	zJ5BqX0weuKpeqdEqDH65yoIVImVYj/GOaYci8pWwjZ+K4MQk7K9sm9vQ8KweXeiXUzM
	hlK5cyUOvHmHnavnfdazFrcsr0TFVcuzsnTuowxUcOjs5w56WaY6GXRiEZztn69zRf5m
	pFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=jUJhEuy+XIuC/oXCtoHkrHZlRd1DJtmdg7Wax4ceGvY=;
	b=b3CuMtbZ528lTsER301QqK8oUPOwl0gZNLUl5cFLvUPAWYreVkQbyVIS2+o9/ahDSb
	B2/+SKhUBgk0yoVjsoSziG7L0jCxLmK/DDg7UCYgcx+k1tI9lhe3ZB+K6m3tmML57KyN
	6n/LWohT1fociOoZG/lDVI2iYDYk3QCR3bPu3dUgHYLe8GIwg9lNyp6+V97crt7qjdMJ
	NLqrx7qB7wJmdLhrVQwxfX8XtEGy1arDLBOZSTa6txOu1XMB2LpprYyOpPsWgPxXz/7g
	UeQcGNCoBqmxdBRkdl+GNN4IWv6hHczyA0xuGLiTMhMxKfVG6WKhDdmnXkjXVxNyKfX2
	/yZw==
X-Gm-Message-State: AMCzsaUERmLuI/aVxdOuLm1iD6zXNaEVfTdmPVX16j6xnmnIxiMUKFg+
	JVOYvZE4jL+BTfxsDCtbtggUt5jJ
X-Google-Smtp-Source: ABhQp+T/NHSyis8nafzfbgEcJpdmAlo7TLkchI9idCbOseTPpF4HTtBr4ilTrUMatr9WLPs2h9JpaQ==
X-Received: by 10.200.8.149 with SMTP id v21mr11658193qth.123.1508258767691;
	Tue, 17 Oct 2017 09:46:07 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.46.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:07 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:02 -0300
Message-Id: <20171017164426.25277-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v3 18/42] misc: avoid "include/" in include
 path
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:15 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/adb.c      | 2 +-
 hw/ssi/aspeed_smc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/input/adb.c b/hw/input/adb.c
index fcca3a8eb9..924a3f9fd5 100644
--- a/hw/input/adb.c
+++ b/hw/input/adb.c
@@ -24,8 +24,8 @@
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "hw/input/adb.h"
+#include "hw/input/adb-keys.h"
 #include "ui/console.h"
-#include "include/hw/input/adb-keys.h"
 #include "ui/input.h"
 #include "sysemu/sysemu.h"
 
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index cb515730c5..992617fd3a 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -26,7 +26,7 @@
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
-#include "include/qemu/error-report.h"
+#include "qemu/error-report.h"
 #include "exec/address-spaces.h"
 
 #include "hw/ssi/aspeed_smc.h"
-- 
2.15.0.rc0



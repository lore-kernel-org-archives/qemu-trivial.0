Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgiK-00021C-N2
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:31:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgiJ-0001z9-02
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgiI-00047d-7l
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:07 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:44177)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgiF-00044k-9I; Thu, 14 Dec 2017 22:31:03 -0500
Received: by mail-qt0-x243.google.com with SMTP id m59so10546848qte.11;
	Thu, 14 Dec 2017 19:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sqSPjkpaKuw+YzItKf0cLrmEo5izjoT1sb7jg1F4dEM=;
	b=fWppzoVUqOwndnmSDRR5VT14dhgbsN5x+6P1GagFXX2tMoB4xKZvCvZZ/TnIB22Kw0
	/0+uBKaKdx59qxlYLwv2khcbqAd+2kux7NhBPueeiJbAwujWNS7SEnh+JcHjvBdnt8PB
	5G5bV58NLhXSiizvLHiTlTCTAPiVQ+B6kWE0iq3eB70dTTtZwiQgSFKtzc/v+xuDPon+
	qWUj81t8CXdlmR8Bvd5GA8vXP/DXSCKMPPRiif1TTon44cqV/v/yCV6ZqaFsC9cfgK3z
	hkez3OlO7AwDwWXMUNJoxeENsmG3PNiSsVEwc1MqklA8w9L04YyjcJXhf96CcvtacmkQ
	SaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=sqSPjkpaKuw+YzItKf0cLrmEo5izjoT1sb7jg1F4dEM=;
	b=Axlzi0ccmt17/m6hiAvb8jSaV66LwBi4S2JlrN02gUD1k6SVVI0YcEO0Hu6zPpxGVZ
	fabz0Hgi5VdDokLXmfKqy4MZxnNcKsDryTPBif33MqgYYyg03rCLVkBGzSrzXZgdbkke
	aRwI0WRjV3DwZmIaxTTldGDwM6sDhNw/mmRi1Ez0GgvjlpQWKTQlGV6jXOglAMfvIKDh
	RYUEHHvbCs6Rc2X639kkjsbOOriQhGgnqVA30jPyN46EWE82+nLE1RFRopyY0K21iMbR
	nw+JfUMWKeQ24j/kvrf7pkRkwVFaOLHsYxEmoHiw13fcZjXHnhxYOXR6AjswNBn4MR23
	wEpA==
X-Gm-Message-State: AKGB3mJN4t2Hy1hbi2ihgokRxJiHqUMn+g69dx5gy7hjL3EJF1KhmzlX
	tg6cgUxN0GzZj9z5DS6h7nE=
X-Google-Smtp-Source: ACJfBov1btRyey+GAQ+attXek4lq7tigfDmVuKGCvdr9QPjsP/06M2t5CytFPH2XGlwZdzNXFL9Rdw==
X-Received: by 10.237.48.193 with SMTP id 59mr20681103qtf.45.1513308662726;
	Thu, 14 Dec 2017 19:31:02 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.30.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:31:02 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:Block layer core)
Date: Fri, 15 Dec 2017 00:29:43 -0300
Message-Id: <20171215033015.738-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v4 11/43] block: remove "qemu/osdep.h" from
 header file
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
X-List-Received-Date: Fri, 15 Dec 2017 03:31:08 -0000

applied using ./scripts/clean-includes

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 block/dmg.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/dmg.h b/block/dmg.h
index b592d6fa8b..2ecf239ba5 100644
--- a/block/dmg.h
+++ b/block/dmg.h
@@ -26,7 +26,6 @@
 #ifndef BLOCK_DMG_H
 #define BLOCK_DMG_H
 
-#include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "block/block_int.h"
 #include <zlib.h>
-- 
2.15.1



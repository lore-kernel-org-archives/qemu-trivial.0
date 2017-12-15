Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgj1-0002fX-Iv
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:31:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgiz-0002dO-JB
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgiw-00059H-Ep
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:49 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:45729)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgiu-00056q-Ai; Thu, 14 Dec 2017 22:31:44 -0500
Received: by mail-qk0-x242.google.com with SMTP id d141so8867485qkc.12;
	Thu, 14 Dec 2017 19:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=02u9OKQeHNQF2u4uxB9ozGZ3FJiQabXADmRSvJI7sYI=;
	b=lJhVBx4tgpBnO8ASNkPk5eAwZcQ0R1YUpHyN5m8AVBxAgmlq4BIgF4ikpmubV0D6v9
	7KFBkpNFaw5Lj0TFTOXcikLxO9/0fNCwtLmFQqsy7wxnChPT3pwMfSEhWK8VFdk3gbIp
	I4sGLm225A8EMx+/Oxc70vz0ulvkEnfttrZMK4/dP6X7L+0ojKHNtJ/WV1f6+/v/uzOz
	x9m6DOwDLvw2ox5ySoVwwvBXhz4uD7En2r5mb4nIypTB5Kqt9isoYdwgNDD2NqI8kPxg
	ImkPceLGP0G31WT/31qkaWwK4soQxZqxdToFclKRiEyjbK1UsMGidsZ3zwR1R8czgvfD
	V+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=02u9OKQeHNQF2u4uxB9ozGZ3FJiQabXADmRSvJI7sYI=;
	b=KPcDJlivCBG+/5jvTzaugSB8Q+KGIjEb+5yE4nFjqnj1JM4PpxoNJQAIVJmmXL65JL
	L2OvYNCbS/V56FiIkU60Mt7uL78tpjfSIhIpUB9h25LM7DDuW1OWqibfULe/HAljJDB7
	pzrVcMrcb6ebw3+E9O71nmmu9IO5x6fkQOlBaoZHpi5nbqJnBdylg55/+4tVMgOJZ3MH
	s7lpfTq45+uVioCXOo/D3pObOy3EHVs0l5yN/27yEZP25B1wHtvqqHb9PchDAVlNZdq/
	/28s8/OmUDZxdeLT5nyONm9RW2k8mxxuIa/LQQa5YYvWC4L6d22qPYHtWLPW8957jQll
	A70g==
X-Gm-Message-State: AKGB3mIr9PZi/DtMW0vHxnK7Ev4Vv5yXCK2O3n6Eoc+r9gfniVzJh0WI
	TR3pYnIT/RxDJH4zeXfjJjw=
X-Google-Smtp-Source: ACJfBosn40wms9aJ1o4zS9wpLUbcryc/+wsWv6YbdQN0DnGStAN5mmQlV5/b/OM9afIOcn1RCS9QSw==
X-Received: by 10.233.239.70 with SMTP id d67mr19180772qkg.308.1513308703837; 
	Thu, 14 Dec 2017 19:31:43 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.31.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:31:43 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
Date: Fri, 15 Dec 2017 00:29:53 -0300
Message-Id: <20171215033015.738-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v4 21/43] hw/misc/pvpanic: remove unused
 #include
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
X-List-Received-Date: Fri, 15 Dec 2017 03:31:50 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/pvpanic.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index 2b1e9a6450..3a0e4ba828 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -13,14 +13,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "qapi/qmp/qobject.h"
-#include "qapi/qmp/qjson.h"
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
 
 #include "hw/nvram/fw_cfg.h"
 #include "hw/i386/pc.h"
-#include "qapi-event.h"
 
 /* The bit of supported pv event */
 #define PVPANIC_F_PANICKED      0
-- 
2.15.1



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rJ7-0004Se-H5
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:43:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJ5-0004QJ-Bp
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJ3-0000DR-UU
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:39 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:33795)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJ3-0000DE-QZ; Sun, 15 Apr 2018 19:43:37 -0400
Received: by mail-qt0-x244.google.com with SMTP id a25so7272735qtm.1;
	Sun, 15 Apr 2018 16:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=M0yipUmrY+nm0NvLlu0T4ZqhhYTJKb5WoR6yDj+yjI0=;
	b=cS14B8saMSHj7jRQivm54acEhtI/DpHbF8w8SeVa/X9dTTNYR3bYJ7pTxxRKdIkmGQ
	WUK7vKeQjkXKsU6jer1abd6jWFrhEpyZiyB7F56ND4O7PbeSb+35z3MQZfN+fS+ojgR3
	fKoJarlC+6oXFEPd4J1AHuE64nB5LhpUm4MVTV2Hw/BYcylluYLD2M0wkHqjTwVAsp62
	+7XxrK6H/zoUGGP7/iYSEqhWEiGNC6xq6a6YeA0RMNFGMANMAFGwzCh2bfYBQFtWGd6A
	j9amumfVSbQs2v8SOj1AzrRPa8M7lu4aft3K6FyNx+KjGdfleakHyd+TqOcM9QuZlgJ0
	Wpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=M0yipUmrY+nm0NvLlu0T4ZqhhYTJKb5WoR6yDj+yjI0=;
	b=i9IM+XpIpv/ZWOjkXPXZ0qpd+Ay8TLf7Le+wPujEoGRK9iG0f8eoXBqjH5kbKdvQV3
	hMmJKVD0+7IMGXSLGkLtUERvgONEVErSv77bgONwTM2FGVpaj8Qd0vRaHkG2tpjOIg2d
	Ie2Ffovx22oRSYt0u9iXh/kekBt47C8UfkA5HC5qDOWrXSrdsYVa2kiepZNvZ2J2d1n9
	fxfTqR1Pxq+YiL+nzknnB11Ygxpvm4IEcGS/loTTaM6ayTuutST3abXF6v9CMNR4xwYn
	auk8mIqXovio21vq2qRRL/tJI0NpxJYPq3A2VdFW/LIp+KP6KjN0WujoXLpiasoeAwZ8
	pHaA==
X-Gm-Message-State: ALQs6tBO0t1XepVoX2B1LQJ1WExgvUHNpZ3PO8+akVaQ0uiiZXf/Y0s5
	HI/E9kxTqvRR522wkeKv52HH5kn2
X-Google-Smtp-Source: AIpwx48SrbNpvB8vLj6L+GBdBtPXhQnmYHD/vTi6Sz54aH+0zpKeusfHwb0pvYUwmuVf5WaRx4Spbg==
X-Received: by 10.237.35.6 with SMTP id h6mr13674120qtc.287.1523835817206;
	Sun, 15 Apr 2018 16:43:37 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.43.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:43:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Date: Sun, 15 Apr 2018 20:42:33 -0300
Message-Id: <20180415234307.28132-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v3 07/41] hw/ivshmem: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:43:40 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/misc/ivshmem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 16f03701b7..2f4715abad 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -17,6 +17,7 @@
  * GNU GPL, version 2 or (at your option) any later version.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "hw/hw.h"
@@ -1302,7 +1303,7 @@ static void ivshmem_realize(PCIDevice *dev, Error **errp)
     }
 
     if (s->sizearg == NULL) {
-        s->legacy_size = 4 << 20; /* 4 MB default */
+        s->legacy_size = 4 * M_BYTE; /* 4 MB default */
     } else {
         int ret;
         uint64_t size;
-- 
2.17.0



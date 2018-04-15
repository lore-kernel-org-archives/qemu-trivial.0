Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rJ0-0004Kv-Ap
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:43:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rIx-0004Hi-9H
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rIw-000056-IN
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:31 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:40965)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rIw-0008WL-Dn; Sun, 15 Apr 2018 19:43:30 -0400
Received: by mail-qt0-x242.google.com with SMTP id d3so13549281qth.8;
	Sun, 15 Apr 2018 16:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=W9rPcOalcqA0InRVjx6nWOjU2qNw6igt6HlV0JQwQcY=;
	b=S+WgY4HgxJRtZPkd9uCD83t0e5FuX4++u/nwsujzk3DuoOGD/ukY2mbZobxtpa3Ho3
	00RN21DEbvu11xM1qTYJ9p4BjhA8pD6DuICugYa4yb4UXOugXe2z/ZibGYsudtKEUhxn
	SaQPnCkEYgY8IBV7KMFUNGYViL0ZF/Pt1qdP7/W7fEk4ICsUcqwnzoPnaqACQ5ggPZE4
	uCkjD+3XL1SOP728XB1C9WEKu3BDHuezpT0QijF39+Tj5vqS7x94ztK5mXBVhM+wI4Mk
	q1qo63id5vfOHTsdj6TA2hDCbn7mHXaBb1JVrbPI/Dq0D/ypMO4wgqhhogx9K8ZG1DT4
	yXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=W9rPcOalcqA0InRVjx6nWOjU2qNw6igt6HlV0JQwQcY=;
	b=FvzaYSuPt6AW0ucAz9SIsSQGFSyxSfuue9tyrZb0Mrl1SMueA5mIdhgt26oE6Y1l6x
	bFTqKZ53DxlHRBpm3RPRfwPh2a1xNemkkCSfM9HofSd3JsWQI0rF7qP47iAJumyQmiMR
	yxxV9d6gw8Pfje6cDX35DGQBdw6Zi0stHoI1//MUj8FfgpZBopVs9eP/dlrmgKfHy8XO
	qWFENNWD38iMTIzVx+zbDZhY6tgwlhAK2diPE8pa38/+i2XkkglXZ08DvOTYVlDHj3Ue
	7rh2OblVbN60MUNMzFWL0fYw7J6t2roel3ZFaYbXcF6WjBOqgep47qmrmcj5SKFuh9zD
	VzJw==
X-Gm-Message-State: ALQs6tDABOaJEuQ8Yd1J7wnGZDSpyePwyQMOW2Ct24KLvxEYJZtcB9+Z
	h5QPqF2sxZyhOmgG5Aj9gFZTKddE
X-Google-Smtp-Source: AIpwx4+M9ldViECKrs4f3VXKApSfND1TeOFKEWxLAQL3Hr+9GeYyphowdbR5OZz78CEtzGHYIFESRQ==
X-Received: by 10.200.70.21 with SMTP id p21mr13592928qtn.320.1523835809749;
	Sun, 15 Apr 2018 16:43:29 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.43.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:43:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@mips.com>
Date: Sun, 15 Apr 2018 20:42:30 -0300
Message-Id: <20180415234307.28132-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v3 04/41] hw/misc/mips_itu: Sort includes
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
X-List-Received-Date: Sun, 15 Apr 2018 23:43:32 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/mips_itu.h | 2 ++
 hw/misc/mips_itu.c         | 5 +----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/include/hw/misc/mips_itu.h b/include/hw/misc/mips_itu.h
index b3a4532036..030eb4ac62 100644
--- a/include/hw/misc/mips_itu.h
+++ b/include/hw/misc/mips_itu.h
@@ -20,6 +20,8 @@
 #ifndef MIPS_ITU_H
 #define MIPS_ITU_H
 
+#include "hw/sysbus.h"
+
 #define TYPE_MIPS_ITU "mips-itu"
 #define MIPS_ITU(obj) OBJECT_CHECK(MIPSITUState, (obj), TYPE_MIPS_ITU)
 
diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
index c84a48bbb7..ccc4c7d98a 100644
--- a/hw/misc/mips_itu.c
+++ b/hw/misc/mips_itu.c
@@ -18,13 +18,10 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#include "qemu/log.h"
 #include "exec/exec-all.h"
-#include "hw/hw.h"
-#include "hw/sysbus.h"
-#include "sysemu/sysemu.h"
 #include "hw/misc/mips_itu.h"
 
 #define ITC_TAG_ADDRSPACE_SZ (ITC_ADDRESSMAP_NUM * 8)
-- 
2.17.0



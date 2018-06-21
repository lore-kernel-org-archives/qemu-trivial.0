Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW3vK-0000o0-MO
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 14:03:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3vH-0000kV-TX
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:03:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3vH-0006gj-4F
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:03:07 -0400
Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c]:46495)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3vF-0006fD-1F; Thu, 21 Jun 2018 14:03:05 -0400
Received: by mail-qk0-x22c.google.com with SMTP id o2-v6so2248276qkc.13;
	Thu, 21 Jun 2018 11:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=I/KwHg3rh/52GPhac43c/EmkXHVkr5UjitunFTAcdPs=;
	b=XEg05m3Qw5VL7rlel53qhSWrj0U1PDuwy0gIZwYJcuwe/qNjeDnlLp0CkwVswuPe8V
	ezNHYgFdWlMUAC4BQ3SISo3sTBnCH1GDx3tp+o6Hi4ZOmEiSSKQN0EfMAaqUCoPhIT5D
	taRwbaUFJ8xG/tzQiK0tOrH5aMTcbgXu3uKTWUVH+YlhAGXORFxhI3PI7Br8dCBgVlEe
	SjOIRaFTuZ/SqtmcCIUeAj+4seHbENbGhCZF+iWiMTMl/k/aK+bDj+aR/l4b7Mhho/D5
	kRPiqWFm0Y301Cx4RRdOjQkoYyO+CrtIRbLVQxLatXV7O1IBvEiGC9zEYR/VqSAYAgd6
	/+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=I/KwHg3rh/52GPhac43c/EmkXHVkr5UjitunFTAcdPs=;
	b=otZSNA+AKsEraLN5UHnIAmKgGdqR2Kzp5zcgSijipFDUJJMdbpRIhaKQQMVzUGBk3k
	hTXNxQI2e5ImHAHukCopPcgWEI6w80dClTZSccHaq4Z8VmY11NC48eQNk7pJ5+BdekfN
	j0Qyo4/BSuz7sx0mHicMaDY48WCF6xg4Yc6HXpkDIbQaPNk4pGCJBzUQO2YYWyK9i7FD
	2OKt5rvF6iDPAnlY8ie9WXsLTBun72CvVVyMYmxZiXSt8+Gb1fzwOoQ8jBOzCV8Qdmjt
	TpKrHWxtI6U7lMRY0/A1pJpzQUVTMx6+M12u7BW8ITzUMz9IdCEYy5oZ0RW2gu2CBDWQ
	tJsA==
X-Gm-Message-State: APt69E1Iwnzoa5T9cUw41cyq1S6DPpe6Ibb+4qn+D04acbxF7CQiT+Zt
	hphyhD0w8Js8VrfGYPdUVmI=
X-Google-Smtp-Source: ADUXVKLyu4aeJOBuAzaskmnvN4eSA+2VBF5btCX6CJmmo5pxWhg8bSBMJQJ/aqPX8U68mH4L1KJxFg==
X-Received: by 2002:a37:9b82:: with SMTP id
	d124-v6mr8114997qke.395.1529604184464; 
	Thu, 21 Jun 2018 11:03:04 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w51-v6sm2469469qta.12.2018.06.21.11.03.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 11:03:04 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Date: Thu, 21 Jun 2018 15:02:23 -0300
Message-Id: <20180621180224.8312-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621180224.8312-1-f4bug@amsat.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22c
Subject: [Qemu-trivial] [PATCH 10/11] hw/net/stellaris_enet: Use
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
X-List-Received-Date: Thu, 21 Jun 2018 18:03:09 -0000

hw_error() finally calls abort(), but there is no need to abort here.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/stellaris_enet.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 04bd10ada3..188adcbd15 100644
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
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "stellaris_enet_rd%d: 0x%" HWADDR_PRIx "\n",
+                      size, offset);
         return 0;
     }
 }
@@ -442,7 +445,9 @@ static void stellaris_enet_write(void *opaque, hwaddr offset,
         /* Ignored.  */
         break;
     default:
-        hw_error("stellaris_enet_write: Bad offset %x\n", (int)offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "stellaris_enet_wr%d: 0x%" HWADDR_PRIx " = 0x%lx\n",
+                      size, offset, value);
     }
 }
 
-- 
2.18.0.rc2



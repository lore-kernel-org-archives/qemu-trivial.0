Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWwIs-0004IU-Gh
	for mharc-qemu-trivial@gnu.org; Sun, 24 Jun 2018 00:07:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIq-0004Fo-NJ
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:07:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIq-0004LI-05
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:07:04 -0400
Received: from mail-qt0-x236.google.com ([2607:f8b0:400d:c0d::236]:35274)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIk-0004FT-78; Sun, 24 Jun 2018 00:06:58 -0400
Received: by mail-qt0-x236.google.com with SMTP id z6-v6so9356547qti.2;
	Sat, 23 Jun 2018 21:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hh/bp8CNMejKQ01C+jEYyVBD3Ry5ISVMzqeumMxnEr8=;
	b=o8wrqNsw9n1WYgRn3GyDDYij/JEouj7SO1BNlGYwmPllrZvnPh5apyhwPWRkcIRX2F
	2z5nck82EF5jbnLAAQPncEwxsu2eRY50ew1XYV3asBCbgE31mdUHVGCRHHDc+2kZaxa0
	zdN8MiHwGAM3RNocvyoVxHrlCQw6wz9k+pSw7yhvM/rXK2LmpwMJYoToWujmqbeT3g/0
	Albjy6TS9cShN8BTl25vRApU1jKGHonM8qfrZyEbp2buM/W7buXoVz3Np47xTrvFmUXa
	9NwXNMpXRJGwe2e29dQoQ0RswJsicCi7aJe3ZPUwLrzzWBEqiCMnZLtSYkdTrBb7W/iv
	azDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=hh/bp8CNMejKQ01C+jEYyVBD3Ry5ISVMzqeumMxnEr8=;
	b=OwlV2KP8pV6bxGS44yF6K4xdtzSFAQTPs6ZIoz3DqNrimgmvTqOdrHBNX1KuiL9+Z2
	avbE8Sa/QoJw/JaUY7gr9udtVk1tDYr7kLi0jKnbSGMFpYb01xi+ffBEh6mr/EqSLw9d
	VHvjvhRXcpPCf3SGsem2uuwAJHbqY/AHN7h/shPuzjtwokW8qcK9z4EbVUu0M85PlNlJ
	vOOhXU475VSw2IwF74/KhwxYPVPsgjFJSYw7KES/2yiVTl3pg8VuRXVKAzY7Uf1hO8vf
	l5Pd1pW1UWIOJkW4gk1GbPNunDfvZy5N9Iq+PkRjpUfgrXCmNMtDKTrAsqAkD+q/bf4K
	IKvA==
X-Gm-Message-State: APt69E2IUgFJ+ObxogLZQdLBjY1on7YOFQjjgXcxZnaoN5qJ2Er1B/yL
	DjuRW8samFkjssdvWMjGWuA=
X-Google-Smtp-Source: AAOMgpdctpWU/JXiqvh28jR3pMypl1XSw5U2SeHlDOj4SyNZ7u3iFDu6g6I++vCPhruOekINVU/g+A==
X-Received: by 2002:ac8:338a:: with SMTP id
	c10-v6mr6729460qtb.178.1529813217800; 
	Sat, 23 Jun 2018 21:06:57 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:06:57 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Date: Sun, 24 Jun 2018 01:06:05 -0300
Message-Id: <20180624040609.17572-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::236
Subject: [Qemu-trivial] [PATCH v3 12/16] hw/net/stellaris_enet: Use
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
X-List-Received-Date: Sun, 24 Jun 2018 04:07:05 -0000

hw_error() finally calls abort(), but there is no need to abort here.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/stellaris_enet.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 1e7329517c..165562d788 100644
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
     case 0x3c: /* Undocumented: Timestamp? */
         return 0;
     default:
-        hw_error("stellaris_enet_read: Bad offset %x\n", (int)offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "stellaris_enet_rd%d: Illegal register"
+                                       " 0x02%" HWADDR_PRIx "\n",
+                      size * 8, offset);
         return 0;
     }
 }
@@ -442,7 +445,9 @@ static void stellaris_enet_write(void *opaque, hwaddr offset,
         /* Ignored.  */
         break;
     default:
-        hw_error("stellaris_enet_write: Bad offset %x\n", (int)offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "stellaris_enet_wr%d: Illegal register "
+                                       "0x02%" HWADDR_PRIx " = 0x%" PRIx64 "\n",
+                      size * 8, offset, value);
     }
 }
 
-- 
2.18.0



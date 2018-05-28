Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNRZU-0007um-9K
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 19:29:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZR-0007r6-7F
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:28:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZO-0001ir-2K
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:28:57 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:37782)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZL-0001gX-Mm; Mon, 28 May 2018 19:28:51 -0400
Received: by mail-qk0-x242.google.com with SMTP id j12-v6so6831755qkk.4;
	Mon, 28 May 2018 16:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=W9rPcOalcqA0InRVjx6nWOjU2qNw6igt6HlV0JQwQcY=;
	b=hJhOFu9lkJV0J33o6gl92XeTRyEHbM5JlsTyDS5q0B1qqWADYYjw++cscCiquT/hQV
	6UeDU5hNZECDdYKLWDqiFBYgvMdL/rqw4wsU20bq8cZDgbgrH2sAdQXqahU6ugE+z/9P
	gpAyhaKry74Rn9ygNo7KWlvnC2vwaki7+V/cwyIQLde/kpDNCyW54/a/nZ9ski3v1fA+
	WKDqU6bKLxRu/rw6bWqSMJDGksWjj3Xysg1lkJhoPA9GQwlz0VJwUu8+7s6nPs7Sayva
	j67ZYQaY2+FzRMoHuKpZrSsPkd8C4Fqh/iOEKmjum7+lKwx0lkJuXorqLDk5ZqSAip/8
	G2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=W9rPcOalcqA0InRVjx6nWOjU2qNw6igt6HlV0JQwQcY=;
	b=Kj3Iq/YfpoedCnrzI3JzK2+15xPPEc8U5vTX2HOp4Tp1O5iUDqZzUOyJUCLEY9Zce0
	VU1Kc+pv6zbN4pAer0sr2FHftT8L0jDEKlHWGCNMzRCYQcjxNin6pYgPisZ7akKEZt/5
	Cy98GFclCUK4JBo7EHnNaS3ofRj22ghrlBXGYWK3zFWtiB4ObDTRn0m5ZbVJZJ9azP1d
	O5Y2T771H3psq9hgv2x/zDY+NFNrxToGumDXhT+sA+0hNqWAqvv5Ek9jWfx27M97gfOt
	belFOzk5s7JbeGAKhgmNlHnmGf/8TanGkuiqJUlTO6MHyx/J2DcU4LNwzsOXIyb/lMWR
	20dw==
X-Gm-Message-State: ALKqPwdMY76CceH6oxHW+PooDntXPXs59ro3xlZMMWV2kg66kpTgUJZm
	jYTjTSNHvrz31WVRIIbftD8=
X-Google-Smtp-Source: ADUXVKId868pP6ZI/37L27Ji/1QWgTSRUaYeYLaCx3xOV69AImn3zRxO6Ax0qW5FrA7gE18cskixpw==
X-Received: by 2002:a37:1f0c:: with SMTP id
	f12-v6mr12688256qkf.376.1527550131261; 
	Mon, 28 May 2018 16:28:51 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm23756182qki.62.2018.05.28.16.28.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 16:28:50 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@mips.com>
Date: Mon, 28 May 2018 20:27:14 -0300
Message-Id: <20180528232719.4721-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528232719.4721-1-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v4 16/21] hw/misc/mips_itu: Cleanup includes
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
X-List-Received-Date: Mon, 28 May 2018 23:28:58 -0000

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



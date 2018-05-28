Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNRZN-0007p0-HL
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 19:28:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZL-0007m4-0O
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:28:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZK-0001fr-Bb
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:28:51 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:38050)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZI-0001ej-9a; Mon, 28 May 2018 19:28:48 -0400
Received: by mail-qk0-x241.google.com with SMTP id c23-v6so10168349qkb.5;
	Mon, 28 May 2018 16:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7QhGqRWDzK1sa2Oy2KJ3WJkySeQaN8wk3UtQXbhJWAk=;
	b=eyz8rPoaVQIIC8PjXTNqYpOFU90+mHZKlicRxfegsHF12KOl2l4e9gGmReKrybpxUI
	bOfRQn3vIKt6aJBa4nbOw2f2zMWmwIg16KIu32Ohp0YUDwKXUEuLmFrUCf577dDiq2cB
	GdAdeBFjABknkJn/p5zRMQL3Fc3SELZMGD3CYOx6bS6fh2Nx51H9wuXedIW1HItXSxJO
	pTJ052yazCYeYC1QQznn+bkXuuqQPgCgVqxa6HiaTt728CyEwzOSjAkcTVNPhOmxpu0d
	yufsQuZsV/8NdvP8S2fD63iPKZHLudnMcCJDRAMjWbjX64hSoP2A1vaNRdmvXStWoqc9
	RKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=7QhGqRWDzK1sa2Oy2KJ3WJkySeQaN8wk3UtQXbhJWAk=;
	b=D2VxoE5Er9R/SO1JVE8CU+8liHKfyEQrefZGaW4b8mug4iEVGWi9iwm70fQDvCJrIv
	W91u7hc28vPKmuaqXtUkWdtXnMyvg0U8cT42aSxrOGQ+uMvjF+bE9fkwdXdJDddsnSz3
	Ierk54Y9UYwM76hdD/wwmd9yyrdZ8Ur73sTmxsR/y1pIyHBzDxWyXHzozrn3ok24tTWL
	6jmfQB947HdtILGtuORyeG4jPOE7Sye/7WZnCPmHQ9tWFWz5ZVwEOLGA6ClfFFUXLIX4
	//8FD2YVHE39EAH0JYrI7IjAaZaAIlB9ndNnvvO4gFQORUHQ+tJAaNEgyFiufPt51eFE
	Jskg==
X-Gm-Message-State: ALKqPwc1isczj/ySEmh3ROOvwz2C8vUhopitx0MhE/Gwhtjit2L4B2ud
	+nGLi2dNpl7ozWAYZ2mMxAc=
X-Google-Smtp-Source: ADUXVKLQsqTCRgMufytDw3MHCh1A1NYNnA1ES1u+gddPxMlLxxTEtN5LJAmII1OogMRrP9FXB2fYFA==
X-Received: by 2002:a37:843:: with SMTP id 64-v6mr12781775qki.52.1527550127773;
	Mon, 28 May 2018 16:28:47 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm23756182qki.62.2018.05.28.16.28.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 16:28:47 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <keith.busch@intel.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:nvme)
Date: Mon, 28 May 2018 20:27:13 -0300
Message-Id: <20180528232719.4721-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528232719.4721-1-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v4 15/21] hw/block/nvme: Include
 "qemu/cutils.h" directly in the source file
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
X-List-Received-Date: Mon, 28 May 2018 23:28:52 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/block/nvme.h | 1 -
 hw/block/nvme.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 8f3981121d..cabcf20c32 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -1,6 +1,5 @@
 #ifndef HW_NVME_H
 #define HW_NVME_H
-#include "qemu/cutils.h"
 #include "block/nvme.h"
 
 typedef struct NvmeAsyncEvent {
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 85d2406400..811084b6a7 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -35,6 +35,7 @@
 #include "sysemu/block-backend.h"
 
 #include "qemu/log.h"
+#include "qemu/cutils.h"
 #include "trace.h"
 #include "nvme.h"
 
-- 
2.17.0



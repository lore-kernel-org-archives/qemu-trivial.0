Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQkiz-0001B5-Jz
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 21:00:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eQkix-000188-CJ
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 21:00:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eQkiw-00028n-Mv
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 21:00:11 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:34603)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eQkiq-00021V-Cr; Sun, 17 Dec 2017 21:00:04 -0500
Received: by mail-qk0-x241.google.com with SMTP id d66so16644766qkg.1;
	Sun, 17 Dec 2017 18:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=k2uNGvsbUTv22oh2fkukrfwUnyrHtfkhU2p4MdgHtLk=;
	b=NvUKU1tBAOohs9eV+LYyYE2OmLwNpJGY6RfRYmUlUDcXNdKvohlSt37iq8xWVNAV9/
	WoB8L4thaGaOe/rpOUNV277VX9NczlUGa9WHjmowI1kzR5oojq48BwULPI+WYhC425Yn
	i7rN5/P9fKhogN7BYay8VS5IkSItHn1SvnACkt/Je5aWBrmHRspAPkCK0+xPkIseGmyJ
	2BmIdefx5mZAe919vIsYjpwsbGwZqM2J7aZmOj8ZFIkDFOJNf3Tj+2QDmXS+q+acmAqF
	6lYkkR5tpv+xOUr8upRSy0Q/pWYHfszwtRL6xQGDYA81jIcizyQh0C4LhYDHdnoggNFi
	C9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=k2uNGvsbUTv22oh2fkukrfwUnyrHtfkhU2p4MdgHtLk=;
	b=mKENFjvCNZ+aPwym73IPu3Smir1yBN9U39i5nR/WPx1e/GIU3Cd3I3GkSQKDRC3Lty
	K37DaYL6ozgutsePOrlQgBGEw8O9K51+lcqD6bVMLkA0J72GJ1dX8kqQoRQWCXZjd7cm
	oSmFVRYMvFOP5Ha0Hehg9ktHEv9ga1Upf+LNFfehLRtuOhSCMx3qylBlDF2zfoNnZuTe
	JNHf3BHV+2vwjWfFlMFi8pj3h+urzDidxNobqyNfBzKcyPbDeF9a0ANWbuTMVVJO9eFO
	0/dTF/mtS2yukifEHFqwOni3nJFA/RqyuNxYgy4Ho4SGaicDbQc/jorcMVgNiQVhNAeu
	x13A==
X-Gm-Message-State: AKGB3mIo6TsiB6b2n+hrjPHuAP5rGtb6+zW35m3/ZDwH3w5WdTjvzJYi
	0Q/gEfDFKcciyXlgXlTrRPQ=
X-Google-Smtp-Source: ACJfBotRDwwHrtCNOo8ON/gAIODRyAv4MUy/uj2eCfofcmRXEsarEn6w5a33a2d9wKiZu+0sPbmaXA==
X-Received: by 10.55.106.129 with SMTP id f123mr32624641qkc.7.1513562403686;
	Sun, 17 Dec 2017 18:00:03 -0800 (PST)
Received: from x1.local ([138.117.48.211]) by smtp.gmail.com with ESMTPSA id
	r194sm7299893qke.65.2017.12.17.18.00.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Dec 2017 18:00:02 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sun, 17 Dec 2017 22:59:47 -0300
Message-Id: <20171218015947.17293-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH] hw/tpm: remove old i386 dependency
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
X-List-Received-Date: Mon, 18 Dec 2017 02:00:12 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
---
Based-on: 1513446109-9013-33-git-send-email-stefanb@linux.vnet.ibm.com
---
 hw/tpm/tpm_emulator.c    | 1 -
 hw/tpm/tpm_passthrough.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/tpm/tpm_emulator.c b/hw/tpm/tpm_emulator.c
index 3ae8bf6c5a..38b6f175a1 100644
--- a/hw/tpm/tpm_emulator.c
+++ b/hw/tpm/tpm_emulator.c
@@ -33,7 +33,6 @@
 #include "sysemu/tpm_backend.h"
 #include "tpm_int.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "tpm_util.h"
 #include "tpm_ioctl.h"
 #include "migration/blocker.h"
diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
index 487aae2043..149fae63e6 100644
--- a/hw/tpm/tpm_passthrough.c
+++ b/hw/tpm/tpm_passthrough.c
@@ -29,7 +29,6 @@
 #include "sysemu/tpm_backend.h"
 #include "tpm_int.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "qapi/clone-visitor.h"
 #include "tpm_util.h"
 
-- 
2.15.1



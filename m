Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7sFh-0004xc-4G
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 19:39:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFf-0004vf-Iv
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:39:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFe-0002Gl-Va
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:39:39 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:35681)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFd-0002E4-99; Mon, 08 May 2017 19:39:37 -0400
Received: by mail-qk0-x242.google.com with SMTP id k74so12354732qke.2;
	Mon, 08 May 2017 16:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6/1oFirA5w+PPDXTbKehqgDr53fQNfmq+URaQ/d4iz8=;
	b=kWb6ic9dbj30mbxdgzPIMrsq7W/fRp3G9lML965XSc/9JECeMUGMwjz51OunISTobk
	f7VdMCqZLimBud6y1cpQnDhcE6yEQ2YmQD00BubpGT7GL4UetcFpRd2kK9gnvULlxF3a
	ugXI8frXcULiPjD/4P2ZQrxlvOqZbpEPngVzze25APKe4oMRxZrm7AhPUtPjjInmxW5S
	MsKcdu/BFbbQDBq4i757aRDNo5ntn0Y5ffELvB4I/ODW7ADvLvVsZjFXDerbvKFC5Vkd
	ZymRNxIkB7z9DILxvhv/gH2XDROk7yBLnomLHK2mZf6YtvXTmF6qocWqWuiqzaiKSr0h
	k5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=6/1oFirA5w+PPDXTbKehqgDr53fQNfmq+URaQ/d4iz8=;
	b=qaVrM5cpE/6BL317luCTS3hHkLUQL7EURDZcJ/0BiDa78pg1xg6rlrtaPB6qTfbK7/
	oFN+NMv8ot58731ZksPIF6eTB8/C2d8zs9qreFM69e6uDaCAKfxr7n+Gi2lbE36q/cPL
	okfYNkHnrwjQMIt9hfvzC5wMY+hFZH6+yXutlo2YOoiFOe/1ul2dcb+DSSsFoOBxmhb5
	dRcs0v6hzScVdhzJbTBZEQaaUPMk83itOMtEx1U9t5Clb2QFcTVUAjcqw02M5muVHSNP
	6ZZz8ARznMEcPapX2lKE1Ayfiyn33i0XfwFE9BeDfJCZjwwSPK5B/IrXpZBI0Vpq+ZYX
	kO4A==
X-Gm-Message-State: AODbwcDiNonzL5hOdOfv8ooqps61L1XMKM4AVzZTECa0Ym3UgvVrONGO
	e5V1pTUcS+Zo5w==
X-Received: by 10.55.122.5 with SMTP id v5mr26400174qkc.14.1494286776779;
	Mon, 08 May 2017 16:39:36 -0700 (PDT)
Received: from localhost.localdomain ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	v64sm13556099qkg.38.2017.05.08.16.39.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 May 2017 16:39:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Mon,  8 May 2017 20:39:10 -0300
Message-Id: <20170508233918.9043-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170508233918.9043-1-f4bug@amsat.org>
References: <20170508233918.9043-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 03/11] hw/misc: add missing includes
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
X-List-Received-Date: Mon, 08 May 2017 23:39:40 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/unimp.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/misc/unimp.h b/include/hw/misc/unimp.h
index 3462d85836..353ee19abf 100644
--- a/include/hw/misc/unimp.h
+++ b/include/hw/misc/unimp.h
@@ -8,6 +8,9 @@
 #ifndef HW_MISC_UNIMP_H
 #define HW_MISC_UNIMP_H
 
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+
 #define TYPE_UNIMPLEMENTED_DEVICE "unimplemented-device"
 
 /**
-- 
2.11.0



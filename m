Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rIq-0004Al-1q
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:43:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rIn-00049e-QG
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rIm-0008PQ-W5
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:21 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:43435)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rIm-0008PH-Rj; Sun, 15 Apr 2018 19:43:20 -0400
Received: by mail-qk0-x243.google.com with SMTP id v2so14776060qkh.10;
	Sun, 15 Apr 2018 16:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8l7n9buJdwJBJzwD51kAGDiSdsk4G721X0rB4Vb6coM=;
	b=MAODFG4TRdd3yPeL9kkDC5gWsteJgAonSc24t5PV+BBDIm2ecGXn+v3KXHk7LYlJcV
	i10k7Hx1FSUNMMnCeeXofOrq2LUkUE2WLUAXuU+0cmzecYzEP0yNAy1t75u2TpRpjh1H
	r4BzBbE2+G6PDKc5F5fe7FspXtAuvMpL2DJl6CUVq1zBu8qsixa8cRzajTxJJj/bIjXb
	TWlJK5l5XHOVOyTbaB2EUfHJdgPXje6I+xUNS+oPGwFKQ/OGCLwSBdilPHBlQpfxR814
	7oHssc+xbt9aFk1MACx7CA14DcxxRgOD3ppCOSG/DTbA9d+wmD2N1IKXMcvQxdXZr7QI
	mnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=8l7n9buJdwJBJzwD51kAGDiSdsk4G721X0rB4Vb6coM=;
	b=H6SnshHNryX0dqIocXBSUcsRsfdrUSAcBQ4Wq10MwQZZ9Usq3KLmP6peERTRqz7IZy
	6FLsZQzuRxkchYehIIASh31cnCHbkZo+t1MaNGFT73uOX8baLZAaBv3wxw7LOLtSjLm6
	VCQ6cxo7gX62xk0b6dnFLdqzyV+Dxv0UWmmY/Ec2ij258LqrLW5q1gHG4tVau31UN3Yc
	GLrRRlcchhw/+ULyancRY9Lf/ZTF1fLGpEcv2dI4+OA97aSylLFdGZO/3eH2/KA+Kyr+
	AqlcWYEnNxZbvapVcN6wdyY8O4lJnJfdT3hV1Uyl836Qfa8n5BpzP1JpkLcEMm8aNzfF
	/M/w==
X-Gm-Message-State: ALQs6tA3ut0RuXDowzR60kQ6JNWXAi3DEMKzV1FY5GWydo9PZJpz1aLw
	zRNHXAp4nJbRC92cMGpgqSpdfPJ0
X-Google-Smtp-Source: AIpwx4+qKwRfHb4ifiV+QvAkjmCgp85T39vn4BKdFXSyjTMQtS7rHuqMceCBMz1TMubqk5AyrH3sfg==
X-Received: by 10.55.47.2 with SMTP id v2mr11146928qkh.249.1523835800222;
	Sun, 15 Apr 2018 16:43:20 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.43.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:43:19 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Date: Sun, 15 Apr 2018 20:42:27 -0300
Message-Id: <20180415234307.28132-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v3 01/41] hw: Clean "hw/devices.h" includes
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
X-List-Received-Date: Sun, 15 Apr 2018 23:43:22 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/devices.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/hw/devices.h b/include/hw/devices.h
index 861ddea8af..0e27feb0c2 100644
--- a/include/hw/devices.h
+++ b/include/hw/devices.h
@@ -1,13 +1,10 @@
 #ifndef QEMU_DEVICES_H
 #define QEMU_DEVICES_H
 
-#include "hw/irq.h"
-
-/* ??? Not all users of this file can include cpu-common.h.  */
-struct MemoryRegion;
-
 /* Devices that have nowhere better to go.  */
 
+#include "hw/hw.h"
+
 /* smc91c111.c */
 void smc91c111_init(NICInfo *, uint32_t, qemu_irq);
 
-- 
2.17.0



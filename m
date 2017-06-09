Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dJLV7-0002TF-Fx
	for mharc-qemu-trivial@gnu.org; Fri, 09 Jun 2017 11:07:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dJLV2-0002Oj-Vz
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 11:06:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dJLV1-00012X-VF
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 11:06:56 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:33101)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dJLUx-0000zc-Vq; Fri, 09 Jun 2017 11:06:52 -0400
Received: by mail-qt0-x243.google.com with SMTP id w1so15581586qtg.0;
	Fri, 09 Jun 2017 08:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MwgTyYxXOx18kl9NhOqld/C2F3m/ocrPDEGtflfGwq8=;
	b=A7WgnAvFr3/2LKTXlRaU/e+4SXCvC3rDa+YshtucWrgjIKqHVUmmVJsgJGXf8/RF7o
	LSk+ltjYQ7YkhxLLD2aqlYifn2BqN4t3dpqbunJMlZpdX2IobUR0IzBLh9+OPNyDSEqi
	X8Tpo34XIkPYDmWPw+FFJeNLFZZ5XdSJ6I595qAkKpGqzKFEjQ9rnDZOVqMlR4qSwz3q
	8WJD3+3WVQ5mph4mW/NINpAcHtqTK5y3KdKQysUlR6FOQ/uPSjdU020Dz0jcLuKIMTjY
	THBpuvpNDyF0Vyn3BBj/peIHwV+nY/mgTn5SiPyTh675KS/JbLa7ME+FTkvRKOTZy9Lz
	GIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=MwgTyYxXOx18kl9NhOqld/C2F3m/ocrPDEGtflfGwq8=;
	b=C1R9282JXhDO/e2oA2vq0eFqlXuks61dCUk3ZAz5AyKcFTqZvWOv2/4wJCzRlWUXkp
	cXL6PHEcNnpaR5lwbPC4QUwMqtaPCuUMSLs2m84z1D3jvAQ3+kjvrcu0fQYk6WGxWHST
	1dlDNAylgnV5AiEc1CH3WhBgLeW1dYcdIoT0oWQvHLrqFCaNqo3Tu8UWT29a90cuUq5C
	Um2BNxKg/i1BHzWE35xOr6C7r4gO5gcVq/AvB3ET6SX+GZUPtdpbS0kJMoRI0Bbq0ODM
	slgevyZtHwT+tKqlegm5/Ijjlf7wIaVfGc0hMoWCkQQaQkSsy4utdNTY5fgeXJVzQiLf
	uj3g==
X-Gm-Message-State: AODbwcC8DKNy3vp35jocNXS4ClNV6aon9rCU3Suejka9Ms2kpvFs5K2K
	0wT1kPgPXhoT7gOSqUg=
X-Received: by 10.200.3.97 with SMTP id w33mr49605328qtg.203.1497020809806;
	Fri, 09 Jun 2017 08:06:49 -0700 (PDT)
Received: from yoga.offpageads.com ([170.51.96.162])
	by smtp.gmail.com with ESMTPSA id n11sm829983qtb.39.2017.06.09.08.06.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jun 2017 08:06:49 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  9 Jun 2017 12:06:20 -0300
Message-Id: <20170609150622.4720-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v2] hw/misc: add missing includes
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
X-List-Received-Date: Fri, 09 Jun 2017 15:06:59 -0000

inlined create_unimplemented_device() calls sysbus_mmio_map_overlap().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

v2: Addressed review feedback from Eric Blake

 include/hw/misc/unimp.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/hw/misc/unimp.h b/include/hw/misc/unimp.h
index 3462d85836..52e068ec3e 100644
--- a/include/hw/misc/unimp.h
+++ b/include/hw/misc/unimp.h
@@ -8,6 +8,8 @@
 #ifndef HW_MISC_UNIMP_H
 #define HW_MISC_UNIMP_H
 
+#include "hw/sysbus.h"
+
 #define TYPE_UNIMPLEMENTED_DEVICE "unimplemented-device"
 
 /**
-- 
2.11.0



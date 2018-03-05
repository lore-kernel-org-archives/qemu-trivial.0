Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoHU-0003Cu-89
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:27:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHR-0003Af-Vv
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:27:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHR-0006n8-3U
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:27:45 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:40303)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHQ-0006mc-Tz; Mon, 05 Mar 2018 06:27:45 -0500
Received: by mail-wm0-x241.google.com with SMTP id t6so14781434wmt.5;
	Mon, 05 Mar 2018 03:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HEM6+hM6B8YykKoEowuNG+lJlX+g9c2Gdduzr88pJFM=;
	b=kWdCevahHp860/TomYLCU75fe/iVsRBwnjCo1O9cmH5J7XkOqgZgAG153G5F9AAHjx
	zI9D3o5cHjJxJ3MDiFJ5EjIzRtgSK2ws0IysIcMQv7IiN4BzQHDXK+vZSc4WpDYraCu5
	TddMI95/j0CTm1fkEBgBRcvmPmXyFU2I4BKi6CKnWklKLP4wK3b6OX6bynzN0/9P6sjk
	mInBmEfVXLNjymIviTPfjv08XTAuYgoNwD0drB3r8sAC6xExbkr6R+YtVbPZC9aE4e63
	jqplaj6hgkRHZ3Knx1fIbJ+YNHdoKwoXnfGbd2fsZS5P5hLPc3EZYwlmv8TZdrPQwcqi
	y//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=HEM6+hM6B8YykKoEowuNG+lJlX+g9c2Gdduzr88pJFM=;
	b=qJHt5CRE4XSr08S+iWhTVGKZhTpyI+0vpuIPcuGK7J3PXrvxjSu7RBa/ERkt2xN/nD
	ZDIzV0x8ewkdgl4L3tFGjd17jMNatDhbYshn8a86v174o22yBdu/VM+5niVhws5gekRG
	Yg279j4jH0ZAK//dSBfSifuuq0JN89F1HsO+dOIBH/gY3662KAU0VuK9Damuntfjyi99
	6sVMcuk4nIN0noGe25K13DAWUqDIndc99fcYVs/w3H3YRHSOaTi6+8S8R4vVP2smtANc
	1iaideZbB+tqoxfGT1srhvNjykHH4jYu59HaEFFiraQnNWFqZVJBxCkhzrb/i+9QTLjf
	CeOQ==
X-Gm-Message-State: AElRT7Gr0H24c0MrOIeBlGEX3+Axv8DheRmL3kih/eddgodpyuSqQwZA
	j5WMj+ycY1YFQqdTEBRACm2dleXw
X-Google-Smtp-Source: AG47ELsSJQAQN0b+dQxXku12lD+lhfYMBwxoQiLTOGGsGVkct3HStolbYtGVPASDji3My/Sir6o+uw==
X-Received: by 10.28.87.75 with SMTP id l72mr7400230wmb.48.1520249263651;
	Mon, 05 Mar 2018 03:27:43 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.27.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:27:43 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Keith Busch <keith.busch@intel.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:nvme)
Date: Mon,  5 Mar 2018 08:27:05 -0300
Message-Id: <20180305112732.26471-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: [Qemu-trivial] [PATCH v2 03/30] hw/block/nvme: include the
 "qemu/cutils.h" in the source file
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
X-List-Received-Date: Mon, 05 Mar 2018 11:27:47 -0000

where it is used.

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
2.16.2



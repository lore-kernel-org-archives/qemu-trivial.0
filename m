Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FVu-0006gT-7r
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVr-0006dD-DQ
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVq-0004Y9-JC
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:39 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:50849)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVo-0004Wk-Mc; Mon, 16 Oct 2017 20:13:36 -0400
Received: by mail-qk0-x241.google.com with SMTP id o187so21701qke.7;
	Mon, 16 Oct 2017 17:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CHFCjRYj3vmjtKuTiVOnt8bH1KrLcDf6RKPJCMOJzb0=;
	b=VloxSLReOtSTEH6ybH5z4RnhI8jCdAnyv5nxDNl7SpWV2e8OHkURdi4OCpHsrdMke2
	ApydVlUXpHLmiAAGNiOzpN44/B8Z1mdRQyCe6bxHbxiEiqgtXZOQSNii8AnByahr6V0e
	DVQh+kepmusK6ICuUh6LkDtQRge17PV5Q1MEjJrQ7yQM3ysuzssDlp7II7OnbCwuyQFm
	7OxobFuJJxgbgdslT+b14U3OTCpg40LuvsvXMGwYlQbS6RmHXF4o9B4OwLxpXfAV7jHl
	xyOPBuAWttJE5lr9k1xsN8vuKDwIsTSTlnLDbjT2zvfbuyJ3xYiWfBxtJql8xoEzO0oS
	cQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=CHFCjRYj3vmjtKuTiVOnt8bH1KrLcDf6RKPJCMOJzb0=;
	b=qPXw8irj5Nxf5PGnt4KLrQuflpJObBtFFchhuGJKoeAAeZ57dHS4Ht9oPQ+Ty7vG6L
	3e16FsBJcxlwlg10WiQ4IDJCmOkTf6JVzYBBttkKrGpx5BbOotOrmg8KlMesUzDsvs/l
	vJ0hyylOSWHT17xGqKA9JlEsFf3uVYceRIu9sfwx2DSZ5WF5peusIabv02izidIy/E6j
	ybHW1KEcad/Bt0BuOMQ4GDo54FE5AWtRErFdUkX1kPltxKckQl3hEKNNUFeOaGk4f/mu
	+UDbAnFdYcZEVeKB5NCy3NnUeCwmRfKYzBjcyUuF6ifdq6k3vkRUTsLESHgf9z5hwccN
	rr5A==
X-Gm-Message-State: AMCzsaXjQKAuD1mL7D7jZ7ohKnbViu7xYN/O+YOK7B+gZ9Wj3ksRmw4w
	qAkVGhGcx7Hv0U6bJHJPWuM=
X-Google-Smtp-Source: ABhQp+RL4L2OBGwJkwhI/QuYg27qQzO3oxwVF9Nuh7eSvfFBIncYhj6bicpa/U6MlhMt8JSeCU6nQA==
X-Received: by 10.55.42.73 with SMTP id q70mr15888965qkh.337.1508199216290;
	Mon, 16 Oct 2017 17:13:36 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.13.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:13:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>,
	Corey Minyard <cminyard@mvista.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:53 -0300
Message-Id: <20171017001209.32276-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v2 23/39] hw/ipmi: remove old i386 dependency
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
X-List-Received-Date: Tue, 17 Oct 2017 00:13:40 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Corey Minyard <cminyard@mvista.com>
Tested-by: Corey Minyard <cminyard@mvista.com>
---
 hw/ipmi/isa_ipmi_bt.c  | 1 -
 hw/ipmi/isa_ipmi_kcs.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
index 2fcc3d2e7c..e098fd5206 100644
--- a/hw/ipmi/isa_ipmi_bt.c
+++ b/hw/ipmi/isa_ipmi_bt.c
@@ -26,7 +26,6 @@
 #include "hw/hw.h"
 #include "hw/ipmi/ipmi.h"
 #include "hw/isa/isa.h"
-#include "hw/i386/pc.h"
 
 /* Control register */
 #define IPMI_BT_CLR_WR_BIT         0
diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c
index 80444977a0..689587b65d 100644
--- a/hw/ipmi/isa_ipmi_kcs.c
+++ b/hw/ipmi/isa_ipmi_kcs.c
@@ -26,7 +26,6 @@
 #include "hw/hw.h"
 #include "hw/ipmi/ipmi.h"
 #include "hw/isa/isa.h"
-#include "hw/i386/pc.h"
 
 #define IPMI_KCS_OBF_BIT        0
 #define IPMI_KCS_IBF_BIT        1
-- 
2.15.0.rc0



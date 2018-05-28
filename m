Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNRZj-00088Q-7b
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 19:29:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZf-000871-Bl
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:29:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZe-0001zH-K4
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:29:11 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:41250)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZc-0001xp-IM; Mon, 28 May 2018 19:29:08 -0400
Received: by mail-qk0-x243.google.com with SMTP id d125-v6so10161432qkb.8;
	Mon, 28 May 2018 16:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6RN2PkGN6K8vKGqpHhKpSYC/X204Taw9Rvf/StHhZ9k=;
	b=UCXQNuIiiUv8QDvnmC7EJGPe9ZFxD3P29mY14hqpwaQKLuC4Z/HYQN4ZcgT7GPUmor
	0LJeF/o4p8RMy2tTiewfdVhVGgVDpHxBKoa9+WkRFw/tdilfJ+L8tG9GG1Lw+gtNCkLt
	ZMATHh56ZvhELDu7264muEAmZqful1U/W/zb2GyH+NlxgpOJkPkypffYWEusOQ2BVpCg
	IEySfF1pL0rpXIEjOatKFwLcA7u78vfcLakY+CteOAwYc6KZ7q60gAri6iAB0jATwap0
	BbES3vjilddtyfgBisiE0+f3+lAb1AT7MucYa3W0SMG+WAasYq3bvvdwVuZ0uIRvnF4p
	sp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=6RN2PkGN6K8vKGqpHhKpSYC/X204Taw9Rvf/StHhZ9k=;
	b=sj9xXPeFZw1WVoL+oygXP0FBcOvzmnVL/uqQ9Um2gwoz4NWO/jVMFQ3sn7aGvPPzMK
	viPoPRUcatZQ2ykBlu4Tc1FN/IYJlqUQNnoC+QbXkh9AUhfCOb+HkrShAmvNCG3x2s/7
	vnCjq/BquEN093OnTLjbaLcn4kgnvvP+OoJXF5U/kY1YDtmTJaRAirAw0Os5BggUdR4A
	/I31MVabVABwzqK1gTQWY11wfg+PmvOPUR1EjctuB8DwfqCHljFJ+7W6P1ECit/SxMV+
	Izk0Vg/6WinrxE75uP4mY8mKJow7wvSp7dPDE7YtK8s/3XIdBTIB4wCHeor18AkYcmoX
	5WAw==
X-Gm-Message-State: ALKqPwf3HfPwXgQWgl8cZT29lR9y8kzh/tAMcOAeBoxVgiItIy0/Msb5
	68x+VKg9qv367Piyo+rokkQ=
X-Google-Smtp-Source: ADUXVKJLmV3JThPKRRANyyJnBYF1ekWquBwzznXkRMvlAaz4IKI/TeACkyHR6me9Vb1tqgloR+YFhw==
X-Received: by 2002:a37:4cf:: with SMTP id
	198-v6mr1954406qke.186.1527550148109; 
	Mon, 28 May 2018 16:29:08 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm23756182qki.62.2018.05.28.16.29.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 16:29:07 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 28 May 2018 20:27:19 -0300
Message-Id: <20180528232719.4721-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528232719.4721-1-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v4 21/21] hw: Clean "hw/devices.h" includes
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
X-List-Received-Date: Mon, 28 May 2018 23:29:14 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
This starts the slow process of getting rid of devices.h...
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



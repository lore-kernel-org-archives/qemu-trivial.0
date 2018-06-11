Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBRA-0004xX-Rv
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:16:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBR8-0004ua-4v
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:15:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBR7-0002hO-9G
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:15:58 -0400
Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232]:41297)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBR4-0002ff-Bn; Sun, 10 Jun 2018 21:15:54 -0400
Received: by mail-qt0-x232.google.com with SMTP id y20-v6so18862135qto.8;
	Sun, 10 Jun 2018 18:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=g4Q7v6tEPhCDY5mYka4WBfZXMmY8sWWpBdN6t9dQp/k=;
	b=ht2sEWaJHphuKI7iwUoBxbjFzGwmIz4IZyd0fKysjXUXylLqyQgFx7n9aBW1vzJUiN
	HmwqnonFOtnWuFeIniPfxq2DZEIWx1veN3JjtZUTTzjhaP1g0Tss7gSCWX28t2Kd+LcA
	F3clOVWx736AtBUiq2EA8janncq7N3Gg7vfQm9UFv3Sriv6UzzgoGp0rWfkgOUGIuGQC
	upeyxh3BhlQGrKBDZ6qiyMUvQkh1RtviaCitmCBFxqbBa57SCw0iwDRIwfI6hp/ysgUw
	qWM3rkoMZ+7+nlGb9ZeXOhCvsgVsZIG/+waxISe5vdl9rVql58J3NLqTFMak4bHdTvK/
	oD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=g4Q7v6tEPhCDY5mYka4WBfZXMmY8sWWpBdN6t9dQp/k=;
	b=S456KAU5JvwHQLT1nLqx338Nf7uwlNQ69SshsaaW2JPuniUxzfvcV16fkrnMC+ZMZW
	TUzPVMHxlqDehGn0jiw2ntAYO+Xh+5XU0ZV5OQh0lxle2jVUATlghO/bW0cQY3ao+sLi
	c2+1lsROPwBi1Zzw99nadiRvSkBFIf3E4dewmZZBDj71/Sk7SH4icabIQfGv8nfNh6Wm
	2eZvn3Zjg/nDZLue4gYfPqKepI38XfeRDxyHxBepOQsxwGrWN4P3HMbbuuv3WmYZsHZt
	iygPBOFQUgZzeq2ffSLnq1xh0QgwtBnihIC/A/Spj/Sg12+YQGvfjSkQiYD6zKpO98lL
	EkuA==
X-Gm-Message-State: APt69E0B9+wsTldiz9kyQlMo5rtOr4l0WeO2W08BGgGcCWj/XUM771wM
	++UU0fW80I7Mnv8L/PAYJOg=
X-Google-Smtp-Source: ADUXVKLBnc4FBSqYRGvChmuA61FFw5jVbexQudtHMMV5taGicLWwe1d7I0FIauP60sgIfh0FvOgpnw==
X-Received: by 2002:ac8:2b18:: with SMTP id
	24-v6mr14423630qtu.73.1528679753927; 
	Sun, 10 Jun 2018 18:15:53 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.15.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:15:53 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Alberto Garcia <berto@igalia.com>
Date: Sun, 10 Jun 2018 22:14:29 -0300
Message-Id: <20180611011501.10235-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::232
Subject: [Qemu-trivial] [PATCH v4 08/40] hw/ipack: Use the IEC binary prefix
 definitions
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
X-List-Received-Date: Mon, 11 Jun 2018 01:15:59 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 hw/ipack/tpci200.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/ipack/tpci200.c b/hw/ipack/tpci200.c
index da05c8589d..cd3e79139d 100644
--- a/hw/ipack/tpci200.c
+++ b/hw/ipack/tpci200.c
@@ -9,6 +9,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/ipack/ipack.h"
 #include "hw/pci/pci.h"
 #include "qemu/bitops.h"
@@ -597,9 +598,9 @@ static void tpci200_realize(PCIDevice *pci_dev, Error **errp)
     memory_region_init_io(&s->las1, OBJECT(s), &tpci200_las1_ops,
                           s, "tpci200_las1", 1024);
     memory_region_init_io(&s->las2, OBJECT(s), &tpci200_las2_ops,
-                          s, "tpci200_las2", 1024*1024*32);
+                          s, "tpci200_las2", 32 * MiB);
     memory_region_init_io(&s->las3, OBJECT(s), &tpci200_las3_ops,
-                          s, "tpci200_las3", 1024*1024*16);
+                          s, "tpci200_las3", 16 * MiB);
     pci_register_bar(&s->dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->mmio);
     pci_register_bar(&s->dev, 1, PCI_BASE_ADDRESS_SPACE_IO,     &s->io);
     pci_register_bar(&s->dev, 2, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->las0);
-- 
2.17.1



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQqP-0001Kz-11
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:43:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqE-0001Gl-UL
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqD-0007ce-TJ
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:34 -0400
Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231]:43582)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQq9-0007a2-AF; Mon, 25 Jun 2018 08:43:29 -0400
Received: by mail-qk0-x231.google.com with SMTP id j124-v6so547075qka.10;
	Mon, 25 Jun 2018 05:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2UK0NoqUpmf9xn9GoIZ3L6Qow6qgWaindH9dlZIma3A=;
	b=Y8/mwzMQmbLDXl8ALjB4juAdLWWUVp3mRLg6H8Ao/e6Asv+QwrkXMxTZ4f6rZ4EUK8
	EcEic3V5Do+RABdRr8M6jJIFYQE0yuHGHrltB88IaoCz6cAIsCynHBRPjKTJJB0xF8EO
	3Tc3kdEPSLM1A1c+qgxN9tgnZfZLUvCHRaIrSFRbonm/44jyCxNEQgv7NEzFaaDxKca3
	WCnuzfrWLsuC9GKWtF/LOevY9rujNfpmMVVqUgG0h01ZlnVb33F/D3fOQQ8R3kQcgbDz
	xHRUMQL+HAK1M8pES3aLnO9Av1fdGjuOK7qFGcPWvjp1dl0SWwcp0LAqYkGfOZPSwMST
	H8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=2UK0NoqUpmf9xn9GoIZ3L6Qow6qgWaindH9dlZIma3A=;
	b=F8XRxHVWb6S9d+U/118JvfMzvZSdg4TOexs9HsUaAfJ19efdVVfW9LF2q8B4HdDyHQ
	vcBdntM6sXnT7U+FNOOaHxFdCfFJsGhY8wdutf0G+Uhdaf9Kj5wWh58iK91/Hnjn0XBL
	kTGn97KiajfakmOnulu5ZpJV5udAcgoIZHBflktjFrLBCYLYl48vVmca3GkPr+JcXXMp
	6SSlq/+IQ2u3SHg6Bjm/TVbcyQmDulHGOuuABnDyDExA34SfKnJTlxFAqUYHJcTKvcCl
	bqtP1WMZOqZBk4DCitlEALbbXg/n/td+P4Lv7n/ezhJhAqdP2ReMdtixZIAGIlhsQdFJ
	rCNw==
X-Gm-Message-State: APt69E1Z4MBET2ORxbU3qlHPlwhUHacDL7vqjDV4vuOtiDlRBgXatlc4
	N5sMWstjoPZuuHEYLChCku8=
X-Google-Smtp-Source: AAOMgpdJPPUsxDye4gpgfNKNFqLMm3E7p/JmFVHSBGnNegkl/0DXmofTMS5HFycTATaIyrBR0xZpEw==
X-Received: by 2002:a37:6251:: with SMTP id
	w78-v6mr4854811qkb.364.1529930608758; 
	Mon, 25 Jun 2018 05:43:28 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.43.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:43:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Alberto Garcia <berto@igalia.com>
Date: Mon, 25 Jun 2018 09:42:00 -0300
Message-Id: <20180625124238.25339-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::231
Subject: [Qemu-trivial] [PATCH v5 08/46] hw/ipack: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 25 Jun 2018 12:43:37 -0000

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
2.18.0



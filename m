Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fG3wX-00053u-O6
	for mharc-qemu-trivial@gnu.org; Tue, 08 May 2018 10:50:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fG3wV-00051s-HE
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 10:50:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fG3wQ-000541-Lt
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 10:50:15 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:40038)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fG3wD-0004wa-Ru; Tue, 08 May 2018 10:49:57 -0400
Received: by mail-qk0-x241.google.com with SMTP id h138so24107113qke.7;
	Tue, 08 May 2018 07:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=A0Az3qZj2dgriGtsANmROlvCBDKJXkO5N3oKNaqPg9o=;
	b=A8XheQqo553QctV11FxewNKZqeFIg8RLLa+GYhJw3SJRpIqYIwCGFBmvwtdNdlyUEb
	zKNBSPcfaTOs/dMDtGU6aSRrN1Tc0XXWElDsBi8NL1lKNMUJ7igAj18+Rp4xoJZznN3a
	uUOupKV+5UmKN6SaiVOBZZBl8q19RLZ8ViT+Lndzntb5EsA5Ox80LgO++k0LXrIMzILK
	HJlpxNEguC2oAI8fpL9Ohl5J/tNzq1a2Zhmlfe0hLdKNyx1sA6DFWwN2dE0fHExlZCKB
	5u89ZcVMjXEYN6Muj/6dY8fjSXZIgCiZzZaobULym3maimzX1yxij8UiVol4utQReOpW
	SlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=A0Az3qZj2dgriGtsANmROlvCBDKJXkO5N3oKNaqPg9o=;
	b=AYqWrk73eTLTn8h/XNGhRHHiSRgMp8hwG1zRqfYdPHWSKiG9uUxuGvJP3SHdJSyVMM
	wZr6/No8bhsWrQhPwDSL3LTEn5B4qJ5JCh6o/nDi8iMrrVJQcNJljgsuZLLtvn3xFpoO
	aJFXhMk04vVAxbYaUGGxR51+p3Y4VaVor/7Cs7jaWTnJ69oyxxp9IEEh751Xvs42jKHy
	zv+zR2WH/OwfmvNCXKXqW3kwx1PG00Nq7PETOlBiLLG+pzdCaEIkvt5Rq68r0JorzEEJ
	p4Uol6CMpqA3KV3B8gJkl6usPW7HkWVrIlk7xBF1kiUhTQ8e9adgmzEU0hpRW1Z8s1Fq
	w7YQ==
X-Gm-Message-State: ALKqPwcby1nvPOJy31NhN8G5b62Ee6/YJl6V4YkNUm6Q3CtYmteNx/D/
	VuGrccI8klmQaSk1Y4YsH5o=
X-Google-Smtp-Source: AB8JxZp1wT9ifjI3H0iANANRcVJM9Au/7keBkB/KqraRdUREo8QUUtM9kOeL5EXQ6d15L1t1kovvBg==
X-Received: by 10.55.169.194 with SMTP id s185mr2432475qke.284.1525790997138; 
	Tue, 08 May 2018 07:49:57 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m127sm1034456qkc.68.2018.05.08.07.49.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 May 2018 07:49:56 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: John Snow <jsnow@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-trivial@nongnu.org
Date: Tue,  8 May 2018 11:49:48 -0300
Message-Id: <20180508144948.14071-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH] hw/ide/ahci: Keep ALLWINNER_AHCI() macro
 internal
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
X-List-Received-Date: Tue, 08 May 2018 14:50:16 -0000

The ALLWINNER_AHCI() macro is only used in ahci-allwinner.c.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ide/ahci_internal.h  | 3 ---
 hw/ide/ahci-allwinner.c | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ide/ahci_internal.h b/hw/ide/ahci_internal.h
index 8c755d4ca1..1a25d6c039 100644
--- a/hw/ide/ahci_internal.h
+++ b/hw/ide/ahci_internal.h
@@ -375,7 +375,4 @@ void ahci_reset(AHCIState *s);
 
 #define SYSBUS_AHCI(obj) OBJECT_CHECK(SysbusAHCIState, (obj), TYPE_SYSBUS_AHCI)
 
-#define ALLWINNER_AHCI(obj) OBJECT_CHECK(AllwinnerAHCIState, (obj), \
-                       TYPE_ALLWINNER_AHCI)
-
 #endif /* HW_IDE_AHCI_H */
diff --git a/hw/ide/ahci-allwinner.c b/hw/ide/ahci-allwinner.c
index 5397483fd8..2fd95078ba 100644
--- a/hw/ide/ahci-allwinner.c
+++ b/hw/ide/ahci-allwinner.c
@@ -24,6 +24,9 @@
 
 #include "trace.h"
 
+#define ALLWINNER_AHCI(obj) \
+        OBJECT_CHECK(AllwinnerAHCIState, (obj), TYPE_ALLWINNER_AHCI)
+
 #define ALLWINNER_AHCI_BISTAFR    ((0xa0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
 #define ALLWINNER_AHCI_BISTCR     ((0xa4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
 #define ALLWINNER_AHCI_BISTFCTR   ((0xa8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-- 
2.17.0



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoHW-0003Eo-7a
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:27:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHT-0003Bg-6n
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:27:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHS-0006o3-39
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:27:47 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:34915)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHR-0006nO-TK; Mon, 05 Mar 2018 06:27:46 -0500
Received: by mail-wm0-x242.google.com with SMTP id x7so14720777wmc.0;
	Mon, 05 Mar 2018 03:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=93o2U7BX+ZSBqXJ5MU1gN/1Jp48kYaJmNmRa4OxJE/g=;
	b=PRFMoyqA5pk5020Qe8rcoqU5jOHnUoptyDJMwGR8r9zkf2buYXQq8Z2ede5oybVWOM
	1hLx0cCX53jmT3DmnZS1hnTLNlURzvrbRVewPmr4cD+2aE9pbZkJm+YyX877Bx6Y59Z5
	VEjt/ipa8XKyBIfk+BJgBFc7c0ILB4fhNjidjJ7s48KknxpQuiX3S2C4FQH+Y7w0IeLG
	OomaRmhdF7F48a4aOlqevfGZfdOgWGNcYnJRpINijC5cac4LFwVGqjT8pq3cc+qigTS1
	11gC1XKH9N4zv1s+swizJUbv/QPFTKn+tE+1YsOVQRLOzMDq0s+MV6qdPK8mSxuPXOA1
	B7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=93o2U7BX+ZSBqXJ5MU1gN/1Jp48kYaJmNmRa4OxJE/g=;
	b=SWWFwzufucwEqNz0ELB0b7R7dnwz7eXKKfLsQgVCCyD0ESpAZUEyRmxa2rZvkKi+Jh
	L2wo/eUETe3bCt1bXrLWxaIHsDEckmUr9il7mhNVjUXnPml3kV462EgW3mS+ZkNc8v8o
	JgcrX8Ye5E4DakLjsuKrdRiUZL7+vASCIn2vlxJc6SPu1oau9Fqsuy30MpPh/IT57evj
	aexsLZXnRqJPobKHC+gOvm4aoa01cXWhM0zDDfchXtvinTEJhGCn0viYM4iUn4IKjCN8
	wUHogdLiuoyONio1IbyE/ubvmF5bJgfdizT2hhyPKoN+1nKYgxo6y4hfvf/9vOAV94ca
	EI3w==
X-Gm-Message-State: AElRT7Gy63EY7Uctkoc9k1KXqpEKVV1BuIbQbZzCUWdkjVXXcyQyRmT1
	KzXtrpvJkmd6l3vKeynivYKWccIf
X-Google-Smtp-Source: AG47ELv/MZSiTeaWUxiuEvNSg7l0L0kp1D4cAG/FMQrb1FEDTwCMisyU0x14UDWq+0B4GTGrVHTu2A==
X-Received: by 10.28.17.210 with SMTP id 201mr3007848wmr.58.1520249264797;
	Mon, 05 Mar 2018 03:27:44 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.27.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:27:44 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Michael Walle <michael@walle.cc>
Date: Mon,  5 Mar 2018 08:27:06 -0300
Message-Id: <20180305112732.26471-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: [Qemu-trivial] [PATCH v2 04/30] hw/lm32/milkymist: remove unused
 include
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
X-List-Received-Date: Mon, 05 Mar 2018 11:27:48 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Thomas Huth <thuth@redhat.com>
---
 hw/lm32/milkymist.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index 471a74eaa1..c28379399f 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -30,7 +30,6 @@
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "elf.h"
-#include "sysemu/block-backend.h"
 #include "milkymist-hw.h"
 #include "lm32.h"
 #include "exec/address-spaces.h"
-- 
2.16.2



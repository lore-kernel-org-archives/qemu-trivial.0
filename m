Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgiv-0002Zj-Tg
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:31:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgir-0002XA-Vb
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgir-00053Z-4a
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:41 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:32821)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgin-0004yC-RC; Thu, 14 Dec 2017 22:31:37 -0500
Received: by mail-qk0-x244.google.com with SMTP id 63so8865109qke.0;
	Thu, 14 Dec 2017 19:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hsNhItPXt7QRb7/Ebl+VbktqresP2BTn9qexIVfPLFo=;
	b=AQLiX5FP0q+bJvCUI7tT5cXR4PTi7tDLAPaQCfe0I2ut9mo8AteQgyU2cln/WTC4lY
	evvVYSR9k4WnwXC7rfHf/KxUxlakBuST2hPYyxaPqgOhae+Fl/+7ytfbsIo+0+nAM4/f
	U7Z8M+SHixqKhKfy0La1sWZR3YOgEwJv6UMnb2lH2Jfvv0hSE+6Uug6R2iHCQbYOVLoU
	65fpWi+gAKunA+xqFnpplvxBKaiUo/o7AZ0Is3y2QhhhwJfZuntFXG4ykQ9bbq2S2NVv
	rxvKStRQFygu/Hejx+7zOwCg69jtNhcMhdTfSMQD+J9DDzmkV9cujkcgImkPFWTBcc1K
	g2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=hsNhItPXt7QRb7/Ebl+VbktqresP2BTn9qexIVfPLFo=;
	b=RDIzO9mvG+hQalwkUaacw/LHjg23LPtyLrjGg2QuGI0+Tj2/Yn2KksYSROhYL9BAMX
	6D958O5OtknZgFTaDGVEyHWmc2I0B1eS6q7sMI1qcf2heMx4JON/BOfSArm8sLHZ1ICS
	IfU+UCeynDuxV0oZPi9fhYRjigMbIHuQLzqxN4FvqLIBi4qGNg9sR6t2gvf1k4pKCirA
	L0IZvM/034T8C6shEiNq1WG5x6vJVAXpEZDVF+1ou18m9PTtK0WvBhze0+n6Gz2rt64W
	grBtj688vasAA4SIyRhXMGi+phE+hJGydg8QH7OLGn0tK0LzbQNWQN1suB8hs/ouXA8t
	1K+w==
X-Gm-Message-State: AKGB3mJ6o/ZTBb5dQ/DUxTWJ1Wq89Q5ura5ob1bhd72ePz88EsSiPRh9
	NuRWUa9sT6f2byZLeXL0apE=
X-Google-Smtp-Source: ACJfBouElEmyLuQR95dJ4ThGrtsqPDreWrLtY/TzItEvkhrNBLBXYKVuDupM1LNhXTFj+uwMHGdmuQ==
X-Received: by 10.55.25.18 with SMTP id k18mr19323311qkh.336.1513308697368;
	Thu, 14 Dec 2017 19:31:37 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.31.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:31:36 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
Date: Fri, 15 Dec 2017 00:29:51 -0300
Message-Id: <20171215033015.738-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v4 19/43] numa: remove unused #include
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
X-List-Received-Date: Fri, 15 Dec 2017 03:31:44 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 numa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/numa.c b/numa.c
index 7151b24d1c..20bdb5a4b1 100644
--- a/numa.c
+++ b/numa.c
@@ -29,7 +29,6 @@
 #include "qemu/bitmap.h"
 #include "qom/cpu.h"
 #include "qemu/error-report.h"
-#include "include/exec/cpu-common.h" /* for RAM_ADDR_FMT */
 #include "qapi-visit.h"
 #include "qapi/opts-visitor.h"
 #include "hw/boards.h"
-- 
2.15.1



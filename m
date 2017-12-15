Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgj3-0002hJ-4a
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:31:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgj1-0002fD-A2
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgj0-0005Hg-JW
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:51 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:41159)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgix-0005C0-Sa; Thu, 14 Dec 2017 22:31:47 -0500
Received: by mail-qk0-x242.google.com with SMTP id r184so1186337qke.8;
	Thu, 14 Dec 2017 19:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9Y5A616ittiTi+//TK7qXrH8l5Odu0MJdufm03cghtg=;
	b=TLcrfCpCV5rFsqcetlDmxwzucE3uAtSkPX+2OReiZjxmUClH1kDWkcR3C468dlF6dg
	BtdY2CwqCRg7dW/Yh85wPbkcyXHFetH5gu/NWAFJTf78o8Eju5y4dGMTmO0FH1AuSilx
	FE2FLRHK5oxjVDpPbI0yVevZRwz58sKRdF3RoWf1nKeQj57IFvGS6tIr0wwn+xqjZmA/
	qA04kXWliI3QeeDjFhpMcUYLN7bwLHPh8ldN9JUWcIJif32ul94DX1x5kpYPPmlwjKi5
	RzNn6YN5lA5lIIEde483iDLsd8zh29ixJGN2hbZch3lg9W8VnUo7f8DSCJ2yOHFeU6Vp
	P1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=9Y5A616ittiTi+//TK7qXrH8l5Odu0MJdufm03cghtg=;
	b=hXeyTdMr6cH47OwpLakrs9O7+2sJImkaH3NW4GehOgWiXUgbcarRcZZiAhmP5xQd4O
	wSWTr0TyZKiJZGBYMOfVEhADJsOQBdjzAQWJF0S92gMUGheI+oohcyH+fRU4KSyT4wqB
	70zlHOlzzA1oLcuQUG7HAGyMCVH+sveDFvAmZVjE3+7LJblnXAW6JMvUB56weXD/Cj6l
	uB5n1vLu7bMD4GclPaFI3MR5EHvUCyJ6F5nQxN6tG9686UTxs1NnZdbgPhniH23igFDX
	YHVB+GxscF88OnO49JmpKXfq0Cl7otet77DMmRSC+JW5TXhpsGQbpgWvF54nextoGl2D
	4uDw==
X-Gm-Message-State: AKGB3mJJRgKnAjSgPEhBhGGd5g7Ei4dSQ+s6JDbdpUIqw1GA8AGKJ3gR
	2e/JSmXay3++3yRO6iM04is=
X-Google-Smtp-Source: ACJfBovMYCBs+MPTkmSNqCBFiU30YVeKbwNV25SNcZHcP6HyOi45F7e2TxMbtoAjChEMqarFB8O+yw==
X-Received: by 10.55.1.76 with SMTP id 73mr20134768qkb.80.1513308707417;
	Thu, 14 Dec 2017 19:31:47 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.31.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:31:46 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 15 Dec 2017 00:29:54 -0300
Message-Id: <20171215033015.738-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v4 22/43] hw/ssi/aspeed_smc: remove unused
 #include
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
X-List-Received-Date: Fri, 15 Dec 2017 03:31:52 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/aspeed_smc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 992617fd3a..5059396bc6 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -27,7 +27,6 @@
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
 #include "qemu/error-report.h"
-#include "exec/address-spaces.h"
 
 #include "hw/ssi/aspeed_smc.h"
 
-- 
2.15.1



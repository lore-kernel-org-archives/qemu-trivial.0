Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgjq-0003TR-BD
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:32:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjn-0003Pu-Bs
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjm-0006WF-A0
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:39 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:39424)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjk-0006QS-BR; Thu, 14 Dec 2017 22:32:36 -0500
Received: by mail-qk0-x243.google.com with SMTP id u184so8865174qkd.6;
	Thu, 14 Dec 2017 19:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JhkZWm9edmPhjMG5NmEpJkxVu3C3w9IufgjUN3kTYK0=;
	b=jMF1hmTGtAJbAWpkFwxoJY25CsZJ9XqAt/TGeJlxb2GIHoT7NZKatLyF8SS5Dr8XpJ
	kdOd0Zi/nH4owAzj2Myg9ZKx4F6zrYQAHPvuolzSc/jG4+sCUB0LP40LDkI926tgItER
	/BcCih/qG4ZvLBwAbd4lSucq+YW7WbBpHAdDDWYwq0gwSO4JMf6j4jpvf7x4ipPhSw9A
	3N5uS3VaWoSC+ANLLkLTm50HZBLwDKHZOuV0N/siBk0DaKW7AzMXdv9qt2OSQJZn6QjT
	nCpc8xuEfMWOe6xtrY7XYNfnw4avZwpke/ezJxLbhXz3NCFu4onEruU3NLRSNqr9bNLj
	QzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=JhkZWm9edmPhjMG5NmEpJkxVu3C3w9IufgjUN3kTYK0=;
	b=kWW9C2PubXtux2bd4P17sNBRqIXqdriIbZodSObs+eoxzauwQX+EVNrGpFjeiFwxDY
	ciCnx6y8eDYzZ0rxpEQ0NC4VVA/0ZQvk6CExZB0lOA25YiXkzaNwM8DnRCRU2Dxuoilw
	XGRvDyNNqd36kvJmDvOa13cA6c6UG9IE+k8NT6YEzGQ/u0WpIZFDjsUK1aEFheP8JmLU
	wYGNeQFPssh7BKBwUJ6VDBYpsDvXphp6mnW7PzmD6lwmOwBIOpJZXc1FUmuwNxjQyUV5
	y+i8gyNPtA0xwR3Luggn5gvgU4mAIaddCr6DjofjtmEDiQIZSPNwRV7qYob76aLisr7c
	FbpQ==
X-Gm-Message-State: AKGB3mKFX6CQsgCO6f3ItnRXe1SX7iaW6udnuVHhT/s5fbEGoVz6X/mY
	DJW7jf+4Ygisk67nZFkk3wM=
X-Google-Smtp-Source: ACJfBotqIAmGP/IhhIyISzUUAUqn17uMEmz6woFYce7DJINq94JubeZtDQy8YlWiZl0syvUc7YTk6A==
X-Received: by 10.55.181.66 with SMTP id e63mr19279740qkf.130.1513308755907;
	Thu, 14 Dec 2017 19:32:35 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.32.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:32:35 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
Date: Fri, 15 Dec 2017 00:30:07 -0300
Message-Id: <20171215033015.738-36-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v4 35/43] hw/display/vga: "vga.h" only
 contains registers defs, rename it "vga_regs.h"
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
X-List-Received-Date: Fri, 15 Dec 2017 03:32:40 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/display/{vga.h => vga_regs.h} | 0
 hw/display/vga.c                 | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/display/{vga.h => vga_regs.h} (100%)

diff --git a/hw/display/vga.h b/hw/display/vga_regs.h
similarity index 100%
rename from hw/display/vga.h
rename to hw/display/vga_regs.h
diff --git a/hw/display/vga.c b/hw/display/vga.c
index a64a0942da..ce95b40e5c 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -24,11 +24,11 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
-#include "vga.h"
 #include "ui/console.h"
 #include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 #include "vga_int.h"
+#include "vga_regs.h"
 #include "ui/pixel_ops.h"
 #include "qemu/timer.h"
 #include "hw/xen/xen.h"
-- 
2.15.1



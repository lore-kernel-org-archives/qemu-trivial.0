Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FVm-0006Xl-3I
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVh-0006TI-NO
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVg-0004QR-SY
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:29 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:56816)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVe-0004N4-Ld; Mon, 16 Oct 2017 20:13:26 -0400
Received: by mail-qt0-x243.google.com with SMTP id z28so31399qtz.13;
	Mon, 16 Oct 2017 17:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=L0zjNG/KJCrWqUy4/vjewFYt4qrERV93FJ02IL6gHSs=;
	b=t+R2zS0AFJhbWvD4ZSpeKSPvL8GWFLcB4kASnR62eGHwC5tTjAb/ogqNJEl8IIQgq6
	NtOTdUmd8n+6dnMDfsAvstKTGiHQ8QiwSOD+PqJKJrOGxEs/H9ZH/0Nk3a58LNYyU39a
	geEW450+G2k9TNGgjjfgWA4GZ2z2CQwfQ5UWjif1Oja7J5FMDYSKoqiDKOlY7IfdXfc9
	Wge0Hy9uG0YIRxtynbVr82e5Ooz1AkO0MfBGYLNAYn//njcGOG2BoL7hcXZbDqq8Vp4R
	V7ciUtVPE9JMIhc1moGz/LZd1ToOmUpwgopq566IGrjpUKlK2mMv4SuIzVHKpZ6v/PFs
	2w5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=L0zjNG/KJCrWqUy4/vjewFYt4qrERV93FJ02IL6gHSs=;
	b=YmZZdRgeIFn7DnvX9BaE7lN4nCtSjADdP3aBcsu56Vf8fLmctuhwHR1u2RQ4mXF8/Q
	TGAYbmcAxB3Wx8XGdQ/FoFi0JZBNiw3lmHCkaHVQcFJ8stTj5LhHefhIpenVRuHV8MgM
	vS9JpkY0Gwg42gIKt8W9ki8pO0db+bP7v/1+kxlSTQ6n/Y5hWEAUnMn3VON4qHkEYCod
	tYSy7iNg0ZaECuXexkTdxMe6T5Y/a8R4qUISJ4eg2NUWTWE9C+W1hM18P2TbdkrZbC2s
	47NDJU6FhCBBFs0TWVJ0rT0WUALIDMYj23H3YrDrqZEWLShMeheCawQgdYVjE2tfTk9p
	xqow==
X-Gm-Message-State: AMCzsaXpdLaUolFpTRsaBABu7p4059mZKRSvCPA8zbzlsZ8yO+PXkUNM
	Kv7sQUuxy0IbMZMJWlLJACw=
X-Google-Smtp-Source: AOwi7QCiOEP0hJ8IkM0v4gguQwFVrm/M52sJ2NLsWcgQPBa5+XNOZMuF+det9hKI3SElgwEXto+iFQ==
X-Received: by 10.200.39.236 with SMTP id x41mr16904714qtx.287.1508199206322; 
	Mon, 16 Oct 2017 17:13:26 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.13.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:13:25 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:49 -0300
Message-Id: <20171017001209.32276-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v2 19/39] hw/ssi/aspeed_smc: remove unused
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
X-List-Received-Date: Tue, 17 Oct 2017 00:13:30 -0000

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
2.15.0.rc0



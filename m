Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgik-0002Q2-8G
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:31:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgii-0002NI-4r
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgih-0004pt-Dh
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:32 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:42476)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgid-0004gy-5N; Thu, 14 Dec 2017 22:31:27 -0500
Received: by mail-qk0-x244.google.com with SMTP id a193so158950qkc.9;
	Thu, 14 Dec 2017 19:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ee2+P/ohJHk81s7UreqToLgpc0sPfiU6+exQo1cBF4g=;
	b=QfCTOulZHdRmQI5JMZj9Lz7uNn3g7cL9sg+sI7A3iwW2Ii/kGjvm9m0BOG0LgIQbFz
	SOJ8YRfvgMpBEfkxpyGXmPqaQeWBIjZ6E3CRzN7k3V1IpdU4lge7EJYzIBNQ+WASdx2W
	uogjc2LjyyJjtlazpwp9ecWWSpHESG3xJmUgOHZqrQXgpkKF09uVZRnsLii2tMzuMBfb
	DIJPouobxIrL0NUYQM/5fbGJ2q9UMNaqjVDrbN+JboXRzqYgs0MpY9+zSr7e1n6HgYvy
	Y2aC+cKqk7dMoIRh77S0hUparXJrNYVIqouDrKpicdTAW6qmei4/pTHdaLTmsBCr/Mhb
	gAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ee2+P/ohJHk81s7UreqToLgpc0sPfiU6+exQo1cBF4g=;
	b=dnbDAd4Szy9xjSTUQsqZxMMlk/6dr2CGIdaqWA1rxdCO9wHF+6HBjGPV2xLuJvULxF
	9Ie2zTMcGC0GasOatlNrO+yIqxvtpcbTIs8kqB4ze5haTjFr1QqM9lxzuT/cYA58aO1x
	2yLlrv/QvT5B6BMM56L8jA0V5Xyph9bFtqY/03Ckp3HxHJUSStdElKxd7/SL/T4k/wJA
	tiFJ8kgRMkboZ+94BHAczBpRfmNEZgOg8clE3GpyxAdHMk+HPvxvcyAKsjB4XKycvZH1
	QSVXPFmyDZtjFZWfju5eyU/YH3zBy5Blx80tInFTUFcRxmVu3YPSwNtfhO9DEkcxHYHs
	YSrA==
X-Gm-Message-State: AKGB3mIUnjXiQlF2R8NZd+Uqe3F0nD2Z+9NpGxOjI4WFi9ro2nz5y45m
	NCnOhXAFZVxXt80aB61L4yg=
X-Google-Smtp-Source: ACJfBovrHCqrHA9WPQO9Bm13qSgYikb/h0XVx5xSsDt1af2ZB6SuKz97XTslyLEfLc7fqRt6bNcfjg==
X-Received: by 10.55.97.135 with SMTP id v129mr18077468qkb.305.1513308686725; 
	Thu, 14 Dec 2017 19:31:26 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.31.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:31:25 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Date: Fri, 15 Dec 2017 00:29:48 -0300
Message-Id: <20171215033015.738-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v4 16/43] i386/hax: remove duplicated include
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
X-List-Received-Date: Fri, 15 Dec 2017 03:31:33 -0000

this file in include in "target/i386/hax-i386.h":

    #ifdef CONFIG_WIN32
    #include "target/i386/hax-windows.h"
    #endif

which guaranties that sysemu/os-win32.h is previously included (CONFIG_WIN32)

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hax-windows.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/i386/hax-windows.h b/target/i386/hax-windows.h
index f7c3e99246..004f867694 100644
--- a/target/i386/hax-windows.h
+++ b/target/i386/hax-windows.h
@@ -20,7 +20,6 @@
 #ifndef TARGET_I386_HAX_WINDOWS_H
 #define TARGET_I386_HAX_WINDOWS_H
 
-#include <windows.h>
 #include <memory.h>
 #include <malloc.h>
 #include <winioctl.h>
-- 
2.15.1



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V0X-00028q-8t
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0S-00023H-EB
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0R-0003Rp-Mg
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:16 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:52588)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0O-0003Of-H0; Tue, 17 Oct 2017 12:46:12 -0400
Received: by mail-qk0-x242.google.com with SMTP id b15so2824958qkg.9;
	Tue, 17 Oct 2017 09:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JtzpUlfAEdAeO+iGWPLs3N4uX0ZSdOQwNeVpWcGSmP4=;
	b=Poxokc6ubBh7h9qRf+v1uyxpdWf66YXQNjAOVhTR6/BtelNzIw1HppBrc9qjuvwMmY
	7tIBW/HHX/N4bsQeS/0noe0KOsgMx7/2y8thst8l06d5gmKoIOjwRcFr66CmFfeMneJP
	vzEQEFuyBfcFRxSYGFVgNMO2oDsrkMthguJHNwUFA5wFrlz+/IrBCeS10fZ831pbPeG2
	ChkjOzGzVTGOI43V2Kjuauc3ihB+5C5veC+83LZx3GwbAaap/eoxsoYpUWIidYzFlOH6
	5hm7AWrU6t3VL7KkA1W1+mTcIk6m8hqGhTco7Wq/2zpbwjrAgnAC0YTZNFdQcYR+5iaI
	P1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=JtzpUlfAEdAeO+iGWPLs3N4uX0ZSdOQwNeVpWcGSmP4=;
	b=Q1QRGJySmCeIddIMV1ab3w/zyKv5OSbeuRRYjggz6l17w2Uats8jSWjgVT2d6l/k6V
	AfAk5UzhkcCspWM4Cq5bN/eTQETEWeS/VgI0mUBDzo4RPjmqbjTp1pHqxxeAaErFimek
	cvE6SkUpY20Smxagf2tLtqA632Bw0c8ZlfcJtcIu60oki6k57AhxH+PQdJQ7TJElBSs5
	By+KK7OWLOA/yay2mS7EOpTX8lfC2bB8twG2G7xkm0QoYJvWOwj2cqyPP8eJldyfbmOA
	DIArKlaRe+f2xLJH0rhBT2qvE01Z5RD7KRWaMK3lazOYYa9euVgy+KZOrbgFTNjpGSdk
	Qx3w==
X-Gm-Message-State: AMCzsaW2ukHuJaDWoPrjZdETm9zTE91tkJ5ASP3QoorcaVrRo7Akiw/e
	teNn2OjjDPGM6k1dtrH2O/0=
X-Google-Smtp-Source: ABhQp+TWixZad2s2NDEx4vMWaq+mkZ6KpcjcQxH0ERkhtYA7kvY2+UU3xW9DkF3bV2RwZvVKvFVizQ==
X-Received: by 10.55.22.132 with SMTP id 4mr15064566qkw.39.1508258771994;
	Tue, 17 Oct 2017 09:46:11 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.46.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:11 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:04 -0300
Message-Id: <20171017164426.25277-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v3 20/42] hw/input/vmmouse: remove unused
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:20 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/vmmouse.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/input/vmmouse.c b/hw/input/vmmouse.c
index b6d22086f4..65ef55329e 100644
--- a/hw/input/vmmouse.c
+++ b/hw/input/vmmouse.c
@@ -24,7 +24,6 @@
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "ui/console.h"
-#include "hw/input/ps2.h"
 #include "hw/i386/pc.h"
 #include "hw/qdev.h"
 
-- 
2.15.0.rc0



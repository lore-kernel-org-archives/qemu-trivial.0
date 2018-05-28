Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNRYc-00078Y-UP
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 19:28:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYX-00075h-Mw
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:28:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYW-0000xd-Rw
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:28:01 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:38714)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYU-0000v8-Qb; Mon, 28 May 2018 19:27:58 -0400
Received: by mail-qt0-x244.google.com with SMTP id x34-v6so3251650qtk.5;
	Mon, 28 May 2018 16:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1P8v3kXxL90nL3K6IVab8JnshDR4N8iUOe8pusPbGsQ=;
	b=F4YvHgdms9yt59VK3ZUEydUp5pIHQAAh/aKOlu/5bP/Zx/qwE1AbIwgbK64R4w68Jp
	TeLvahz/DAzxS71TmZmgJGsoOv1ATsliiM/SId6k+n10e2BlFVOv8jaSynvJ638zzbwm
	i5N+ddsnL7yXLKXMMWwfyc68UlLUnVaBQVurCaMas8u8ilELYmCXZJneOd43+aVjeYrb
	LjA26dhpjxqYpvJ6s0mkBuO664gg/HPeHb0OAEgjkeEKc7F1Cki3oKQnnBTPAD9lBIqy
	dwStMGWlHt6eFkMMcBaOpDgt5sLqohVHwdMX70HvHX5ICEoQVs/cpJKiIORzlIB9K00d
	QbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=1P8v3kXxL90nL3K6IVab8JnshDR4N8iUOe8pusPbGsQ=;
	b=YoRE4tySuv3Ho9ggw7UBDWC3RIZAQbGQVuH21vWlJhOMaEN+4AE1NshosbNA6smdJM
	zhw4ek0XPDcRtpUv0feGFlc+CJRzDRPnISE3KsQRNDqVCqDIcxbkOMmurSje2E3F0kiR
	jvwfrsLDhUYSmf8nz/UCPVNYIIH7dDI6cActxLDg+Pe0obj0LtHNlTh4JWMZ638uZ6is
	yLx79H3T1RtxlO/Uh6tpcyTVi3GFUkhDX4aOVh0YzqxMfoJr5TCwXmP7VDu0uJ2U8BWf
	lIcaCclxkCLQN+dFXs7O320OtQhVmfgf2CmYm7z9okBGyqIJQfWVeTLBK61hauVOfKlq
	tkjQ==
X-Gm-Message-State: ALKqPwf0iba53wUUYm4ycWX9bO4QeBKP2z/1RTPLT2kyinovctKqMnUn
	vmSKFmYudVqMh8k8tmiH5SY=
X-Google-Smtp-Source: ADUXVKJuS8qWZDvcJ66RANVORdTXH0Kz7Qc+1o0uuZiCZiS0eefpY2gACP2LnIfxOQjbLu2ZdcnKmg==
X-Received: by 2002:aed:2f64:: with SMTP id
	l91-v6mr14677764qtd.216.1527550078376; 
	Mon, 28 May 2018 16:27:58 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm23756182qki.62.2018.05.28.16.27.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 16:27:57 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Date: Mon, 28 May 2018 20:27:06 -0300
Message-Id: <20180528232719.4721-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528232719.4721-1-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v4 08/21] target/hppa: Include "qemu/log.h"
 to use qemu_log()
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
X-List-Received-Date: Mon, 28 May 2018 23:28:02 -0000

Since his inception in 61766fe9e2d, this file uses the qemu_log()
API from "qemu/log.h".  Include it to allow further includes
cleanup.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hppa/int_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/hppa/int_helper.c b/target/hppa/int_helper.c
index 787f3d6357..561bf6eb60 100644
--- a/target/hppa/int_helper.c
+++ b/target/hppa/int_helper.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
-- 
2.17.0



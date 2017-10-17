Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FW0-0006mr-96
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVy-0006kl-AH
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVx-0004dG-F8
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:46 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:50850)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVv-0004bd-L8; Mon, 16 Oct 2017 20:13:43 -0400
Received: by mail-qk0-x242.google.com with SMTP id o187so21938qke.7;
	Mon, 16 Oct 2017 17:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DWbFx1RqF/81xCg7WLslXI+d56l8J+BcYQxd5UOcBuo=;
	b=CzWpYvJnyUixnjg7NTNpN9mQyCpAvo11zZ7wD7BKClbBn1gNUR72++nzWoiAWHPWFo
	sv+WdL8TtVsPuhUW/GNPDanSHB+HJY9KH05twfBD72gd+ek0CTGFiM3+WjB/6qkP0bBZ
	pMxFVypBFM+3RKKaY9BO3blLqtgU2M6nhKYelPhe61JAdIN2yA3SE9BQfNP/dI6d8waO
	5HKR4Hb/d+8XFWFOrvOvxwCztqn9FoODQZk0IyX5nAoHx4BH9ouq4+46c8DsSL2JmKRb
	yznktes/04TXdtBUhtgp1T4ltb+QL77uWhJuaBvGUpfzSXqhyvaNYl0RkIp1e8+7va5D
	oRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=DWbFx1RqF/81xCg7WLslXI+d56l8J+BcYQxd5UOcBuo=;
	b=O1CIxwc3ej4M9ypXf6lt/kt/A0Qe0IHGYwPM3niBwiolCbpdRu/ssh1jAjRBDwjifZ
	TZBzW4suYxxz8gmoRrE525YC4QwYM8V9KdQAFB57v7ECGAlls7YI22zVUTkkOLCw8g/T
	cp6/4SouJNyahm/KtikRMCpvVitdNc4EospPF2orLBt5O1bOA/QGWwP/K613b6wXIQRY
	pjmCe5AKkTi9lgeleVuDijlR3wNjtYg8u2tPuKU5mqfyB21uIsYA5KuxePq/iTad5oAD
	4nDkkDQKMpKMYE2CB5kJyPl02KyqsI4924XgYXvZ64fmX69el/8id++QFX5aWFtJVrg1
	21bQ==
X-Gm-Message-State: AMCzsaVCmVCwV9mmhUmsS01u8Kty5JAGs8a29MDqIu56fx7R9dLmCqh8
	nUSo/AlHzIQz8InHoZmVLl4=
X-Google-Smtp-Source: ABhQp+RqBjLt1igACVE9JwEUKKikG4VouKQSBV/AhzM1gcplxs5wM2Q0c9sFGX4rw7VVRYur6CpiAg==
X-Received: by 10.55.6.149 with SMTP id 143mr11670965qkg.231.1508199223225;
	Mon, 16 Oct 2017 17:13:43 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.13.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:13:42 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:56 -0300
Message-Id: <20171017001209.32276-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v2 26/39] hw/virtio-balloon: remove old i386
 dependency
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
X-List-Received-Date: Tue, 17 Oct 2017 00:13:47 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/virtio/virtio-balloon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 37cde38982..14e08d20d0 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -18,7 +18,7 @@
 #include "qemu/timer.h"
 #include "qemu-common.h"
 #include "hw/virtio/virtio.h"
-#include "hw/i386/pc.h"
+#include "hw/mem/pc-dimm.h"
 #include "sysemu/balloon.h"
 #include "hw/virtio/virtio-balloon.h"
 #include "sysemu/kvm.h"
-- 
2.15.0.rc0



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V0u-0002ba-Ob
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0q-0002Wi-NV
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0q-0003dE-5C
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:40 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:44434)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0o-0003a5-Ao; Tue, 17 Oct 2017 12:46:38 -0400
Received: by mail-qk0-x244.google.com with SMTP id r64so2848514qkc.1;
	Tue, 17 Oct 2017 09:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DWbFx1RqF/81xCg7WLslXI+d56l8J+BcYQxd5UOcBuo=;
	b=X5CVlTtOUF7R54801tg4VDhuoVbWGRswPxZuKyf+7bO9ihNQkTgsxIEfVn2a+0sx9z
	BJBgU5TaWTSgRvNq8Ag30GjkxL/Ld4DfOUqDBhhXnrSedvh6GWb3IqNBzCA3XIa5kFhr
	kpHu/udCLho1ANMKotFpp59CvcyoAAPxAR+ekZ8m7ruYYGB8zrMzK9RqwipIcrBeuMwd
	1N2OeFxmi9+MdOvbWW8yFkU4V3yrI0SX58Dw0Jxbp3a9m0dcewal5eMONQNLjzT+crBK
	hGv/loUaBp9FmYKGAX4VtzJObG8xMmJG1R/g9YypsqvfK7En1Hi2l2dqViZt/ycVrQPd
	dZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=DWbFx1RqF/81xCg7WLslXI+d56l8J+BcYQxd5UOcBuo=;
	b=Jwjy0kPRR8az1M5hMAh49AfAyCQ8zQI5LwqGHUFjEsu6KdEHPONoZnOlAV/e7IvH+N
	RuwGv3z/uKkyRjlxWbndwctbPDPYdK6y7HyXan2QQpG7oh5KZ+U/sWh9JPN1Oatp0TrS
	ciYEN+Yt6lGcJkq+Iq5oESBmC6214CqYG4YfU1M1kQLVCQIAvhEltaqDrd2BnzG91cl4
	XCrv87wrTYWIu3RoqGFY4SNMRPhAVNQul0NaUIPFMCXxoTwCLefC0KXAHz775n2DfmbI
	AxzRIzeik1BXDj1AshL1DHPbCVSJab25KZrsp1nuh8uECHkeUVMKmOqEI3vZLFa3dRuz
	0ZwQ==
X-Gm-Message-State: AMCzsaWcTzemaRoNk6qs9xtu8qOuske0rql/7Yc5f8P7RmkkFcMXep3L
	PPrtlphLZAGrRS+sbvjDMxk=
X-Google-Smtp-Source: ABhQp+SZTX/aSYi8P2iUA3A2loY5mE/eYSdALYCRClTuVIblRxrtW6FnhgjvCWH3ffR4AIYpeXRQ1Q==
X-Received: by 10.55.160.135 with SMTP id j129mr18194998qke.274.1508258793513; 
	Tue, 17 Oct 2017 09:46:33 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.46.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:13 -0300
Message-Id: <20171017164426.25277-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v3 29/42] hw/virtio-balloon: remove old i386
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:41 -0000

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



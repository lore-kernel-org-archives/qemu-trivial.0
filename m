Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rKo-0006N2-Oj
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:45:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKm-0006L5-NM
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:45:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKl-0001in-VK
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:45:24 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:46047)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKl-0001iT-QW; Sun, 15 Apr 2018 19:45:23 -0400
Received: by mail-qk0-x243.google.com with SMTP id f9so6882425qkm.12;
	Sun, 15 Apr 2018 16:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Z3UrdZ+xs17b+UgQAmKBEVDBeEfkwVN5yv24oZ632iw=;
	b=hKhKjynUxa6nyfWd34g+Aqu15bOhPamoxHlwUHUGWjKuqBWX6lCFkRQQPkdnKYaklQ
	C0FwkXm+LNdP3GQEhtR910qClkFx3K/Uh8l8Y1W7U/NwVh+3OiPdO/7PtDi+D07ysGT7
	6UHq+Nt0s+fB0ThbalGK+nEL8NYQSpvJiNcM6MEEp5KhlQu9unubOk+rwPYVPIRkRjpu
	4G9NBev9hAsz/KtWuM79/HtJLB8HDUpN5/8AywjmEzLp782ijTdVISnJ492V5iAVYwgs
	vKJ0u3koDK0AqFaJXoN5LUlxv7+tderQ+iaEjz93gTynOhHwF9Nf5R1NuLarQsFrY+HQ
	dARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Z3UrdZ+xs17b+UgQAmKBEVDBeEfkwVN5yv24oZ632iw=;
	b=cZyFnJ9vOP3w9Dg7ZHdOAtlphRfuRAmDtnA6Ty1GE96NoIq9U1MicCWRpTzcYlY7J9
	P4p9+v453n2GT1nHw3r0MMqUPU4OhxvNgkxs7VaYSiCcavbO1RWUsM2RXxRJE2s+HQ26
	xm6CVSOsbb0/XqD36QlH1Wj0m1X3onx52a9AlCRej1bnXD0KmoOuy1kZW6susKGUEgUm
	+kcMC7aons0nr9wINLI44SnoI4kFjX1JSYlJ0yE33DKUykFnMleHf8IGIkPc99uAgUzm
	AITlGZGYv/TkwmL95rYvJgA4NCfxB+fURukkA334FFbWWm9G30NrIHWreSjjkOTG0ukG
	ZVUQ==
X-Gm-Message-State: ALQs6tCgA4l+uz/4gRcg+0gJ997ma29Ho0vH7RxJn3HfakEUfWY/VpVC
	siW3Yt3pZRr5m8Oq/pQKmlRqbXFEU1c=
X-Google-Smtp-Source: AIpwx48aO/MuR7tm1cLx4FUbm5xfmHGQqj2IQ9lTKZ3rIQAFg1klIFb74SxgPJsPmWGZAqu0ESXz/Q==
X-Received: by 10.55.20.103 with SMTP id e100mr576182qkh.6.1523835923138;
	Sun, 15 Apr 2018 16:45:23 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.45.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:45:22 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Date: Sun, 15 Apr 2018 20:43:03 -0300
Message-Id: <20180415234307.28132-38-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v3 37/41] hw/virtio: Use the BYTE-based
 definitions
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
X-List-Received-Date: Sun, 15 Apr 2018 23:45:25 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/virtio/virtio-net.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index 02484dc94c..8765f6546e 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -14,6 +14,7 @@
 #ifndef QEMU_VIRTIO_NET_H
 #define QEMU_VIRTIO_NET_H
 
+#include "qemu/units.h"
 #include "standard-headers/linux/virtio_net.h"
 #include "hw/virtio/virtio.h"
 
@@ -44,7 +45,7 @@ typedef struct virtio_net_conf
 } virtio_net_conf;
 
 /* Maximum packet size we can receive from tap device: header + 64k */
-#define VIRTIO_NET_MAX_BUFSIZE (sizeof(struct virtio_net_hdr) + (64 << 10))
+#define VIRTIO_NET_MAX_BUFSIZE (sizeof(struct virtio_net_hdr) + (64 * K_BYTE))
 
 typedef struct VirtIONetQueue {
     VirtQueue *rx_vq;
-- 
2.17.0



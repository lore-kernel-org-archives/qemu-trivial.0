Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQ58-00057z-6P
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 11:41:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ55-000557-OM
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ54-0003So-UR
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:31 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:34165)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ52-0003RA-SU; Fri, 22 Sep 2017 11:41:28 -0400
Received: by mail-qt0-x241.google.com with SMTP id q8so892086qtb.1;
	Fri, 22 Sep 2017 08:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AVERwoUvsOv/OzYJBD0FjyfdMg9Ct3s150p6mRTtWoA=;
	b=iDSF8PseUzJFs2t5z1wXrkYkJWzMAHYTRiLuO4SYQIYix1iaLWxJ2AYDsoq0M96fVH
	EcMjl9+GdNTpjL1YHBndU6JL0B65EQpm/+gEntoWp1SKpwntrEV8MkodVxWEQX5sefXz
	gZ2xHQz/ZJpnO0fzp/XvlKZzuPD8U0CEFwlXDlzWlKQRx1yAJNu9ntA54ePtvxDHAu7L
	5olI0/EidxVGhzDZ2N5KX2P0yOs/o+WKhRrnQCgClKe/uySs6KQ+cumt4stbJGbE/S9A
	2jPoDhlZ3H07J+2xh4zodNKGpptN3O4YpuX9ZM2DM3e0x33kjSkmUzO5nhwNwcIZ4NS/
	7lsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=AVERwoUvsOv/OzYJBD0FjyfdMg9Ct3s150p6mRTtWoA=;
	b=RY1bBoAr8QGSRNIf/Xu7orlKfTr9Sq7rMG5OkPCJzYflnekV8FyzJeh1hksGNoGlex
	WkpbWcjeuN/PrVAkvyNqLRHbyERqL2uu0b8COrhUMGpwaFJSyJ53fjt/450ONF1wkfzI
	A/nHULyoROPkgEwPNBN+w4poplAxn5+WXl7B29waqFGL5prghddy4SxHdIuWJyW2Hu4k
	Y/Gjdt8SfTEU+XPGxHf+xKISEIsLOak4lxt/SFysYW62Baed+3sX9zO/z9xSFnjIGKAe
	s/W38F5SmeN6k2YaexU8Ktts4LvMHP7mreOpcI+bXXNueH0eMlGfGkuwl/xjtg+v/62V
	CFLQ==
X-Gm-Message-State: AHPjjUiErrYvxvj3pWMnfcIddhEh6Ay/O173q3NLTidKAS6ImzzXmUpU
	G4wn2azvphdfJcTthjxrXDTfP2Cyd4M=
X-Google-Smtp-Source: AOwi7QDx36N9yUSElVwTzRpLH31fH5EbKZeBGYwI/WAGKxe26xdgPuufA6JVUZIGtkHTTd8BsAHZZw==
X-Received: by 10.200.8.9 with SMTP id u9mr8485321qth.146.1506094888415;
	Fri, 22 Sep 2017 08:41:28 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z75sm71742qkb.71.2017.09.22.08.41.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 08:41:27 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 12:39:57 -0300
Message-Id: <20170922154014.29350-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 17/34] hw/virtio-balloon: remove old i386
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
X-List-Received-Date: Fri, 22 Sep 2017 15:41:32 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.14.1



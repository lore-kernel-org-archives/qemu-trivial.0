Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mHnka-00061b-MK
	for mharc-qemu-trivial@gnu.org; Sun, 22 Aug 2021 09:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrom06@ya.ru>)
 id 1mHm30-0006HT-Gl; Sun, 22 Aug 2021 07:53:54 -0400
Received: from forward102j.mail.yandex.net ([5.45.198.243]:52970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrom06@ya.ru>)
 id 1mHm2x-0004Fx-8g; Sun, 22 Aug 2021 07:53:54 -0400
Received: from forward103q.mail.yandex.net (forward103q.mail.yandex.net
 [IPv6:2a02:6b8:c0e:50:0:640:b21c:d009])
 by forward102j.mail.yandex.net (Yandex) with ESMTP id 921BA4BE74CB;
 Sun, 22 Aug 2021 14:53:43 +0300 (MSK)
Received: from vla1-bf865e4901fb.qloud-c.yandex.net
 (vla1-bf865e4901fb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:c86:0:640:bf86:5e49])
 by forward103q.mail.yandex.net (Yandex) with ESMTP id 8D19561E0002;
 Sun, 22 Aug 2021 14:53:43 +0300 (MSK)
Received: from vla3-178a3f795968.qloud-c.yandex.net
 (vla3-178a3f795968.qloud-c.yandex.net [2a02:6b8:c15:2584:0:640:178a:3f79])
 by vla1-bf865e4901fb.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 3jhBV2GEkk-rhIa9g7x; Sun, 22 Aug 2021 14:53:43 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail;
 t=1629633223; bh=XPBTUXwtFpOmZpipx+mQxl2NFKDM8fkFSf/c/YGP4ko=;
 h=Message-ID:Date:Subject:To:From;
 b=Ba8/hmge+15zGzf696ulDOZGmCGOanU+Ao+IHqhtn/yUu6eOzWC2Ta4L2yZwNLvBY
 wEQUMOIBQhOQhrcqcPfRNAemWedbwKsQEpWLxVXJOYm65T+WTQJsyXcsKfiFrR9Ul0
 ENEScp/BKPkYqCN9VEGUpp2V+3tKbZ67sIU+fJ/8=
Authentication-Results: vla1-bf865e4901fb.qloud-c.yandex.net;
 dkim=pass header.i=@ya.ru
Received: by vla3-178a3f795968.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id 2apwDxZqGf-rgMaBMC3; Sun, 22 Aug 2021 14:53:42 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Max <mrom06@ya.ru>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] virtio-vga,
 stubs: Fix qemu failing on virio-vga with blobs on when qemu compiled
 with modules enabled
Date: Sun, 22 Aug 2021 14:53:41 +0300
Message-ID: <2325716.RMfIIZ1vQW@max>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.45.198.243; envelope-from=mrom06@ya.ru;
 helo=forward102j.mail.yandex.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 22 Aug 2021 09:42:58 -0400
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Aug 2021 11:53:54 -0000

From f972dab518c6581a83f397c35b3d09b2ef6de674 Mon Sep 17 00:00:00 2001
From: max <mrom06@ya.ru>
Date: Sun, 22 Aug 2021 14:02:48 +0300
Subject: [PATCH] virtio-vga, stubs: Fix qemu failing on virio-vga with blobs on when qemu compiled with modules enabled

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/553
Signed-off-by: max <mrom06@ya.ru>
---
 stubs/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubs/meson.build b/stubs/meson.build
index d3fa864..beb737f 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -53,7 +53,7 @@ if have_system
   stub_ss.add(files('semihost.c'))
   stub_ss.add(files('usb-dev-stub.c'))
   stub_ss.add(files('xen-hw-stub.c'))
-  stub_ss.add(files('virtio-gpu-udmabuf.c'))
+  stub_ss.add(when: 'CONFIG_LINUX', if_false: files('virtio-gpu-udmabuf.c'))
 else
   stub_ss.add(files('qdev.c'))
 endif
-- 
2.32.0





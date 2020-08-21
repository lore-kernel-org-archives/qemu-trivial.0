Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k98z1-0006RX-Bz
	for mharc-qemu-trivial@gnu.org; Fri, 21 Aug 2020 11:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k98yz-0006Oe-GW
 for qemu-trivial@nongnu.org; Fri, 21 Aug 2020 11:29:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34102
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k98yx-00062y-RL
 for qemu-trivial@nongnu.org; Fri, 21 Aug 2020 11:29:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598023770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cvnB3su+5AR/IptiEh8NCGepT51dI755gYTFsFKWbp4=;
 b=LNqcL0eUfV3VffY8OW6b7EXE89IWuAHsY17HhwJ0EGQIAmCqDs25mWLL2L0X50ypmd7+XS
 aWPBYXbgCK0gEr3E5GrY7yOjTdkyaREfHZgmvfTylmVC+JvAj6ARtSXtsk3KrsrnCjVXgk
 HIGoIYrpqQXdS+bkGXt6JhCid03HBwU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-AKCZ9ga6MdiwvjzKlepxKQ-1; Fri, 21 Aug 2020 11:29:27 -0400
X-MC-Unique: AKCZ9ga6MdiwvjzKlepxKQ-1
Received: by mail-wr1-f70.google.com with SMTP id y6so643925wrs.11
 for <qemu-trivial@nongnu.org>; Fri, 21 Aug 2020 08:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cvnB3su+5AR/IptiEh8NCGepT51dI755gYTFsFKWbp4=;
 b=ZPRvAJ8PVEVKNTEF+x5edbXYA+p1d00wop+bRjspJim5aBmxZDvFCqWHcHyykJmG3T
 ECznwTS+nRWYBvE7OcRS8BSDNST4I2c7sh93ST9qsdvN2er4VDYcCdX2DmHEqj93WPSd
 508qvJMHKJc1JXLX1J8qkaRrIwff2k9f8yw0a1jCyOtkp3IN+zvaoMafUktGy28c4s9q
 CLfdvVzRHaBE5KLg6WEt53tslvi8H78enaZDmM8ijFjll4Kk9qVg2czqvhCsasoq7q3g
 bUUsxFIKaIR3Az+6mm283/ybDnHD6pqEo20N8fVFWT3TuRd1TNZxf/OI8TsdXynwreEq
 xlbg==
X-Gm-Message-State: AOAM530xuST1K5PKBljFFnPqLUfitjFi2vj45ASRbq/wfS68SGjHjCta
 P2IAfct0dsamD2WarolawY3+ScYiGMz22Qr9Csp06Ie+GYP3gbc2dRMWZrgDGeGi0JO1qHGV19Y
 CyllyZ0TdjVxtcgWUMA==
X-Received: by 2002:a5d:4947:: with SMTP id r7mr3168997wrs.165.1598023766600; 
 Fri, 21 Aug 2020 08:29:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzN7MZT2eswuXRZiNhQLEaRzZPpu8ejtlyqqeNgiW5I8KF0Wot5wxQKr6XYP3owgrwyMo0I9g==
X-Received: by 2002:a5d:4947:: with SMTP id r7mr3168988wrs.165.1598023766357; 
 Fri, 21 Aug 2020 08:29:26 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id k1sm4876329wrw.91.2020.08.21.08.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 08:29:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] meson: Do not consider qemu-keymap a 'tool'
Date: Fri, 21 Aug 2020 17:29:24 +0200
Message-Id: <20200821152924.1246930-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:55:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 21 Aug 2020 15:29:33 -0000

We need qemu-keymap to generate the keymaps.

This fixes when configuring with --disable-tools:

  Compiling C object qemu-keymap.p/qemu-keymap.c.o
  Compiling C object qemu-keymap.p/ui_input-keymap.c.o
  Compiling C object qemu-edid.p/qemu-edid.c.o
  ../ui/input-keymap.c:7:49: fatal error: ui/input-keymap-atset1-to-qcode.c.inc: No such file or directory
  compilation terminated.
  Makefile.ninja:688: recipe for target 'qemu-keymap.p/ui_input-keymap.c.o' failed
  make: *** [qemu-keymap.p/ui_input-keymap.c.o] Error 1

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index 808f50b07ef..4036af7181c 100644
--- a/meson.build
+++ b/meson.build
@@ -1062,6 +1062,11 @@ if 'CONFIG_GUEST_AGENT' in config_host
   subdir('qga')
 endif
 
+if 'CONFIG_XKBCOMMON' in config_host
+executable('qemu-keymap', files('qemu-keymap.c', 'ui/input-keymap.c'),
+           dependencies: [qemuutil, xkbcommon], install: true)
+endif
+
 if have_tools
   qemu_img = executable('qemu-img', [files('qemu-img.c'), hxdep],
              dependencies: [authz, block, crypto, io, qom, qemuutil], install: true)
@@ -1078,11 +1083,6 @@ if have_tools
   subdir('contrib/rdmacm-mux')
   subdir('contrib/elf2dmp')
 
-  if 'CONFIG_XKBCOMMON' in config_host
-    executable('qemu-keymap', files('qemu-keymap.c', 'ui/input-keymap.c'),
-               dependencies: [qemuutil, xkbcommon], install: true)
-  endif
-
   executable('qemu-edid', files('qemu-edid.c', 'hw/display/edid-generate.c'),
              dependencies: qemuutil,
              install: true)
-- 
2.26.2



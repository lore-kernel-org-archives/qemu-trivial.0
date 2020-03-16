Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDqjP-000814-RD
	for mharc-qemu-trivial@gnu.org; Mon, 16 Mar 2020 10:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jDqjN-00080A-Gv
 for qemu-trivial@nongnu.org; Mon, 16 Mar 2020 10:28:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jDqjL-0002sJ-Iy
 for qemu-trivial@nongnu.org; Mon, 16 Mar 2020 10:28:37 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:50822
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jDqjL-0002ra-F4
 for qemu-trivial@nongnu.org; Mon, 16 Mar 2020 10:28:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584368915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fOKrfo5bbyxSEwW8Bb/6gBXkGPftjp1ADluFRQkIlR8=;
 b=dF8gJ8M6SgkNs2vSCkvBLwOyrakVtO8bCiwskhwEjcEgwv9dpLyPM+XAmoDSUmNkGIYPxp
 Or3eRkpm8yvybHqydtO0KOkF7BZ+WgfdZrPDAvrDnLypMTvYOit0CBE2T6Xl2q7ch0y/jK
 G7v6jbTTVhpOP0V7eofub3GSOYLGYhE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-w5_tsxmkNJ2D1MpUk5P5FQ-1; Mon, 16 Mar 2020 10:28:32 -0400
X-MC-Unique: w5_tsxmkNJ2D1MpUk5P5FQ-1
Received: by mail-wm1-f71.google.com with SMTP id g26so4684196wmk.6
 for <qemu-trivial@nongnu.org>; Mon, 16 Mar 2020 07:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TDKRgixbJAcVUYD4Ybb2gvKa7rLyvdtOHGcjQKF6N9w=;
 b=FzVW8rmxbd5i0wsRgDHx8+ZDTtTqFurHURx94nRbweQ43ldygFKFRwxOzNykG3KTp+
 d/3KDPbshOLg4cwzt2B5Qzt9q+EqwOgQqju0ymRCHXdCR00JsuskJl7QP08+3utDciyj
 iKdoUDLF84UuAmx5eN9QVVx7uxDd1T34pTQ9KvKL/m5WsO8mWj0SpY/zfQwWulasZtM/
 MGD4AsHPIOcGmbd/lA/VI8C/LWodkoIZamVHfb7be4Cwt+3RlXYQj/yZ279Qy320x8aQ
 +oQXIQzv7QP6NZ+oTkSqR37EV2XzEQMvlZd3UIodSjhk+bxJYZaMs1BqgTwBK/AOyW6O
 fv4A==
X-Gm-Message-State: ANhLgQ2B6FYzxma2tESO2rltJlWfDDxdHMQ3NQr+5D9yRYzu/2pQrg1R
 59vGZnBWDtlcd/G5W8tO/YGahc4lTcZWeL9+ijbp/1WGb5JfDpM3Yjr+UmgkutAvfyDN2voFn+P
 P2hYCmraX0oIJEscf9Q==
X-Received: by 2002:a7b:c391:: with SMTP id s17mr27039051wmj.55.1584368911114; 
 Mon, 16 Mar 2020 07:28:31 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu6eNhDEYbXHwMl5ihSAYArb+HJ5waefmoYQoCCKuDAoI9gtrCoKXJA0yOJKdtgD+h3j7Pc8A==
X-Received: by 2002:a7b:c391:: with SMTP id s17mr27039033wmj.55.1584368910848; 
 Mon, 16 Mar 2020 07:28:30 -0700 (PDT)
Received: from localhost.localdomain (191.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.191])
 by smtp.gmail.com with ESMTPSA id z6sm94673wrp.95.2020.03.16.07.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 07:28:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Michael Walle <michael@walle.cc>,
 =?UTF-8?q?=C3=81kos=20Kov=C3=A1cs?= <akoskovacs@gmx.com>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Emilio G . Cota" <cota@braap.org>, Richard Henderson <rth@twiddle.net>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2] MAINTAINERS: Mark the LatticeMico32 target as orphan
Date: Mon, 16 Mar 2020 15:28:27 +0100
Message-Id: <20200316142827.20867-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Mon, 16 Mar 2020 14:28:39 -0000

Michael Walle expressed his desire to orphan the lm32 target [*]:

  I guess it is time to pull the plug. Mainly, because I have
  no time for this anymore. I've always worked on this on my
  spare time and life changed. And secondly, I guess RISC-V is
  taking over ;) It has a far better ecosystem. Also, to my
  knowledge the only (public) user of LM32 is milkymist and this
  project is dead for years now..

  So time to say goodbye. It was fun and I've learned a lot -
  technically and also how a huge open source project works.
  Thank you everyone for that :)

  Basically everything still works and there are even TCG test
  cases which covers all instructions the processor has.

Many thanks to Michael for his substantial contributions to QEMU,
and for maintaining the LM32 target for various years!

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg605024.html

Acked-by: Michael Walle <michael@walle.cc>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Also orphan machines, added Michael A-b tag
---
 MAINTAINERS | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 32867bc636..c89bf61989 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -183,8 +183,8 @@ F: hw/net/*i82596*
 F: include/hw/net/lasi_82596.h
=20
 LM32 TCG CPUs
-M: Michael Walle <michael@walle.cc>
-S: Maintained
+R: Michael Walle <michael@walle.cc>
+S: Orphan
 F: target/lm32/
 F: disas/lm32.c
 F: hw/lm32/
@@ -945,13 +945,13 @@ F: pc-bios/hppa-firmware.img
 LM32 Machines
 -------------
 EVR32 and uclinux BSP
-M: Michael Walle <michael@walle.cc>
-S: Maintained
+R: Michael Walle <michael@walle.cc>
+S: Orphan
 F: hw/lm32/lm32_boards.c
=20
 milkymist
-M: Michael Walle <michael@walle.cc>
-S: Maintained
+R: Michael Walle <michael@walle.cc>
+S: Orphan
 F: hw/lm32/milkymist.c
=20
 M68K Machines
--=20
2.21.1



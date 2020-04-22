Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRFUR-0006XP-61
	for mharc-qemu-trivial@gnu.org; Wed, 22 Apr 2020 09:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59320)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFUL-0006Pv-AY
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFUF-0002p5-Js
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:29 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25294
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRFUF-0002mS-5m
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587562342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CAm/ELJG3BqWeqIODV3zHLDQPYZpESaEVU+juqiMjnQ=;
 b=AJtyyL0hmQ41jY9wiENYbJcBpjfcw4SjG7Sp3SxOh0eht+p209klmIHekolwH/ixm7V8yp
 WjLd8a7InoVqso+H4L3u+Diy4A+u1tF5jrDt0jJJ4/WXKUpGG4WBh1Na7q+pwg+mwE90PL
 x5wExaBfA/iBRY89lwufOh/PcTDwT+w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-KjRaNyS6MROy91yTEiGskg-1; Wed, 22 Apr 2020 09:32:21 -0400
X-MC-Unique: KjRaNyS6MROy91yTEiGskg-1
Received: by mail-wm1-f71.google.com with SMTP id 14so790376wmo.9
 for <qemu-trivial@nongnu.org>; Wed, 22 Apr 2020 06:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2FKpjcCgxFkJLIX2UQN4Z0uyrzf8czNZGVSlJzZoMlE=;
 b=brm/zx51yu1Rdu7ND09R6WP9nh0P3pPYNagyYNxc2YMmbHudKcCeoD19PmVCV+DdZS
 Ppo9qhqb2PG3Y5X56TEEPqYInKXcHaMErzr3M1+a6TryaNrg3ipZVF44hKG+n0scOnFj
 rNuOl80qBpZDATByFSW4IShictuWRBwBQG6yOuBq1sCqHHwjGyDrVCHlSE4pElESyRyq
 bpoCr/p1ZcYI2GjpN0YJ4WYm8y0jwfychwLFSGplKRcq2rPpGTZ/vHWLZOt5lOqdRCnD
 xbQCC4F0AXY8UkBor5jYyH3fUoD98QGfhlU6xYIZaGbyhTU6dIyFB0YaiFY/HwGFn4mD
 H/xg==
X-Gm-Message-State: AGi0PubjEazLgvAhCYS1yW3mcBCJGly1IhEn5d4jTaLyz3lzUo/ajK6S
 ne0cXSDJheZ/JGor4fNrClkri2wLbzx+uLgZgtpOhK4bkzX5F4arxG/uc8z7KIX1dwKce/+vF8S
 r1gw36b9MfTpjjUttNQ==
X-Received: by 2002:a05:600c:2255:: with SMTP id
 a21mr10753405wmm.150.1587562339896; 
 Wed, 22 Apr 2020 06:32:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypKBHCxVFL6Ws9hQAYww/uSUD16SaeWprZDoQADn+KRz09ut8eE6N/X1REGfFk5aEplfb6ksWA==
X-Received: by 2002:a05:600c:2255:: with SMTP id
 a21mr10753390wmm.150.1587562339737; 
 Wed, 22 Apr 2020 06:32:19 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id y7sm8374745wmb.43.2020.04.22.06.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 06:32:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 qemu-ppc@nongnu.org (open list:sam460ex),
 qemu-block@nongnu.org (open list:IDE)
Subject: [PATCH v3 5/9] hw/ide/sii3112: Remove dead assignment
Date: Wed, 22 Apr 2020 15:31:48 +0200
Message-Id: <20200422133152.16770-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200422133152.16770-1-philmd@redhat.com>
References: <20200422133152.16770-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:12:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Wed, 22 Apr 2020 13:32:31 -0000

Fix warning reported by Clang static code analyzer:

    CC      hw/ide/sii3112.o
  hw/ide/sii3112.c:204:9: warning: Value stored to 'val' is never read
          val =3D 0;
          ^     ~

Fixes: a9dd6604
Reported-by: Clang Static Analyzer
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ide/sii3112.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index d69079c3d9..94d2b57f95 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -42,7 +42,7 @@ static uint64_t sii3112_reg_read(void *opaque, hwaddr add=
r,
                                 unsigned int size)
 {
     SiI3112PCIState *d =3D opaque;
-    uint64_t val =3D 0;
+    uint64_t val;
=20
     switch (addr) {
     case 0x00:
@@ -126,6 +126,7 @@ static uint64_t sii3112_reg_read(void *opaque, hwaddr a=
ddr,
         break;
     default:
         val =3D 0;
+        break;
     }
     trace_sii3112_read(size, addr, val);
     return val;
@@ -201,7 +202,7 @@ static void sii3112_reg_write(void *opaque, hwaddr addr=
,
         d->regs[1].sien =3D (val >> 16) & 0x3eed;
         break;
     default:
-        val =3D 0;
+        break;
     }
 }
=20
--=20
2.21.1



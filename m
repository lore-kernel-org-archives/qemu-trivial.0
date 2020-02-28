Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7e6j-0007Lb-3k
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 06:47:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41117)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7e6g-0007L6-5h
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7e6d-00018P-U3
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:01 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59593
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7e6d-00018A-Qq
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582890418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JwOs2po6nVBrNz+DhsO8Xnl0PhYikRZa4JYienbwBPU=;
 b=GMgxbPb3n2MdhM8CgbEy3r8SqEfDxu99xPdZD7iR14ejrxew27jAuKPhWZ6RzbrYm+Yyvd
 aNGB2txh2UWGbO2tgqnSYlSUiVyDQU+AduSfARpJ6R6fj8LV40QTKB8oKogpJq40NKvAC3
 pCpJdbGAambfyp0nqHu1/qC9ZglSy+g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-yhhrPYDoPFGWLsKLQ4Sxuw-1; Fri, 28 Feb 2020 06:46:57 -0500
X-MC-Unique: yhhrPYDoPFGWLsKLQ4Sxuw-1
Received: by mail-wm1-f69.google.com with SMTP id j130so1044452wmj.9
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 03:46:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CpNdsjNPiC6/DnLPjwvW92rGWlXZRi+/lAbWPRuMDaY=;
 b=s7ngFtyHEBpUtApzGrdEIxuS4o4z5+1OIKEZGPdlgttF9vbA1VilZdTlB79RYWvMbF
 D2BXsqIR9/DauSYPIRlpifjoXoOj4Y47VYgXw4Xlo7C7D10XpnBOqbgRRH0BNkrTJtd2
 B0Lk7vG8Tb9nP3OzLd2xmjxncqhxyLc8yf+Z2nG1VAyqhYqR1Yx10yuUYCEgdaume+s2
 X5kr/JrPtORwUPcnLe8iqW9pybvg3Aw6FcQ/bJYpjj4qLuFdMaQcqg4e38vyp7atODpi
 n3lZPHTzI6U1GuQwztZ9KPP/vSiEN6py2ASAPDQiS4UxD2iIXS/fRWZUmw847NYTLf5x
 Iiaw==
X-Gm-Message-State: APjAAAVPtQk6mOY58TRlLTuMc0svBez9PAQVOJ4P6vhaqaJetDDUEdYi
 bOWR3+CnmhZbi7/Cln3zG3xo+JQtxpqx0I0ILcXcGOccNkkP4z6wthxJWtmeiegGBTc+A1sNV9J
 hsuKX6QAplf6Ql9iX6w==
X-Received: by 2002:a5d:4b03:: with SMTP id v3mr4785712wrq.81.1582890415984;
 Fri, 28 Feb 2020 03:46:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqxM2/smC26C3TpXbjvfNECRInDeKtZIZJPjM3yZ9lkl22pRKcGsi5IATwr0AxhD1KPwzkMb6w==
X-Received: by 2002:a5d:4b03:: with SMTP id v3mr4785695wrq.81.1582890415762;
 Fri, 28 Feb 2020 03:46:55 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id q138sm1127219wme.41.2020.02.28.03.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:46:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v2 01/18] vl: Add missing "hw/boards.h" include
Date: Fri, 28 Feb 2020 12:46:32 +0100
Message-Id: <20200228114649.12818-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200228114649.12818-1-philmd@redhat.com>
References: <20200228114649.12818-1-philmd@redhat.com>
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
X-List-Received-Date: Fri, 28 Feb 2020 11:47:03 -0000

vl.c calls machine_usb() declared in "hw/boards.h". Include it.

This fixes (when modifying unrelated headers):

  vl.c:1283:10: error: implicit declaration of function 'machine_usb' is in=
valid in C99 [-Werror,-Wimplicit-function-declaration]
      if (!machine_usb(current_machine)) {
           ^
  vl.c:1283:10: error: this function declaration is not a prototype [-Werro=
r,-Wstrict-prototypes]
  vl.c:1283:22: error: use of undeclared identifier 'current_machine'
      if (!machine_usb(current_machine)) {
                       ^

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 softmmu/vl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 16ff5a16a3..20b7201451 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu/units.h"
+#include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu-version.h"
--=20
2.21.1



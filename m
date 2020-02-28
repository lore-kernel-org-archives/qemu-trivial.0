Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7e7D-0008DT-Qi
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 06:47:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41283)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7e7A-000862-VI
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7e79-0001Je-To
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:32 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42787
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7e79-0001J1-Qs
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582890449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=73OgrN2M+rMTohi90iBlDHcrDQ0XOXk9OuciFu+Dx5c=;
 b=MpHaLUBmOg24ni1lZi3xC1LymO2LYimkzhU53Q257Ipjxek2djZ73JUXPx9gZrrLymNdQ6
 KTx4LonJ7gvMgJQt6v4e7rFDwftWN9OqSCxXwq/kw03cWC9WVMm/Jsi8+U/RVb2FZRdS3A
 ulCP8FXNZo59iX9cWJiISnbBwjQLUmk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-Z7_v77coOY6lmqnBtt-u_w-1; Fri, 28 Feb 2020 06:47:28 -0500
X-MC-Unique: Z7_v77coOY6lmqnBtt-u_w-1
Received: by mail-wr1-f72.google.com with SMTP id 72so1224346wrc.6
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 03:47:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2nnjZZT8SRwguHek+59VriRLt7OR5qsxOtTlGAQZhfs=;
 b=UA9xo+mN5YWntnvn0PShv4GAjJ0YTf1kAh0tAYI+KJ3GpfwnGty+TOBTCbpTo+el+W
 pIHlR1e4sQA7r7nK/dCOewMj6LoA0GzPu+dzT/rcg9Plu1q072b8Wf8bYRq/+7S1Y8w/
 OngQ3gCIpdjG8ZBZ0o0hB/JHmIvv/7i5gWNCBrct+Q676riC3y02Z/PbpWSPKWlk36cT
 gD/nnEHqeBwEdUMdUg3enJaiyf4XISytJ3Lrd+rVo6iTeIgDQT6fBqOF8jz75mHbGPRc
 KS3Xlx10pgdnv+tWjcexD0FqYH9Oh+C/N0NagdrlGU9dyklzdHlRm8QZh8lZkvGenMCk
 4Gyg==
X-Gm-Message-State: APjAAAWbVVsreHgdqFZ75xX1gFW9gykOHI2YjDNXvAfeTALj6sAeqHg5
 dK8XzMq70AZUufZrarAPrGPhCmVE6TJLpVR08JobSkshHsYEFkyMGt49XOEPU8go60yTrUQS5k6
 zIdFmnjCKLVWFjkvb6A==
X-Received: by 2002:a1c:cc06:: with SMTP id h6mr4661033wmb.118.1582890446801; 
 Fri, 28 Feb 2020 03:47:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqwzy+LStQa1gSChylqIu8s/TQY+qa5cvUG4+ApfOss4KtTM50KgxciBNLjGP10gzmJoTxvMhg==
X-Received: by 2002:a1c:cc06:: with SMTP id h6mr4661014wmb.118.1582890446582; 
 Fri, 28 Feb 2020 03:47:26 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id f1sm12392933wro.85.2020.02.28.03.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:47:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 05/18] hw/usb/dev-storage: Remove unused "ui/console.h"
 header
Date: Fri, 28 Feb 2020 12:46:36 +0100
Message-Id: <20200228114649.12818-6-philmd@redhat.com>
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
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Fri, 28 Feb 2020 11:47:34 -0000

The USB models related to storage don't need anything from
"ui/console.h". Remove it.

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/usb/dev-storage.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index 90da008df1..4883c1d89e 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -17,7 +17,6 @@
 #include "desc.h"
 #include "hw/qdev-properties.h"
 #include "hw/scsi/scsi.h"
-#include "ui/console.h"
 #include "migration/vmstate.h"
 #include "monitor/monitor.h"
 #include "sysemu/sysemu.h"
--=20
2.21.1



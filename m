Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7e6p-0007Wv-9x
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 06:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41195)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7e6m-0007QE-JV
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7e6l-0001AZ-KN
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44557
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7e6l-0001AU-HW
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582890427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lu32hqItUP7dM4PGcIuD4sRgE5GBtRTQN7Q926tcd10=;
 b=PgSZ8uQz+EzwF0zTI1x4yZk5orHkJkYw8QQM1nJdBhXx4SmQTN5wx0ZyB0C8GNywbkqtx5
 KRMmafVtDX3xy1Iw5b3B995CJ5fpxypvYWla+JHlxZhwduKISvxk+hulVSO52mF2wr1NkM
 /x6Kmk972Mtp51kUEg26onWHOGv7wJo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-FCjVWTvrNMOx-cKQNLRQmA-1; Fri, 28 Feb 2020 06:47:02 -0500
X-MC-Unique: FCjVWTvrNMOx-cKQNLRQmA-1
Received: by mail-wm1-f72.google.com with SMTP id p4so222721wmp.0
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 03:47:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BP6/+KyIobA7aYPnUFr/bb+oOTNiJS/7LfeIG0A45xo=;
 b=KvI+yBuoOuxaYJLijm6e0g7O0VpXS92WgU11Eoyg5/ua2PxYF6LUQNLP5L7R8OljK/
 7+omhtLxrOn2TeHiBYsBROhSKSBESIyV+lU3LH8+W9AYQEXjOvSg1F5jAA1w4rRJ6DO7
 YA4xyHBoCmjfwpbKU7sgY9XRH8KOcleplefK5YHGkdlKTVA1J7Kxg11hnRY7/Ky66jM7
 6t4BAz2utX5EzxHMv+yTIGWxFCozvV3PIio1cAKAOICCQ7UDuWsHBh33Dsb8RoaYcHx1
 Jaej7hmILwt+UEgZ/xYk2KOG0Vvbknw8w178sKTgyB5CwGnlQmVuWtQymdoKHgRnVkIO
 Xlnw==
X-Gm-Message-State: APjAAAXSYopibPxpy81xqI5cuabjN8payLCgPRnL5F/UM0+selvNra9c
 B02vK5Sh3tlq80pu/iMIkGJjy7BOd3EWqiVJxyR1bEEIlaaEiUcZ+pnFwzDu0IlTC/PzYCejoCY
 x21qQ5rPrdoDl9MdxwQ==
X-Received: by 2002:adf:a18b:: with SMTP id u11mr4669735wru.148.1582890421504; 
 Fri, 28 Feb 2020 03:47:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqz0BAxZC0vuVfdrKTugBW7uZS7nErJ64gXrD9UqgMAY8B2pOEjTh7K/y8dhhzFCNjK3dECNSw==
X-Received: by 2002:adf:a18b:: with SMTP id u11mr4669648wru.148.1582890419862; 
 Fri, 28 Feb 2020 03:46:59 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id q138sm1127219wme.41.2020.02.28.03.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:46:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 03/18] hw/i386/ioapic_internal: Remove unused
 "hw/i386/ioapic.h" header
Date: Fri, 28 Feb 2020 12:46:34 +0100
Message-Id: <20200228114649.12818-4-philmd@redhat.com>
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
X-List-Received-Date: Fri, 28 Feb 2020 11:47:09 -0000

The "ioapic_internal.h" does not use anything from
"hw/i386/ioapic.h", remove it.

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/i386/ioapic_internal.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_int=
ernal.h
index d46c87c510..fe06938bda 100644
--- a/include/hw/i386/ioapic_internal.h
+++ b/include/hw/i386/ioapic_internal.h
@@ -23,7 +23,6 @@
 #define QEMU_IOAPIC_INTERNAL_H
=20
 #include "exec/memory.h"
-#include "hw/i386/ioapic.h"
 #include "hw/sysbus.h"
 #include "qemu/notify.h"
=20
--=20
2.21.1



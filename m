Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7e8E-0001db-RX
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 06:48:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41592)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7e8C-0001b8-Ok
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7e88-0001Ya-J9
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:35 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45024
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7e88-0001Y2-1c
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582890510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a2Kfw5nEVFcSKCWzcOhteR6YpW54ZFAnQQKQBI2MXqg=;
 b=c+NLD6GcItXbC7gzGt39Vr/iH4a8mfZk7WhnSxeHozAqAvoOBe1NgQTCPBB0gqhsHKXEAm
 wQSBT7RdxOF/ajzdSaX0TW5llK8DDdBqpr4E2wcJLNSxYd3MJcjmo9A732nLlILWupkg+U
 d25rSTso7jXnAcTeEPi6Ry5GkcVHygo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-JRBSEr0TPlOlh6gKx15fBA-1; Fri, 28 Feb 2020 06:48:27 -0500
X-MC-Unique: JRBSEr0TPlOlh6gKx15fBA-1
Received: by mail-wm1-f71.google.com with SMTP id w12so607409wmc.3
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 03:48:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UifnvwpH88RzXCfeYrjEOymeXNUW1ByC1YLamNivAUM=;
 b=XkLQXGvpvb7CW2fnbJQ+tX3ZMD4jXdP/Ex+bRmjYOSTmhGs8JQJOSBLHVpgtwWTuZ9
 JjY1HRpFEtNwmhjd+MbwhSA/exmOS+PeQaYwIJYunTe4PTlEDb9rYE86oGsrbojhZZh2
 zLmI5/FLO9N/DOS+taz71OHHkrexunDghaPn/ZBYFOXmeV4KeSycRoIGAj7Qv3Rc4xey
 9pGjRsxTJs8MqSra3kd5MWmvsWMBT4tqSZ27tbB7N6jBMdz3nK13dH6UkTTNQt8PEH1t
 IdJBBgsAiIm/s4bwPDnjAecygFveahR4PuOhW7kxBZqvQsY3TfEHCz3zio2YkjOlj0rE
 BtWg==
X-Gm-Message-State: APjAAAV6NHj0f4/8/lU/OsPqwhpkaKhMvdxUS3FKR5U3oVLvYk0oJnXb
 wy8Ph5aLkL69R2U4U4dEz9uS16GTx/svMmoewQwFR1JEkccNlYwkjfhM4KwD3WlbfFqmQ+9MTsF
 1jjsp3tSHez6Grw4Lzw==
X-Received: by 2002:a05:6000:1142:: with SMTP id
 d2mr4433725wrx.62.1582890505822; 
 Fri, 28 Feb 2020 03:48:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqw/YOGrrKpPqdBU/A8oP0QeSk83ur85tLpWBnJ8ZzExIf0wpFgLDVPZSkRhqNA7dkInB/MwmQ==
X-Received: by 2002:a05:6000:1142:: with SMTP id
 d2mr4433710wrx.62.1582890505589; 
 Fri, 28 Feb 2020 03:48:25 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id a7sm1736226wmj.12.2020.02.28.03.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:48:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 13/18] hw/i2c/smbus_ich9: Include "qemu/range.h"
Date: Fri, 28 Feb 2020 12:46:44 +0100
Message-Id: <20200228114649.12818-14-philmd@redhat.com>
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
X-List-Received-Date: Fri, 28 Feb 2020 11:48:37 -0000

hw/i2c/smbus_ich9.c calls range_covers_byte(). Include "qemu/range.h"
which declares it.

This fixes (when modifying unrelated headers):

  hw/i2c/smbus_ich9.c:66:9: error: implicit declaration of function 'range_=
covers_byte' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
      if (range_covers_byte(address, len, ICH9_SMB_HOSTC)) {
          ^

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i2c/smbus_ich9.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
index fd50fb851a..48f1ff4191 100644
--- a/hw/i2c/smbus_ich9.c
+++ b/hw/i2c/smbus_ich9.c
@@ -21,6 +21,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/range.h"
 #include "hw/i2c/pm_smbus.h"
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
--=20
2.21.1



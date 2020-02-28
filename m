Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7e6j-0007Lz-Na
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 06:47:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41146)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7e6g-0007LB-Vj
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7e6f-00018t-Ux
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27055
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7e6f-00018f-RF
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582890421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c3546yi0MNEa4PeS8dV7Vwzlyh9MvQJ56uhzxTJLw0w=;
 b=d+N1dLOq+LcvnjqJbSRSZhq/i9Ls4lTfMdSwLjo8Ee1IDA0TflQOggQunNyAsuo7QbtLK8
 0sxXAr8eWygTG2P/8s6jWvmyrrwMx9JFImHkz5lrUqhcYEBCs8G9qPIldKlledxz3f7Kmy
 hFf7swhKFVC3DV44jVOMqKHlW/UU3cU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-zytr57bBMwG34I-3RqPOJA-1; Fri, 28 Feb 2020 06:46:59 -0500
X-MC-Unique: zytr57bBMwG34I-3RqPOJA-1
Received: by mail-wr1-f72.google.com with SMTP id p11so1222013wrn.10
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 03:46:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f7g55rjk1KrrisnX/ncLGxvcfXQdY0DJfVs+Hz1podY=;
 b=VB3MHNdYn2sfoWryvcF3WT2RKkZh+YKOFt/F5BArPf+YkkBuD44DZdbf/RpnkuNHK3
 yL/pz4rgxivV1QMIgyzfLIC43Vw8RM2xOED85XuMmFQwMd+8/WG6NgEAIuqRYKpVS20o
 3P1VgSBMfP3EXPmtU8VVKx2KnVLsstokL4t2H+CFbKWL6Odw7Hu9QNS+d7p0cCiatiAm
 1KHXUC9W2J9JRdt+fxuQQCeFyVNICScfnZsSLVnanLi9gUIOUoTIizeYkO1UpUmfXyFf
 G+FBKHQfiCs0ihqvKMwuNhWn6jmqEM+8y/mdk9D3rHx9fcpD4Q8455cwh8nV0wmY5hVC
 7myw==
X-Gm-Message-State: APjAAAWeAQrr9m/C3PXn7M6pDDoHstCTMubHrxDcxznFw1KA8mxuEMAL
 SbzWHRHBZNJSd0sBEiZR/UUcDAmZ+0PRVXy8bX/N4aQXp7DmVrBmoOXP9/hJ3DKAayLmEf6krdO
 aGTZLWFeBVKUifVnLRA==
X-Received: by 2002:adf:f7c4:: with SMTP id a4mr4494906wrq.361.1582890418145; 
 Fri, 28 Feb 2020 03:46:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqxnzX87j3iygThg/Ua8j06sDbyEO3Vmhe1XCY219T9ODOfqM0dNbos+7UVje+Hl6zfQMiBUGg==
X-Received: by 2002:adf:f7c4:: with SMTP id a4mr4494890wrq.361.1582890417971; 
 Fri, 28 Feb 2020 03:46:57 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id q138sm1127219wme.41.2020.02.28.03.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:46:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 02/18] hw/southbridge/ich9: Removed unused headers
Date: Fri, 28 Feb 2020 12:46:33 +0100
Message-Id: <20200228114649.12818-3-philmd@redhat.com>
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
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Fri, 28 Feb 2020 11:47:04 -0000

The ICH9 chipset is not X86/PC specific.

These files don't use anything declared by the "hw/i386/pc.h"
or "hw/i386/ioapic.h" headers. Remove them.

Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/i386/ich9.h | 1 -
 hw/acpi/ich9.c         | 1 -
 hw/isa/lpc_ich9.c      | 1 -
 3 files changed, 3 deletions(-)

diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 72e803f6e2..a98d10b252 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -5,7 +5,6 @@
 #include "hw/sysbus.h"
 #include "hw/i386/pc.h"
 #include "hw/isa/apm.h"
-#include "hw/i386/ioapic.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci_bridge.h"
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 2034dd749e..fdd0a6c79e 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -27,7 +27,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
-#include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
 #include "qemu/timer.h"
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index f85b484eac..cb79616ced 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -37,7 +37,6 @@
 #include "migration/vmstate.h"
 #include "hw/irq.h"
 #include "hw/isa/apm.h"
-#include "hw/i386/ioapic.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/i386/ich9.h"
--=20
2.21.1



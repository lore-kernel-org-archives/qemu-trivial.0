Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7e8l-0002PR-B9
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 06:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41700)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7e8e-0002Ek-N5
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:49:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7e8d-0001hV-Mt
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:49:04 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:56434
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7e8d-0001gd-IT
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:49:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582890542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qTdLeO/j/e6eP/jAK/QSTo2ZeP6lsa0GUR9L2pxBWEY=;
 b=eoMCN7fPsch90+bZG5+w29u3uYAC8wpbWi9a7VhGw2RzJotrd9O+ePJyf+dbPMNl0lXf52
 SZE+TfbRyEWRiYK6s6Iip5anUAhBc9I07zHP193AF/NfzodcJnLCmmsPQoaDeMj0ae0Ekx
 /WQwTHS/tZ6vo/l3xBdlk66YdN4ovfM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-ltbOhRCcPomOy9PAz_nFHw-1; Fri, 28 Feb 2020 06:48:59 -0500
X-MC-Unique: ltbOhRCcPomOy9PAz_nFHw-1
Received: by mail-wm1-f71.google.com with SMTP id w12so607886wmc.3
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 03:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dgOorqpkh3gN4b7sAM5gmxbiZ9joAGYWI1QUJBzOx9g=;
 b=bp9aNHFUWASTgeJp6tKe3zF1fs5hIdkUEn2WwiZZ7nY169YhNTAUNDj4+MpCkuv4cg
 BEdsxYbFh9ge6Tz+4FkmVxFZyYN2iiejnsq70+DwWhCWH4mMeK67AwtmISCBmq86B+fs
 45FSSbVkymwwVrf/B09Ogz2VDVJ/xYsIOqbMsqspUgr1I0XEDNXgg+oZo7Eoo1+xGboT
 aMixIbKkb8mBTX1zO1sNJzUyeUGXUnAuaqMj3MIx6M1t9XKOdIlf7hU5OG6ZVMhQNQmN
 G/j0yaxmC+o6KPqrZJUuJyrSNikoWjScE/KdivBhzkC5IaE6lQFm0WOnrR7XBJHeJYB4
 6HWw==
X-Gm-Message-State: APjAAAUi3mhQ2wJjdwYhFQszlWUti7GUPbcLtZgyDx0Ev6oRNbU9ogwi
 aaJpwz/+H4/EVO4b9WQ/2NaekrYBuFsCWZO7Uk9sN2jpY2nFrTYGKBfKQCxa40TCHJeY8WgobWB
 2c/+l+JYu4kNtem8wSA==
X-Received: by 2002:a7b:cf39:: with SMTP id m25mr4483313wmg.146.1582890538277; 
 Fri, 28 Feb 2020 03:48:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqzSECnXVOCZYvsdQaRgO3slzYjheg1QWBdEwrqqjtLopf28EMMyXYnzPgpXVuQahIv26lkZyQ==
X-Received: by 2002:a7b:cf39:: with SMTP id m25mr4483298wmg.146.1582890538096; 
 Fri, 28 Feb 2020 03:48:58 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id 133sm2082799wmd.5.2020.02.28.03.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:48:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 18/18] hw/i386/pc: Clean up includes
Date: Fri, 28 Feb 2020 12:46:49 +0100
Message-Id: <20200228114649.12818-19-philmd@redhat.com>
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
X-List-Received-Date: Fri, 28 Feb 2020 11:49:07 -0000

Various headers are not required by hw/i386/pc.h:

 - "qemu/range.h"
 - "qemu/bitmap.h"
 - "qemu/module.h"
 - "exec/memory.h"
 - "hw/pci/pci.h"
 - "hw/mem/pc-dimm.h"
 - "hw/mem/nvdimm.h"
 - "net/net.h"

Remove them.

Add 3 headers that were missing:

 - "hw/hotplug.h"

   PCMachineState::acpi_dev is of type HotplugHandler

 - "qemu/notify.h"

   PCMachineState::machine_done is of type Notifier

 - "qapi/qapi-types-common.h"

   PCMachineState::vmport/smm is of type OnOffAuto

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/i386/pc.h | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index d5ac76d54e..6ab6eda046 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -1,20 +1,15 @@
 #ifndef HW_PC_H
 #define HW_PC_H
=20
-#include "exec/memory.h"
+#include "qemu/notify.h"
+#include "qapi/qapi-types-common.h"
 #include "hw/boards.h"
 #include "hw/block/fdc.h"
 #include "hw/block/flash.h"
-#include "net/net.h"
 #include "hw/i386/x86.h"
=20
-#include "qemu/range.h"
-#include "qemu/bitmap.h"
-#include "qemu/module.h"
-#include "hw/pci/pci.h"
-#include "hw/mem/pc-dimm.h"
-#include "hw/mem/nvdimm.h"
 #include "hw/acpi/acpi_dev_interface.h"
+#include "hw/hotplug.h"
=20
 #define HPET_INTCAP "hpet-intcap"
=20
--=20
2.21.1



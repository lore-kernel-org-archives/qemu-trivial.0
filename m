Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNRYm-0007Fk-E3
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 19:28:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYj-0007E8-Es
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:28:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYi-000192-Bf
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:28:13 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:36723)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYg-00016j-F3; Mon, 28 May 2018 19:28:10 -0400
Received: by mail-qt0-x243.google.com with SMTP id q6-v6so16566521qtn.3;
	Mon, 28 May 2018 16:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mG/yutMKmd6wawuLKHFikBhHELjZdxM5hgYUYKRJ6Co=;
	b=GezI/DJlqPTshy7z5+IPEUvxZIHEDeFhPz/blCbhN0p+vL3VGAQqB+2tv9tKsplkvJ
	FAvVx7S4I31CG0yxFYNW0DP9OnsG5qgtt1myk6N5II5Z5Uh5yBS1gqdGEJjPHgukhWNd
	qT7ky7GSj3vF+PgmUwdB1WPtZ0Y4aYByp2kU05RyJaNW7N+Q8xUB2WN8oX008+y4GhuT
	FDh+1muGRn9wdl45K6PIkcQYQ7zJX2vuX4CLMzsBw8Gxz7T10z0ZkcKZkKnojX4OsfDy
	9j7/CwdKT3/K2u39EpMNJUyD12b9RjiJdVavkhnzd0JC1APh+GIoIV1qePOKNtJmgwrN
	t2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=mG/yutMKmd6wawuLKHFikBhHELjZdxM5hgYUYKRJ6Co=;
	b=sEX0WWcKWQYlBHMogz5Kb1GVfqU1zIneLb7J3XjKpOxykWe/hP96pM112aOeIaGly4
	3YMmi6cS1+pP09luseerlePwqsMvhsu/o82N3+KbQyo/oTwqWfkIFZXIi8oPcBEklTfx
	8wQOTW5qHOa8nc9c1KumcVJRqWONCBk9lU9Weoa2aGUEwJ9+FJLYNQYslOG1ooHlopfX
	v3g60mHC20J155ebi/XMxrl2NSmIwAsoTpK0VzJIw0CeCy67rFGhq9lPkgoOHZtV7B7T
	9Tjun6vMmV+VLfSnk51JOkA7NDKn4q4OsfCYUrxKE/kDHg8UYDUIqhnNSbOSFcOamF1C
	LvHg==
X-Gm-Message-State: ALKqPwdmEUgwvVUvc32I8DqIM8WkHm1/BjnMJ1lEfRr25MTEDHonl6HM
	qBQOJtQrgcxfONV6JKiLgGI=
X-Google-Smtp-Source: ADUXVKL1kEnw8J7p9Es+pmVcjbHtDXRzirTy9tQT8iGH4ZBvAlnOXHDVDWtYvV4eW3w75VgVdH2SOw==
X-Received: by 2002:ac8:3183:: with SMTP id
	h3-v6mr14210623qte.173.1527550090039; 
	Mon, 28 May 2018 16:28:10 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm23756182qki.62.2018.05.28.16.28.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 16:28:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Mon, 28 May 2018 20:27:08 -0300
Message-Id: <20180528232719.4721-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528232719.4721-1-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v4 10/21] hw: Do not include "exec/ioport.h"
 if it is not necessary
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 28 May 2018 23:28:15 -0000

Code change produced with:
    $ git grep '#include "exec/ioport.h"' hw | \
      cut -d: -f-1 | \
      xargs egrep -Li "(portio|cpu_(in|out).\()" | \
      xargs sed -i.bak '/#include "exec\/ioport.h"/d'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/pcihp.c | 1 -
 hw/acpi/piix4.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 91c82fdc7a..80d42e12ff 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -32,7 +32,6 @@
 #include "hw/pci/pci.h"
 #include "hw/acpi/acpi.h"
 #include "sysemu/sysemu.h"
-#include "exec/ioport.h"
 #include "exec/address-spaces.h"
 #include "hw/pci/pci_bus.h"
 #include "qapi/error.h"
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 8b703455b7..6404af5f33 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -28,7 +28,6 @@
 #include "sysemu/sysemu.h"
 #include "qapi/error.h"
 #include "qemu/range.h"
-#include "exec/ioport.h"
 #include "hw/nvram/fw_cfg.h"
 #include "exec/address-spaces.h"
 #include "hw/acpi/piix4.h"
-- 
2.17.0



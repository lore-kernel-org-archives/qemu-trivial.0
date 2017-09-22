Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQ4k-0004ib-SG
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 11:41:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4i-0004ff-2F
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4f-0003DP-R4
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:08 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34479)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4d-0003CE-NS; Fri, 22 Sep 2017 11:41:03 -0400
Received: by mail-qk0-x242.google.com with SMTP id d70so874827qkc.1;
	Fri, 22 Sep 2017 08:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WX/okiQsZXJT3rw6dra6YpjKNWcldMZ25hpMuwmA8lk=;
	b=dzBRaU8bo122+D5/4hPQ0bUd2tm5K1Fofy/fZfS5KpA4jk3eI6axr6uBaeM3vtt9E2
	/aTHuddd04r8wT3slv1YVea79V2ezjrqqL8BBQpIaAyNYq0Hze7F43+S+cK1WqrayU9Q
	prZLfxdVKIGGXhO1IBK4j2Q185BAP3O70gtX55gD9iE0MGCxixv8QhQyRTSE8LnBIIq5
	aaatnKQtp7fVVd4Mf+ulrNkDE5KzvtgPDaEzHP0a55M0x22kBHFFDPSEX4WI6CinQeou
	AQU39UfrT9URIQCS/l3DFjMKn0fdBIZ3L7cV7umhB3l4It0a6ljI75RfNUtJPc+Gns/g
	SO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=WX/okiQsZXJT3rw6dra6YpjKNWcldMZ25hpMuwmA8lk=;
	b=k+1vb37r45Zh/VP3LaN+6+Z8oD3nRcOTJXEPfJzQpfeiNXXdeejN0EgaMF7VzKWKFJ
	YFjtAGzBZI7QE2PHcfRJswm0P3k59Sn3IlATSQqLzoB7wQVcvvZth4OYbg8Pi0oOgmbW
	Q9QIdkijKOrxbdpuQy4SyZFJKil0XniJFsW9Wjz1Tz+hYqdqURL4lSis4ncbp9Mq4qmG
	YiXGcYPXX+Kzbj2/1+D6SVzlPKhRn2bS9uHo/YvvRKUjOL5R45OQ/fvBMhYxFUL7FR4b
	L/w9m1jo9XWl8cEV8C5SuqTGQ+c0e1rNzE92Pvdasnc4rYSbP+dIzNHPIl7UqVaXpeCq
	n0Ww==
X-Gm-Message-State: AHPjjUjZJufbZyMUAz0BlM3s1bI62+3YkCVwGXnJoRuQF+xf2vH9b03h
	kG2/oktW1ySgi1eo+iSeWvM=
X-Google-Smtp-Source: AOwi7QBvT8JenV+qnsrffJsUcXUyY8iXoo2EIoLQtIKWgeNyUcsIVUr87b4LOjYaQipJhTHOr8bkVA==
X-Received: by 10.55.12.133 with SMTP id 127mr7956657qkm.251.1506094863233;
	Fri, 22 Sep 2017 08:41:03 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z75sm71742qkb.71.2017.09.22.08.41.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 08:41:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 12:39:49 -0300
Message-Id: <20170922154014.29350-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 09/34] misc: avoid "include/" in include path
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
X-List-Received-Date: Fri, 22 Sep 2017 15:41:10 -0000

while here, remove unused #include from aspeed_smc.h

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/adb.c      | 2 +-
 hw/ssi/aspeed_smc.c | 3 +--
 numa.c              | 1 -
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/input/adb.c b/hw/input/adb.c
index fcca3a8eb9..924a3f9fd5 100644
--- a/hw/input/adb.c
+++ b/hw/input/adb.c
@@ -24,8 +24,8 @@
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "hw/input/adb.h"
+#include "hw/input/adb-keys.h"
 #include "ui/console.h"
-#include "include/hw/input/adb-keys.h"
 #include "ui/input.h"
 #include "sysemu/sysemu.h"
 
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index cb515730c5..5059396bc6 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -26,8 +26,7 @@
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
-#include "include/qemu/error-report.h"
-#include "exec/address-spaces.h"
+#include "qemu/error-report.h"
 
 #include "hw/ssi/aspeed_smc.h"
 
diff --git a/numa.c b/numa.c
index 100a67febf..ebc553b5d9 100644
--- a/numa.c
+++ b/numa.c
@@ -29,7 +29,6 @@
 #include "qemu/bitmap.h"
 #include "qom/cpu.h"
 #include "qemu/error-report.h"
-#include "include/exec/cpu-common.h" /* for RAM_ADDR_FMT */
 #include "qapi-visit.h"
 #include "qapi/opts-visitor.h"
 #include "hw/boards.h"
-- 
2.14.1



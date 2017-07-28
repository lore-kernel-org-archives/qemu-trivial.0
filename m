Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxyI-0005D6-W4
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyD-00058W-0S
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyC-0004Yi-2c
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:53 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35835)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxy9-0004Vx-IZ; Fri, 28 Jul 2017 01:37:49 -0400
Received: by mail-qt0-x241.google.com with SMTP id t37so8845833qtg.2;
	Thu, 27 Jul 2017 22:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2uvUowXH5aycUAnPjcImRLt/VhBHSs7FPhujMnQT/B4=;
	b=NWWFTHr5VEDFdbswCbjSwXsqTZQYo6LepXL/gPIzlRPEdn6ch5T5LfWryHuBUe1LHb
	vuY4Ta8pSR7h9A0vx0TFbDtt+JcdlYiu+Vt5wQ7lY1hjNks8WMTz/Ft+6CFrKNzIXfAl
	p9VPacsqLr1CBZv91d+qolue0BZHQOTvLGS6x11rHXE+zu82MkRRETd8qQjmIcLchXlD
	r4pnLMWa3p6Ztbg6cywMvqr2qUOkUCyeyXO2be2FLaa1fZgUGY95Pi6OHl5wdEOuIO8A
	hOeOQwZovZut5iPQbA5MN9IKtg3W/NAj5SUR5adnp5GXcHpX5oDyIsSE6XOHrMchgGfk
	AzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=2uvUowXH5aycUAnPjcImRLt/VhBHSs7FPhujMnQT/B4=;
	b=q6ZBjQG32foyJLOEQsphUeuP+Eren2hnIvK+TJxdcgrZ79ql/SMUKi5J5kXMf49TCz
	4Zq/xfon3fY+DZZn2Mg8iD4tIQQZOqEqvQa4/cGAvEQtW5JyOcDz23TeEturcJV8W228
	wdk39DV4v8sNWGTDxgPP2DTRCvcbldz+HQp/DbHXwfmJVz7ZzfLLIMAtX82pHmbn9RSH
	yBzavlMQG96QvKCtaJcsY/bg3JWMoW6Lgwtivj2Rk4blaQtZmJfaLvUMg/WvBdINKw/R
	UaKan9bJ2FyBCSzI68aJbpQgxOVuIS57ng/lxxUkjfMLn8vJ4FHAHrCvXwP4inDyScjh
	Dhiw==
X-Gm-Message-State: AIVw113Q824ec7Cj2qEsK2FQygDz8Uv0pTpPqZbrDXQgA/UJc/WBiHxm
	uZw4osrPXxGWSg==
X-Received: by 10.200.36.210 with SMTP id t18mr9723494qtt.291.1501220269163;
	Thu, 27 Jul 2017 22:37:49 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:48 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:36:00 -0300
Message-Id: <20170728053610.15770-38-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 37/47] MAINTAINERS: update docs/devel/ entries
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:57 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7649d57e0f..23de632424 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1438,7 +1438,7 @@ F: tests/test-qapi-*.c
 F: tests/test-qmp-*.c
 F: tests/test-visitor-serialization.c
 F: scripts/qapi*
-F: docs/qapi*
+F: docs/devel/qapi*
 T: git git://repo.or.cz/qemu/armbru.git qapi-next
 
 QAPI Schema
@@ -1490,7 +1490,7 @@ M: Markus Armbruster <armbru@redhat.com>
 S: Supported
 F: qmp.c
 F: monitor.c
-F: docs/*qmp-*
+F: docs/devel/*qmp-*
 F: scripts/qmp/
 F: tests/qmp-test.c
 T: git git://repo.or.cz/qemu/armbru.git qapi-next
@@ -1521,7 +1521,7 @@ S: Maintained
 F: trace/
 F: scripts/tracetool.py
 F: scripts/tracetool/
-F: docs/tracing.txt
+F: docs/devel/tracing.txt
 T: git git://github.com/stefanha/qemu.git tracing
 
 Checkpatch
@@ -1536,7 +1536,7 @@ F: include/migration/
 F: migration/
 F: scripts/vmstate-static-checker.py
 F: tests/vmstate-static-checker-data/
-F: docs/migration.txt
+F: docs/devel/migration.txt
 
 Seccomp
 M: Eduardo Otubo <otubo@redhat.com>
@@ -1941,5 +1941,5 @@ F: docs/
 Build system architecture
 M: Daniel P. Berrange <berrange@redhat.com>
 S: Odd Fixes
-F: docs/build-system.txt
+F: docs/devel/build-system.txt
 
-- 
2.13.3



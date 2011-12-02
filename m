Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RWPTB-0004aE-9Q
	for mharc-qemu-trivial@gnu.org; Fri, 02 Dec 2011 04:31:49 -0500
Received: from eggs.gnu.org ([140.186.70.92]:38408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RWPT4-0004CZ-C1
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 04:31:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RWPT3-0001lM-2X
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 04:31:42 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:57598)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RWPSx-0001k9-QM; Fri, 02 Dec 2011 04:31:35 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	755507281889; Fri,  2 Dec 2011 10:31:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id fzUdAGGrsobs; Fri,  2 Dec 2011 10:30:43 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 8BC1C728188C; Fri,  2 Dec 2011 10:30:43 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Fri,  2 Dec 2011 10:30:41 +0100
Message-Id: <1322818241-18137-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH=5D_Convert_source_files_to_UTF-?=
	=?utf-8?q?8_encoding?=
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Dec 2011 09:31:46 -0000

Most QEMU files either are pure ASCII or use UTF-8.
Convert some files which still used ISO-8859-1 to UTF-8.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/ds1225y.c           |    2 +-
 hw/fdc.c               |    2 +-
 hw/jazz_led.c          |    2 +-
 hw/tc6393xb_template.h |    2 +-
 hw/vmport.c            |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/ds1225y.c b/hw/ds1225y.c
index 6852a61..5da2d68 100644
--- a/hw/ds1225y.c
+++ b/hw/ds1225y.c
@@ -1,7 +1,7 @@
 /*
  * QEMU NVRAM emulation for DS1225Y chip
  *
- * Copyright (c) 2007-2008 Herv=E9 Poussineau
+ * Copyright (c) 2007-2008 Herv=C3=A9 Poussineau
  *
  * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
  * of this software and associated documentation files (the "Software"),=
 to deal
diff --git a/hw/fdc.c b/hw/fdc.c
index ecaad09..531a34e 100644
--- a/hw/fdc.c
+++ b/hw/fdc.c
@@ -2,7 +2,7 @@
  * QEMU Floppy disk emulator (Intel 82078)
  *
  * Copyright (c) 2003, 2007 Jocelyn Mayer
- * Copyright (c) 2008 Herv=E9 Poussineau
+ * Copyright (c) 2008 Herv=C3=A9 Poussineau
  *
  * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
  * of this software and associated documentation files (the "Software"),=
 to deal
diff --git a/hw/jazz_led.c b/hw/jazz_led.c
index eb472a0..c75aef7 100644
--- a/hw/jazz_led.c
+++ b/hw/jazz_led.c
@@ -1,7 +1,7 @@
 /*
  * QEMU JAZZ LED emulator.
  *
- * Copyright (c) 2007 Herv=E9 Poussineau
+ * Copyright (c) 2007 Herv=C3=A9 Poussineau
  *
  * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
  * of this software and associated documentation files (the "Software"),=
 to deal
diff --git a/hw/tc6393xb_template.h b/hw/tc6393xb_template.h
index 1ccf6e8..4cbbad5 100644
--- a/hw/tc6393xb_template.h
+++ b/hw/tc6393xb_template.h
@@ -5,7 +5,7 @@
  *
  * FB support code. Based on G364 fb emulator
  *
- * Copyright (c) 2007 Herv=E9 Poussineau
+ * Copyright (c) 2007 Herv=C3=A9 Poussineau
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
diff --git a/hw/vmport.c b/hw/vmport.c
index b5c6fa1..0a3dbc5 100644
--- a/hw/vmport.c
+++ b/hw/vmport.c
@@ -1,7 +1,7 @@
 /*
  * QEMU VMPort emulation
  *
- * Copyright (C) 2007 Herv=E9 Poussineau
+ * Copyright (C) 2007 Herv=C3=A9 Poussineau
  *
  * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
  * of this software and associated documentation files (the "Software"),=
 to deal
--=20
1.7.2.5



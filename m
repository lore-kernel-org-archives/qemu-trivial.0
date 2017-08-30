Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnAyL-0005yu-1s
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 17:56:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAyI-0005xP-Vg
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAyF-0007y7-Um
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:27 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:37216)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAyD-0007xV-S1; Wed, 30 Aug 2017 17:56:21 -0400
Received: by mail-qt0-x243.google.com with SMTP id g13so6272284qta.4;
	Wed, 30 Aug 2017 14:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vu0hIscE7l/9cHMGACozCRrQTWVy2OcARI4evM8aJf8=;
	b=blUPQB4rdRi0uuN2ktm/XQwapaXcCXasFmYZVBCehMgJ69u+s/PaYyXq13TaDsuz/Z
	C2Wl22LTOz80J4Q9MTbdWat6vJJ4E+kQYBpBFIr/lUF0b7EfSEnKIn5pUtJC3fij/9be
	nqRdl1iBcwG+tMXUa6Dgf0vYkLxcZzI8Tnv82jAAV/NVIexAkvJvsuuCBCjnBWK2pWtR
	lGkpD+eTLZbNknpjB9ImkA/Wrd6O6+BEagvg2TfX1aAjuOVLsEEimlm70oxhdZj61v3d
	X9QbpFpxVwB7LH3imG2/xA3CNG5l9Fop1GDe6ycyXbP/F0Sj36iMHqCyjReg/almSpZ5
	10eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=vu0hIscE7l/9cHMGACozCRrQTWVy2OcARI4evM8aJf8=;
	b=AVVCl6dypkTyEnAVJvTYunfuXPBw31dPggubWtJHacJopgbtu01xV/pw3V70OjmjYo
	WpfnnFLK5GMextU240Gqark4boGXlNxKWW9ClT4wsb/bf6kXvBQxvDVCW0vZ7yeSe9r/
	imX5+SmHJUvZ85l8Ke1PPY2Eqn9WkSnHaQwfKF7LEO299J8bAUS+iXXDNDMUcw2cXvD3
	czxCyTzGxq06UvlPGUj6TjuJyTBO+1SEdZ7Ti+kyheQd2CkuMvUdVt/GW5ZKcSEZQ+1g
	DimpV0S9eyUlN5VKkSnh3DIBZavlusg8lKda7I4SlFHccZ89QHNz/Sy9qAcTkpgJY5eY
	yLzw==
X-Gm-Message-State: AHYfb5hmKL16jAEOfyfxxtx7ilBV9d8Ux462+yRUR74pr0jmHkaVZk8v
	NVlQjh++Gf4aXB9WPVl2Xw==
X-Received: by 10.200.1.67 with SMTP id f3mr4151471qtg.4.1504130181193;
	Wed, 30 Aug 2017 14:56:21 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	w131sm4298690qkb.85.2017.08.30.14.56.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:56:20 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 30 Aug 2017 18:55:22 -0300
Message-Id: <20170830215523.25278-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170830215523.25278-1-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v2 16/17] MAINTAINERS: update docs/devel/
 entries
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
X-List-Received-Date: Wed, 30 Aug 2017 21:56:28 -0000

moved in commit ac06724a7158

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a0c00550e..452ccd71b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1414,7 +1414,7 @@ F: tests/test-qapi-*.c
 F: tests/test-qmp-*.c
 F: tests/test-visitor-serialization.c
 F: scripts/qapi*
-F: docs/qapi*
+F: docs/devel/qapi*
 T: git git://repo.or.cz/qemu/armbru.git qapi-next
 
 QAPI Schema
@@ -1466,7 +1466,7 @@ M: Markus Armbruster <armbru@redhat.com>
 S: Supported
 F: qmp.c
 F: monitor.c
-F: docs/*qmp-*
+F: docs/devel/*qmp-*
 F: scripts/qmp/
 F: tests/qmp-test.c
 T: git git://repo.or.cz/qemu/armbru.git qapi-next
@@ -1497,7 +1497,7 @@ S: Maintained
 F: trace/
 F: scripts/tracetool.py
 F: scripts/tracetool/
-F: docs/tracing.txt
+F: docs/devel/tracing.txt
 T: git git://github.com/stefanha/qemu.git tracing
 
 Checkpatch
@@ -1512,7 +1512,7 @@ F: include/migration/
 F: migration/
 F: scripts/vmstate-static-checker.py
 F: tests/vmstate-static-checker-data/
-F: docs/migration.txt
+F: docs/devel/migration.txt
 
 Seccomp
 M: Eduardo Otubo <otubo@redhat.com>
@@ -1914,5 +1914,5 @@ Documentation
 Build system architecture
 M: Daniel P. Berrange <berrange@redhat.com>
 S: Odd Fixes
-F: docs/build-system.txt
+F: docs/devel/build-system.txt
 
-- 
2.14.1



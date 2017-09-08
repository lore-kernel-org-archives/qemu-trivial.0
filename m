Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dqNEM-0007VT-5P
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2017 13:38:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNEJ-0007So-OP
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:38:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNEI-0007ai-Na
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:38:11 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:37572)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNEI-0007a8-Iu; Fri, 08 Sep 2017 13:38:10 -0400
Received: by mail-qt0-x242.google.com with SMTP id h21so1946738qth.4;
	Fri, 08 Sep 2017 10:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:mime-version:content-transfer-encoding;
	bh=BZsoXntJcuTb8Bk+QjOpgMW7kKRm7yiraFHvIzf334g=;
	b=VNN/5BuuWX96lsLkIDxBRQ1a5yL/ukKZpEjcvbdGIdnEsosVT0RJQN7fk7Uo/LgM8P
	PJ+eLwHpIJaTTPIusYhTFbHs8zXvaVNKNnBFD47pwsTzegTD6ifF+ylg4vSDLgI6MngH
	nbha2W6WsE+QuaUA2mlbsukHQUDdwhMI3qWCez03FR1SBkasH6dvGWA7+xbsquNvRQ8D
	yzekfNH7bc0Zmp96tFTLvv+AB0qTl8Q6rN8jC83VTyz2yazuuhqPrKOqQhMr2OrTjKst
	qyT0oHaErN4xxzv0v/lUR6s9rJ1ijLjG1g6iRFSGz92CkWMN6GyTuw9uDKs3HX0c5kWF
	5qhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:mime-version
	:content-transfer-encoding;
	bh=BZsoXntJcuTb8Bk+QjOpgMW7kKRm7yiraFHvIzf334g=;
	b=MsbHOvlaqwLogI05yXrKvd80kJeMfoV3bmbeBYzfcCXFZvI8flmsL0DXdjxXMQ/+0/
	2y+0MhgDhfzG8QLOsQs09fhXMbHhmGrp0MUZeS2qF/5htxrbI4rAsGHn++3B0fgLEVZ2
	DqtctW8anrxgfIM0loMwkdN4I3slyWQxZIpE9EtfJgT8V52US7hlShVz+o9eCNThOIzu
	CoZlnrksJWUXJ2TzZSUzdPgfp/fkz4zSO0lDA7Y7EVMD3GR/fvLnVI+GV2eY2LYtgh8O
	9+VUK8gY8vrNvrx4i3FlY0IaWmL5fOAJfmTzH1c1YCi/aa1hRrEl3KhdWBERaHlU0UP3
	GCBg==
X-Gm-Message-State: AHPjjUj7dSyKSodEuiJ8uWRXqvsmDtrLvdUjkJ9xShrRZiGbvjbob/v0
	NvVYuF2GExvURErkhe90/A==
X-Google-Smtp-Source: AOwi7QCUtHelcTLuCzNIq+APlGQUQdyHu766R4ZFg08eHjGySVZPgQlyNGtxSHJgr43YTAokgYnsXw==
X-Received: by 10.200.45.26 with SMTP id n26mr5340038qta.183.1504892289782;
	Fri, 08 Sep 2017 10:38:09 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f4sm1605859qtg.35.2017.09.08.10.38.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 10:38:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri,  8 Sep 2017 14:36:31 -0300
Message-Id: <20170908173632.6711-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908173632.6711-1-f4bug@amsat.org>
References: <20170908173632.6711-1-f4bug@amsat.org>
In-Reply-To: <20170908173146.6446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v3 14/15] MAINTAINERS: update docs/devel/
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
X-List-Received-Date: Fri, 08 Sep 2017 17:38:12 -0000

moved in commit ac06724a7158

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 53891bd36e..f8630561de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1419,7 +1419,7 @@ F: tests/test-qapi-*.c
 F: tests/test-qmp-*.c
 F: tests/test-visitor-serialization.c
 F: scripts/qapi*
-F: docs/qapi*
+F: docs/devel/qapi*
 T: git git://repo.or.cz/qemu/armbru.git qapi-next
 
 QAPI Schema
@@ -1471,7 +1471,7 @@ M: Markus Armbruster <armbru@redhat.com>
 S: Supported
 F: qmp.c
 F: monitor.c
-F: docs/*qmp-*
+F: docs/devel/*qmp-*
 F: scripts/qmp/
 F: tests/qmp-test.c
 T: git git://repo.or.cz/qemu/armbru.git qapi-next
@@ -1502,7 +1502,7 @@ S: Maintained
 F: trace/
 F: scripts/tracetool.py
 F: scripts/tracetool/
-F: docs/tracing.txt
+F: docs/devel/tracing.txt
 T: git git://github.com/stefanha/qemu.git tracing
 
 TPM
@@ -1525,7 +1525,7 @@ F: include/migration/
 F: migration/
 F: scripts/vmstate-static-checker.py
 F: tests/vmstate-static-checker-data/
-F: docs/migration.txt
+F: docs/devel/migration.txt
 F: qapi/migration.json
 
 Seccomp
@@ -1923,5 +1923,5 @@ Documentation
 Build system architecture
 M: Daniel P. Berrange <berrange@redhat.com>
 S: Odd Fixes
-F: docs/build-system.txt
+F: docs/devel/build-system.txt
 
-- 
2.14.1



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fRMb3-0000fn-9w
	for mharc-qemu-trivial@gnu.org; Fri, 08 Jun 2018 14:58:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fRMax-0000eH-15
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 14:58:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fRMaw-0005t0-8t
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 14:58:43 -0400
Received: from mail-qt0-x22f.google.com ([2607:f8b0:400d:c0d::22f]:34979)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fRMap-0005rN-PK; Fri, 08 Jun 2018 14:58:35 -0400
Received: by mail-qt0-x22f.google.com with SMTP id s9-v6so14479685qtg.2;
	Fri, 08 Jun 2018 11:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TWY54WQ8Y4prLBKBmR1Hvf5NKR4Y1a4bzyfVbcTFp98=;
	b=kLghwe491es6Ok3ybYpOvlbm766M+KnKQApFafRzq4dDT92JMFgtXeBFwQdFnkLiA5
	KZsLjtaNQ3Ib5EUCn5NCxEc7lL7nOUZakk/4cleTN9XmxhlNHW1M40rZuGqerOl/mlbg
	AWegLfvC/wxQ1wMmrSlVmu7D06+MiWPNUYV3j68fdUzZf0i/HVUJxtA955ef/5XuuvI6
	EjActBa+apbYOdB43QfS+3xrUbwE8nV650/iDk/Of/aUIa/o70ZyrC5h3KnPmG4OCgjy
	IMPAV2Epr5AvMLX+GV7rO6cm5QBF5yMwzPdC8bLR4JeE4Jg4ExnqqfBJE4sYZXkqc8Y6
	VaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=TWY54WQ8Y4prLBKBmR1Hvf5NKR4Y1a4bzyfVbcTFp98=;
	b=TgvEl0QAcSB4QiokAALMrOfJH0B0otnCv3W8Kn/7Z3Wa9NXeZEtA96vXUEdHrIe6HV
	23ctfB1HxSLg6bHvSGwfSEMxiC5+FX8IPcW5KKLEr3Vjmkuj6VtHGQ/Nx66v21Ya73w+
	Qub8Y3ooBn/Q8HMmn+wqjaGMojxq5Nad8Xeot+7kutIGdXZtBqneDA3IW0wggBNUJtz9
	DLu9prsAZF0quGfz0p/wzLE/o1zTGrNDaawl0P3JsN6FDrQmTXjmsbxoF3fNJWjuJOGi
	Cow/w1JSaouG3lFixsR6iioQnmbaSA/D7nvefDgfitV3gOLcIWY5aFkSYCEMEGH9JQKY
	slPA==
X-Gm-Message-State: APt69E3wZfOA4BEMFIqgXDoXbBmI4aJxvPDaiZreIHokhZVAFGOG8e3F
	ZDwPUpRWWrZfuWE+6zLivl8=
X-Google-Smtp-Source: ADUXVKJNvPWO79jFnk9osN7eNm7ksigTzoJRccJAk37zCBNxGz26hvgqlsBq6lb+tiGR51U1nTrQCQ==
X-Received: by 2002:a0c:a995:: with SMTP id
	a21-v6mr6756153qvb.173.1528484315059; 
	Fri, 08 Jun 2018 11:58:35 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	q130-v6sm26445163qke.63.2018.06.08.11.58.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 11:58:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org
Date: Fri,  8 Jun 2018 15:58:26 -0300
Message-Id: <20180608185826.10708-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22f
Subject: [Qemu-trivial] [PATCH] Makefile: Remove qemu-version.h and
 qemu-options.def during 'make distclean'
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
X-List-Received-Date: Fri, 08 Jun 2018 18:58:47 -0000

qemu-version.h and qemu-options.def are generated files
that should be deleted during 'make distclean'.

This solves building issues with out-of-tree builds from
a source tree that has been built in (see d1bd2423a90).

This solves:

- /qemu-version.h existing in source tree:

    /source/qemu/qemu-nbd.c: In function ‘version’:
    /source/qemu/qemu-nbd.c:133:6: error: expected ‘)’ before
    ‘QEMU_FULL_VERSION’
     "%s " QEMU_FULL_VERSION "\n"
          ^~~~~~~~~~~~~~~~~~
          )
    /source/qemu/qemu-nbd.c:133:3: error: format ‘%s’ expects a matching
    ‘char *’ argument [-Werror=format=]
     "%s " QEMU_FULL_VERSION "\n"
      ~^
    cc1: all warnings being treated as errors

- /qemu-options.def existing in source tree:

    /source/qemu/vl.c: In function ‘main’:
    /source/qemu/vl.c:3052:18: error: ‘QEMU_OPTION_blockdev’ undeclared
    (first use in this function); did you mean ‘QEMU_OPTION_clock’?
                 case QEMU_OPTION_blockdev:
                      ^~~~~~~~~~~~~~~~~~~~
                      QEMU_OPTION_clock
    /source/qemu/vl.c:3052:18: note: each undeclared identifier is reported
    only once for each function it appears in

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 023b3437ec..7ae453ffa2 100644
--- a/Makefile
+++ b/Makefile
@@ -757,6 +757,7 @@ qemu-%.tar.bz2:
 distclean: clean
 	rm -f config-host.mak config-host.h* config-host.ld $(DOCS) qemu-options.texi qemu-img-cmds.texi qemu-monitor.texi qemu-monitor-info.texi
 	rm -f config-all-devices.mak config-all-disas.mak config.status
+	rm -f qemu-version.h qemu-options.def
 	rm -f po/*.mo tests/qemu-iotests/common.env
 	rm -f roms/seabios/config.mak roms/vgabios/config.mak
 	rm -f qemu-doc.info qemu-doc.aux qemu-doc.cp qemu-doc.cps
-- 
2.17.1



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fRfWj-00015X-4D
	for mharc-qemu-trivial@gnu.org; Sat, 09 Jun 2018 11:11:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fRfWh-00014c-Ix
	for qemu-trivial@nongnu.org; Sat, 09 Jun 2018 11:11:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fRfWg-0002IQ-9u
	for qemu-trivial@nongnu.org; Sat, 09 Jun 2018 11:11:35 -0400
Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232]:43562)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fRfWb-0002EQ-K7; Sat, 09 Jun 2018 11:11:29 -0400
Received: by mail-qt0-x232.google.com with SMTP id y89-v6so16386155qtd.10;
	Sat, 09 Jun 2018 08:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GyQu28x08eY14sQuR6djY0yHljoIa7T09bju5auHauk=;
	b=kI2T7Ep7wHpSx7d5H/hFvFP1k04gr588kOZLNGaBVZY+GljDGiIuj6wPGPcP6ZfUIF
	Juc+0GE61RKp2DckUxYcKvDOZMaFsEehyT3A21zcbMAHVv0+B1paUwORfHq/ED6GqLD3
	pkgK2BaAZzJWpdmJh6dt6g/vj/92rmtgzwYICTDZO2+E+XSmHWla2dmkhvJrDKdBoFvZ
	2nVTaSKrILSYw8ji6nUO28SVJwqnXmDjYIWXov0PvKltLbtYxLzg4gc4FsJFMqkQgHOi
	cujJydp1BSsLjIJWhb0Tp1anD7bt1NixF4m2Zv0ie5EQti6/v7opJ8fkpqrnVwjX0nau
	cUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=GyQu28x08eY14sQuR6djY0yHljoIa7T09bju5auHauk=;
	b=ns9bf4g+5cZVWLwpczmJOhuAG15unh8mjRSDJz7BEjagRDYZnSJr1xfr0vSfEdJdNh
	4s2OO6F0o60ZNbpNhYEL9rgxWw1mTj2d/2qFq3um5jVzV3ArrLoAFRXWUNVKN8T2d1eZ
	wjBXiMAlCkT8K8CE6xBaCYyiZWyHpD3KVyxmLjlItpf63ukPmy6FDM1ljZQyw5/O1etg
	TaQM5Jz7gV5RyHL9d2I6ERbrUaiiosh0pSD2GLVqKRqXTKP1jKflUN+QORhN6O9uQq1M
	JrLje5Q0t28POBrSS3kCCxHlHq+Q0AMehFvZa5Uzd7xVnv+Ip/ihXJAiZnb9q0dwo4T7
	ohHA==
X-Gm-Message-State: APt69E2ESc68+Peij7NYwQarLOxdfwItwtPS6dR013Yk/HWS2IDqY862
	SPoe4+9L83eSyQYCJlAzqK8=
X-Google-Smtp-Source: ADUXVKIgXU3T9pSuye69XDpvZW1S1eAfHUKs4FKSW7GbPYsUADeOa2KaxcUmcW7qelgq2ewXkNsyRw==
X-Received: by 2002:ac8:36d:: with SMTP id
	w45-v6mr9892104qtg.382.1528557088979; 
	Sat, 09 Jun 2018 08:11:28 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o31-v6sm6503531qte.16.2018.06.09.08.11.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jun 2018 08:11:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org
Date: Sat,  9 Jun 2018 12:10:48 -0300
Message-Id: <20180609151048.9628-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::232
Subject: [Qemu-trivial] [PATCH v2] Makefile: Check for more dangling scratch
 files in out-of-tree builds
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
X-List-Received-Date: Sat, 09 Jun 2018 15:11:36 -0000

It is easy to catch the generated 'config-host.mak' in the source
tree, however qemu-version.h and qemu-options.def are also generated
files and are hidden by .gitignore rules.

Improve the out-of-tree safety net rule added in d1bd2423a90,
by also checking for these two files.

This solves building issues with out-of-tree builds from a
source tree that has been built in:

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
Since v1 http://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg02254.html:
Peter noticed [1] those files already are in GENERATED_FILES

[1] http://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg02338.html

 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 023b3437ec..521009964c 100644
--- a/Makefile
+++ b/Makefile
@@ -55,7 +55,8 @@ endif
 # Check that we're not trying to do an out-of-tree build from
 # a tree that's been used for an in-tree build.
 ifneq ($(realpath $(SRC_PATH)),$(realpath .))
-ifneq ($(wildcard $(SRC_PATH)/config-host.mak),)
+scratch_files = config-host.mak qemu-version.h qemu-options.def
+ifneq ($(wildcard $(addprefix $(SRC_PATH)/,$(scratch_files))),)
 $(error This is an out of tree build but your source tree ($(SRC_PATH)) \
 seems to have been used for an in-tree build. You can fix this by running \
 "$(MAKE) distclean && rm -rf *-linux-user *-softmmu" in your source tree)
-- 
2.17.1



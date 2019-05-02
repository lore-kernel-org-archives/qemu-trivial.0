Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMGvy-0003xT-0L
	for mharc-qemu-trivial@gnu.org; Thu, 02 May 2019 14:59:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMGvs-0003qC-0j
	for qemu-trivial@nongnu.org; Thu, 02 May 2019 14:59:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMGvp-00037y-VQ
	for qemu-trivial@nongnu.org; Thu, 02 May 2019 14:59:47 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:51701)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hMGvk-00034V-1e; Thu, 02 May 2019 14:59:41 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1N9M5y-1gjvKl3vXg-015GfB; Thu, 02 May 2019 20:59:04 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
	Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
	qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Date: Thu,  2 May 2019 20:58:33 +0200
Message-Id: <20190502185835.15185-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502185835.15185-1-laurent@vivier.eu>
References: <20190502185835.15185-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Jbw4DFL3kvmwxXXd9rzfjPC2Ip/dTFEAYMbD8QAvxeCw5T+swVq
	w6UKqnjj/kzVazLA1918SMeXEWtkyutlNkix1ViekyBV4m150PTXokWytCraJd0F7mmiMy6
	1pNcUZsN8p2O9tKg92xJPEblyBULzpezZhScFHgjkhGfhEnMgUqJm11xr2Mng61+soJbdVA
	5qxWaYo1pXoAMlfzvG5aA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hyiRxIsEq0A=:wEJ0I4jLEfp8BiJPKbQR4k
	24tKzc5osHLwzNNaj31hHFTIvFDq23RafyVJ8PDZjS8dRS+awJzLFXb4vrZNHlj8x+Y1hhi/0
	wH14l6aR8/3vEDEZ3zEZG9VG8Yl/Ys6Vs5Ed1ltacVqC16hfymGFUXBA/KyLbZwzFV9Q1TkKb
	6MENWDlVeLCV1hmhgzSHud1zp8nK4jasIXl0Dfu2eSWjkCLkjWivdJXr6+qJT2zhVJBd59sWO
	pqWXGImEK7QYtuSHZLNYuidzdHr8pNDFGoIylepvcJRkzg63JjikbS3wipqcCRq90UsfDR9t3
	HOF/cqHwkIZXg/my3hrJfR9+a0hiBaYkb5vl6ROrFg3okSnpYd2yW92Mb1ayVdAacIpq99vUi
	GMv93NiaXMVPh+6ygwAjOTxdjxlzTh7JbNthNQ7yNvchZe82kQoniiwXqHnW0GJtMyvG5xv0N
	aN2piYn45OPV8c1yUFmtPkD03JLqfS5j9OZUfRe5/i7tq5XOvqfjXzbowa+si9nXsxKoNKvDJ
	G3FyN4NE+B+4V7DCJYvb10LgBs8ZAtKpT1vN9t5Q7D/XxxbETdL1l6yukUdDlPmWTzh2NFL87
	BqxfkE5vXOQ5iEKjhLxrTzYuGnfOwCgkAkmLnEIFqNhvTw3SHRdVknJ2lYuD1VXfzLwn4GPpz
	oYj3jRaRwGrhq3T5tPBJqYfv6k7EtGH97ehy1w7K2IeKSJ2zWkHvPxnACdVtm6Aek8jWNmVul
	SM6pRmvDClODmHutaNeB0bcZjMGB/YpUuhF0Za5g/RTJVcctL+4Sf2Mwftg=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: [Qemu-trivial] [PULL 11/13] Makefile: Let the 'clean' rule remove
 qemu-ga.exe on Windows hosts
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
X-List-Received-Date: Thu, 02 May 2019 18:59:50 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Commit 48ff7a625b36 added the QEMU Guest Agent tool with the
optional ".exe" suffix for Windows hosts, but forgot to use
this suffix in the 'clean' rule. Calling this rule let a dangling
executable in the build directory.
Correct this by using the proper optional suffix.

Fixes: 48ff7a625b36
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20190427161322.24642-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 43a7a047b452..e223bfe2a3a1 100644
--- a/Makefile
+++ b/Makefile
@@ -639,7 +639,7 @@ clean:
 		! -path ./roms/edk2/BaseTools/Source/Python/UPT/Dll/sqlite3.dll \
 		-exec rm {} +
 	rm -f $(edk2-decompressed)
-	rm -f $(filter-out %.tlb,$(TOOLS)) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod *~ */*~
+	rm -f $(filter-out %.tlb,$(TOOLS)) $(HELPERS-y) qemu-ga$(EXESUF) TAGS cscope.* *.pod *~ */*~
 	rm -f fsdev/*.pod scsi/*.pod
 	rm -f qemu-img-cmds.h
 	rm -f ui/shader/*-vert.h ui/shader/*-frag.h
-- 
2.20.1



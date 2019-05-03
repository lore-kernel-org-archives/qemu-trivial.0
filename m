Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMWLh-0007lz-FR
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 07:27:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWLf-0007jq-Bm
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:27:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWLe-0003LC-Fx
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:27:27 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:53183)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hMWLc-0003Hh-De; Fri, 03 May 2019 07:27:24 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MSZDt-1hBq3W2v6X-00SsBl; Fri, 03 May 2019 13:27:07 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, qemu-trivial@nongnu.org,
	Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Stefan Weil <sw@weilnetz.de>, Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Fri,  3 May 2019 13:26:49 +0200
Message-Id: <20190503112654.4393-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503112654.4393-1-laurent@vivier.eu>
References: <20190503112654.4393-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:N07At0ZGbo5irFABpI5uyTwKRVlRPb2fUGCZ7q3zcuJYX9kZvoe
	/bqsmUbvIUXBMoaw8aDQCc0ffl5emnNJ0D3tPJod/VxDecIdIwcVppwvIrXXOxKlTKvDLiM
	x7b/be7wZpH8NLNdvp1xEQQxujLfs197lQhzR31jDAB3rb/ckSZcpsoiTgRjt6T7ty2Z6S7
	Cy4rPBLDTbprizof7YTBQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:i122f+U2Nv0=:yP3Vo9C/nr9TtDjkVhL+aH
	dE2xW/AvZAAtQytXYtGgt3WVhzowIuZkYQHu3S283vH24Wdg3lzcLC5moQWbVgyfFe1Ui7MpF
	Y3oTlhK+6G96EWpIIb4PyQug2x1YB6dXbM0P1EreJ/6ShLeX5qd9k0gFBCBj1pjDOafTO3AwE
	NV/CEBhyH/ZiB4uLIk1/hN0e2gom/rk98Sv/FvDtSrxK+Q7SFoMAprY/Ba+kOmNQuNG/lFakE
	6941oEbVq8hBwp6p5w+FNz8mAMvsAD+BqGpZIL3IjCLD6Us7eq3f2TzhVvrnT8HftHtau8oK+
	maycJajnLyWzboum8+WmGbtd5lpf3MVrlid06fIULRoT29c2WuSM6Ahjgd7SITpNZkRz/xpw0
	zVms/WcXc7IWk+NhS70t3y8yaEFMPoiCTcJQG7N85/gIDLORjv3iZRNJban38O4saGLnRAeth
	/rnAdjaD2lxMS85RYZwwqSeKl8hF2/qSN6MkSGTEUSRscBDx/oBJEgZV+m0eModLf1qtvc7xl
	+Ffj/SBIrFqqKpn6d22w/gEPtcu1mrHRiPpj1JHeZCMzje4+KompbG/6PtZSGN8+nOxA36GFh
	2yy5Be1bLZD50CJxfq5DxF1eezqmbbyknS35XlK/vT7QWQbagcsG4ipvWJXkBqVmvUDoRJXpr
	hj524biWRXynZ/IEAdAEW2QYZ6FtOEfKugn6EFZV2SeXzK5oCfmCBPbokxWQ1YrWeH+I375J7
	M+CQ9dMBF+UJ++ZGeZBQreZENaSeJ++XrCFr6ZVzisP5CnzXSKu5KF/yhvc=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL v2 07/12] Update configure
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
X-List-Received-Date: Fri, 03 May 2019 11:27:28 -0000

From: Stefan Weil <sw@weilnetz.de>

The last *.aml file was removed in commit 13b1881aacc7e5018773bd545bbaf8d5476699ee.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190409053320.14612-1-sw@weilnetz.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index a2607afb3408..14f02452f9d4 100755
--- a/configure
+++ b/configure
@@ -7880,7 +7880,6 @@ LINKS="$LINKS python"
 for bios_file in \
     $source_path/pc-bios/*.bin \
     $source_path/pc-bios/*.lid \
-    $source_path/pc-bios/*.aml \
     $source_path/pc-bios/*.rom \
     $source_path/pc-bios/*.dtb \
     $source_path/pc-bios/*.img \
-- 
2.20.1



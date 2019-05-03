Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMWEA-0008IR-HP
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 07:19:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWE8-0008GO-9c
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:19:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWE7-0001OE-Dm
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:19:40 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:60817)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hMWE5-0001LK-AE; Fri, 03 May 2019 07:19:37 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MZjQl-1hHtfC3vi3-00Wjt4; Fri, 03 May 2019 13:19:06 +0200
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
Date: Fri,  3 May 2019 13:18:27 +0200
Message-Id: <20190503111832.30316-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503111832.30316-1-laurent@vivier.eu>
References: <20190503111832.30316-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jE/Twybj5oWwxyCk6VfpUuQg9Q+gLYWpj8WFHjv/HsSDnH6mW3N
	Ij7iieZi3ecMeIbxeFxi9+Dr+eborEwIJBvQhUpWyei/ZNwMt8RLK+ZJHSrlhnfa27Mvl9X
	qfLCUjkSgJcts/4CyfyfaufCLm9b6FFDEssENWtaZBrK43PH/byaid5o7+EGOuQqESBjeEy
	VTHrGdVsQvE8csyHLZIYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3h4rEd7zUG4=://NE6e3tqs19ubXB/McQ6t
	FNf9YKU6l93EEaour5jCBPs2r6WXpCnv9CGqs6dmDvBfkTCmBjBGyKv5/hf9nvTxSNqIypzk9
	zd1F5UXv7pLdRsMwA9AX89uWX9YcZmIeDDHS1oCyB7DqkuAy3HkG4TE9AamHvgQz98/DcrZEy
	9HeKNDGyp/T8YZ6OaL73U/uyVMAMS6JWuy03SfEjfLQ52XFqZQnfLN0dic/rbviB/tSTaWtd6
	9tdhqW1DSoet5b3S53CxDLaaAqKKSzKi2ihsDfSS2pcUX9J5eSfH5xquJrSvLvpOhSVw2k/DJ
	Uoy0t4PCLuQ+lA7fTTnryElwKPD0+kyRm3LMVSESW4GPNjiFB/BmhV8BrXNlFpYN3biAMdUXs
	HMlfsyIq/PeShrbEBcMPdzhtYNoTaAAGHuim0Kh61lz3ynSGSeMAEmkUnxX+UU2doWGH4s27H
	Lp1Kin3fI8wA97YJCXa7PcwubttxC6wwpygEGjAhUZAkHm9BHSsnR9ivrZIsOfuge9RG2TJWL
	1bn1FjY+FBsAGX4kNJdxVUljWHmcM3TWhqFShi5gCMX8J/+wYbkL1e0t/vbAQvuykNyTJ5fko
	LIHNdO9Pf9GWjwTTc6kJogX88GVTiDGsqMLQk3X0u+MmuJjJHR1ni9JmY80K+MoBCOBwOqmrG
	qIj4ikd8EVzPBwnZyN7w/ua4SHjm9sGBwrRz9/66+luKp8rnNnbnakRgB4sbk9kWXwFh0IkM8
	oNDgsb0DU5fTL4y9rndMHx0ozuFlWrVtrMOyoalsvyF+4NvZXIPS3uk9GHY=
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
X-List-Received-Date: Fri, 03 May 2019 11:19:41 -0000

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



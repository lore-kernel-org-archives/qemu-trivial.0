Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmeSG-00014C-4s
	for mharc-qemu-trivial@gnu.org; Thu, 24 Jan 2019 07:50:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gmeSD-00011Q-Gr
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 07:49:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gmeS5-0000te-Gn
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 07:49:53 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:51327)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gmeRz-0000pO-Mj; Thu, 24 Jan 2019 07:49:45 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MGygv-1h04qo3kN1-00E7Wk; Thu, 24 Jan 2019 13:49:30 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
	Richard Henderson <rth@twiddle.net>, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>
Date: Thu, 24 Jan 2019 13:49:03 +0100
Message-Id: <20190124124906.16653-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190124124906.16653-1-laurent@vivier.eu>
References: <20190124124906.16653-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JaN0c9m6kAN5GeSrG9fdbHHvtpO2Lr0v9GGFGTswAcj5nCkB59M
	t4cFSRjQqtBy6+JZ9FdAp2p7eFXHyqugNw55xUCSSYZaQ8WbnqlPMcz6plJUd2sWLfIrJeo
	0K//feTOi/cyAcwcZcUxTw7sclcx79OOcGlICLMbTOHWSQ5noPmZpHyw5d06Ygw4K4a9+GL
	nkCJPwQv1fVidRdtuyGMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CzOlcvnpsxw=:guNSgW5QhQ+mH/U0G+2QW/
	MfX3iMp+Y17iHgl/9NWJV3hTWwNTJ0oIQ/rBg4WYi2ujqioEydlvgbhK9ATL9A+F953T74xRs
	iBl3Nku2XkgJuEBer0XZyO18EIZAbk6i09K6e3RiFt8cETdcjbZ3sb2xU+r17V4W+AKAw+GfP
	LCdH7TmPmtdsDvq0nSrTBomQF268141i+zy0ti/O4HhDN3KE+LrROSm7XvOdYmtD+hi2QfEuF
	UXdF5FFSAujLPmnmBwwcs+HszVcPqyenYA3gwv/3Jq82yPHUsc4MPHsUlV4gLzv7Ci3kcT4LZ
	LIq92lJmu1HpgFc9CkBcVlQnoXAQo5VuowPEX5EfYd4wFtKi410y5Wq/BdA3tGOL+mbqAn4IE
	QWd/q4ttFumNXXao6DXGmN6ffmXFO6443i/fZQLZ6OkMxA3ArsSTRRqst8qYtBCk2hvqwWGye
	0o2U1TNPKVX4e44irdgW79k12eRPQO9yN16xBfk8vVNfMgn4HgSk5nKz2qJ3SzAwdaIIKn38c
	sOS4865i/1OwmTV+FfD/BPeTKAPkHb9WdNwlUAXxyj+Xp9Fe7/wTsgMwWkpb8fmp8YYjS35VI
	FUqXzxW1TRnGl4zm6OFS55psT48NgWQ9O+VIUpIz/76RDFLbaoEe5Tm9PDfoSGLTXZc6TSTjP
	jPgaUAsUoNQJihcKA1ZxkLajHrjL+C7xevgB7TbcwMe3pMb1S8sAu2pkTt0RZvuFAicDgTk7o
	iQB6Z4XTQKQnBE+mD+pd2UWFW1uhdp9AeETaUr4kiVIY6fHFxgWMdA/AuN4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
Subject: [Qemu-trivial] [PULL 2/5] contrib/gitdm: Fix a typo
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
X-List-Received-Date: Thu, 24 Jan 2019 12:49:59 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Typo comes from upstream git://git.lwn.net/gitdm.git.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <20190111155555.8270-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 contrib/gitdm/filetypes.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/gitdm/filetypes.txt b/contrib/gitdm/filetypes.txt
index 15d6f803b9..165b71b3f9 100644
--- a/contrib/gitdm/filetypes.txt
+++ b/contrib/gitdm/filetypes.txt
@@ -4,7 +4,7 @@
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
 # the Free Software Foundation; either version 2 of the License, or
-# (at your option  any later version.
+# (at your option) any later version.
 #
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
-- 
2.20.1



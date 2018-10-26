Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4JH-0004rI-RQ
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:46:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4JA-0003tU-Lu
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:45:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG46u-0005Qd-0E
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:33:17 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:52399)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG46b-00051X-PP; Fri, 26 Oct 2018 11:32:58 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N4vFE-1fZLOI3GmS-010wFj; Fri, 26 Oct 2018 17:31:55 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N4vFE-1fZLOI3GmS-010wFj; Fri, 26 Oct 2018 17:31:55 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Michael Walle <michael@walle.cc>, Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, xen-devel@lists.xenproject.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Fri, 26 Oct 2018 17:31:12 +0200
Message-Id: <20181026153125.24738-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:U9jVNabS9lDH6itzy1tIuUq3Dt7MRpDCm4Ceq17/qNHbC9X0h5c
	bdPdHiYmNSZxMSWmNkn3Oqhzdl41sly6mR5dEgnur0/O381eFifPyK1NhpaDAa083Hkd8D2
	4K2Ck0+J+3JsvqwaEfnY0RYawswXFFy0uDk+1ZcXjEOYrKcN3mE3bQ6uSDh2NuaUAyegpdC
	/tuwCWsdh3QnYJLvvelbg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:Z8jlqrDC1/s=:yg0uejzoMUY3/zwEwpWOCv
	74RG8Fc4Ywkp5e2ZiVqgX7xtjDy/TJgkjLt+wtQhUYZCUNW66pUVPZU7XEgXV/GqG9z7Muwxq
	v/MkIOuluji8QQcgJhr+Yur2nO88B8Fc+nxpWjo5YNnhEIHDntW9iZ20AWpS4T2eussjUGM0k
	Q5C8F/Xcglkp738LY9a1P8LwbuLFt4WgWqtjsktBQdRIOrZh5ZBVWp2kfT88+QcAknWLdm80V
	90bk+YjQvfsvK/O+E/OKhcKT2ly6RVigg81LT7vkY4iXBD6QVKwGQUzQ/nm0n2voXCyhPbxbl
	WXverTlelHZ6YNHEp/J6OVopu+L0+ozxd4zoqLOQ+tkZG6Y3RdhnP7RhA1xy+Cr7jMzau4l8v
	9QoSsswgXq28vIT5miwyupdvHdro3BKZUIqskO8yI2Z4e81EPL+Fh++ksig1lhExdVKFGt9iR
	OWRaGHrkULfMA6mmcUp3boiLm23SnR4+fItTA8a7aTGqZJxM+nSSWnat5ROHHYpprvMmKYgWe
	uOoZjkxkgbuL6BWaABBkZ8ALzWw1NYADw/7ShPtvWVW4p1LyNVVepVkCKdXQ3MPkKL9P1LXIV
	tnOLr7pXDPHuA1WZYfyQzqqjze4WD7mPYMHo76Gmvq3Pi6b1KQn72pSZwq2b7pD39NyTmd4Ww
	AhAXup540d2yjasVFchKRMJHXhhHv7cACjL2vlRlfSCisowJRyVvSk5PRa9bSAMsQy5a2Dw7t
	lz9YtcQ6hycHLray
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] [PULL 07/20] scripts/decodetree.py: remove unused
 imports
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
X-List-Received-Date: Fri, 26 Oct 2018 15:45:57 -0000

From: Cleber Rosa <crosa@redhat.com>

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20181004161852.11673-8-crosa@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/decodetree.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 277f9a9bba..457cffea90 100755
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -149,12 +149,10 @@
 #   trans_addl_i(ctx, &arg_opi, insn)
 #
 
-import io
 import os
 import re
 import sys
 import getopt
-import pdb
 
 insnwidth = 32
 insnmask = 0xffffffff
-- 
2.17.2



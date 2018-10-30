Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHS8o-0001id-VE
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 07:24:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS8f-0001ZK-Er
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:24:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS8e-0002b4-Ck
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:24:49 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:54553)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gHS8L-0002Ap-W1; Tue, 30 Oct 2018 07:24:30 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MOQu6-1fuwMb3vR8-00PtOG; Tue, 30 Oct 2018 12:24:00 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MOQu6-1fuwMb3vR8-00PtOG; Tue, 30 Oct 2018 12:24:00 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Stefano Stabellini <sstabellini@kernel.org>, qemu-trivial@nongnu.org,
	qemu-block@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org, Gerd Hoffmann <kraxel@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>,
	Michael Walle <michael@walle.cc>, Markus Armbruster <armbru@redhat.com>
Date: Tue, 30 Oct 2018 12:23:24 +0100
Message-Id: <20181030112337.17973-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Q67xc6fcWLfjbG7Ml7jpS1Aya7e9ae37lnkUty+YWGKEVwlvsPw
	tAf2OifniHA81i/uHFvQud+ZwGtJXJS5utKj0UMYz55wPI21InZVZCgYdHJEnDeOO0NW0RW
	pUPOgggjjd1m6OQQXuQ5yeN25RmxdabzLdgGY1/KGvCmLYzPOc509Bdy4NMa4FD9XlKiWKG
	vdtsb0ddP8BpUoV8wxuHQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:B7DB0orcvlQ=:viB53D0U/y5OC/zItp+l8+
	jcS9reEAgNas082Zug1uXgfMTR7jJ2wEZVY9DPxEVHyzqrXGUcKLVWth5YSxo78DQuYnhEW4V
	kDejINzHR0M2rOXmsah50i7Alc5nA7gw/A0vAZI0439g4yM9pPiWn+xrqxBNFNcX498MOiN/h
	3nIqO3kWOLbpJQ6GCuQC/sItgAPLuRlD9WOA2tr3Vh9FoYvZTgQhh1A+hd5Q2EGzW34lb11hb
	tkxK3JVP7wfO1bu6hTYB22cpe2tuoUF+YHThzEHZseOCnLCn8QXWEqlLMRYIEVpvWCNBcvoGG
	S48qamGeVTtvoDY3N7mts/wCy5bp+qYRD8VmS9FW0xYDLMtlVIE5tSqIC/D6I9GRwn5pJU4+u
	b4Tj1+n/VgfF1TCTkkbaHqp2s4j0WAGkZegsvzBpZNVNHcNNFd6qe1anRMbdYN7Q2tdlQx48C
	iNWQYPgwZcDDT4norsuqgvVQbswy73i/m9+5a1HA8tUOjidJWnp/knIS7+QYg5LRNCDYVFtfS
	mQ9/q9k323i/UA41woCDG7eKHj/Iqq2mdU8CS7UY3tToyCCBLXClKbRO15yPsBOQsWEqhqPNi
	dTNYOTa+7qG5l592jJ/eYi8D6FcOKjNbkbOUVDK+0h7zWVBYdYSUaB+r1ykDo9ONWwrSkmVkP
	vP3blloWjqKCumjFRCC8vnp652kg4EUIYbmA1954S7W3zxWXmIfjXQ/Dv+CGOM8sX8HfykvHd
	9oWVpESufZ8Bsv+q
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL v2 07/20] scripts/decodetree.py: remove unused
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
X-List-Received-Date: Tue, 30 Oct 2018 11:24:50 -0000

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



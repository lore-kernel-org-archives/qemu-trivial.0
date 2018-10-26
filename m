Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4Jh-0005FS-0V
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:46:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4JZ-0004rD-UK
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:46:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG46b-00056O-SV
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:33:03 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:50227)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG46b-000529-41; Fri, 26 Oct 2018 11:32:57 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1M9qYn-1gCTaj3BfJ-005nJ0; Fri, 26 Oct 2018 17:31:57 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1M9qYn-1gCTaj3BfJ-005nJ0; Fri, 26 Oct 2018 17:31:57 +0200
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
Date: Fri, 26 Oct 2018 17:31:13 +0200
Message-Id: <20181026153125.24738-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Y9ErdKazy18pRB4sG30VI0C2WaT1vuPEezP7oCLYrbTfLCVfYYH
	oNPCWNLcp7NXxcXxQQUjHLCr2pTZGohUEtfYpAr+KXetrMfFky2zQmFY6CXbKAO3fEh6ON2
	5DUKTcThUbkphkRoQYijLb1KR7+QzpeZ8kAU/ZS8C3nw1gz7r3+iRBRRj4jrAYJrwrUwM6g
	eo+1kef5MijhhbhuYk9cw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:Job3xHGt+as=:7GzYCbv+GfH3YLI0X+i0bY
	wBk2kGtdFyNPJOk0wnMLRyf3Fxaq3CUxJxXMTiJrb0G2IfIRl7oNmgnkrp85B8IbpB2xiL7S6
	DRzg18Y32vgrTfEBN3OBiZuDCQyhz6CT/M1ii77z5nAQ/lubRApo5R3+waKa3qAMsrq/fMssj
	Jm48HFZ9kTI/Hxq/mtS27YinTvQHfNEomASwXihOWkfZ7v3rknVRVc4FagcuA+zdSCA32OHVD
	Xe0bDQj9qz39k8aTVCFHQ/PnLJlBhef5acy5DOkO9ndrdiybST5mZ+cV4+cvMI8nibibVZAnW
	F4ySnL/fwtmqDVPPOjs9+E/SzBOiNEDBLDgc7GUaCmxBFmHol/fY4Xm6Epxp2HjpVKC91fsSw
	0qh9zye7bEc+pqu8E16KphS5YwDDhD7DOena0wQntAJJr75vNc8Uf0NwFAekbKyR0+rLVJUDl
	aaj3lJiNsTkCuzOIzlmW5VDh8q/zvafsSE4/5k2dZhEFBqwo1mERB5ikY3/fHmqcCYp0YfyA2
	ffqTjuYltCtgMNQT9z1jbJT7vQKmJelToPG43+WbOEGf4OPqEFHiWFshayRDcLw0txzrnDiGL
	2/cxafNSLLa7C0+VmJAPX1CmRNHH84jMYgRq+E7lrKUvkL9ABid1mNsemWb8DLccyJ+ENHW8h
	mFZStuKOYKnDyJ14ySTu9HDMpPTVz1R+KAsjrlpiIZTXbqhggj4CCh63ENWSYrnlBd65NjmOG
	3f6LrvJnLsHoQ4J1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] [PULL 08/20] scripts/qemu.py: remove trailing quotes
 on docstring
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
X-List-Received-Date: Fri, 26 Oct 2018 15:46:25 -0000

From: Cleber Rosa <crosa@redhat.com>

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20181004161852.11673-11-crosa@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/qemu.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qemu.py b/scripts/qemu.py
index f099ce7278..b0b2f12ce6 100644
--- a/scripts/qemu.py
+++ b/scripts/qemu.py
@@ -87,7 +87,7 @@ class QEMUMachine(object):
         @param name: prefix for socket and log file names (default: qemu-PID)
         @param test_dir: where to create socket and log file
         @param monitor_address: address for QMP monitor
-        @param socket_scm_helper: helper program, required for send_fd_scm()"
+        @param socket_scm_helper: helper program, required for send_fd_scm()
         @note: Qemu process is not started until launch() is used.
         '''
         if args is None:
-- 
2.17.2



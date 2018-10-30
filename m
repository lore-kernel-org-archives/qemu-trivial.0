Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHS8i-0001dC-G2
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 07:24:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS8f-0001Yt-Ai
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:24:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS8e-0002bD-DH
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:24:49 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:40493)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gHS8R-0002Fw-Sa; Tue, 30 Oct 2018 07:24:37 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MS43X-1g7Ii04BtD-00TS9B; Tue, 30 Oct 2018 12:24:04 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MS43X-1g7Ii04BtD-00TS9B; Tue, 30 Oct 2018 12:24:04 +0100
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
Date: Tue, 30 Oct 2018 12:23:26 +0100
Message-Id: <20181030112337.17973-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:fRXDuC7A+9gUdg2j7rbgPGWEzu26PAaeJ3msJENwEZyMBuht2XZ
	+vOUYRgnozCOMELkhIeuNQz1yzaBNsGxsneK5EruGaaVC/HLrSwQ70ROeGVhpqmOCMBFCo/
	z1I096nvniR7qD+aCEKNSbY7sYzfL/uCaaKCfY+91VGPUmCFRWN7UMsHYrw31MMbktHm5Q9
	BvYJmAqzKjwdHTOerJwcQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:orvFnjlgs3U=:CUwiEiQns+64lQSW6CWlzC
	VYDiXoWcsXGwECHonjRY5d+VSnxWorYYtviVFe0jIoXpvdfLAMJR7kDFT64OvHnXWqwKAMebD
	FHszgeIb3sWnCMryki7XXjO6m6BByK16UO/ydbCOLPtPdDDrT1V4JtuybO8RVUXD0YJ2kwcwF
	JADyEXW4tB4AvW28Q1kysvCTb8XfbWZ5AiAPYLkPMVPBPGUJcnT92WUa70rSoEsilep9PxLME
	ys8EHT14Q2QLZiEM84KQRUHBaou9TEedkLMABiNAr3vS4Koi6aCgnb1hkLRfHMNBoLx3RHR9x
	2726J59rdfjIqEHxSbfJYDWHVR9/by++0tsvQgzRCa3j9S3tshq3Bx7wwNtcM5FXzTClhVSDR
	4UHVddBo/tg5TLWngQ3somVoByE2ep8bfljZCIkMd4MYP4E+np0Y4gLCt/EjskovP4A/UKNED
	dZQWU1SHEmBCjj/zfsOTLHJrIurD/TgGIfP13HAjpZIBpJBHKRd4sKj8iNld7fCCUpLvnsoSI
	Fl8djWyaWxQ/8dW6O/3Fc0jgtmV9Ff//eoSiftM6t+81YcIy8axBC0hFkuK4Z42kXtKFlemHy
	t/ewlPTEf40aWTzL/3+IdFdMicfAEVsKTnQVQ1HdTjkDetZTqfcUdoacCxANxRHwtws4oozHN
	zjOUHU13jL+89Ni6Wu2QLvCXbsftYsdMIbj3v9sn0SkT8gKkDOOkRVbhIytIpzqchsl8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL v2 09/20] qemu-iotests: make 218 executable
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

Commit 990dc39c made all tests executable at the time, but 218 came in
later, and missing those permissions.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20181004161852.11673-4-crosa@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/qemu-iotests/218 | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 tests/qemu-iotests/218

diff --git a/tests/qemu-iotests/218 b/tests/qemu-iotests/218
old mode 100644
new mode 100755
-- 
2.17.2



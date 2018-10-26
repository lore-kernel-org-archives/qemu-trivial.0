Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4JC-0004oT-C7
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:45:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4J8-0003mJ-Om
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:45:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG46y-0005Ti-UD
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:33:26 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:52491)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG46b-0004ly-3E; Fri, 26 Oct 2018 11:32:57 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N3Gok-1fXghI38r4-010OHp; Fri, 26 Oct 2018 17:31:59 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N3Gok-1fXghI38r4-010OHp; Fri, 26 Oct 2018 17:31:59 +0200
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
Date: Fri, 26 Oct 2018 17:31:14 +0200
Message-Id: <20181026153125.24738-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:gMxyO7cWiaH3Jx8M5bWDfTmNhiRZ8d5Z+EEnmLDHlJVSZ9g4bZj
	zqBcvvzl2TYWPx/7WhLpoop4bCMqP++g9JYwv6Ri89uwvtUWF3vdETI2ZN1I++X3yLGL9OX
	s6ArVYQwsnEAPqlwLQrCaSRbaMgzNfR//jGK/mP1C+paIUcS/cDCBs/TpiVD1Jzg8BkkKaB
	7hhrZW8gYoMhvQet2cfpQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:wLyk8Prc9+g=:4d34OV/M03Vrq/gr64rvqz
	fDNpJ8apH/4Rv4HxBKnTHLtM0MzqNCxjD0j+KG1kbx08dw4i3hMxHwJOKoYQDVgjFB1faSCqk
	GqAeO2zEYN6cw960JcuhIGhmIViv//bKi3FNjEeQAJgxWGuTVPHs+CrvtrvoaIj8X119vJ9YO
	ErJ4rGc9oEYKHaDrB7X+mQVtPvTKlAbCvub4WVJy+3sYkZU+l7uY6S9GE6RlGeUq5LHFwx/7h
	uC89UyxrdVvYSUgXPdG7DH4KB7ITc7VYsdmPng044RVXynctAqrFd+3l5P/CWGXmlqbKhoNHS
	dYhuvUNltKeMXlc0hXU8IuRUWxF6GpovJ7snoDi/ybu8o7dSptV/RkmE/06T1EoVmMu1LlGPu
	xhOPwCxvdN2W7RBB6+C6pYaEPTK2r1Z6vaINqQFXOpXX/YWAgfWLrkZd39o/BtdIeKZtTdwsp
	Jeli3FaSlzqe5zuw6WJgbPowY57mygF/Jeywp50C3m6HWhT733raY6vpms4QB1njTJDyMV8QZ
	Im5ivmbWw0JJBpwYel5zZ2VrFs376L/JGWQzDaeKzF1C2mva3YrKr7jySocoUe5UwV55e4a1H
	7xsxxLEHE0t3tD9/7T7Agsh4ZGyx+2lYSHqpiXa65SXRNZ7don+LbKe6K83qQkVaIlxTmqA9R
	bRDvOiag+lobbRxbL+UmnMo4gVbsQQjms5Nh73zQopuoWh2mkFhJpKWu9cEF7EbJYexY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: [Qemu-trivial] [PULL 09/20] qemu-iotests: make 218 executable
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
X-List-Received-Date: Fri, 26 Oct 2018 15:45:55 -0000

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



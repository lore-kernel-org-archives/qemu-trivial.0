Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4RvS-0002R1-AL
	for mharc-qemu-trivial@gnu.org; Thu, 14 Mar 2019 11:05:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h4RvN-0002Nx-8G
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 11:05:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h4RvK-0004j2-GU
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 11:05:37 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:45481)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h4RvJ-0004JE-U7; Thu, 14 Mar 2019 11:05:34 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1Mf3yk-1gX3742x34-00gboM; Thu, 14 Mar 2019 16:05:04 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Thu, 14 Mar 2019 16:04:51 +0100
Message-Id: <20190314150454.15960-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TTzf+Q2lymmeZzti9Fe1gsfPNOjq1Y1osWsi2mzuoXGKwcl5NLP
	3awpXfER4OBwgstQSGtmPX3YPhJZbbmljPIV2KRFnr/iRJgjUdfuQtT/cTuqECOprISSj5r
	Sm+2V/1+QT17V5+YXWsuojeQu4lPkmA8kl4ftZFJ71ca2SGoC+NMUR4R+DIdho7j3Jcn56S
	yNgvkR5a0fZfkzTN3PQYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oYwUDR0yucM=:HgnLd++1OgPlB/7W/GXrJ8
	OcjSLqnUksDa+ir03NgTMqloreKtxLWicO5oGeJoHS79aXiT8wGJb/JdLHNU9G6+vIM5bLXku
	GZFwXrHLPJ1bPFoaFbzsyk+1phGV1kMRnSXLUOFqTRRsJ9phS9FvOwUT6MFj6Gufanf28B2lv
	Peb1bvRYfQzRPszq8yj37Wt6zYSbyOhRL4uU5GbRm+iScfI2YO2Xt8PWOYcbOJITrfGlPNlHq
	F5W1rRGwiH+FR4t9KE452JD0SVQ6lxMDk//Qzaw64B622p/JzdqrPzKU5zupixwyny6U6LOWl
	ysYUfHGzW7aI9SEcKSLJT/XgDhfT5mX/agrpBSbA6DjX3xRdyTG5qvvwCPk4wvxw3Y2l0mQZ0
	US7jGhw+4cJQyLf0p+BkcOSQO87JSBaZ1x5Dg5zqNA/YN/seZABKBAjERBX4u3rs2qwjOTi0V
	5f4Vg5BMXE19xCHP8S1dKGM/MjDyRpY0HhBRw2sGhBdC6/Qd9ESu4zV8vijndAnCKHV7xCO8M
	ghUiXlBi9tPxzjNDhGFAcRXwR5m3fIJ5LFjVVLDdg5lL30HVDaI7/ph1yzg16FDvh3hCsVmtF
	EkXKTo0QdljagBEhvpkuz96ZNJcrS/WJ08m5TlhGW+i6qTlbxMglibUEem4D4D7f1dAMHAm/p
	veotGSPvxWNU4zOs7eQVsK+WvVjQ8M9982aDMDrThHG/8kr7AbgeVwueLe4YkLQjXmwnUU4SP
	/+HB+ojsCBSbnMsz+0QKIT3gHq+lro0jzKkgGw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 0/3] Trivial branch patches
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
X-List-Received-Date: Thu, 14 Mar 2019 15:05:40 -0000

The following changes since commit 9164add701788075f229b560bc3e92f6562ff857:

  Merge remote-tracking branch 'remotes/stsquad/tags/pull-gitdm-next-120319-1' into staging (2019-03-14 13:48:48 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-branch-pull-request

for you to fetch changes up to a0af8cee3cf6c2fc08fee5b69820c2f91d5b0b44:

  tests/.gitignore: ignore test-qapi-emit-events.[ch] for in-tree builds (2019-03-14 16:02:13 +0100)

----------------------------------------------------------------
.gitignore updates for v4.0

----------------------------------------------------------------

Eric Blake (1):
  maint: Ignore built elf2dmp

Stefano Garzarella (2):
  .gitignore: ignore docs/built created for in-tree builds
  tests/.gitignore: ignore test-qapi-emit-events.[ch] for in-tree builds

 .gitignore       | 2 ++
 tests/.gitignore | 1 +
 2 files changed, 3 insertions(+)

-- 
2.20.1



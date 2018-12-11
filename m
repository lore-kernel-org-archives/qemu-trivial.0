Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmPL-0008NF-Ce
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:05:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPG-0008Ek-3h
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPA-0007Vz-R9
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:17 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:53017)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmP9-0007MN-MB; Tue, 11 Dec 2018 13:05:12 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MEC8L-1geANC2J7t-00AFmC; Tue, 11 Dec 2018 19:04:19 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue, 11 Dec 2018 19:03:44 +0100
Message-Id: <20181211180352.19644-23-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:V77jyCxr4c5fqbAKYSzwC8LOcy57RqPnlIgxV5c3ld5J69KzJdR
	QiVQ+6NUJYRwBzpA/A63LxIDlinHZq2uL/F1F9kTz6IKf/Xnj1e/t5gLfbJmX5bG0GzK25n
	nUfYCCfCmMiKGhWp+V1y17KsIuozgQRufMPzwpIkxjoTcLCwLl4MmK6h7y0kM8UrIM1ODdT
	QMRlGDWvPo+hZN7srtfTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7CWIJqvUbbE=:hJ1TgdLeKGllzJWdO0B3iI
	QuhVV59OAuUmBh1yOukLXK2eASYIDZmOEWD2aGvF3maRT1zSIZlAefHR2Pudp5aZVdJHBnfe9
	HOlxBZ3nhF6UWuOvK4XeKQA7ANturzBtORQaHUOa/BwEw7FKceIRcz2qoy8Kz9OekqMpb93P2
	eLxZ9ODsLp8b6fzxxHVUV2rL43vFN+ZqW+hsHr8VzvrevSmcUcATIJgpbTc0OCVIWaWIKWAqC
	Tf91qken1ZgirHduzyHdto0tvviVDP9InmroQM/t25tXnOijQil63u8n56TJiPfbSqteORTOe
	uUbCPROSrCCPf0JxeP7SC6GzzsB4aebHGCJSNG5IfuIuT8FlQleqoE5nlmTPDs8Na76/DOhK8
	5hSY7ywEULq8015GB0G/EjwmmhwGb/B5dxLia6jkRoY31ISZWQMxCYvTk49DhYr8Ai0PteE8L
	Rc7Kmy2snaHdAz9B8wEIb3kgH9jSdqxbV6aiEQyyT3QJsglxMpHKMjSQd2ztJDO3D7kb2j+Ly
	orz8tis/WKe40vCc45YY26K/dFV8tDR42fLJhoEc1TCSjQJAvSfmBQikLxyBDaOzTqFnPvw3k
	05O+CKkrl/RyRgQcD/IdtJWWQYv31SMh18Sr15jy6qT/9N6eMZWAoZtp5aj0We02Mi2iV6Tur
	cz8bnkD5l0qvapaHlIukEs0hynG6XmCPtLe8JyVkEqAvXQcEm27QG+DChSSWHYcKqmS+OyjQ3
	+/1df5BAC+2337m94hNc5WmHHH8BM89FLMp4mcATWfWi9nsBFOlXzMnAtbI=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: [Qemu-trivial] [PULL 22/30] MAINTAINERS: Add a missing entry to the
 QMP section
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
X-List-Received-Date: Tue, 11 Dec 2018 18:05:22 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20181125205000.10324-20-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20096dad05..4251c5edd3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1917,6 +1917,7 @@ S: Supported
 F: qmp.c
 F: monitor.c
 F: docs/devel/*qmp-*
+F: docs/interop/*qmp-*
 F: scripts/qmp/
 F: tests/qmp-test.c
 F: tests/qmp-cmd-test.c
-- 
2.19.2



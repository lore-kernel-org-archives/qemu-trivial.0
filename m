Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmPO-0008V1-UX
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:05:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPH-0008GU-FV
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPG-0007bt-69
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:19 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:41575)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmP9-0007SA-H4; Tue, 11 Dec 2018 13:05:11 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MlL5x-1hB1Df0Hcr-00lmNs; Tue, 11 Dec 2018 19:04:22 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>, Li Qiang <liq3ea@gmail.com>
Date: Tue, 11 Dec 2018 19:03:47 +0100
Message-Id: <20181211180352.19644-26-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hX3tsi9kMK0AxLs1/wLiw1iP+cOMJhSy9BhkWrHisSt8WL9CBCE
	iZqDWVuwvpVKid8M/+6uUNtknRdxkg6k+dHFJdeo0DgUA3tc8I+d7spuMKg1jJKgjQUV8oo
	1URwyNuJfcrkvPuKRMiz5alUskJQpiOAeh0XVjsAwc88RB17QRUh5AGHqd6tr1gsBqljO7e
	4ApHBfb1lSdmMor0sKM+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G0xi7nA+AUk=:ADX/N327kEjRJS5CyX0F47
	PbhFHGdCF/V6ZgKAqUUw5YaRTUb+QYnB4NMcHMtXxrqELBPO8IgQSSZRXIvUpF8sf9XWnJO6X
	IPhwgNljNSeRqLYyhBfKXnSv/7qQ32uIQyME134A4BoMLtf5enTseiPZ+n387TzVfocYiFQBP
	n0wJfUG20vsXqLa7Z5KN00MhYK+rHuZJ//J+KmdslsUxWiY+9/nivex4rSMHOScR9NJHgTO2o
	1rKaiyiYq4izIeWl6sMqMobB/ozbHUbUmct8DNZKPGz9Fm5LgiQIt0lyKl/56CB/D9ZyNKKk0
	R9SRR5qnxl8BojIaa2HLmHClQGGJs6gHrQatDh43ESIilBNzIodNXs2SOzjELTNYouRG/gwry
	M12gTLgxbEUQ0I5N5QX8BVhtQEAUzu1k+EGouNCOiwBe12jil5lRm044EEer5z0FKPwaKB0sm
	UUHBkuaiK75GyX5Zjoy1QcIrL9ADFBGIrwcCglnUFXG5HYPYxOtRhOwGRzrwAQHfiRmPLZgpb
	+IExgr6MGudDK2h3YyPFIv8bEWu7Uq577UVJZqb1Oa56qFOdeXmTGBD9TIKk9rAfz2zkrirYT
	Fy3NdcbPzUrH74m0sqdzmxE2tZ291ZZCVdXMTUWeQiePdd/T/21YFqu1xB7ykE/l3ktM5lTQJ
	58+nn/huRdMw208tvRXSCYj4c3aobqrq6EFC+phwwDp+IOIsc0UlbMgC4GOpaBnRbhJ+eXUMk
	SJbb59zUH0nPEVl9Wc8tj2gs9P9Ip5C64oYqIrvDiTKzof5YZJouo8C/EM0=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 25/30] target: hax: fix errors in comment
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
X-List-Received-Date: Tue, 11 Dec 2018 18:05:24 -0000

From: Li Qiang <liq3ea@gmail.com>

Cc: qemu-trivial@nongnu.org

Signed-off-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <1543312812-2929-1-git-send-email-liq3ea@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/i386/hax-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
index 502ce6f0af..b978a9b821 100644
--- a/target/i386/hax-all.c
+++ b/target/i386/hax-all.c
@@ -205,7 +205,7 @@ int hax_vcpu_destroy(CPUState *cpu)
     }
 
     /*
-     * 1. The hax_tunnel is also destroied when vcpu destroy
+     * 1. The hax_tunnel is also destroyed when vcpu is destroyed
      * 2. close fd will cause hax module vcpu be cleaned
      */
     hax_close_fd(vcpu->fd);
-- 
2.19.2



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1drVqk-0003xd-6P
	for mharc-qemu-trivial@gnu.org; Mon, 11 Sep 2017 17:02:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34534)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1drVqh-0003vM-Sa
	for qemu-trivial@nongnu.org; Mon, 11 Sep 2017 17:02:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <n54@gmx.com>) id 1drVqh-00034F-2L
	for qemu-trivial@nongnu.org; Mon, 11 Sep 2017 17:02:31 -0400
Received: from mout.gmx.net ([212.227.17.20]:62803)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1drVqa-00030u-BV; Mon, 11 Sep 2017 17:02:24 -0400
Received: from localhost.localdomain ([185.58.161.191]) by mail.gmx.com
	(mrgmx102 [212.227.17.174]) with ESMTPSA (Nemesis) id
	0Lpxdr-1dCOGQ15hX-00fk9k; Mon, 11 Sep 2017 23:02:21 +0200
From: Kamil Rytarowski <n54@gmx.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, jperkin@joyent.com, Kamil Rytarowski <n54@gmx.com>
Date: Mon, 11 Sep 2017 22:50:01 +0200
Message-Id: <20170911205001.11789-1-n54@gmx.com>
X-Mailer: git-send-email 2.14.1
X-Provags-ID: V03:K0:yDCIJ71MyDmp6l1AqxKELUXnmWjUFs+RsetosWDgeqpxQXqnbs7
	NqP9epHkLDh+kP4GhGzh6M79JqfoSuU10CyNtbdXj4v5bs9PkxRVqK4yzoVIGqKRgn5TfYF
	dIU64WqOip8fxSgEKS15J1u1Q095sRyEeJYNkBWSGzffFLoW3LP9VAS4RRlQCb2nFpyx1BL
	8JtFPAoXep5uR9vIBQJuw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:42xkGtxmyoM=:nX9Cpip5c55kF+FwO/uVY5
	UQx1T/6JqBPc1KnEGGvVHlKPIkjERmLC71lgVhA81ZB9Zo4VpBoKmQsnGcos9NVqzxHRaWwI9
	znzY1JHLjE0pmTEN4iSx4tol54qRZzxhGbV9isN/6eO8OLPxbZZ1P6EjKqeaiTIARRuR58xQ1
	/SK6IMNSc5UzIcQWqUQ3Njru0PihbEPKx4L87X7FKr5xB8uwyHCne3Hp/45oxYya093Id8NUO
	nkH+LrH4I8sKXctVPgPlHt7hLUgtUlzRzyXfYoO7bBlox1+5eIwun5BvYQrX1xV7u98PRBIZA
	QfcF2SWBUyrd6+BvQ3aevVBCvXQTBPg5Vsy6dWbcz5GBAQ80VMllPDArndCbTH9lhuWMZavIp
	fXpbeEOmgP/Tde+mn1GynEViGR0WlQ9Un+eJ4jyI7dIKeFgByaATaXtv6yN0xeOMz2KUtgoNm
	pIvfkZLzDQJFB2F6ofm3G2DCJVXvwHKD36SH2t2vVToiWJjYEeiv4xoWYhZmtcc4acSanlct5
	zTgkSTYhWPWCXoBDUj43dZnj/C2aSbMUb9NKpix4BwTpbpPCvViKQ3I6dXyCZOAUBi2FyXCTy
	suQCOfg5/06U0f7HoCmH4KsI61Bf3uYUzwu2fqM1NTmB1zDulY9o39QS+RDJ1zWC0qmjy1qd/
	xhy4JR4wt01M7lZM6ekAxy7CSoxkOfigQy9tU39G/7kZpOCZCD/15XVTdTdcLDemKJCMBPPmM
	KBftalQ5fUwJUbJ4ILKFo9YOtZToTopp7vxlCZePaQu8Q8tuk6pT1rXuizS4g83lT8nUgFQKW
	hkQ0x1GEvAaOkNf0yDmA5v57vXTFg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.20
Subject: [Qemu-trivial] [PATCH] Drop gld linker usage on SunOS
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
X-List-Received-Date: Mon, 11 Sep 2017 21:02:32 -0000

This is required to be removed on SmartOS (Illumos).
As of now there are no alternative supported SunOS distributions.

Signed-off-by: Kamil Rytarowski <n54@gmx.com>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index fd7e3a5e81..3dc0a71984 100755
--- a/configure
+++ b/configure
@@ -746,7 +746,6 @@ SunOS)
   solaris="yes"
   make="${MAKE-gmake}"
   install="${INSTALL-ginstall}"
-  ld="gld"
   smbd="${SMBD-/usr/sfw/sbin/smbd}"
   if test -f /usr/include/sys/soundcard.h ; then
     audio_drv_list="oss"
-- 
2.14.1



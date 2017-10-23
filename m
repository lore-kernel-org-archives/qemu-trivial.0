Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6e0O-0004qw-Ae
	for mharc-qemu-trivial@gnu.org; Mon, 23 Oct 2017 10:47:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Yongbok.Kim@imgtec.com>) id 1e6e0L-0004o8-Cj
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 10:47:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Yongbok.Kim@imgtec.com>) id 1e6e0K-0004XS-2z
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 10:47:01 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:59561)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Yongbok.Kim@imgtec.com>)
	id 1e6e0C-0004S3-Bh; Mon, 23 Oct 2017 10:46:52 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Forcepoint Email with ESMTPS id 266D6C5DA97C5;
	Mon, 23 Oct 2017 15:46:40 +0100 (IST)
Received: from a32.hh.imgtec.org (10.100.21.170) by hhmail02.hh.imgtec.org
	(10.100.10.21) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 23 Oct 2017 15:46:43 +0100
From: Yongbok Kim <yongbok.kim@imgtec.com>
To: <qemu-devel@nongnu.org>
CC: Paul Burton <paul.burton@imgtec.com>, Laurent Vivier <laurent@vivier.eu>, 
	Michael Tokarev <mjt@tls.msk.ru>, Yongbok Kim <yongbok.kim@mips.com>,
	<qemu-trivial@nongnu.org>
Date: Mon, 23 Oct 2017 15:46:36 +0100
Message-ID: <1508769996-5747-4-git-send-email-yongbok.kim@imgtec.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1508769996-5747-1-git-send-email-yongbok.kim@imgtec.com>
References: <1508769996-5747-1-git-send-email-yongbok.kim@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.100.21.170]
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 195.59.15.196
Subject: [Qemu-trivial] [PULL 3/3] MAINTAINERS: Update Paul Burton's email
 address
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
X-List-Received-Date: Mon, 23 Oct 2017 14:47:02 -0000

From: Paul Burton <paul.burton@imgtec.com>

Update my email address from paul.burton@imgtec.com to
paul.burton@mips.com, since MIPS will soon no longer be a part of
Imagination Technologies & as such the @imgtec.com address will soon
cease to function.

A mapping is added in .mailmap such that git reports the new @mips.com
address, and get_maintainer.pl in turn reports it when examining git
history. Whilst here add a mapping for my also-defunct
paul@archlinuxmips.org email address too.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Michael Tokarev <mjt@tls.msk.ru>
Cc: Yongbok Kim <yongbok.kim@imgtec.com>
Cc: Yongbok Kim <yongbok.kim@mips.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
[Yongbok Kim:
  Updated message subject]
Signed-off-by: Yongbok Kim <yongbok.kim@imgtec.com>
---
 .mailmap    |    2 ++
 MAINTAINERS |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/.mailmap b/.mailmap
index 5aec1bd..ee81ac8 100644
--- a/.mailmap
+++ b/.mailmap
@@ -11,6 +11,8 @@ Fabrice Bellard <fabrice@bellard.org> bellard <bellard@=
c046a42c-6fe2-441c-8c8c-7
 James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
 Jocelyn Mayer <l_indien@magic.fr> j_mayer <j_mayer@c046a42c-6fe2-441c-8c=
8c-71466251a162>
 Paul Brook <paul@codesourcery.com> pbrook <pbrook@c046a42c-6fe2-441c-8c8=
c-71466251a162>
+Paul Burton <paul.burton@mips.com> <paul.burton@imgtec.com>
+Paul Burton <paul.burton@mips.com> <paul@archlinuxmips.org>
 Thiemo Seufer <ths@networkno.de> ths <ths@c046a42c-6fe2-441c-8c8c-714662=
51a162>
 malc <av1474@comtv.ru> malc <malc@c046a42c-6fe2-441c-8c8c-71466251a162>
 # There is also a:
diff --git a/MAINTAINERS b/MAINTAINERS
index 1aedc9f..7625256 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -642,7 +642,7 @@ S: Odd Fixes
 F: hw/mips/mips_fulong2e.c
=20
 Boston
-M: Paul Burton <paul.burton@imgtec.com>
+M: Paul Burton <paul.burton@mips.com>
 S: Maintained
 F: hw/core/loader-fit.c
 F: hw/mips/boston.c
--=20
1.7.1



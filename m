Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6e0R-0004vO-9f
	for mharc-qemu-trivial@gnu.org; Mon, 23 Oct 2017 10:47:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Yongbok.Kim@imgtec.com>) id 1e6e0O-0004r1-Cc
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 10:47:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Yongbok.Kim@imgtec.com>) id 1e6e0N-0004aY-9u
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 10:47:04 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:45166)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Yongbok.Kim@imgtec.com>)
	id 1e6e0K-0004Rl-QQ; Mon, 23 Oct 2017 10:47:00 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Forcepoint Email with ESMTPS id 3B0E2EFD12E6B;
	Mon, 23 Oct 2017 15:46:39 +0100 (IST)
Received: from a32.hh.imgtec.org (10.100.21.170) by hhmail02.hh.imgtec.org
	(10.100.10.21) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 23 Oct 2017 15:46:42 +0100
From: Yongbok Kim <yongbok.kim@imgtec.com>
To: <qemu-devel@nongnu.org>
CC: James Hogan <james.hogan@imgtec.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, <qemu-trivial@nongnu.org>
Date: Mon, 23 Oct 2017 15:46:35 +0100
Message-ID: <1508769996-5747-3-git-send-email-yongbok.kim@imgtec.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1508769996-5747-1-git-send-email-yongbok.kim@imgtec.com>
References: <1508769996-5747-1-git-send-email-yongbok.kim@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.100.21.170]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 195.59.15.196
Subject: [Qemu-trivial] [PULL 2/3] MAINTAINERS: Update James Hogan's email
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
X-List-Received-Date: Mon, 23 Oct 2017 14:47:05 -0000

From: James Hogan <james.hogan@imgtec.com>

Update my imgtec.com email address to my kernel.org one in MAINTAINERS
as MIPS will soon no longer be part of Imagination Technologies, and add
a mapping in .mailcap so get_maintainer.pl reports the right address.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
[Yongbok Kim:
  Updated message subject]
Signed-off-by: Yongbok Kim <yongbok.kim@imgtec.com>
---
 .mailmap    |    1 +
 MAINTAINERS |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/.mailmap b/.mailmap
index 28defa1..5aec1bd 100644
--- a/.mailmap
+++ b/.mailmap
@@ -8,6 +8,7 @@ Aurelien Jarno <aurelien@aurel32.net> aurel32 <aurel32@c046a42c-6fe2-441c-8c8c-7
 Blue Swirl <blauwirbel@gmail.com> blueswir1 <blueswir1@c046a42c-6fe2-441c-8c8c-71466251a162>
 Edgar E. Iglesias <edgar.iglesias@gmail.com> edgar_igl <edgar_igl@c046a42c-6fe2-441c-8c8c-71466251a162>
 Fabrice Bellard <fabrice@bellard.org> bellard <bellard@c046a42c-6fe2-441c-8c8c-71466251a162>
+James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
 Jocelyn Mayer <l_indien@magic.fr> j_mayer <j_mayer@c046a42c-6fe2-441c-8c8c-71466251a162>
 Paul Brook <paul@codesourcery.com> pbrook <pbrook@c046a42c-6fe2-441c-8c8c-71466251a162>
 Thiemo Seufer <ths@networkno.de> ths <ths@c046a42c-6fe2-441c-8c8c-71466251a162>
diff --git a/MAINTAINERS b/MAINTAINERS
index 245f7d5..1aedc9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -285,7 +285,7 @@ S: Maintained
 F: target/arm/kvm.c
 
 MIPS
-M: James Hogan <james.hogan@imgtec.com>
+M: James Hogan <jhogan@kernel.org>
 S: Maintained
 F: target/mips/kvm.c
 
-- 
1.7.1



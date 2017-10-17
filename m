Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4Scm-0004eT-O5
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 10:13:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <James.Hogan@imgtec.com>) id 1e4Sck-0004cy-RQ
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 10:13:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <James.Hogan@imgtec.com>) id 1e4Scj-0000ep-P0
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 10:13:38 -0400
Received: from mailapp02.imgtec.com ([217.156.133.132]:26669
	helo=mailapp01.imgtec.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <James.Hogan@imgtec.com>)
	id 1e4Sce-0000au-Db; Tue, 17 Oct 2017 10:13:32 -0400
Received: from HHMAIL03.hh.imgtec.org (unknown [10.44.0.21])
	by Forcepoint Email with ESMTPS id 11C9A7684C044;
	Tue, 17 Oct 2017 15:13:25 +0100 (IST)
Received: from jhogan-linux.mipstec.com (192.168.154.110) by
	HHMAIL03.hh.imgtec.org (10.44.0.21) with Microsoft SMTP Server (TLS) id
	14.3.361.1; Tue, 17 Oct 2017 15:13:27 +0100
From: <james.hogan@imgtec.com>
To: <qemu-devel@nongnu.org>
CC: James Hogan <james.hogan@imgtec.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, <qemu-trivial@nongnu.org>
Date: Tue, 17 Oct 2017 15:13:11 +0100
Message-ID: <20171017141311.22194-1-james.hogan@imgtec.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.154.110]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 217.156.133.132
Subject: [Qemu-trivial] [PATCH v2] Update James Hogan's email address
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
X-List-Received-Date: Tue, 17 Oct 2017 14:13:39 -0000

From: James Hogan <james.hogan@imgtec.com>

Update my imgtec.com email address to my kernel.org one in MAINTAINERS
as MIPS will soon no longer be part of Imagination Technologies, and add
a mapping in .mailcap so get_maintainer.pl reports the right address.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
---
Changes in v2:
- Use my imgtec address as the author / SoB (Laurent Vivier)
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 28defa1b2c57..5aec1bdf9f7d 100644
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
index 9522d1b621bd..b01f5c46ef83 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -284,7 +284,7 @@ S: Maintained
 F: target/arm/kvm.c
 
 MIPS
-M: James Hogan <james.hogan@imgtec.com>
+M: James Hogan <jhogan@kernel.org>
 S: Maintained
 F: target/mips/kvm.c
 
-- 
2.14.1



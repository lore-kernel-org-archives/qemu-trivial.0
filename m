Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bKB1T-0002hg-3r
	for mharc-qemu-trivial@gnu.org; Mon, 04 Jul 2016 17:03:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1bK9N9-00026K-CP
	for qemu-trivial@nongnu.org; Mon, 04 Jul 2016 15:17:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1bK9N5-0003XS-6P
	for qemu-trivial@nongnu.org; Mon, 04 Jul 2016 15:17:34 -0400
Received: from hera.aquilenet.fr ([141.255.128.1]:40283)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1bK9N4-0003XE-Rg
	for qemu-trivial@nongnu.org; Mon, 04 Jul 2016 15:17:31 -0400
Received: from localhost (localhost [127.0.0.1])
	by hera.aquilenet.fr (Postfix) with ESMTP id 6D5818B4F
	for <qemu-trivial@nongnu.org>; Mon,  4 Jul 2016 21:17:22 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
	by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ou1lZVsBeV8j for <qemu-trivial@nongnu.org>;
	Mon,  4 Jul 2016 21:17:22 +0200 (CEST)
Received: from var.youpi.perso.aquilenet.fr (unknown
	[IPv6:2a01:cb19:1af:4600:3602:86ff:fe2c:6a19])
	by hera.aquilenet.fr (Postfix) with ESMTPSA id 003ED82E6
	for <qemu-trivial@nongnu.org>; Mon,  4 Jul 2016 21:17:21 +0200 (CEST)
Received: from samy by var.youpi.perso.aquilenet.fr with local (Exim 4.87)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1bK9Mz-0002f9-CV
	for qemu-trivial@nongnu.org; Mon, 04 Jul 2016 21:17:25 +0200
Resent-From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Resent-Date: Mon, 4 Jul 2016 21:17:25 +0200
Resent-Message-ID: <20160704191725.GB3004@var.home>
Resent-To: qemu-trivial@nongnu.org
Received: from iona.labri.fr [147.210.8.143]
	by var.youpi.perso.aquilenet.fr with IMAP (fetchmail-6.3.26)
	for <samy@localhost> (single-drop);
	Wed, 22 Jun 2016 18:12:26 +0200 (CEST)
Received: from iona.labri.fr ([unix socket]) by iona.labri.fr with LMTPA;
	Wed, 22 Jun 2016 18:11:39 +0200
X-Sieve: CMU Sieve 2.3
Received: from localhost (localhost [127.0.0.1])
	by iona.labri.fr (Postfix) with ESMTP id 4462B4EAC
	for <samuel.thibault@labri.fr>; Wed, 22 Jun 2016 18:11:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at labri.fr
X-Amavis-OS-Fingerprint: UNKNOWN [S20:53:1:60:M1460, S, T, N,
	W7:.:?:?] (up: 3080
	hrs), (link: ethernet/modem), [140.77.166.138]:43492
Received: from iona.labri.fr ([127.0.0.1])
	by localhost (iona.labri.fr [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id w5ofGunZFNbd for <samuel.thibault@labri.fr>;
	Wed, 22 Jun 2016 18:11:39 +0200 (CEST)
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by iona.labri.fr (Postfix) with ESMTPS id 126D956C9
	for <samuel.thibault@labri.fr>; Wed, 22 Jun 2016 18:11:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by sonata.ens-lyon.org (Postfix) with ESMTP id 9245420196
	for <samuel.thibault@labri.fr>; Wed, 22 Jun 2016 18:11:28 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
	by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z99xo6T--5ah for <samuel.thibault@labri.fr>;
	Wed, 22 Jun 2016 18:11:28 +0200 (CEST)
X-policyd-weight: using cached result; rate: -4
Received: from hera.aquilenet.fr (hera.aquilenet.fr [141.255.128.1])
	by sonata.ens-lyon.org (Postfix) with ESMTP id 77CEA20195
	for <samuel.thibault@ens-lyon.org>;
	Wed, 22 Jun 2016 18:11:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hera.aquilenet.fr (Postfix) with ESMTP id 36F458A7A;
	Wed, 22 Jun 2016 18:11:24 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
	by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hBPioMGJm0Gh; Wed, 22 Jun 2016 18:11:24 +0200 (CEST)
Received: from var.youpi.perso.aquilenet.fr (unknown [82.98.7.198])
	by hera.aquilenet.fr (Postfix) with ESMTPSA id 134C08A79;
	Wed, 22 Jun 2016 18:11:24 +0200 (CEST)
Received: from samy by var.youpi.perso.aquilenet.fr with local (Exim 4.87)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1bFkOH-0006KH-Ie; Wed, 22 Jun 2016 17:48:33 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: qemu-devel@nongnu.org,
	kraxel@redhat.com
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Date: Wed, 22 Jun 2016 17:48:31 +0200
Message-Id: <1466610511-24280-1-git-send-email-samuel.thibault@ens-lyon.org>
X-Mailer: git-send-email 2.8.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 141.255.128.1
X-Mailman-Approved-At: Mon, 04 Jul 2016 17:03:17 -0400
Subject: [Qemu-trivial] [PATCH] Document that curses usually needs -k option
 too
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
X-List-Received-Date: Mon, 04 Jul 2016 19:17:36 -0000

Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 17f15ad..ce535a9 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -306,7 +306,7 @@ STEXI
 @findex -k
 Use keyboard layout @var{language} (for example @code{fr} for
 French). This option is only needed where it is not easy to get raw PC
-keycodes (e.g. on Macs, with some X11 servers or with a VNC
+keycodes (e.g. on Macs, with some X11 servers or with a VNC or curses
 display). You don't normally need to use it on PC/Linux or PC/Windows
 hosts.
 
-- 
2.8.1



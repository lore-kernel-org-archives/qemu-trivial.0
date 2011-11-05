Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RMUiu-0006nJ-Up
	for mharc-qemu-trivial@gnu.org; Fri, 04 Nov 2011 21:07:04 -0400
Received: from eggs.gnu.org ([140.186.70.92]:47816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RMUis-0006nA-Po
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2011 21:07:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RMUir-0007zD-45
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2011 21:07:02 -0400
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:57020)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RMUiq-0007rr-FX
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2011 21:07:00 -0400
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id F1EB2723
	for <qemu-trivial@nongnu.org>; Sat,  5 Nov 2011 09:05:08 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:subject:message-id:mime-version:content-type; s=
	rsa1024; bh=4snj4y4KX7ZVkP062Q13xz9Jw84=; b=AndXz/lEAZhY65HbPDWE
	aKoqUBF++xVzHGXIleStnhiDqUVXh8udJWVXh2Cik7TTRRvjYn9jYK2y261nx3g0
	KoOsuu8Wu83S7WSw1ra6G5kVN0WXIkV2EY7rLHzYPdfzBzgPDVgYsz2SX8Hp2SKi
	9zc4kGF0ia9D8mMf6JN9cT4=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id E9E0A722
	for <qemu-trivial@nongnu.org>; Sat,  5 Nov 2011 09:05:08 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id pA516sEk080244
	for qemu-trivial@nongnu.org; Sat, 5 Nov 2011 09:06:54 +0800 (CST)
	(envelope-from chenwj)
Date: Sat, 5 Nov 2011 09:06:54 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
To: qemu-trivial@nongnu.org
Message-ID: <20111105010654.GA79132@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Subject: [Qemu-trivial] [PATCH] qemu-tech.texi: Remove libqemu from QEMU
	generic features
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Nov 2011 01:07:04 -0000

  According to [1], libqemu is not available anymore. Remove libqemu
from QEMU generic features.

[1] http://www.mail-archive.com/qemu-devel@nongnu.org/msg49809.html

Signed-off-by: Chen Wen-Ren <chenwj@iis.sinica.edu.tw>
---
 qemu-tech.texi |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/qemu-tech.texi b/qemu-tech.texi
index 397b070..9a590b2 100644
--- a/qemu-tech.texi
+++ b/qemu-tech.texi
@@ -96,10 +96,6 @@ Alpha and S390 hosts, but TCG (see below) doesn't support those yet.
 
 @item Precise exceptions support.
 
-@item The virtual CPU is a library (@code{libqemu}) which can be used
-in other projects (look at @file{qemu/tests/qruncom.c} to have an
-example of user mode @code{libqemu} usage).
-
 @item
 Floating point library supporting both full software emulation and
 native host FPU instructions.
-- 
1.7.3.5


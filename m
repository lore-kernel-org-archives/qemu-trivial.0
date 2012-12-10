Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ti3m6-0007PZ-Fs
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2012 08:52:02 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1Ti3lq-0007L1-51
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 08:52:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1Ti3li-0007Ty-3I
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 08:51:46 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:28839)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1Ti3lh-0007Th-JL
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 08:51:38 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id B64F77FE
	for <qemu-trivial@nongnu.org>; Mon, 10 Dec 2012 21:51:34 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:subject:message-id:mime-version:content-type; s=
	rsa1024; bh=8epuzvGIaVAeXDAuu6kVOm8ARa0=; b=BJ7aRnRe8YhJYCPum6M0
	MV2ddggZakkRIQ6OlQtWKiXzPaiBMyaodBnZv0cRNJZWQRYXpG3NO0SDFtBtxQ/W
	0Ly+x0QrVSaS9AhwsuPn/RQABE6Y1qlPqoaZ80+k7+Iw+98Dnunz+v0zSd0Bp+sH
	CDseVv7H8NcChEWDGw1IOAY=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id A66A97FD
	for <qemu-trivial@nongnu.org>; Mon, 10 Dec 2012 21:51:34 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id qBADpVTj040830
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 21:51:31 +0800 (CST)
	(envelope-from chenwj)
Date: Mon, 10 Dec 2012 21:51:31 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: qemu-trivial@nongnu.org
Message-ID: <20121210135131.GA40753@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Subject: [Qemu-trivial] [PATCH] Remove Sparc v7 and v8 host support from the
	configure list
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
X-List-Received-Date: Mon, 10 Dec 2012 13:52:00 -0000

  According to QEMU 1.3 release note, sparc v7 and v8 host support have
been removed. [1] Fix configure list as well.

[1] http://wiki.qemu.org/ChangeLog/1.3#Host_support

Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
---
 configure |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index e5aedef..56cf49d 100755
--- a/configure
+++ b/configure
@@ -1089,7 +1089,7 @@ echo "  --fmod-inc               path to FMOD includes"
 echo "  --oss-lib                path to OSS library"
 echo "  --enable-uname-release=R Return R for uname -r in usermode emulation"
 echo "  --cpu=CPU                Build for host CPU [$cpu]"
-echo "  --sparc_cpu=V            Build qemu for Sparc architecture v7, v8, v8plus, v8plusa, v9"
+echo "  --sparc_cpu=V            Build qemu for Sparc architecture v8plus, v8plusa, v9"
 echo "  --disable-uuid           disable uuid support"
 echo "  --enable-uuid            enable uuid support"
 echo "  --disable-vde            disable support for vde network"
-- 
1.7.3.4


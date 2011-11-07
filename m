Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNLie-0007tj-22
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2011 04:42:20 -0500
Received: from eggs.gnu.org ([140.186.70.92]:40338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RNLib-0007pW-To
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:42:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RNLia-0004RV-5B
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:42:17 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:41432)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RNLiZ-0004R2-Du
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:42:16 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 04E5833F;
	Mon,  7 Nov 2011 17:40:22 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=whHaAexgesNEk7qL5WfuWNddQFY=; b=npdxdoPuFUtClYDh3cASn+9q29VX
	gOJ1fnYMI7AxhFk0HzgbjCG9daiCgw9BFe6Ldi8mtySbkEkG5tOMgC48iGoHhf3U
	d239NeJi2Y6kt5bjPc4GqdXxyw8AhD7m70C8rwA10VjyqJ77pucdzNGZ9beq3TRs
	n8Q2kO0dINJKd4k=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id F2F7B33E;
	Mon,  7 Nov 2011 17:40:21 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id pA79g5mE020072;
	Mon, 7 Nov 2011 17:42:05 +0800 (CST) (envelope-from chenwj)
Date: Mon, 7 Nov 2011 17:42:05 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20111107094205.GA19396@cs.nctu.edu.tw>
References: <20111104193331.GA37125@cs.nctu.edu.tw>
	<20111107081517.GD9450@stefanha-thinkpad.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20111107081517.GD9450@stefanha-thinkpad.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org,
	=?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
Subject: Re: [Qemu-trivial] [PATCH] configure: Show --cpu option on the help
 list
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
X-List-Received-Date: Mon, 07 Nov 2011 09:42:19 -0000

> Please say "Build for host CPU [$cpu]" so that it's 100% clear that thi=
s
> is the host architecture and not the target.

  Fix. Thanks. :)

Signed-off-by: Chen Wen-Ren (=E9=99=B3=E9=9F=8B=E4=BB=BB) <chenwj@iis.sin=
ica.edu.tw>
---
 configure |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/configure b/configure
index 9e5da44..e970069 100755
--- a/configure
+++ b/configure
@@ -1036,6 +1036,7 @@ echo "  --fmod-lib               path to FMOD libra=
ry"
 echo "  --fmod-inc               path to FMOD includes"
 echo "  --oss-lib                path to OSS library"
 echo "  --enable-uname-release=3DR Return R for uname -r in usermode emu=
lation"
+echo "  --cpu=3DCPU                Build for host CPU [$cpu]"
 echo "  --sparc_cpu=3DV            Build qemu for Sparc architecture v7,=
 v8, v8plus, v8plusa, v9"
 echo "  --disable-uuid           disable uuid support"
 echo "  --enable-uuid            enable uuid support"
--=20
1.7.3.5


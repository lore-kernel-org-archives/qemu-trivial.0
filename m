Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TlbhO-00081R-2C
	for mharc-qemu-trivial@gnu.org; Thu, 20 Dec 2012 03:41:50 -0500
Received: from eggs.gnu.org ([208.118.235.92]:49389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TlbhJ-000810-Iy
	for qemu-trivial@nongnu.org; Thu, 20 Dec 2012 03:41:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TlbhG-0005hi-T8
	for qemu-trivial@nongnu.org; Thu, 20 Dec 2012 03:41:45 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:20888)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TlbhG-0005gM-AP
	for qemu-trivial@nongnu.org; Thu, 20 Dec 2012 03:41:42 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 11268A0F;
	Thu, 20 Dec 2012 16:41:36 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:mime-version:content-type; s=
	rsa1024; bh=TTA6fiSzTrLLUigbY3Qa0psVCmA=; b=G1trzxNd2nUcvp5vfOJN
	x6ipqQ1QSfj0+0X9WayeC4oxXnlDTWBXmJtU3C0XEZLFgoBPX5mo0efXqck8ai8v
	Y6Br+e738dO6GOUSrp+lAVb9kpOEs5AkIJlb4jg9NgDeBMpmTjCOdUdi/6l7MgYX
	GlzQegzefTkSYu6kT0IKa6M=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 0452EA0E;
	Thu, 20 Dec 2012 16:41:36 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id qBK8fY8t022291;
	Thu, 20 Dec 2012 16:41:34 +0800 (CST) (envelope-from chenwj)
Date: Thu, 20 Dec 2012 16:41:34 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: qemu-trivial@nongnu.org
Message-ID: <20121220084133.GA22209@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Subject: [Qemu-trivial] [PATCH] Remove --sparc_cpu option from the configure
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
X-List-Received-Date: Thu, 20 Dec 2012 08:41:49 -0000

  commit 9b9c37c36439ee0452632253dac7a31897f27f70 always assume sparcv9,
the others are no longer supported. Remove --sparc_cpu option from the
configure list.

Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
---
 configure |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index b101d5c..781b305 100755
--- a/configure
+++ b/configure
@@ -1089,7 +1089,6 @@ echo "  --fmod-inc               path to FMOD includes"
 echo "  --oss-lib                path to OSS library"
 echo "  --enable-uname-release=R Return R for uname -r in usermode emulation"
 echo "  --cpu=CPU                Build for host CPU [$cpu]"
-echo "  --sparc_cpu=V            Build qemu for Sparc architecture v7, v8, v8plus, v8plusa, v9"
 echo "  --disable-uuid           disable uuid support"
 echo "  --enable-uuid            enable uuid support"
 echo "  --disable-vde            disable support for vde network"
-- 
1.7.3.4


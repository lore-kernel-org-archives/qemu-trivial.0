Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UDRa7-000641-P4
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2013 22:33:23 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1UDRa1-0005tl-VH
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2013 22:33:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1UDRZz-00021l-Dt
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2013 22:33:17 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:64515)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1UDRZt-00020I-T6; Wed, 06 Mar 2013 22:33:10 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 43049972;
	Thu,  7 Mar 2013 11:33:02 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:mime-version:content-type; s=
	rsa1024; bh=oTa0ymOBVAOyUaNctP6VCMjETXA=; b=dZGVLEpBpCJHiTtCJLZe
	GIFWiKMRcW/MQ8isUIl1LoBZh85f42hFKa5bXb8o4JYGUrOyelz3KHshfIq3TlWM
	eyrYb2CN9KoV6s91ff0ueXfWi0Z2I+PoTIMvx4Jpi1HmXL3xgibkymyeDFM167zE
	5eUmvzafZS5190gdEZsbg20=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 19F08971;
	Thu,  7 Mar 2013 11:33:02 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id r273X1qP049355;
	Thu, 7 Mar 2013 11:33:01 +0800 (CST) (envelope-from chenwj)
Date: Thu, 7 Mar 2013 11:33:01 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: qemu-trivial@nongnu.org
Message-ID: <20130307033301.GA48996@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Cc: qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] Use proper term in TCG README
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
X-List-Received-Date: Thu, 07 Mar 2013 03:33:21 -0000

  In TCG, "target" means the host architecture for which TCG generates the
code. Using "guest" rather than "target" to make the document more consistent.

Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
---
 tcg/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/README b/tcg/README
index 934e7af..22174c0 100644
--- a/tcg/README
+++ b/tcg/README
@@ -379,7 +379,7 @@ double-word product T0.  The later is returned in two single-word outputs.
 
 Similar to mulu2, except the two inputs T1 and T2 are signed.
 
-********* 64-bit target on 32-bit host support
+********* 64-bit guest on 32-bit host support
 
 The following opcodes are internal to TCG.  Thus they are to be implemented by
 32-bit host code generators, but are not to be emitted by guest translators.
-- 
1.7.12.3


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk692-0008SU-LA
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 04:01:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZilzO-0007iA-AN
	for qemu-trivial@nongnu.org; Sun, 04 Oct 2015 12:18:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZilzN-00082W-EJ
	for qemu-trivial@nongnu.org; Sun, 04 Oct 2015 12:18:18 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50954)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZilzJ-0007y0-3F; Sun, 04 Oct 2015 12:18:13 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 38ADB403CD;
	Sun,  4 Oct 2015 19:18:10 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 253ADA66;
	Sun,  4 Oct 2015 19:18:10 +0300 (MSK)
Message-ID: <56115142.6060109@msgid.tls.msk.ru>
Date: Sun, 04 Oct 2015 19:18:10 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <1442868929-17777-1-git-send-email-jsnow@redhat.com>
In-Reply-To: <1442868929-17777-1-git-send-email-jsnow@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qtest/ahci: fix redundant assertion
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
X-List-Received-Date: Sun, 04 Oct 2015 16:18:20 -0000

21.09.2015 23:55, John Snow wrote:
> Fixes https://bugs.launchpad.net/qemu/+bug/1497711
> 
> (!ncq || (ncq && lba48)) is the same as
> (!ncq || lba48).

Applied to -trivial too, just in case :)

Thank you!

/mjt


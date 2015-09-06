Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZYXaQ-0000Zw-Cb
	for mharc-qemu-trivial@gnu.org; Sun, 06 Sep 2015 06:54:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZYXaO-0000Ze-3v
	for qemu-trivial@nongnu.org; Sun, 06 Sep 2015 06:54:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZYXaJ-0006LK-0V
	for qemu-trivial@nongnu.org; Sun, 06 Sep 2015 06:54:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54486)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZYXaI-0006LE-PE
	for qemu-trivial@nongnu.org; Sun, 06 Sep 2015 06:54:06 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 279C9409B9;
	Sun,  6 Sep 2015 13:54:06 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 0F156A76;
	Sun,  6 Sep 2015 13:54:06 +0300 (MSK)
Message-ID: <55EC1B4E.1010605@msgid.tls.msk.ru>
Date: Sun, 06 Sep 2015 13:54:06 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, 
 qemu-trivial@nongnu.org
References: <1438272042-3769-1-git-send-email-kamalesh@linux.vnet.ibm.com>
	<55EC14DF.2000904@msgid.tls.msk.ru>
In-Reply-To: <55EC14DF.2000904@msgid.tls.msk.ru>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] s390x/kvm: Fix couple of typos
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
X-List-Received-Date: Sun, 06 Sep 2015 10:54:12 -0000

06.09.2015 13:26, Michael Tokarev wrote:
> 30.07.2015 19:00, Kamalesh Babulal wrote:
>> Fix spellings of 'transfered' -> 'transferred' and
>> 'occured' -> 'occurred'.
> 
> Applied to -trivial, thank you!

It was too fast.  There was another patch, by Lajos Veres,
named "typofixes", which included these 2 fixes and a bunch
of others.  I've applied the patch by Lajos Veres instead.

Thanks!

/mjt


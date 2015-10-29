Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZrhlS-0000G6-24
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 03:36:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZrhlP-0000An-Ce
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:36:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZrhlO-0003qY-Do
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:36:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42115)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZrhlI-0003q7-3Y; Thu, 29 Oct 2015 03:36:40 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D426942107;
	Thu, 29 Oct 2015 10:36:34 +0300 (MSK)
Message-ID: <5631CC82.6050106@msgid.tls.msk.ru>
Date: Thu, 29 Oct 2015 10:36:34 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <1444372921-30909-1-git-send-email-famz@redhat.com>
	<5631CA00.9090102@msgid.tls.msk.ru>
In-Reply-To: <5631CA00.9090102@msgid.tls.msk.ru>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] scripts/text2pod.pl: Escape left brace
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
X-List-Received-Date: Thu, 29 Oct 2015 07:36:48 -0000

29.10.2015 10:25, Michael Tokarev wrote:
> 09.10.2015 09:42, Fam Zheng wrote:
>> Latest perl now deprecates "{" literal in regex and print warnings like
>> "unescaped left brace in regex is deprecated".  Add escapes to keep it
>> happy.
> 
> Applied to -trivial, thank you!

Noticed your v2 without the roms/ipxe change.  For fun, I just
removed that one when applying the v1, thought it was superlows... :)

/mjt




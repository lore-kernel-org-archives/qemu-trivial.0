Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VgffQ-0007u8-OS
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 13:59:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VgffF-0007da-Qt
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 13:59:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Vgff7-000758-DD
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 13:59:45 -0500
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=51700
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Vgfeq-0006ot-49; Wed, 13 Nov 2013 13:59:20 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	C3A2372801A1; Wed, 13 Nov 2013 19:59:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id u5C8WvmJ9Zht; Wed, 13 Nov 2013 19:59:17 +0100 (CET)
Received: from [192.168.178.35] (p54AD829C.dip0.t-ipconnect.de
	[84.173.130.156])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	D33B77280100; Wed, 13 Nov 2013 19:59:16 +0100 (CET)
Message-ID: <5283CC04.4030906@weilnetz.de>
Date: Wed, 13 Nov 2013 19:59:16 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>	<5283BF4E.1020009@weilnetz.de>
	<5283C3EE.7020300@msgid.tls.msk.ru>
In-Reply-To: <5283C3EE.7020300@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/16] [for-1.7] Trivial
	patches for 2013-11-13
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
X-List-Received-Date: Wed, 13 Nov 2013 18:59:55 -0000

Am 13.11.2013 19:24, schrieb Michael Tokarev:
> 13.11.2013 22:05, Stefan Weil wrote: []
>> The two trace.h related patches moved include statements from .h
>> files to .c files. I compiled the resulting code on 64 bit Linux,
>> also with cross compilation for MinGW, so win* won't be a problem.
>> Nevertheless there remains a risk because my builds don't include all
>> QEMU options (especially not spice, rbd, nss, libusb, seccomp). Both
>> patches were not marked for 1.7, so please skip them when pulling for
>> 1.7. 
> How about all other patches, because none of them were marked for 1.7?
> Thanks, /mjt

This one was marked for 1.7 and is needed to fix the MinGW buildbots:

qga: Fix compilation for old versions of MinGW

This one was not marked, but is safe (although it can also wait until
after 1.7):

console: Remove unused debug code

All other of my patches here can wait.

Cheers,
Stefan





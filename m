Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VgeQu-000825-Uj
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 12:40:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VgeQl-0007qO-3b
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 12:40:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VgeQd-0005CS-P9
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 12:40:43 -0500
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:47970)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VgeQO-0005A5-U7; Wed, 13 Nov 2013 12:40:21 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	BB422728019E; Wed, 13 Nov 2013 18:40:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id jp-CvPLewO71; Wed, 13 Nov 2013 18:40:17 +0100 (CET)
Received: from [192.168.178.35] (p54AD829C.dip0.t-ipconnect.de
	[84.173.130.156])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	926D37280100; Wed, 13 Nov 2013 18:40:17 +0100 (CET)
Message-ID: <5283B980.20902@weilnetz.de>
Date: Wed, 13 Nov 2013 18:40:16 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1384105751-12815-1-git-send-email-sw@weilnetz.de>
	<5283683F.9020102@msgid.tls.msk.ru>
In-Reply-To: <5283683F.9020102@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH for 1.7] qga: Fix compilation for old
 versions of MinGW
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
X-List-Received-Date: Wed, 13 Nov 2013 17:40:50 -0000

Am 13.11.2013 12:53, schrieb Michael Tokarev:
> 10.11.2013 21:49, Stefan Weil wrote:
>> While MinGW-w64 can compile the qga code, MinGW from Ubuntu lenny
>> (gcc-mingw32 4.4.2-3) shows these errors:
> I guess you mean Debian lenny, not Ubuntu lenny here ;)  And lenny
> is an "old-old-stable" Debian release - it was before squeeze which
> is now oldstable.  Lenny has been released at 14 Feb 2009...

It should have been Ubuntu Lucid (LTS).

>  1 file changed, 1 insertion(+)
> Thanks, applied to the trivial-patches queue, with s/Ubuntu/Debian/ - hopefully
> this is okay :)
>
> /mjt

Debian Lenny is sufficiently old, so I am rather sure that its MinGW
has the same problem, so this is fine, thanks.

Stefan



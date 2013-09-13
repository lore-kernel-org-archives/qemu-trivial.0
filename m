Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKMXC-0006aR-Q5
	for mharc-qemu-trivial@gnu.org; Fri, 13 Sep 2013 02:07:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VKMX5-0006Qi-Qo
	for qemu-trivial@nongnu.org; Fri, 13 Sep 2013 02:07:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VKMX0-00025C-0a
	for qemu-trivial@nongnu.org; Fri, 13 Sep 2013 02:07:07 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:56591)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VKMWo-00023Y-6I; Fri, 13 Sep 2013 02:06:50 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	0125072819E8; Fri, 13 Sep 2013 08:06:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id mozP4cvxPXB6; Fri, 13 Sep 2013 08:06:38 +0200 (CEST)
Received: from [192.168.178.35] (p54ADB18A.dip0.t-ipconnect.de
	[84.173.177.138])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	C19F5728004C; Fri, 13 Sep 2013 08:06:37 +0200 (CEST)
Message-ID: <5232AB6D.7020609@weilnetz.de>
Date: Fri, 13 Sep 2013 08:06:37 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Anthony Liguori <anthony@codemonkey.ws>
References: <5232A934.90701@redhat.com>
In-Reply-To: <5232A934.90701@redhat.com>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, Michal Privoznik <mprivozn@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] Wiki vandalism
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
X-List-Received-Date: Fri, 13 Sep 2013 06:07:13 -0000

Am 13.09.2013 07:57, schrieb Michal Privoznik:
> So I've just got another trivial patch ACKed. Yay! So I wanted to check
> it out in the next-trivial branch. Therefore I went on the qemu-trivial
> wiki and found two things:
>
> 1) Plenty of wiki vandalism (tracked down to user Jennypear [2]), e.g.
> appending ads in URL form to several pages [2]
>
> 2) The url for trivial patches repo is outdated.
>
> Michal
>
> 1: http://wiki.qemu.org/Special:Contributions/Jennypear
>
> 2:
> http://wiki.qemu.org/index.php?title=Google_Summer_of_Code_2011&diff=prev&oldid=1694
>

Thanks for reporting.

Anthony, please disable that user account. I started fixing the
vandalized pages.



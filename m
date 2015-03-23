Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ya8GM-0004XA-G9
	for mharc-qemu-trivial@gnu.org; Mon, 23 Mar 2015 15:43:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Ya8GJ-0004UN-VK
	for qemu-trivial@nongnu.org; Mon, 23 Mar 2015 15:43:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Ya8GI-00058T-Tq
	for qemu-trivial@nongnu.org; Mon, 23 Mar 2015 15:43:47 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=50123
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Ya8GD-00057i-Ky; Mon, 23 Mar 2015 15:43:41 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	B44E711810A8; Mon, 23 Mar 2015 20:43:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id TmI7kcK4zFmw; Mon, 23 Mar 2015 20:43:37 +0100 (CET)
Received: from [192.168.178.24] (p54AC84F7.dip0.t-ipconnect.de
	[84.172.132.247])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	5944B1180041; Mon, 23 Mar 2015 20:43:37 +0100 (CET)
Message-ID: <55106CE8.3080302@weilnetz.de>
Date: Mon, 23 Mar 2015 20:43:36 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Joseph Hindin <jhindin@daynix.com>
References: <CAJAHpUYhCjJ2viionKHDeVJX=pK22=QQjuO1DuSFRaWjQz-naA@mail.gmail.com>
In-Reply-To: <CAJAHpUYhCjJ2viionKHDeVJX=pK22=QQjuO1DuSFRaWjQz-naA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] Revised patch for QEMU Guest Agent compilaiton
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
X-List-Received-Date: Mon, 23 Mar 2015 19:43:48 -0000

Am 23.03.2015 um 20:29 schrieb Joseph Hindin:
> Hi
>
>    About a week ago I've submitted the revised patch for QEMU GA 
> Windows cross-compilation. Since then I've not got any responses. 
> Would you mind to look into the proposed patch?
>
>     Regards,
>
>        Joseph Hindin
>
> http://lists.nongnu.org/archive/html/qemu-devel/2015-03/msg03155.html

Maybe you would have got a response if you had sent that patch to Paolo 
or me, too.
Your patch has formal issues: it should have a short subject (< 80 
characters typically)
and some description. Your patch puts all text into the subject, so this 
becomes
rather long. Please send an updated patch with "git send-email" and use 
scripts/checkpatch.pl
before you send it.

Is there any reason why you filter the -fstack-protector% the way you 
did in your patch
(and not as suggested by Paolo)?

Technically I think your patch fixes the problem.

Thanks,
Stefan




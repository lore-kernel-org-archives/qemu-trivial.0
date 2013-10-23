Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VYr97-0004Cl-22
	for mharc-qemu-trivial@gnu.org; Wed, 23 Oct 2013 01:38:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VYr91-00045d-5S
	for qemu-trivial@nongnu.org; Wed, 23 Oct 2013 01:38:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VYr8x-0006L8-5E
	for qemu-trivial@nongnu.org; Wed, 23 Oct 2013 01:38:11 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=56421
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VYr8o-0006JR-Tb; Wed, 23 Oct 2013 01:37:59 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	2C4BA72801A3; Wed, 23 Oct 2013 07:37:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id AlrmiW6_4Uez; Wed, 23 Oct 2013 07:37:45 +0200 (CEST)
Received: from [192.168.178.35] (p54ADBFF9.dip0.t-ipconnect.de
	[84.173.191.249])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	3F7C3728019C; Wed, 23 Oct 2013 07:37:44 +0200 (CEST)
Message-ID: <526760A5.5030107@weilnetz.de>
Date: Wed, 23 Oct 2013 07:37:41 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Don Koch <dkoch@cloudswitch.com>
References: <1381520073-32674-1-git-send-email-sw@weilnetz.de>
	<52585983.1000606@terremark.com>
	<CAFEAcA8QMiNuBMN0=DmXA8RqV9iVdoD-weGF04njKCGw1nbbyg@mail.gmail.com>
	<52585F8B.6080604@cloudswitch.com>
	<5264E9E4.5070700@msgid.tls.msk.ru>
In-Reply-To: <5264E9E4.5070700@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>, Don Koch <dkoch@verizon.com>,
	Alexander Graf <agraf@suse.de>, Stefan Hajnoczi <stefanha@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] misc: Spelling and
 grammar fixes in comments
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
X-List-Received-Date: Wed, 23 Oct 2013 05:38:15 -0000

Am 21.10.2013 10:46, schrieb Michael Tokarev:
> So guys, do we agree to apply this or not, after all? :)
>
> Thanks,
>
> /mjt

The discussion was a bit confusing.

Finally, the patch got two reviews (Reviewed-by: Peter Maydell
<peter.maydell@linaro.org>, Reviewed-By: Don Koch <dkoch@verizon.com>,
see http://patchwork.ozlabs.org/patch/282925/).I assume that Reviewed-By
is unusual but obviously the same as Reviewed-by.

Eric Blake wrote that he liked the approach of patch v2, but did not
object to v3.

Therefore I think that you can take the patch v3 into your queue.

Regards,
Stefan



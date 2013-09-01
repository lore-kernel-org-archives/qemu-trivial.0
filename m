Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGAHW-0007dk-Fw
	for mharc-qemu-trivial@gnu.org; Sun, 01 Sep 2013 12:13:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VGAHP-0007Vl-JP
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 12:13:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VGAHK-000643-N5
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 12:13:35 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:46571)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VGAH9-0005yT-Ua; Sun, 01 Sep 2013 12:13:20 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	A09A572819E3; Sun,  1 Sep 2013 18:13:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id BBoA7woo9Dvv; Sun,  1 Sep 2013 18:13:06 +0200 (CEST)
Received: from [192.168.178.35] (p54ADA8CD.dip0.t-ipconnect.de
	[84.173.168.205])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	8901A72819DE; Sun,  1 Sep 2013 18:13:06 +0200 (CEST)
Message-ID: <52236791.9000900@weilnetz.de>
Date: Sun, 01 Sep 2013 18:13:05 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1376594735-7433-1-git-send-email-tmirza@codesourcery.com>
	<52207C25.9070302@siemens.com> <52236146.3050801@msgid.tls.msk.ru>
In-Reply-To: <52236146.3050801@msgid.tls.msk.ru>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	Taimoor Mirza <tmirza@codesourcery.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v3] slirp: Port redirection option behave
 differently on Linux and Windows
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
X-List-Received-Date: Sun, 01 Sep 2013 16:13:40 -0000

Am 01.09.2013 17:46, schrieb Michael Tokarev:
> 30.08.2013 15:04, Jan Kiszka wrote:
>> On 2013-08-15 21:25, Taimoor wrote:
>>> From: Taimoor Mirza <tmirza@codesourcery.com>
>>>
>>> port redirection code uses SO_REUSEADDR socket option before binding to
>>> host port. Behavior of SO_REUSEADDR is different on Windows and Linux.
>>> Relaunching QEMU with same host and guest port redirection values on
>>> Linux
>>> throws error but on Windows it does not throw any error.
>>> Problem is discussed in
>>> http://lists.gnu.org/archive/html/qemu-devel/2013-04/msg03089.html
> []
>> Stefan, can you ack this? Then I would pick it up for the slirp queue.
>
> I remember having exactly the same issue myself a few years back with
> the difference of SO_REUSEADDR behavour on windows and *nix, and the
> suggested change appears to be correct.  So you can count on my
>
> Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
>
> as well.
>
> I applied the v2 of this patch (with a trivial fix) to trivial queue
> (before seeing this v3), I can remove it if you like.
>
> Thanks,
>
> /mjt

Hi Michael,

thanks for your review of this patch. I had no opportunity to test
it myself, but I also think that it is fine.

(v2 + trivial fix) should be identical to v3, so this looks good, too.

Cheers,
Stefan



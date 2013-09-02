Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGNTS-000069-MB
	for mharc-qemu-trivial@gnu.org; Mon, 02 Sep 2013 02:18:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1VGNTL-00005m-Ns
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 02:18:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1VGNTG-0000Hf-Tm
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 02:18:47 -0400
Received: from goliath.siemens.de ([192.35.17.28]:22432)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1VGNTG-0000HV-Jr; Mon, 02 Sep 2013 02:18:42 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id r826Ia91020264;
	Mon, 2 Sep 2013 08:18:36 +0200
Received: from mchn199C.mchp.siemens.de ([146.254.78.133])
	by mail1.siemens.de (8.13.6/8.13.6) with SMTP id r826IZLm030638;
	Mon, 2 Sep 2013 08:18:35 +0200
Message-ID: <52242DBB.7010509@siemens.com>
Date: Mon, 02 Sep 2013 08:18:35 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1376594735-7433-1-git-send-email-tmirza@codesourcery.com>
	<52207C25.9070302@siemens.com> <52236146.3050801@msgid.tls.msk.ru>
	<52236791.9000900@weilnetz.de>
In-Reply-To: <52236791.9000900@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 192.35.17.28
Cc: qemu-trivial@nongnu.org, Taimoor Mirza <tmirza@codesourcery.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
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
X-List-Received-Date: Mon, 02 Sep 2013 06:18:52 -0000

On 2013-09-01 18:13, Stefan Weil wrote:
> Am 01.09.2013 17:46, schrieb Michael Tokarev:
>> 30.08.2013 15:04, Jan Kiszka wrote:
>>> On 2013-08-15 21:25, Taimoor wrote:
>>>> From: Taimoor Mirza <tmirza@codesourcery.com>
>>>>
>>>> port redirection code uses SO_REUSEADDR socket option before binding to
>>>> host port. Behavior of SO_REUSEADDR is different on Windows and Linux.
>>>> Relaunching QEMU with same host and guest port redirection values on
>>>> Linux
>>>> throws error but on Windows it does not throw any error.
>>>> Problem is discussed in
>>>> http://lists.gnu.org/archive/html/qemu-devel/2013-04/msg03089.html
>> []
>>> Stefan, can you ack this? Then I would pick it up for the slirp queue.
>>
>> I remember having exactly the same issue myself a few years back with
>> the difference of SO_REUSEADDR behavour on windows and *nix, and the
>> suggested change appears to be correct.  So you can count on my
>>
>> Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
>>
>> as well.
>>
>> I applied the v2 of this patch (with a trivial fix) to trivial queue
>> (before seeing this v3), I can remove it if you like.
>>
>> Thanks,
>>
>> /mjt
> 
> Hi Michael,
> 
> thanks for your review of this patch. I had no opportunity to test
> it myself, but I also think that it is fine.
> 
> (v2 + trivial fix) should be identical to v3, so this looks good, too.

Yep, fine with me as well.

Thanks, everyone.

Jan

-- 
Siemens AG, Corporate Technology, CT RTC ITP SES-DE
Corporate Competence Center Embedded Linux


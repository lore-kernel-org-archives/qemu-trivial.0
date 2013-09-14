Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKtoE-00063o-5x
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 13:39:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKto7-0005w6-JH
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 13:39:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKto2-0006nO-MS
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 13:38:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54996)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKtnq-0006jn-6p; Sat, 14 Sep 2013 13:38:38 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id BB5C34114E;
	Sat, 14 Sep 2013 21:38:29 +0400 (MSK)
Message-ID: <52349F15.3020706@msgid.tls.msk.ru>
Date: Sat, 14 Sep 2013 21:38:29 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1377063869-16834-1-git-send-email-sw@weilnetz.de>
	<52262A5E.2010507@weilnetz.de> <5234542D.2020400@msgid.tls.msk.ru>
	<5234812D.8080905@weilnetz.de>
In-Reply-To: <5234812D.8080905@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] configure: Enable extra compiler warnings
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
X-List-Received-Date: Sat, 14 Sep 2013 17:39:00 -0000

14.09.2013 19:30, Stefan Weil wrote:
> Am 14.09.2013 14:18, schrieb Michael Tokarev:
[]
>> Well.  I see at least one hidden flag here which is not covered by the
>> description:
>>
>> -gcc_flags="-Wendif-labels $gcc_flags"
>> +gcc_flags="-fstack-protector-all -Wendif-labels $gcc_flags"
>>
>> Is it intentional?
>
> No, -fstack-protector-all should not be there. It might be a relict of
> a previous patch rebase: I added -Wextra in my local branch a long
> time ago, and -fstack-protector-all was obviously moved to another
> location in configure during that time.
>
> I can send an updated patch later, or you can just remove it from
> my original patch.

Please take a look at the resulting patch at
  http://git.corpit.ru/?p=qemu.git;a=shortlog;h=refs/heads/trivial-patches-next
and see if this is the patch you want to be applied.

I verified it compiles on FreeBSD 9.1, but I tried only minimal set
of optional dependencies so things might still break, but I think
we can fix it later.

If it looks okay, I'll send a pull request today.

Thanks,

/mjt


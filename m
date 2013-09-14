Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKtwD-0007wA-44
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 13:47:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VKtw7-0007qQ-4W
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 13:47:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VKtw1-0000FC-Lk
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 13:47:11 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:39375)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VKtvq-0000De-L4; Sat, 14 Sep 2013 13:46:54 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	356F272819EA; Sat, 14 Sep 2013 19:46:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id DLVD68POZNLq; Sat, 14 Sep 2013 19:46:42 +0200 (CEST)
Received: from [192.168.178.35] (p54AD9847.dip0.t-ipconnect.de [84.173.152.71])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	9495772819E3; Sat, 14 Sep 2013 19:46:41 +0200 (CEST)
Message-ID: <5234A101.2070506@weilnetz.de>
Date: Sat, 14 Sep 2013 19:46:41 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1377063869-16834-1-git-send-email-sw@weilnetz.de>
	<52262A5E.2010507@weilnetz.de> <5234542D.2020400@msgid.tls.msk.ru>
	<5234812D.8080905@weilnetz.de> <52349F15.3020706@msgid.tls.msk.ru>
In-Reply-To: <52349F15.3020706@msgid.tls.msk.ru>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
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
X-List-Received-Date: Sat, 14 Sep 2013 17:47:16 -0000

Am 14.09.2013 19:38, schrieb Michael Tokarev:
> 14.09.2013 19:30, Stefan Weil wrote:
>> Am 14.09.2013 14:18, schrieb Michael Tokarev:
> []
>>> Well.  I see at least one hidden flag here which is not covered by the
>>> description:
>>>
>>> -gcc_flags="-Wendif-labels $gcc_flags"
>>> +gcc_flags="-fstack-protector-all -Wendif-labels $gcc_flags"
>>>
>>> Is it intentional?
>>
>> No, -fstack-protector-all should not be there. It might be a relict of
>> a previous patch rebase: I added -Wextra in my local branch a long
>> time ago, and -fstack-protector-all was obviously moved to another
>> location in configure during that time.
>>
>> I can send an updated patch later, or you can just remove it from
>> my original patch.
>
> Please take a look at the resulting patch at
>  http://git.corpit.ru/?p=qemu.git;a=shortlog;h=refs/heads/trivial-patches-next
>
> and see if this is the patch you want to be applied.
>
> I verified it compiles on FreeBSD 9.1, but I tried only minimal set
> of optional dependencies so things might still break, but I think
> we can fix it later.
>
> If it looks okay, I'll send a pull request today.
>
> Thanks,
>
> /mjt


It looks good, but I'd prefer my v2:
http://patchwork.ozlabs.org/patch/274928/.
It's nearly identical to your version, but sorts some options
alphabetically.

Thanks for your work.

Stefan




Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vg9q6-0007ou-6r
	for mharc-qemu-trivial@gnu.org; Tue, 12 Nov 2013 04:00:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <whitearchey@gmail.com>) id 1Vg9pz-0007nW-AP
	for qemu-trivial@nongnu.org; Tue, 12 Nov 2013 04:00:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <whitearchey@gmail.com>) id 1Vg9pu-0003F7-Kq
	for qemu-trivial@nongnu.org; Tue, 12 Nov 2013 04:00:43 -0500
Received: from mail-lb0-x230.google.com ([2a00:1450:4010:c04::230]:39702)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <whitearchey@gmail.com>)
	id 1Vg9pu-0003Du-1Y; Tue, 12 Nov 2013 04:00:38 -0500
Received: by mail-lb0-f176.google.com with SMTP id p9so1632606lbv.35
	for <multiple recipients>; Tue, 12 Nov 2013 01:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:to:subject:references:date:cc:mime-version
	:content-transfer-encoding:from:message-id:in-reply-to:user-agent;
	bh=njnUpEnwhvbmFj/vVCbr+6g6B8gFf2DF41sVGXArGA8=;
	b=S7Z9DFIaIlmQxsnWV9BO/BsgPd+eCFaWiLh8VPer8AbNk4/h6+XckwZKBOymOX7r1J
	Hv3WFLhgwbT+kYTCAVSmCWDt3clXVoZPr7lQnsdzkbrIzapnbqDV3B7pFgfC81/NjftL
	AEpiIOEvgfJ73owVUCbFrdeYuJc4qXQyfnxu9mZtKMOIPQjh2MctzV24tWBo6nDVZKta
	NYpMmuo+kkWiU++YOLhxW8oEp3bFjWZZiIoDCJtZKRQwzuLL1zs9uwdbPCegBsoajWDA
	+e7afZ8JtOVjql3/KGPJvDuTrX7Zh2TZVy9ryFsU71k1yhqAbwmNZGa53BjwjxPPjMix
	Ps5Q==
X-Received: by 10.152.10.99 with SMTP id h3mr26790675lab.13.1384246836295;
	Tue, 12 Nov 2013 01:00:36 -0800 (PST)
Received: from whitewind-arch ([193.169.1.2])
	by mx.google.com with ESMTPSA id e10sm3560233laa.6.2013.11.12.01.00.34
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 12 Nov 2013 01:00:35 -0800 (PST)
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
To: "Michael Tokarev" <mjt@tls.msk.ru>
References: <op.w53t8fe2cb68cn@whitewind-arch>
	<527A09E4.7090605@msgid.tls.msk.ru> <op.w55q9zz9cb68cn@whitewind-arch>
Date: Tue, 12 Nov 2013 18:01:02 +0900
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: whitearchey <whitearchey@gmail.com>
Message-ID: <op.w6fhz019cb68cn@whitewind-arch>
In-Reply-To: <op.w55q9zz9cb68cn@whitewind-arch>
User-Agent: Opera Mail/12.16 (Linux)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c04::230
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] qga: Fix shutdown command of guest agent
 to work with SysV
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
X-List-Received-Date: Tue, 12 Nov 2013 09:00:48 -0000

What about patch? Will it be applied? Or should it be rewritten?

On Thu, 07 Nov 2013 11:45:25 +0900, whitearchey <whitearchey@gmail.com> wrote:

> On Wed, 06 Nov 2013 18:20:36 +0900, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
>> 06.11.2013 05:54, whitearchey wrote:
>>> For now guest agent uses following command to shutdown system:
>>> shutdown -P +0 "blabla"
>>> but this syntax works only with shutdown command from systemd or upstart,
>>> because SysV shutdown requires -h switch.
>>>
>>> Following patch changes the command so it works with systemd, upstart and SysV
>>
>> While the patch is one-liner indeed, it is a bit more than trivial.
>> Because it changes things in a non-obvious way, especially when
>> multiple systems are concerned.  Cc'ing qemu-devel@ due to this.
>>
>>> --- a/qga/commands-posix.c
>>> +++ b/qga/commands-posix.c
>>> -        execle("/sbin/shutdown", "shutdown", shutdown_flag, "+0",
>>> +        execle("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
>>
>> Note that shutdown command is not in POSIX, despite the fact
>> that this is put into commands-posix.c
>>
>> Note also that even shutdown from sysvinit on linux has another
>> option, -P, which mean poweroff, while -h means "halt OR poweroff"
>> (the latter is a bit unclear).
> With upstart/systemd qga use one of thee commands, depending on 'mode' parameter:
>    shutdown -P +0 "..."
>    shutdown -H +0 "..."
>    shutdown -r +0 "..."
> SysV equivalents for these are:
>    shutdown -h -P +0 "..."
>    shutdown -h -H +0 "..."
>    shutdown -h -r +0 "..."
> and these retain their meaning with upstart/systemd.
>
>>
>> Does the same work on other *nixes?  *BSD?  Solaris?
>>
> No, it doesn't. But existing code also does not work.
> According to FreeBSD manpages, shutdown does not accept -P and -H options. Commands should be:
>    shutdown -p +0 "..."
>    shutdown -h +0 "..."
>    shutdown -r +0 "..."
>
> shutdown in Solaris does not accept any of -hHpPr and does not accept time in "+0" format
>
>> Thanks,
>>
>> /mjt


-- 
Using Opera's revolutionary email client: http://www.opera.com/mail/


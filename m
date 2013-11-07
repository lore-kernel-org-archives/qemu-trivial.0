Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VeFaw-0003jo-Oe
	for mharc-qemu-trivial@gnu.org; Wed, 06 Nov 2013 21:45:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <whitearchey@gmail.com>) id 1VeFao-0003fB-CM
	for qemu-trivial@nongnu.org; Wed, 06 Nov 2013 21:45:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <whitearchey@gmail.com>) id 1VeFai-00008h-Re
	for qemu-trivial@nongnu.org; Wed, 06 Nov 2013 21:45:10 -0500
Received: from mail-lb0-x230.google.com ([2a00:1450:4010:c04::230]:55515)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <whitearchey@gmail.com>)
	id 1VeFai-0008VE-Jm; Wed, 06 Nov 2013 21:45:04 -0500
Received: by mail-lb0-f176.google.com with SMTP id z5so411985lbh.7
	for <multiple recipients>; Wed, 06 Nov 2013 18:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:to:subject:references:date:cc:mime-version
	:content-transfer-encoding:from:message-id:in-reply-to:user-agent;
	bh=RV4h+Aih6CqWtIWBe+C/siTKxUba5xhCztnBFj/T7QA=;
	b=cEGgK7tDZnj1hcd0jLGGcS2uXdy7jrdeyyPNtYRFgOxLvG+P7VTgwVUNLDqkyOPHb0
	f+/ffEsZlJnoqa8yi2FUwmMkH7hf48wm+HgAlXK1DOXgTR99fNei36hBY3+DKyACawbn
	1GokuKxKsnFwDYOcYOmWj+C9NDZhkK/MV0LKbnM+qnHNzad5L/hYyYkDF1zt5l8cdrXQ
	pgE2xZJPkJyRtnkSnpYCoAmGLj11JCgw0gYoUHUuk3Rs1hGrd1VRfS6H9KbMT39esKjf
	aQBOhLubjie1HyBdJBJDe2/DFk0oSpaa29SYMnTU2HKaV9fD2XYOXWawqUS23YG0GDKk
	25Xw==
X-Received: by 10.152.120.33 with SMTP id kz1mr4437920lab.26.1383792302862;
	Wed, 06 Nov 2013 18:45:02 -0800 (PST)
Received: from whitewind-arch ([193.169.1.2])
	by mx.google.com with ESMTPSA id mr1sm1186576lbc.16.2013.11.06.18.45.00
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 06 Nov 2013 18:45:01 -0800 (PST)
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
To: "Michael Tokarev" <mjt@tls.msk.ru>
References: <op.w53t8fe2cb68cn@whitewind-arch>
	<527A09E4.7090605@msgid.tls.msk.ru>
Date: Thu, 07 Nov 2013 11:45:25 +0900
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: whitearchey <whitearchey@gmail.com>
Message-ID: <op.w55q9zz9cb68cn@whitewind-arch>
In-Reply-To: <527A09E4.7090605@msgid.tls.msk.ru>
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
X-List-Received-Date: Thu, 07 Nov 2013 02:45:16 -0000

On Wed, 06 Nov 2013 18:20:36 +0900, Michael Tokarev <mjt@tls.msk.ru> wrote:

> 06.11.2013 05:54, whitearchey wrote:
>> For now guest agent uses following command to shutdown system:
>> shutdown -P +0 "blabla"
>> but this syntax works only with shutdown command from systemd or upstart,
>> because SysV shutdown requires -h switch.
>>
>> Following patch changes the command so it works with systemd, upstart and SysV
>
> While the patch is one-liner indeed, it is a bit more than trivial.
> Because it changes things in a non-obvious way, especially when
> multiple systems are concerned.  Cc'ing qemu-devel@ due to this.
>
>> --- a/qga/commands-posix.c
>> +++ b/qga/commands-posix.c
>> -        execle("/sbin/shutdown", "shutdown", shutdown_flag, "+0",
>> +        execle("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
>
> Note that shutdown command is not in POSIX, despite the fact
> that this is put into commands-posix.c
>
> Note also that even shutdown from sysvinit on linux has another
> option, -P, which mean poweroff, while -h means "halt OR poweroff"
> (the latter is a bit unclear).
With upstart/systemd qga use one of thee commands, depending on 'mode' parameter:
   shutdown -P +0 "..."
   shutdown -H +0 "..."
   shutdown -r +0 "..."
SysV equivalents for these are:
   shutdown -h -P +0 "..."
   shutdown -h -H +0 "..."
   shutdown -h -r +0 "..."
and these retain their meaning with upstart/systemd.

>
> Does the same work on other *nixes?  *BSD?  Solaris?
>
No, it doesn't. But existing code also does not work.
According to FreeBSD manpages, shutdown does not accept -P and -H options. Commands should be:
   shutdown -p +0 "..."
   shutdown -h +0 "..."
   shutdown -r +0 "..."

shutdown in Solaris does not accept any of -hHpPr and does not accept time in "+0" format

> Thanks,
>
> /mjt


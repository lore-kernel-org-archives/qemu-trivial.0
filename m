Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S4bkC-0004cy-UW
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2012 12:30:44 -0500
Received: from eggs.gnu.org ([208.118.235.92]:49131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S4bk0-00046i-EK
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 12:30:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S4bju-0001CT-64
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 12:30:32 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:50722)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1S4bjN-0000yO-Cw; Mon, 05 Mar 2012 12:29:53 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	2053E7280099; Mon,  5 Mar 2012 18:29:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id PGEdo-Kf7JSc; Mon,  5 Mar 2012 18:29:50 +0100 (CET)
Received: from flocke.weilnetz.de (p5086EA78.dip.t-dialin.net [80.134.234.120])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	96E367280009; Mon,  5 Mar 2012 18:29:50 +0100 (CET)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1S4bjK-0001jR-8z; Mon, 05 Mar 2012 18:29:50 +0100
Message-ID: <4F54F80E.6040401@weilnetz.de>
Date: Mon, 05 Mar 2012 18:29:50 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20120207 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1330928551-6452-1-git-send-email-sw@weilnetz.de>	<4F54BE41.7040409@suse.de>
	<CAFEAcA-F276yFMOfo8KxPHqNtf+UnWSN_h9WDaMwoNB4ZqbPhQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-F276yFMOfo8KxPHqNtf+UnWSN_h9WDaMwoNB4ZqbPhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] osdep: Remove local
 definition of macro offsetof
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
X-List-Received-Date: Mon, 05 Mar 2012 17:30:43 -0000

Am 05.03.2012 14:49, schrieb Peter Maydell:
> On 5 March 2012 13:23, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
>> Am 05.03.2012 07:22, schrieb Stefan Weil:
>>> The macro offsetof is defined in stddef.h. It is conforming to
>>> the standards C89, C99 and POSIX.1-2001 (see man page), so it
>>> is a sufficiently old standard.
>>>
>>> Therefore chances are very high that QEMU never needs a local
>>> definition of this macro.
>
>> Did you check when this was introduced and whether the commit message
>> gave any explanation why?
>
> It's been copied and moved around and rerationalised down to one
> definition since then, but the first offsetof() definition was
> added by Fabrice in fd6ce8f66 in May 2003, with no particular
> comment about it. That is about as close as qemu gets to "it has
> always been this way" :-)
>
> Nearly a decade on, I think dropping it is probably reasonably
> safe.
>
> -- PMM

Thanks for your mail.

If anybody likes historic discussion threads, here is one from 2008:

http://lists.nongnu.org/archive/html/qemu-devel/2008-06/msg00009.html

I am working without the local definition in my QEMU tree since 4 years n=
ow.

Cheers,
Stefan W.



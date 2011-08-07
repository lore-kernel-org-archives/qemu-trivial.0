Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qpzpt-0007Rm-3c
	for mharc-qemu-trivial@gnu.org; Sun, 07 Aug 2011 05:39:57 -0400
Received: from eggs.gnu.org ([140.186.70.92]:52223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1Qpzpq-0007Jp-Oh
	for qemu-trivial@nongnu.org; Sun, 07 Aug 2011 05:39:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1Qpzpq-0007h0-00
	for qemu-trivial@nongnu.org; Sun, 07 Aug 2011 05:39:54 -0400
Received: from mail-qy0-f173.google.com ([209.85.216.173]:54604)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1Qpzpn-0007gl-Tk; Sun, 07 Aug 2011 05:39:51 -0400
Received: by qyk31 with SMTP id 31so1214880qyk.4
	for <multiple recipients>; Sun, 07 Aug 2011 02:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=JDWic5WDGhOk9biR8YeAXL89aoSMUE9sJ2gh+C4ztr0=;
	b=NQCu0FmRYDLIEQAqibyZDQehbLzy0n8okE/lOtTjC4sisJSvQ9PWnkzuMyZDGIbhND
	S526UbpbDMfwUchuw4qgpgEf7hxGZD/sm/Fdz4f6/gggEK94OfWi1CxDwPCc40RpFbM6
	fD6f/G9kptoyqoC9+B+vR/yN+7IkVwFiJUl2M=
Received: by 10.224.110.3 with SMTP id l3mr3625901qap.32.1312709991124; Sun,
	07 Aug 2011 02:39:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.37.82 with HTTP; Sun, 7 Aug 2011 02:39:31 -0700 (PDT)
In-Reply-To: <4E29EEEC.3090803@mail.berlios.de>
References: <1311190818-4793-1-git-send-email-weil@mail.berlios.de>
	<1A5A263C-4EFA-4BF5-AC6E-937D109C8DA7@web.de>
	<4E29EEEC.3090803@mail.berlios.de>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sun, 7 Aug 2011 09:39:31 +0000
Message-ID: <CAAu8pHvVsNtVhrc+Mg4v4JdAPvHjSyUxcFb3n9WZKv7RrqPBjA@mail.gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <andreas.faerber@web.de>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] darwin-user: Remove two
	unused variables
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
X-List-Received-Date: Sun, 07 Aug 2011 09:39:55 -0000

Thanks, applied.

On Fri, Jul 22, 2011 at 9:43 PM, Stefan Weil <weil@mail.berlios.de> wrote:
> Am 22.07.2011 22:48, schrieb Andreas F=C3=A4rber:
>>
>> Hi Stefan W.,
>>
>> Am 20.07.2011 um 21:40 schrieb Stefan Weil:
>>
>>> cppcheck report:
>>>
>>> darwin-user/signal.c:322: style: Unused variable: i
>>> darwin-user/signal.c:322: style:
>>> Variable 'err' is assigned a value that is never used
>>
>> Does this really bug you? I'm a bit skeptical towards trying to fix
>> warnings in code that doesn't compile either way... (or does it by now?)
>>
>> Andreas
>
> Hi Andreas,
>
> the warnings were the result of a static code inspection with
> a program called cppcheck. I don't compile darwin code,
> so I did not notice that the code does not compile.
>
> Is there a good reason to keep those two unused variables?
> Fixing the issue helps with static code analysis because
> unnecessary manual code checks can be avoided.
>
> Cheers,
> Stefan
>
>
>


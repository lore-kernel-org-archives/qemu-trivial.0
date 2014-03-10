Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN154-0004Bz-4b
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 10:21:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WN14y-0004Al-Tb
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 10:21:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WN14u-0004t4-P9
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 10:21:20 -0400
Received: from mail-lb0-f178.google.com ([209.85.217.178]:57542)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WN14u-0004sq-Hz
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 10:21:16 -0400
Received: by mail-lb0-f178.google.com with SMTP id s7so4575412lbd.23
	for <qemu-trivial@nongnu.org>; Mon, 10 Mar 2014 07:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=0XHhFvPRQtiZB5wc6+fnkR/AytAJAKIt99zQh+P48fo=;
	b=JIM1I8DtEwwedAE6txDx9LOKeMDdrZCuCTPPED+hOjgRYBzhb6B6UYcNfx9C3gsdoF
	uSGhz6YoBAhDPdcQQbhxDHXOo8Js/2X4Khf4bIBG5vpAAlD9ZBc4eR/E/kgQFQTxGCn8
	/h3kkiYrRrSpsxBIu+UEaYCcLH11yvX94+nAGqYUsg+ppthOXdgX16SWltULITqL7qJ5
	oc6TVe6mvpocMf8LGxoTV8ZJoT9VFLkAGGR1Z9b+NPmkk285o30djKwdp2j1vv06JEna
	owWnd3UpCEY61clBP3I/e+VoQJgL/44HfjI+RXqteBgspvsF8sZRRLX8lVUVa6fCeLdE
	Djgw==
X-Gm-Message-State: ALoCoQm9QLcHvKEPAyAuHO+WdesjGDN8GamWLYuoJdSNHF18ZEyH7dj8+/aCF+4Fj5HgJC345pS5
X-Received: by 10.112.137.5 with SMTP id qe5mr22382835lbb.16.1394461275303;
	Mon, 10 Mar 2014 07:21:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.118.34 with HTTP; Mon, 10 Mar 2014 07:20:55 -0700 (PDT)
In-Reply-To: <531A41A7.80302@suse.de>
References: <1394219753-26106-1-git-send-email-sw@weilnetz.de>
	<531A211D.8030209@suse.de> <531A2587.8030104@weilnetz.de>
	<531A41A7.80302@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Mar 2014 14:20:55 +0000
Message-ID: <CAFEAcA-eh197bmJz8fT6LScfdi2UE_3kZGOv9p6XKQ+iAmzqJg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.178
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] libvixl: Fix format strings
 for several int64_t values
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
X-List-Received-Date: Mon, 10 Mar 2014 14:21:25 -0000

On 7 March 2014 22:01, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> Am 07.03.2014 21:01, schrieb Stefan Weil:
>> Am 07.03.2014 20:42, schrieb Andreas F=C3=A4rber:
>>> Am 07.03.2014 20:15, schrieb Stefan Weil:
>>>> "%d" or "%x" won't work on hosts where int values are smaller than 64 =
bit.
>>>>
>>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>>> ---
>>>>  disas/libvixl/a64/disasm-a64.cc |   20 ++++++++++----------
>>>>  1 file changed, 10 insertions(+), 10 deletions(-)
>>>
>>> Patch looks correct, but I see no indication that this is a backport
>>> from upstream libvixl. Have you submitted it there too?
>>
>> If I knew how to submit it to libvixl, I'd have done that already. I did
>> not find any hint (e-mail address, keyword contrib) in the sources from
>> github. Can you help me?
>
> Google led me to the following:
> https://github.com/armvixl/vixl
>
> vixl@arm.com

This is the right email address and git repo, yes.
(our disas/libvixl/README gives the github URL, at least.)

I would encourage you to email them patches, it will
act as a prod for them to get themselves set up to
handle incoming contributions properly :-)

>> It would also be fine if someone just takes my
>> patch and applies it there.
>
> Hopefully Peter can help; I just remembered someone asking not to apply
> spelling fixes to not complicate functional backports.

I will apply this patch to target-arm.next. I'm happy
that we carry genuine bugfixes to libvixl (hopefully
in anticipation of them going away on a future update),
it's only non-functional changes I'd rather we don't
carry in our tree.

thanks
-- PMM


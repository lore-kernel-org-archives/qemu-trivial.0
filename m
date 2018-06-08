Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fRJGe-0000DE-Nt
	for mharc-qemu-trivial@gnu.org; Fri, 08 Jun 2018 11:25:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fRJGc-0000AY-4O
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 11:25:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fRJGb-0006C2-28
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 11:25:30 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:33003)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fRJGa-0006Be-Tq
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 11:25:28 -0400
Received: by mail-ot0-x244.google.com with SMTP id h6-v6so16141052otj.0
	for <qemu-trivial@nongnu.org>; Fri, 08 Jun 2018 08:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=tvr0byWkoBZXZ5nIGSg08TjGK51gPaI0JEwjiIiIsQQ=;
	b=V4GGhjhTLGb6WmQcHpImeGL2TjHXSOxhTylllYFJJ7ZEVBxyMu1dbNkj9KDsTQSmIT
	t7QJBCbAL0GMn3wj1+P7k1KZZ0dZx2ard3+IQoEjoifwu0um+4HC30abQ2j0WGeQLbC0
	jkRKmOwduoGd2uLTZW2M2FyPBc2q6j0irtymg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=tvr0byWkoBZXZ5nIGSg08TjGK51gPaI0JEwjiIiIsQQ=;
	b=EaE9bM8tu7zLhpYIXYDXWWefttd1NlkyC5R50/jMNtm711Y9r25OESUFM3z/AVH7rg
	1U8JfPBO+8d3kDvgALWLxWDAPAaIkH6LDtzMc4cnHQZfCNR4vpeHDESeqM00Evf3L29l
	5cpRR/Wivb7HHqWM/Y5RjJO4BGhVhvjaWMm2hAPOTxfi8pfrKQ368q1wWpRpzPkhTQOr
	Iij8cm1oU8dBYdsEDsBQwBfaMULFk9C2rVAecnnHs19AgFLhS+6phMsomgB83/dyZ9An
	JS9c5dw+dQvSmhVjaFTDI8MdiY3ii2M7ruKSIDV/422dZSxc23yRkhyHg56K5NNC1rd9
	chhg==
X-Gm-Message-State: APt69E1AqyKjXpGX9jMgonQZQdbmz8U3DawMUMg08i+LhqWfbyF/8inV
	8yKQ/mHhST1RiiGKQCt2SbYpQWmJMn9LPfrkZNGMKA==
X-Google-Smtp-Source: ADUXVKKHs42DLPVnR4lD7fvv9AFQghrjt5glhd9LehnTzVzcjIes88rEL3MLTxZmt9QBJiWXaEAmMKnehpqFapn2Fjs=
X-Received: by 2002:a9d:34db:: with SMTP id
	t27-v6mr4216683otd.316.1528471528124; 
	Fri, 08 Jun 2018 08:25:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Fri, 8 Jun 2018 08:25:07 -0700 (PDT)
In-Reply-To: <9abdaa17-d6d1-0c34-2a20-43078b487bef@redhat.com>
References: <20180607210818.12727-1-f4bug@amsat.org>
	<9abdaa17-d6d1-0c34-2a20-43078b487bef@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jun 2018 16:25:07 +0100
Message-ID: <CAFEAcA-QYnWOo2Hqdr-3tKDDxWDnR+tF4snd15Y1P6md04CogA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Paolo Bonzini <pbonzini@redhat.com>,
	Patryk Olszewski <patryk@fala.ehost.pl>, 
	BALATON Zoltan <balaton@eik.bme.hu>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Laurent Desnogues <laurent.desnogues@gmail.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-trivial] [PATCH] chardev: Restore CR,LF on stdio
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jun 2018 15:25:31 -0000

On 8 June 2018 at 06:47, Thomas Huth <thuth@redhat.com> wrote:
> On 07.06.2018 23:08, Philippe Mathieu-Daud=C3=A9 wrote:
>> Remove the 'stair-step output' on stdio.
>>
>> This partially reverts commit 12fb0ac05, which was correct
>> on the mailing list but got corrupted by the maintainer :p
>>
>> Introduced-by: 3b876140-c035-dd39-75d0-d54c48128fac@redhat.com
>> Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Suggested-by: Thomas Huth <thuth@redhat.com>
>> Tested-by: Laurent Desnogues <laurent.desnogues@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>> See:
>> http://lists.nongnu.org/archive/html/qemu-devel/2018-05/msg06202.html (b=
ug)
>> http://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg01309.html (r=
eport)
>>
>> Peter, Can this enters directly as bug-fix?
>>
>>  chardev/char-stdio.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/chardev/char-stdio.c b/chardev/char-stdio.c
>> index d83e60e787..96375f2ab8 100644
>> --- a/chardev/char-stdio.c
>> +++ b/chardev/char-stdio.c
>> @@ -59,7 +59,7 @@ static void qemu_chr_set_echo_stdio(Chardev *chr, bool=
 echo)
>>      if (!echo) {
>>          tty.c_iflag &=3D ~(IGNBRK | BRKINT | PARMRK | ISTRIP
>>                           | INLCR | IGNCR | ICRNL | IXON);
>> -        tty.c_oflag &=3D ~OPOST;
>> +        tty.c_oflag |=3D OPOST;
>>          tty.c_lflag &=3D ~(ECHO | ECHONL | ICANON | IEXTEN);
>>          tty.c_cflag &=3D ~(CSIZE | PARENB);
>>          tty.c_cflag |=3D CS8;
>>
>
> I think this is the right way to go.
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Applied to master, thanks.

-- PMM


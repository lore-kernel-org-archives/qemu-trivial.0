Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g8QLW-00077Z-9d
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2018 09:40:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g8QLT-00075c-Lw
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:40:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g8QLR-0007sn-Pk
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:40:43 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42284)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g8QLP-0007pX-RL
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:40:40 -0400
Received: by mail-ot1-x341.google.com with SMTP id h26-v6so12729762otl.9
	for <qemu-trivial@nongnu.org>; Fri, 05 Oct 2018 06:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k10c3cVeB+7qn8CLzu4qc5gs9Ot+C2yLitioUDx1DpI=;
	b=Hz8ZojfFIPIrz7hT79Xn8yuUpNWa6SntBbFyZURMd0FW70uOuTgB6b0wm9KugzHInM
	emj+bP/s7IVwET/2KsDT34jtn6ibIxRDyBvUy49H68B4pKAppsh8JrKux5EA3Q6j0axO
	DcBPHZ6Y6sLGE37t+dTeU8hXvuLWk1W1SQpuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k10c3cVeB+7qn8CLzu4qc5gs9Ot+C2yLitioUDx1DpI=;
	b=ZQwufs5mQpjQ7EXER6WUfSVgO3EPJ+EytGZkBoNRnIjB9eblyhOviZVlaYroWUScuI
	jauNLjNN7yCJitMJ+XtBs44ZC8+JO/yiXNDqMpq0zQxvTGOgFaO+RLVFHQb4hFos51oQ
	kXLmCjnBiK6vGnXcg6JdycQT9XQ6KHtwMY0E5KgpTzhqbCV81OKIUVOASENElbN4VuQh
	+AfiDcRmqzYVOCFrprvu2Dj9LKNXQQaEcSI6/Vy23ehIxxiClPQgSxhwHrIMuJMJeqel
	WN4WnCzcj+zfwsLoRPKk2FsfsF1KaXcu2AULmlJe2jPUJ8ebEmR+FgFPFk/S3N2P2JKz
	95ow==
X-Gm-Message-State: ABuFfoiHW3QxSOZyytPTj3dSdhN7c1SX71jL6zFemO7LbzNVGMMq+nO7
	jCPCYhdqkFtnWpDN9pXfZNjA3dHoCLDKRSuJSHJH3w==
X-Google-Smtp-Source: ACcGV61V7FK3eS2zHSGkkxVx6WgLURklqMVSl03hRxGNl0XNlbg2mrjkWWenaqi7wT53HWAaDqvjBztNbgV25kReMPg=
X-Received: by 2002:a9d:cd8:: with SMTP id o24mr6178975otd.363.1538746832344; 
	Fri, 05 Oct 2018 06:40:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP;
	Fri, 5 Oct 2018 06:40:11 -0700 (PDT)
In-Reply-To: <5616e4d4-938c-4e5f-6fe0-64e52d2fe6a7@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-2-crosa@redhat.com>
	<5616e4d4-938c-4e5f-6fe0-64e52d2fe6a7@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Oct 2018 14:40:11 +0100
Message-ID: <CAFEAcA-7Z2qubiC-O2E-pg+YwYkzjYpB=J_xfLePieuZVSKmjA@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, 
	Qemu-block <qemu-block@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 01/10] qemu-img.c: comment
 typo fix
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
X-List-Received-Date: Fri, 05 Oct 2018 13:40:44 -0000

On 4 October 2018 at 17:48, Eric Blake <eblake@redhat.com> wrote:
> On 10/4/18 11:18 AM, Cleber Rosa wrote:
>>
>> A trivial comment typo fix.
>>
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>

>> --- a/qemu-img.c
>> +++ b/qemu-img.c
>> @@ -1085,7 +1085,7 @@ static int64_t find_nonzero(const uint8_t *buf,
>> int64_t n)
>>   }
>>     /*
>> - * Returns true iff the first sector pointed to by 'buf' contains at
>> least
>> + * Returns true if the first sector pointed to by 'buf' contains at least
>
>
> NACK.  You're not the first person to propose this change.  However, "iff"
> is an English word (albeit archaic) which is shorthand for "if and only if",
> which has a distinct logical meaning separate from the weaker "if".
> Spelling it out in longhand instead of calling it a typo is probably
> acceptable, though.

Yes; if you happen to have a mathematical background then it's
a familiar abbreviation; but otherwise it isn't, and it's more
confusing than helpful I think. (I don't think it's archaic; it's
just commonly used in university-and-higher-level maths and not
elsewhere.)

 git grep '\Wiff\W'
shows a surprisingly large number of uses. (NB that some of those
are in 3rd-party code, notably the libdecnumber stuff, and should
probably not be changed.)

thanks
-- PMM


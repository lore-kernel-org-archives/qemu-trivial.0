Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eHTi0-0005Wn-NL
	for mharc-qemu-trivial@gnu.org; Wed, 22 Nov 2017 07:00:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHTht-0005Vj-Go
	for qemu-trivial@nongnu.org; Wed, 22 Nov 2017 07:00:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHThn-0006ry-Pc
	for qemu-trivial@nongnu.org; Wed, 22 Nov 2017 07:00:45 -0500
Received: from mail-ot0-x22f.google.com ([2607:f8b0:4003:c0f::22f]:45836)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eHThn-0006rN-Kn
	for qemu-trivial@nongnu.org; Wed, 22 Nov 2017 07:00:39 -0500
Received: by mail-ot0-x22f.google.com with SMTP id u10so13332733otc.12
	for <qemu-trivial@nongnu.org>; Wed, 22 Nov 2017 04:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1B3YsLUDkgM7bJ6W37VDO28wh00CJ8s3kASMFe8gj+c=;
	b=UoWgqLyN1TgbpkSpDaT5Na3GS3mjMY3JQb2DWy4PMjfLadWj5aMDSmjG5nfDu1lsvY
	uh3xSYC2x6/T46z9NzSCHwz++9py/DF4EBs++KZkxDUMMDAhe0zr5bcmoIogtLvvQOQA
	b+BQlTU4AVG0g3wvNbf3mTPC8gm/Aj5f4nUz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1B3YsLUDkgM7bJ6W37VDO28wh00CJ8s3kASMFe8gj+c=;
	b=BL0ZoX5FXUgntEd33UWeD2sU0tPdBpCz+FsTmgyNAHd0Q7JUsvslYthcjpljsYYVIL
	JissYu5xqKI4Fg9UqXrQQ7H0U3xo8tmSwSeOF05NT74GUVBQTC9/maHlIBTGliDLttC4
	nVjGYxt7VtjIy7AXS08q11vDrZ5deP4L6Jl5idbPSSwFA1P0qEMhrLjzOKXnwRq8ymwc
	1hxZAgvozabAORb9h7X1tP4QrGGTshn02ua7CHNpOt0tsKgnGiizgydATQb7QuqtRjqH
	TYisJNRlKKgRwfF7M159TyxOnjF7/go+7MenUoJWaJhWYU+5Q1+whHAhJky8XMy5KvDL
	APig==
X-Gm-Message-State: AJaThX7RKbSHFtAwNx+k/BMg8HZt7SlbJKeC2KClirD6Fhga6OgVzebZ
	2UXT74o6Xb3dc6uNgHuek+okV3V8iPx3ZSoNojf8BQ==
X-Google-Smtp-Source: AGs4zMaWEzQSiSJjb+Wi3ANNukWfKUDDmkAamaTRmusopGQKW9S0kr0/5HI06GTnueyy3SjC+ht+BZxJATUHkXQ1xK4=
X-Received: by 10.157.90.6 with SMTP id v6mr11706104oth.54.1511352038257; Wed,
	22 Nov 2017 04:00:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Wed, 22 Nov 2017 04:00:17 -0800 (PST)
In-Reply-To: <e52d9ae1-50df-8484-4476-e7b9d6ea0d76@weilnetz.de>
References: <20171116163732.31584-1-sw@weilnetz.de>
	<e52d9ae1-50df-8484-4476-e7b9d6ea0d76@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Nov 2017 12:00:17 +0000
Message-ID: <CAFEAcA8e82pfBOA1WLqPV9MonCsoNge_p1LxPwzL=rGCmHiMsA@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: Fam Zheng <famz@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22f
Subject: Re: [Qemu-trivial] [PATCH for-2.11] Fix build of console and GUI
 executables for Windows
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
X-List-Received-Date: Wed, 22 Nov 2017 12:00:51 -0000

On 21 November 2017 at 21:04, Stefan Weil <sw@weilnetz.de> wrote:
> Am 16.11.2017 um 17:37 schrieb Stefan Weil:
>> It was broken by commit 8ecc89f6e792152496eccb684d6c8c48aba8027d which
>> moved the SDL linker flags from macro libs_softmmu to macro SDL_LIBS.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>
>> Peter, can you apply this fix directly, or do you need a pull request?
>>
>> Regards
>> Stefan
>>
>>  Makefile.target | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Makefile.target b/Makefile.target
>> index e4244c188a..f9a9da7e7c 100644
>> --- a/Makefile.target
>> +++ b/Makefile.target
>> @@ -22,7 +22,7 @@ QEMU_PROG_BUILD = $(QEMU_PROG)
>>  else
>>  # system emulator name
>>  QEMU_PROG=qemu-system-$(TARGET_NAME)$(EXESUF)
>> -ifneq (,$(findstring -mwindows,$(libs_softmmu)))
>> +ifneq (,$(findstring -mwindows,$(SDL_LIBS)))
>>  # Terminate program name with a 'w' because the linker builds a windows executable.
>>  QEMU_PROGW=qemu-system-$(TARGET_NAME)w$(EXESUF)
>>  $(QEMU_PROG): $(QEMU_PROGW)
>
>
> The fix missed v2.11.0-rc2. Can it be applied before v2.11.0-rc3?

Sure, I've put it on my list. In general though, just cc'ing
me on patches is not guaranteed to get my attention, as I
more or less ignore whether I'm cc'd or not as I scan
subject lines. Sending a pull request is the best way to
guarantee getting something to my attention to be applied;
pull requests are the mechanism for allowing me to ignore
patches related to all the parts of QEMU I don't care
about, by delegating them to somebody else :-)

thanks
-- PMM


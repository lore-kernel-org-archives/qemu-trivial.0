Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYIbk-0007yS-Hs
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jul 2017 17:03:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYIbh-0007rA-Hn
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 17:03:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYIbg-0003U6-86
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 17:03:37 -0400
Received: from mail-wr0-x236.google.com ([2a00:1450:400c:c0c::236]:35533)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dYIbf-0003Td-Vb
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 17:03:36 -0400
Received: by mail-wr0-x236.google.com with SMTP id k71so21858085wrc.2
	for <qemu-trivial@nongnu.org>; Thu, 20 Jul 2017 14:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+b3TCwPFreSFDCA481MVtq5BWBTSBkDTQAOcnm77Ms0=;
	b=d6wzoMAooAVKvmOFHrZK5B1MAPZxTgHKs0CuXNXRGEeBR+xNH20d4ydYr963Zkl2Zy
	UKxkI0xv3L05WWVGKwFWRiy6lIm2ODWLNuPweWcuFCOfszlztZogRiXkZo7wBQXXt0C4
	2+afhHIR4GHQmOSiuTEZAKcJT0aVd3OdBe5s0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+b3TCwPFreSFDCA481MVtq5BWBTSBkDTQAOcnm77Ms0=;
	b=FJLq72uGAr2tMMzfgH3YF7q4K7V4s4SbRgthWhOvFpP9HwNGtlA8+hX6D0p4+RRpmI
	a9Vu5spf6ullQy36XOQWqbJiDwfCN4B18iSe4Lxmx0tE4lhguRoXQ2exojGGapLoAYTF
	C3RYnClTpkIA+u84iRbKB5EKSDJ1GXRVn0stUKkhbWIEJv0fP9bXSe7DmXGgUVfQHapk
	5Kw0n13lujsFj2jatDeJMcxmuLgfqCP36cIctMLuzTuqGcs0lwl2p6+1Lri0AIdU7gOj
	a9YWFhFIq8UtkwJOC5AUT9YV/CzYM8Or0DESpSfsvOcVqDEzejBZKABsoGtSe6PpfCJv
	bG/g==
X-Gm-Message-State: AIVw111+OuIJIq2VZVWft47Ctv24ClE5F7PJVDn/8Di3/dCmV7GpNWnN
	cMmDdUA8uKTRrRIfXYBo6A3e7DRfkiZth7/xGA==
X-Received: by 10.223.165.146 with SMTP id g18mr7368402wrc.167.1500584614876; 
	Thu, 20 Jul 2017 14:03:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Thu, 20 Jul 2017 14:03:14 -0700 (PDT)
In-Reply-To: <d4b6f6a0-3479-795a-97b2-68c98a6b0c24@twiddle.net>
References: <1500568290-7966-1-git-send-email-peter.maydell@linaro.org>
	<d4b6f6a0-3479-795a-97b2-68c98a6b0c24@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jul 2017 22:03:14 +0100
Message-ID: <CAFEAcA8tkW2bk_O3iDO-wWpY9EUbUNkUL93OShipsvckj-jkoQ@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Alexander Graf <agraf@suse.de>,
	Cornelia Huck <cohuck@redhat.com>, 
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	David Gibson <david@gibson.dropbear.id.au>,
	Kamil Rytarowski <kamil@netbsd.org>, 
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::236
Subject: Re: [Qemu-trivial] [PATCH for-2.10] Use qemu_tolower() and
 qemu_toupper(), not tolower() and toupper()
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
X-List-Received-Date: Thu, 20 Jul 2017 21:03:38 -0000

On 20 July 2017 at 19:26, Richard Henderson <rth@twiddle.net> wrote:
> On 07/20/2017 06:31 AM, Peter Maydell wrote:
>>
>> gdbstub.c:914:13: warning: array subscript has type 'char'
>>
>> This reflects the fact that toupper() and tolower() give
>> undefined behaviour if they are passed a value that isn't
>> a valid 'unsigned char' or EOF.
>
>
> Not saying we shouldn't use qemu_tolower etc, but this statement is not true
> at all.  Officially, the argument to toupper and tolower is type int.

(I was going to quote POSIX here but I see Eric has done so already.)

> This sounds like a bug in NetBSD -- though it may not even be that, as they
> may have done something clever and put the symbol in the middle of the data.
> A trick that worked before compiler warnings got smarter.

https://ftp.netbsd.org/pub/NetBSD/NetBSD-current/src/sys/sys/ctype_inline.h
The implementation is
  #define toupper(c) ((int)((_toupper_tab_ + 1)[(c)]))

(where I assume _toupper_tab_ is the obvious array.)

thanks
-- PMM


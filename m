Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZH8bo-0006Uq-Bi
	for mharc-qemu-trivial@gnu.org; Mon, 20 Jul 2015 06:47:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZH8bi-0006Qe-So
	for qemu-trivial@nongnu.org; Mon, 20 Jul 2015 06:47:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZH8be-0001hx-Pq
	for qemu-trivial@nongnu.org; Mon, 20 Jul 2015 06:47:38 -0400
Received: from mail-vn0-f44.google.com ([209.85.216.44]:36596)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZH8be-0001hn-M9
	for qemu-trivial@nongnu.org; Mon, 20 Jul 2015 06:47:34 -0400
Received: by vnk197 with SMTP id 197so21365372vnk.3
	for <qemu-trivial@nongnu.org>; Mon, 20 Jul 2015 03:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=u8AAg2pdFFPeOuWN25Tmw6q5X+jFok9vfrBCzfeX5Ak=;
	b=jv6v8PXJb4E3btFJV8wdCANEPi883Ih6A6yav3NWyuF88A50hogEMhI/9Cc/5BIX+s
	CoEdjI7mlTPzgUXUl0DKY/GtrcR++JftasAxocHO+j+E/09OA0t8yjtbVRZsfvbXHnRs
	ybSBR0tls0+tQts6RvN4g5hZk942LRkFd05VHVHJ0Mmu8EIGvaUCK9+sCmdFKZbBbUgu
	y5nfReOwbmFGLDA3mqS7cpwaWNvsvoJfYmCYUm9FmpZZWRdnnL+xh08d5r8mSjNG2Zec
	Wo9fiNCC5A5aaG2lWlZlXuTVwqFdzUue7Wx+CtyNn56YpMxui/r117PsHnhvJg1x2oQk
	k0VQ==
X-Gm-Message-State: ALoCoQkt3p2LfhGO/BHYWrafBh7zOAUeS3Q0Ucv5wKgzlmnYWE+9T2RAy3hTZDIvJ0j8XKvYCfgL
X-Received: by 10.52.114.42 with SMTP id jd10mr36006765vdb.90.1437389254012;
	Mon, 20 Jul 2015 03:47:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Mon, 20 Jul 2015 03:47:14 -0700 (PDT)
In-Reply-To: <CAFEAcA9UhSNVMQ0KDRmQH6pjo=eYRHC+BACCvdoaSGePFH6asQ@mail.gmail.com>
References: <1437208027-14584-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA9UhSNVMQ0KDRmQH6pjo=eYRHC+BACCvdoaSGePFH6asQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jul 2015 11:47:14 +0100
Message-ID: <CAFEAcA8BP3kPOFVEKgGiC-uwraQ7xz0OC7waOEOWsnTCcVtq_g@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.44
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH for-2.4] disas/arm-a64: Add missing
	compiler attribute GCC_FMT_ATTR
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
X-List-Received-Date: Mon, 20 Jul 2015 10:47:42 -0000

On 18 July 2015 at 10:13, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 18 July 2015 at 09:27, Stefan Weil <sw@weilnetz.de> wrote:
>> Type fprintf_function which fits here was defined with this attribute.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>
>> This is an optional trivial patch for 2.4 which fixes compiler warnings
>> in my build environment (with -Wextra).
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> No objection if you want to put it in 2.4, though I'm a bit
> surprised that missing GCC_FMT_ATTR provokes warnings.
> The cleanup is nice anyway.

I've applied this to target-arm.next. Thanks.

-- PMM


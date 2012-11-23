Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tbv0w-0003SP-0I
	for mharc-qemu-trivial@gnu.org; Fri, 23 Nov 2012 10:17:58 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Tbv0t-0003R2-GR
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 10:17:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Tbv0n-0005ZP-1K
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 10:17:55 -0500
Received: from mail-ia0-f173.google.com ([209.85.210.173]:59611)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Tbv0m-0005Z9-Sy
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 10:17:48 -0500
Received: by mail-ia0-f173.google.com with SMTP id w21so5037400iac.4
	for <qemu-trivial@nongnu.org>; Fri, 23 Nov 2012 07:17:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=a292AtTYDu+gzvETYQi2MwRKYPLFiF7Ar7L2gQePprY=;
	b=RzXrekx/Fhf4fHPrWcWhk0ZuYix7hKvfnHFq8aM6miNcsLPrmnZXIu9+5LJY/WHdsy
	ZfOmeY+bQ/zVNK3Y8Wm6WrfOoLfsNywd8Zl4bXZanZQ4Zahxd72qsvn3VuEat3SnNtQX
	tsWoV99GdSVfD8mgflBGIeiXo5DlTrhp2im65gWwJ3HCjPuK8jHC4TunGoObC9oNNBOk
	pEwrllOaiE/NoW2PNGLzULuisOT5ADHh8aGwaBnX4D6/q4M1M3TeUatO5xPpFr+k+Pg0
	1rfoZaGOcaL+fdoLl8zEg9yvODA1KNRpl0LNWmLObjSXpC2WkahPA5BSC2IjTRohDiq+
	PefA==
MIME-Version: 1.0
Received: by 10.50.152.196 with SMTP id va4mr3911475igb.13.1353683868100; Fri,
	23 Nov 2012 07:17:48 -0800 (PST)
Received: by 10.50.45.103 with HTTP; Fri, 23 Nov 2012 07:17:47 -0800 (PST)
In-Reply-To: <50AF931B.8080707@redhat.com>
References: <1353683570-30525-1-git-send-email-peter.maydell@linaro.org>
	<50AF931B.8080707@redhat.com>
Date: Fri, 23 Nov 2012 15:17:47 +0000
Message-ID: <CAFEAcA9AnUrbrOKrJx7pkg9j1Ex3Ou2d23ROsn82TJa4Wdrf_Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQmfCeGgdUtoTRAm6h3o37zKrDN6EVBt3WjWJ2Rag8XzpWd3/QJl4RvsTutme0NHVI6zS3Pc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, patches@linaro.org, qemu-devel@nongnu.org,
	Yurij Popov <oss@djphoenix.ru>
Subject: Re: [Qemu-trivial] [PATCH] qemu-timer: Don't use RDTSC on 386s and
	486s
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
X-List-Received-Date: Fri, 23 Nov 2012 15:17:56 -0000

On 23 November 2012 15:15, Paolo Bonzini <pbonzini@redhat.com> wrote:
> Il 23/11/2012 16:12, Peter Maydell ha scritto:
>> Adjust the conditional which guards the implementation of
>>
>> -#elif defined(__i386__)
>> +#elif defined(__i586__)
>>
>>  static inline int64_t cpu_get_real_ticks(void)
>>  {
>>
>
> You should at least test __i686__ too:
>
> $ gcc -m32 -dM -E -x c /dev/null |grep __i
> #define __i686 1
> #define __i686__ 1
> #define __i386 1
> #define __i386__ 1

Yuck. I had assumed gcc would define everything from i386
on up when building for later cores.

-- PMM


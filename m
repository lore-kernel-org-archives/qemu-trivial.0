Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TEcAT-0003Mr-Q5
	for mharc-qemu-trivial@gnu.org; Thu, 20 Sep 2012 04:31:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41626)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TEcAO-0003Kc-Gg
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2012 04:31:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TEcAK-0000bz-FC
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2012 04:31:24 -0400
Received: from mail-ie0-f173.google.com ([209.85.223.173]:35506)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TEcAK-0000a8-AT
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2012 04:31:20 -0400
Received: by iebc10 with SMTP id c10so2830314ieb.4
	for <qemu-trivial@nongnu.org>; Thu, 20 Sep 2012 01:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=LvEsY5ejtt6zoDNH3fGiL9aj8xDUnsdD4aexa/Qet2E=;
	b=kglOP5ROHtLnChlXhQvu4NFtbfBa7vJKB/WjDeXMj7qy9eH5X7wGl6lshNT2yZY/RD
	/PtcbB/5Ec9zHHlihT0eYLiZ0oR/uvvA/AHz1M4jYkS8ra6uNqaFWges5qTLVqn5pckU
	EUV7qE5VgaAsW2KtWkqXlveWciaBFyaYVL2cgAh1noVZHXFkVJiMNVLaLhrA9B33sqO0
	iiDZhMWO+gSkJxU49SUx7hP+z//K+2CzvCSnbQvoSrvo4CWl4tY9fQReNXYsdkrTeY9A
	YiyxhOtq/KbaFuAC7AnKqowPsYrfCU57Y3uik+42coGZeuWemRuaPYqCOphUTdSXnKRI
	LzxA==
MIME-Version: 1.0
Received: by 10.50.168.3 with SMTP id zs3mr947852igb.60.1348129879308; Thu, 20
	Sep 2012 01:31:19 -0700 (PDT)
Received: by 10.50.19.36 with HTTP; Thu, 20 Sep 2012 01:31:19 -0700 (PDT)
In-Reply-To: <505A3039.3070404@weilnetz.de>
References: <1348072874-2096-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA8Yc1V1jnqrsOPT-JVgNX2RmkM2RoZUg2DzAHtW+dWtUA@mail.gmail.com>
	<505A3039.3070404@weilnetz.de>
Date: Thu, 20 Sep 2012 09:31:19 +0100
Message-ID: <CAFEAcA-JJOarXuswU4ZZdGr_DxqUb+5_Rr-itBveXG5+fgi+5Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnh31cEKzs13sH6nVipM2g94Itn0yfWZHv8NkHr0OdRCEHZSEhEFo1naV1JxPRLr4ZYVZFW
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pflash: Avoid warnings from
	coverity
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
X-List-Received-Date: Thu, 20 Sep 2012 08:31:29 -0000

On 19 September 2012 21:51, Stefan Weil <sw@weilnetz.de> wrote:
> Am 19.09.2012 18:45, schrieb Peter Maydell:
>> ...shouldn't we be propagating the write error up to the guest?
>> It feels like this change is just silencing the coverity error
>> without actually fixing the underlying problem.

> As far as I know, there is no concept how a flash memory
> can report a write error. Flash memory which cannot be
> written is unusable.

Just looking at the callers of the pflash_update() function,
they have cases where they set bits in the status register
for errors, so there clearly is a mechanism for reporting
errors back to the guest.

-- PMM


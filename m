Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1an8tk-00051P-EG
	for mharc-qemu-trivial@gnu.org; Mon, 04 Apr 2016 14:06:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1an8th-0004wY-JY
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 14:06:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1an8tc-0007jd-FX
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 14:06:45 -0400
Received: from mail-lf0-x235.google.com ([2a00:1450:4010:c07::235]:36595)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1an8tc-0007jE-70; Mon, 04 Apr 2016 14:06:40 -0400
Received: by mail-lf0-x235.google.com with SMTP id g184so108585852lfb.3;
	Mon, 04 Apr 2016 11:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=rACV4oW3sBvyzjjB7wCVhksrF1RyJfmMzIrguD8yXqU=;
	b=U79DDqYV5b6HLf8u2B+Hwa9i2O1EKfL0lqKSrNNtNedu8+eXmFMxdCPUQ0N3oU9Sxk
	BrSUzBO7FuBVFdnkLawWDcEwUqTGYKPuzBOUA2n+qxQm02WQNSKJSnniXE3c0hmgMl0u
	Daf29AVahSEGa3aCS/MIWICG1gm4fyQnfIHEfS2Hs2KkrLYsut/VogLrn35Ldkr0914h
	dnWlsTWp3p6/MRbRYc2HyL3ryzlu5qXW7yJxt+X/Wf4Sz2EaXLEH9IS1RQRXwcJBBe4B
	uLKysddxdEZclyBzu23QHCHtRSfj+lpmO2PeQtbZ/Mt6iQlHFDddDsBd9M3SJnBNoaGH
	/l5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=rACV4oW3sBvyzjjB7wCVhksrF1RyJfmMzIrguD8yXqU=;
	b=Bz2UHXiS0UhY4xx7EEBD0tkVICwHkUtkGKE6oY17OoRCAOGTRzq28TTgg8PH4waUFp
	81867tsVvsE68Rs/R6RQe+zRv1ilExYoujcRMLpISleIzx0D2huJEpMKepOnvp/LrS8c
	KyT2p1VJsyGN+7Ab33qx5OI27w0rCGB2nwgU9hmqZSNX1tf2wGFSpSBgzJxx5rTTHpXY
	fmpzzPYt7S1i5RiXsdNp4NWBJCj1fymPQUp7z3JTJfs/CkfUcVA7qQ+5IFQevhAYxgfY
	AO1wzZDlgkV19JewjVx7iPhWEQEVvdunOpzdSK+ryT6B1dV3//xyOG2i1OyU/OKNzpn1
	RO5g==
X-Gm-Message-State: AD7BkJLuyUVy7gKMsiznZFcYxlNeV9vEgVeRslywIjW8nXvXsKp+UJ6mciZZWrYkjKZ8uA==
X-Received: by 10.25.80.81 with SMTP id e78mr9615856lfb.133.1459793199461;
	Mon, 04 Apr 2016 11:06:39 -0700 (PDT)
Received: from [192.168.0.46] ([195.91.132.170])
	by smtp.gmail.com with ESMTPSA id
	o187sm5079482lfo.26.2016.04.04.11.06.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Apr 2016 11:06:38 -0700 (PDT)
To: Stefan Weil <sw@weilnetz.de>, Sergey Fedorov <sergey.fedorov@linaro.org>, 
	qemu-devel@nongnu.org
References: <1459767918-796-1-git-send-email-sergey.fedorov@linaro.org>
	<5702567E.6060701@weilnetz.de> <57026A7E.1000506@gmail.com>
	<5702AA32.507@weilnetz.de>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <5702AD2D.8050406@gmail.com>
Date: Mon, 4 Apr 2016 21:06:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <5702AA32.507@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::235
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH] tci: Fix build with no '-DNDEBUG'
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
X-List-Received-Date: Mon, 04 Apr 2016 18:06:46 -0000

On 04/04/16 20:53, Stefan Weil wrote:
> Am 04.04.2016 um 15:22 schrieb Sergey Fedorov:
>> On 04/04/16 14:56, Stefan Weil wrote:
> [...]
>>> There is indeed a regression in the current code. Commit
>>> d38ea87ac54af64ef611de434d07c12dc0399216 added an include statement
>>> which includes assert.h before NDEBUG is defined. This is wrong and
>>> needs a fix. Could you please try tci.c starting like this?
>>>
>>> /* Defining NDEBUG disables assertions (which makes the code faster). */
>>> #if !defined(CONFIG_DEBUG_TCG) && !defined(NDEBUG)
>>> # define NDEBUG
>>> #endif
>>>
>>> #include "qemu/osdep.h"
>>>
>> Doing so really helps. So what are the plans of how to fix the problem?
>>
>> Thanks,
>> Sergey
>
> The correct fix needs a little bit more code because my first try (see
> above) did not get the definition of macro CONFIG_DEBUG_TCG.
>
> My patch was now sent to the list.

Thanks!


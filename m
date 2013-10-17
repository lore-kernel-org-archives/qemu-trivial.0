Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VWttT-0000G0-6L
	for mharc-qemu-trivial@gnu.org; Thu, 17 Oct 2013 16:10:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VWttN-00009M-5x
	for qemu-trivial@nongnu.org; Thu, 17 Oct 2013 16:10:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VWttB-0006vj-IK
	for qemu-trivial@nongnu.org; Thu, 17 Oct 2013 16:09:57 -0400
Received: from mail-la0-f52.google.com ([209.85.215.52]:62345)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VWttB-0006vC-Bq
	for qemu-trivial@nongnu.org; Thu, 17 Oct 2013 16:09:45 -0400
Received: by mail-la0-f52.google.com with SMTP id ev20so2330152lab.11
	for <qemu-trivial@nongnu.org>; Thu, 17 Oct 2013 13:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=AlkgVOHI+FeJRQLncD8u3e+3gUsiwBwwaEjDkfX8vEQ=;
	b=EU/gbBnLcHyPujZhV5KwbKQHfNfLYfkNT3MNmytAMzMrSwdoqSGj+yT7va+oFtyAc3
	Ree2/9oE2f03kf513/J6+fGW4/L6PygOGImFCkFDyQKEMGCEMizGq0EseWVJtJfjmRQl
	6oLN8TyHjrXSJmKQESIijrLPy+A44XenRsvifHbtadtxG/klWTaL6sRg+k12LL6EUB6Q
	e7rpbRnAkZCFaKxSivq4RyDqJcjDhwyDN7YIx9T1KgXqxi9/yrMKrH7irJFnyuHWlXD3
	uVkV8a7WtiDpZISj4pqFgj2+N8M/HNVw01fgkHiB78akmpSKWwfDU/qIKFIDXfhcMAzV
	K70w==
X-Gm-Message-State: ALoCoQm3pR+lyB5wguP5eGdcgbOWQlEedaa/myszXE4K0fYy9iBlnfeyH+9NTTmSQyseHODFZuQu
X-Received: by 10.152.2.74 with SMTP id 10mr3534687las.36.1382040584213; Thu,
	17 Oct 2013 13:09:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Thu, 17 Oct 2013 13:09:23 -0700 (PDT)
In-Reply-To: <1382037806-9393-1-git-send-email-sw@weilnetz.de>
References: <1382037806-9393-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Oct 2013 21:09:23 +0100
Message-ID: <CAFEAcA_curJNeoKdi62rzzcj6tY4RX_omiD9Q=7wdLbhAvYxYw@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.52
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio: Remove unneeded
	memcpy
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
X-List-Received-Date: Thu, 17 Oct 2013 20:10:01 -0000

On 17 October 2013 20:23, Stefan Weil <sw@weilnetz.de> wrote:
> Report from valgrind:
>
> ==19521== Source and destination overlap in memcpy(0x31d38938, 0x31d38938, 64)
> ==19521==    at 0x4A0A343: memcpy@@GLIBC_2.14 (in
> /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
> ==19521==    by 0x42774E: virtio_blk_device_init (virtio-blk.c:686)
> ==19521==    by 0x46EE9E: virtio_device_init (virtio.c:1158)
> ==19521==    by 0x25405E: device_realize (qdev.c:178)
> ==19521==    by 0x2559B5: device_set_realized (qdev.c:699)
> ==19521==    by 0x3A819B: property_set_bool (object.c:1315)
> ==19521==    by 0x3A6CE0: object_property_set (object.c:803)
>
> Valgrind is right: blk == &s->blks, so it is a memcpy of 64 byte with
> source == destination which can be removed.
>
> Reported-by: Dave Airlie <airlied@gmail.com>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I did a quick eyeball of the other memcpy()s in hw/*/*virtio*
and I think this is the only one with this problem.

-- PMM


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPXGC-00005H-WE
	for mharc-qemu-trivial@gnu.org; Sat, 30 Jan 2016 10:16:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aPXGB-000056-18
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 10:16:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aPXGA-0005wQ-0m
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 10:16:22 -0500
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:35821)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aPXG9-0005wI-JA
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 10:16:21 -0500
Received: by mail-vk0-x22b.google.com with SMTP id e6so56634123vkh.2
	for <qemu-trivial@nongnu.org>; Sat, 30 Jan 2016 07:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=BUVTfpKK0kaKOJhT83vHDf0zseZayXcE1UGEyQaif7U=;
	b=UIzEfyGbPIgNkHt0xdKv/oV4DPaKo4EWUyyEUEs592ps0C8FKbPWu/i9S/Mmy1ocUz
	TvXVpR+hQCrnBKvlufIAxvjE6qKSESnQdCAJt+r0/a4XaLIeu+8rxKCEKm04QF6uSYWt
	AFGhxwTqEnYViC97sdK0ys+OM0nZqmVH8/6zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BUVTfpKK0kaKOJhT83vHDf0zseZayXcE1UGEyQaif7U=;
	b=h4/IIDZivzI6ah0tJZDVh8IfOIDn9BFxwkcVAFpxGV6uOvyd/SkOxghKXQgpVmVCdW
	220FVIHMadE33NL9GQR27W06QhsAZpzAo+y8yq5za1iA1cS2YVrukh/1Yqna2sK4RqNi
	J6STIfAmVmMpU4UYUB49EgswtDAlotNiPM/vuYzSEUlNV9b+qhqpuKwmbPlY6vsjIYpY
	G2nKyqqRGpKkudA7/XLmRNTgqePskpeGn8DjfOPJkQeocBqRaV6JdFv4CsbO/co9ZfN6
	g3vb8bDxkUrg+yNRp8dfW1LB05Q0vrOapMBwdKivkrovHUxDPCTGjQ3mQIcMbul3PKrI
	x6HQ==
X-Gm-Message-State: AG10YOQGs1ljoxiOzXW1K6PJnFxw7PpJXLIsJmYmb9Z7xVBmJWdEBsVCa+lGXA/aBOMgh+fKRNbjAvAYgSgZ6aqk
X-Received: by 10.31.47.207 with SMTP id v198mr9635063vkv.6.1454166980997;
	Sat, 30 Jan 2016 07:16:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Sat, 30 Jan 2016 07:16:01 -0800 (PST)
In-Reply-To: <56AC840E.5000303@msgid.tls.msk.ru>
References: <1453205308-20476-1-git-send-email-pbonzini@redhat.com>
	<56AC840E.5000303@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 30 Jan 2016 15:16:01 +0000
Message-ID: <CAFEAcA8GPeR9BmQVQUpipFeBOArMO7LYbnTdTGeS39aC2=bm-Q@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] cpu: cpu_save/cpu_load is
	no more
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
X-List-Received-Date: Sat, 30 Jan 2016 15:16:24 -0000

On 30 January 2016 at 09:36, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 19.01.2016 15:08, Paolo Bonzini wrote:
>> Everything has been converted to vmstate.
>
> Applied to -trivial, thanks!

Ah, I missed that Paolo had sent out this patch before me
(my version is http://patchwork.ozlabs.org/patch/572694/ but
a week later...)

thanks
-- PMM


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJHy0-0002QF-VN
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 04:07:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XJHxt-0002In-Iz
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 04:06:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XJHxo-0003zk-9J
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 04:06:53 -0400
Received: from mail-lb0-f180.google.com ([209.85.217.180]:56821)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XJHxo-0003zX-36
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 04:06:48 -0400
Received: by mail-lb0-f180.google.com with SMTP id v6so3774484lbi.25
	for <qemu-trivial@nongnu.org>; Mon, 18 Aug 2014 01:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iiuom3QXDMNdW5HiUMJtI5+6blAHFOVFByegLCU1L38=;
	b=VqjD8mx10PWxTCt1xJHMy7IqfzabZ7CNl0CHWFBVOTaKnOw2ORVzVk6LldXQflXpEa
	Qz/7Spl6Lw8S5XCRZY07o+vZQfZpcxWCGIzQJF6zajYnV2WGVHmmkTzQYQ4DLkJz0S2+
	CSL3clEg2+T1lsjh51HYau5RqNJIxPcJHEVc7fmAWv3yajuB6EmjX9yTEjVZfDHixz6M
	7HaSxs9PWd0mWGtwDy7D3bFW2KhFz1AhRFvsHTT38vlT3Z12r12C7I6QElZ1QAWn/utX
	9fKDO4BnpHIrcFEJSbPOKMa98chAQVrNABcR+7a1Ya73yYeMqImSFzBg7IzyDfqGUYWY
	2qag==
X-Gm-Message-State: ALoCoQlxBqY7ZnSf62Eg5uD5zJuH683E86a56Wp0aYXpeVuuChTip3VjI3mcDqbsv3JMCLT5N3ye
X-Received: by 10.152.161.225 with SMTP id xv1mr27963796lab.71.1408349206670; 
	Mon, 18 Aug 2014 01:06:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Mon, 18 Aug 2014 01:06:26 -0700 (PDT)
In-Reply-To: <1408348831-10788-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1408348831-10788-1-git-send-email-zhang.zhanghailiang@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Aug 2014 09:06:26 +0100
Message-ID: <CAFEAcA8r51UaT4bety0h3tTjMmyvb2UwZj6scuTLZUBBYJkxVw@mail.gmail.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.180
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Li Liu <john.liuli@huawei.com>,
	Luonengjun <luonengjun@huawei.com>, peter.huangpeng@huawei.com,
	QEMU Developers <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v7] block/vvfat: assert
 return value of fopen which may fail
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
X-List-Received-Date: Mon, 18 Aug 2014 08:06:58 -0000

On 18 August 2014 09:00, zhanghailiang <zhang.zhanghailiang@huawei.com> wrote:
> From: Li Liu <john.liuli@huawei.com>
>
> fopen() may return NULL which will cause setbuf() segmentfault
>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> Signed-off-by: Li Liu <john.liuli@huawei.com>
> ---
>  block/vvfat.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/block/vvfat.c b/block/vvfat.c
> index 70176b1..62023e1 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -1084,6 +1084,7 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
>
>  DLOG(if (stderr == NULL) {
>      stderr = fopen("vvfat.log", "a");
> +    assert(stderr);
>      setbuf(stderr, NULL);
>  })

An assertion is no better than a segfault.

Better I think would be to just remove this whole lump of code
entirely. Lots of other files do debug printing to stderr without
attempting to open a file if stderr happens to be NULL, why
should vvfat.c be special?

-- PMM


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kdEpm-00042F-US
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2020 10:48:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEpk-0003wl-IM
 for qemu-trivial@nongnu.org; Thu, 12 Nov 2020 10:48:24 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:38724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEpi-0003b9-Jx
 for qemu-trivial@nongnu.org; Thu, 12 Nov 2020 10:48:24 -0500
Received: by mail-ed1-x541.google.com with SMTP id y4so983664edy.5
 for <qemu-trivial@nongnu.org>; Thu, 12 Nov 2020 07:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hjNA2AvDa9szCroj0fQiLuVwsuQI9Wj/ThU/JyHkgl4=;
 b=CmZbqAuJkkPhgehXPFDHwyfsjZ8uh3y3jXdzUXP3udJnU6tmn1oo5VCtc9MAL4ctXu
 a71QalRSgzl23tiM7zsYhwlrxnkEfz/sXuBi5E//WAN4Vgwqm9RrYg7lPZ3yxGpncfqI
 +CjzbQozbK5FQbLyx41AhNqMLh/j0DnNXJeEWEO3NGj4ItJ8abKmdlxj5mzplZnwa5R8
 EG0UzPmi0nhSEnOOxcKPcga2lgI5siypLdyNWomzXwZCEwwP5plxN/eYj+7s8oxVqXCo
 nZJ6vAU+T2ZSiR99OK7uO56vWwkRmIhZ1DmVa2V3RyfabPbqP/WDwHGZfhvYCcgs85tM
 QL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hjNA2AvDa9szCroj0fQiLuVwsuQI9Wj/ThU/JyHkgl4=;
 b=BkaIigis9P+NAk6KlIrWx9smcGfEt9+OiW8NPgTdQ/zuhpp07RIgfCCCeXOweRnxC6
 aiuwpjTaCxxWUJ9DFKpl4LSl08arq1RiSrY+UZlR0yOF40fFUhMqMgxgS250AGc/FWfJ
 x5Z1UpNNbYkc4Hhy1v0g0+7kf/IjR2AEkGdt/uhhhBtWuOIcAKIZLUIOE0fBcbe7/AAD
 I/J5ns/rTa4vG64Q+C0RZeUsG22DsFmVaj2P0WubEYnqj9tWZkuFsT7gHCizkgauw7hZ
 dRUQNIixp7dJ3yntZciww6dH/MX5dO5sLokUe/ujkR1c1n5O0Ym3b3fajho7g2+mJcRq
 AJcA==
X-Gm-Message-State: AOAM533SvovLiNHONuk9fSV0mwtVXL0mPumAGwH7wRyTRX7umOfJw6r+
 EK74QCx7hynu5XiC5lXxW+dQXq3zk5CnMcnIMUyOBQ==
X-Google-Smtp-Source: ABdhPJx6jzN7KO44rJjiERAOy4vEIJfZZgcfBHawDcyK+MpH2Ps4S4UcxcAzsGd1MOikZz9D5+NENUZvBM47hUbdb14=
X-Received: by 2002:aa7:df82:: with SMTP id b2mr322393edy.251.1605196100753;
 Thu, 12 Nov 2020 07:48:20 -0800 (PST)
MIME-Version: 1.0
References: <5F997B84.9040900@huawei.com> <5F9A5B48.9030509@huawei.com>
In-Reply-To: <5F9A5B48.9030509@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 15:48:09 +0000
Message-ID: <CAFEAcA-n768kTj8xsb+dv1q5Ut2QJ79T7nhbH=mobYs2MK6vkw@mail.gmail.com>
Subject: Re: [PATCH V2] vhost-user-blk/scsi: Fix broken error handling for
 socket call
To: AlexChen <alex.chen@huawei.com>
Cc: Raphael Norwitz <raphael.s.norwitz@gmail.com>, QEMU <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Nov 2020 15:48:24 -0000

Ping? This is a coverity issue fix which has been reviewed,
whose tree should it go via?

Adding mst to cc list as the listed maintainer.

thanks
-- PMM

On Thu, 29 Oct 2020 at 06:05, AlexChen <alex.chen@huawei.com> wrote:
>
> When socket() fails, it returns -1, 0 is the normal return value and should not return error.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: AlexChen <alex.chen@huawei.com>
> ---
>  contrib/vhost-user-blk/vhost-user-blk.c   | 2 +-
>  contrib/vhost-user-scsi/vhost-user-scsi.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
> index 25eccd02b5..40a2dfc544 100644
> --- a/contrib/vhost-user-blk/vhost-user-blk.c
> +++ b/contrib/vhost-user-blk/vhost-user-blk.c
> @@ -474,7 +474,7 @@ static int unix_sock_new(char *unix_fn)
>      assert(unix_fn);
>
>      sock = socket(AF_UNIX, SOCK_STREAM, 0);
> -    if (sock <= 0) {
> +    if (sock < 0) {
>          perror("socket");
>          return -1;
>      }
> diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
> index 3c912384e9..0f9ba4b2a2 100644
> --- a/contrib/vhost-user-scsi/vhost-user-scsi.c
> +++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
> @@ -320,7 +320,7 @@ static int unix_sock_new(char *unix_fn)
>      assert(unix_fn);
>
>      sock = socket(AF_UNIX, SOCK_STREAM, 0);
> -    if (sock <= 0) {
> +    if (sock < 0) {
>          perror("socket");
>          return -1;
>      }
> --
> 2.19.1


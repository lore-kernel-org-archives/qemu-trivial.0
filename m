Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJLOS-0001nf-Ud
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 07:46:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XJLON-0001jE-Ch
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:46:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XJLOE-0000jd-Jf
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:46:27 -0400
Received: from mail-la0-f49.google.com ([209.85.215.49]:45550)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XJLOE-0000j5-DN
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:46:18 -0400
Received: by mail-la0-f49.google.com with SMTP id hz20so4392254lab.22
	for <qemu-trivial@nongnu.org>; Mon, 18 Aug 2014 04:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rGGiGq9EIdKUa/1oMIgtqQShuH1oqusWfngI/N3ZNMI=;
	b=QW/It6IeybZAxYhehuFDauIT+1SfhuyUdUV6JipV2FKUUE7RwjUVPMisPmDGBOClG3
	VMqfMkF2OrZ9EIUNRLlwUTnLCWJHMFFxm0DE95h5b9sNEmmeNEhOnoe+r84xPVewCK0v
	/T+gsA6m6PV8Z6HeQrYUgOG4+vocKSPcZV+afcZxFKDtCSkEf+H+DZqrj6hFzz8eRDa8
	snD4fxRS/HMc+5VQMeNKyrLjb8bGU2fHmo3HM6QY14RFeYS++4Rk+4/zAaJtYWElYftj
	h6kF9kGOjAmftDSShbNln7kfEC0U1L64dZ164dyqHZKGmKT9yN69effJLodPl6PVpvTt
	mT/g==
X-Gm-Message-State: ALoCoQmnREopT9jZP+MGGSltNhWdo418m7RSaGewtmYFdfQdfGvd46YzexN5nbvevcZxHj8uyc4M
X-Received: by 10.152.161.225 with SMTP id xv1mr29174668lab.71.1408362377226; 
	Mon, 18 Aug 2014 04:46:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Mon, 18 Aug 2014 04:45:57 -0700 (PDT)
In-Reply-To: <1408362096-10482-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408362096-10482-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Aug 2014 12:45:57 +0100
Message-ID: <CAFEAcA9MPis=UV-mUBaAd17=jxDm6va8Md+kXy=GhQAFMuAQnw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.49
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Li Liu <john.liuli@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/vvfat.c: remove
 debugging code to reinit stderr if NULL
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
X-List-Received-Date: Mon, 18 Aug 2014 11:46:31 -0000

On 18 August 2014 12:41, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Just log to stderr unconditionally, like other similar code does.
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  block/vvfat.c |    5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/block/vvfat.c b/block/vvfat.c
> index 70176b1..ea37023 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -1082,11 +1082,6 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
>      vvv = s;
>  #endif
>
> -DLOG(if (stderr == NULL) {
> -    stderr = fopen("vvfat.log", "a");
> -    setbuf(stderr, NULL);
> -})
> -
>      opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
>      qemu_opts_absorb_qdict(opts, options, &local_err);
>      if (local_err) {
> --
> 1.7.10.4

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


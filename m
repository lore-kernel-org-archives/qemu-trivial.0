Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aZHtf-0006Ff-Qg
	for mharc-qemu-trivial@gnu.org; Fri, 26 Feb 2016 07:53:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZHtd-0006D8-5o
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 07:53:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZHtc-00069J-CN
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 07:53:25 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:35839)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZHtb-000691-5T
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 07:53:24 -0500
Received: by mail-vk0-x236.google.com with SMTP id e6so76012819vkh.2
	for <qemu-trivial@nongnu.org>; Fri, 26 Feb 2016 04:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oSW/i1zTHTJ5VLC0pp6boneI0K8YQ0U2OuaVYp3zOO0=;
	b=G9iSssY7oUxZ+v9/PMht3drDxuOk0MgQ+wrgznnU2vX0FgwegKlr+j3mnkzHQTTVxT
	2E5ylxsHCZEYNS0NMX8WCBSxtOEX2VtUvWwhLYKz0YBXAxCU2ql60bgZFb1iqyk8Mq53
	Hg+szCFpB4edUA8sr5Vh+Jym/t5Asoqe+T5+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oSW/i1zTHTJ5VLC0pp6boneI0K8YQ0U2OuaVYp3zOO0=;
	b=KWeqbvfoZF6C/HXKmx2GgFMETAoWtIofzrlkSezu0uBobYbweYWYqFI3lY7GCQetjk
	IGMyOHrV4EAYlmAkvszMhopXisUl21QfAGgdfnqSuJKBI1RAcmcDYfkuHnf8WdS5aYUV
	LdNay/zUnbDdBHmBtEiNeUEKZ/RZc7TFuqVOdK2mCpdFh1UEsx61x3r0pVJ4cqJRqyDp
	dm8B04NxtGg16rw+mxiZ/JrEL8jY2jM9IUxkyqf7jPgZ8oJN3kyo/oCfm4mz+UkkCiUc
	EWUvLX9JZvpAb0yUSHPFObQ9lGFZjjNH4Z4Hi2o6OY8iQGJ8Pxnc+/FMSS01biyLw81e
	673g==
X-Gm-Message-State: AD7BkJIjw7+BUVf06oVGWRMtE5MMSbT8uKyQjV9+v+S137dVhS/fK/UK/OWrF7+o76MrTLPnKhkbRafmbBaaYtGO
X-Received: by 10.31.1.6 with SMTP id 6mr766497vkb.139.1456491202594; Fri, 26
	Feb 2016 04:53:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 26 Feb 2016 04:53:02 -0800 (PST)
In-Reply-To: <56D04596.7010205@huawei.com>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<56B1A90E.3000506@msgid.tls.msk.ru>
	<CAFEAcA9RzHTZhZemvSGZ_Qpji+bu0=13wQJ0ThMbYhYdJ99w1A@mail.gmail.com>
	<56B22469.7040308@redhat.com> <56B2AD13.6030504@huawei.com>
	<56B2EB3E.2000908@redhat.com> <56B2F4E3.6010807@huawei.com>
	<56BA6F6C.5000301@redhat.com> <56C845B1.3080000@huawei.com>
	<56CE2D33.7020005@redhat.com> <56D04596.7010205@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Feb 2016 12:53:02 +0000
Message-ID: <CAFEAcA-nQuKcONE4GZwavB2w55srvHQP4OxLD6epJaZf4b=agA@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: Wei Huang <wei@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] arm: virt: change GPIO
 trigger interrupt to pulse
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
X-List-Received-Date: Fri, 26 Feb 2016 12:53:26 -0000

On 26 February 2016 at 12:31, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> So how about below patch? I've tested it and it works both for ACPI and
> DT. Could you help verify if it works for you? Thanks.
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 15658f4..4d45ea2 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -558,11 +558,20 @@ static void create_rtc(const VirtBoardInfo *vbi,
> qemu_irq *pic)
>      g_free(nodename);
>  }
>
> +#define GPIO_KEY_LATENCY 500 /* 500ms */

I don't understand why a 500ms pulse is better than a short one.

> +static QEMUTimer *gpio_key_timer;

This is state, and must be migrated somehow.

thanks
-- PMM


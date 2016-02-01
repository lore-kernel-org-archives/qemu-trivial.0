Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQInm-0005Tq-JS
	for mharc-qemu-trivial@gnu.org; Mon, 01 Feb 2016 13:02:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQInf-0005Se-P0
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 13:02:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQIne-0003qb-U1
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 13:02:07 -0500
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:32980)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQIne-0003qN-H1
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 13:02:06 -0500
Received: by mail-vk0-x22d.google.com with SMTP id e64so82376846vkg.0
	for <qemu-trivial@nongnu.org>; Mon, 01 Feb 2016 10:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=THPlLgxDWWxCajeSpEhJe8lcdx4RN+IPMuIJ50dww60=;
	b=RREP7FXMQ1AaJmXDwbchb4uzOhFIElXQQn0Y1DbjJUVo+NWJTwGWkJsJn5C7VilNvv
	Rqws3zOIHHcIrbd/V4OMykwm/FDVo8APACCVAoHan9JbMmHgf+wt4EqgBJ24UyZvDnFK
	uAlFYEsMuC5pyPEY9ZbXiHEN2/tgOOb2c5Ibg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=THPlLgxDWWxCajeSpEhJe8lcdx4RN+IPMuIJ50dww60=;
	b=BUQIClEWzjyNl+kEHaQLmulkvyH0rRIBh4A65NPime6uDf0uOL2MKrN8PriP04PH9A
	iu5kA8iy1sw6K3l+iCbFRU3aesQYsTGL4SeJN7VpNhT5LmdrPanGhblvvBzDsy82VRe6
	w7cZuVd3M8odvsdJo6kqjiDDch18y7wpBmenQCh8jMHrA/WnWQyMlha2L8UISwC755Sn
	6I99PjB71uyQrS0MKAYOL2k9X9x4r2lfZSjwpoAGmV+kPxv9SU4oNebKM1ZlhO5rhxor
	i745CJSMy1nW1CmSz6cVXw1uHXoxYgjrPNS/Zdh0E25bzc5e9VCEYozuCVx7cwm0nELO
	9KfA==
X-Gm-Message-State: AG10YOR9WOzt66o4Mgkd+M3C4J6e+hNIiB3AnqKFccGmrIUdQOw0ULt5SnpWZoe9HhyaMHSIAaIyyZnsPwzKzo+l
X-Received: by 10.31.47.207 with SMTP id v198mr16767615vkv.6.1454349725621;
	Mon, 01 Feb 2016 10:02:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 1 Feb 2016 10:01:46 -0800 (PST)
In-Reply-To: <1454347206-23717-2-git-send-email-wei@redhat.com>
References: <1454347206-23717-1-git-send-email-wei@redhat.com>
	<1454347206-23717-2-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Feb 2016 18:01:46 +0000
Message-ID: <CAFEAcA9XZHowe_JtGFcqEJpnZiqXwT+36bBPPKXWSgc1aVGtHg@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH 2/2] ARM: PL061: Misc cleaning fields for
	PL061 device state
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
X-List-Received-Date: Mon, 01 Feb 2016 18:02:13 -0000

On 1 February 2016 at 17:20, Wei Huang <wei@redhat.com> wrote:
> This patch removes float_high field of PL061State, which doesn't seem
> to be used anywhere.
>
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/gpio/pl061.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
> index 342a70d..2c08e88 100644
> --- a/hw/gpio/pl061.c
> +++ b/hw/gpio/pl061.c
> @@ -56,7 +56,6 @@ typedef struct PL061State {
>      uint32_t slr;
>      uint32_t den;
>      uint32_t cr;
> -    uint32_t float_high;
>      uint32_t amsel;
>      qemu_irq irq;
>      qemu_irq out[8];
> @@ -88,7 +87,6 @@ static const VMStateDescription vmstate_pl061 = {
>          VMSTATE_UINT32(slr, PL061State),
>          VMSTATE_UINT32(den, PL061State),
>          VMSTATE_UINT32(cr, PL061State),
> -        VMSTATE_UINT32(float_high, PL061State),
>          VMSTATE_UINT32_V(amsel, PL061State, 2),
>          VMSTATE_END_OF_LIST()

This would be a migration compatibility break, so at a minimum
you need to bump the vmstate struct versions.

thanks
-- PMM


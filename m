Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aVgkK-0001SZ-Cf
	for mharc-qemu-trivial@gnu.org; Tue, 16 Feb 2016 09:36:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVgkH-0001Qz-O0
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 09:36:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVgkG-0000fr-QU
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 09:36:53 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:33733)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVgkG-0000es-Ln
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 09:36:52 -0500
Received: by mail-vk0-x229.google.com with SMTP id k196so135275539vka.0
	for <qemu-trivial@nongnu.org>; Tue, 16 Feb 2016 06:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jFYrQ1Zx5eqvAIsarjz1Fgm644mPxnvO/zOAr39i1cE=;
	b=K89TLEyjBAr14eyqB0iihs8wDV8OHxYei3kQDGiiIjbWoShm2MT0sd87t+cqyAnGA6
	wEO1ECsg/XbFsdN3ouYTiPdr9XeljXZFGmZ0eVc2Tr4pkEpxLNSiSytP3+Hq1ZKq7bZK
	P4mof5oKmZDoX6o62+bGMSJ3Ie6iElKwKfGhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jFYrQ1Zx5eqvAIsarjz1Fgm644mPxnvO/zOAr39i1cE=;
	b=iWqYZXuCQo9MRr0Y+qGBfWwlGqBXLg046brU6B1cRlONXj9xxDQSd+hwlcZlS45nBC
	CKbojLV9pSnwqtP+Yq6XIwGQFx1q7DUq8UbRiWux+gREcR47TY1drliKE1U8/HULlmGO
	dQJA7CJz1NcTkXl5EwXCIWEfBold5G+DR8p+cO8UQGZl0MSTv2ylLsd5hN5gaZ90/ViZ
	QxFwNOdembf3u2ZgHSmX+Y3qgi/JRegj4rp6F06UTQuwQ3T2VIJe7+RFZAIyMLvwtqdG
	fGNXbuzTnkQIIzS3PJrUWNckAmBPiMZ9Efnje7sawiZuxBVkxhiQewMMcrYIqgK6N6bh
	IqRA==
X-Gm-Message-State: AG10YORFvzfDN5KBp7QRWpJJ4zTeoVCBEm0TvWt+dktznuSKK2gzEESt484avYv5f5nv80PDayi6deWHs5wQyEOi
X-Received: by 10.31.1.6 with SMTP id 6mr16309265vkb.139.1455633410869; Tue,
	16 Feb 2016 06:36:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 16 Feb 2016 06:36:31 -0800 (PST)
In-Reply-To: <1454359775-25959-2-git-send-email-wei@redhat.com>
References: <1454359775-25959-1-git-send-email-wei@redhat.com>
	<1454359775-25959-2-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2016 14:36:31 +0000
Message-ID: <CAFEAcA8Z68oyF3u_htwTQ_vvS96fVR6mA8Gos-B4D7V-SeWbAg@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH V2 2/2] ARM: PL061: Cleaning field of
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
X-List-Received-Date: Tue, 16 Feb 2016 14:36:54 -0000

On 1 February 2016 at 20:49, Wei Huang <wei@redhat.com> wrote:
> This patch removes the float_high field of PL061State, which doesn't
> seem to be used anywhere. Because this changes the device state, the
> version ID is also bumped up for the reason of compatiblity.
>
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/gpio/pl061.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
> index 342a70d..5e2abe6 100644
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
> @@ -65,8 +64,8 @@ typedef struct PL061State {
>
>  static const VMStateDescription vmstate_pl061 = {
>      .name = "pl061",
> -    .version_id = 3,
> -    .minimum_version_id = 3,
> +    .version_id = 4,
> +    .minimum_version_id = 4,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(locked, PL061State),
>          VMSTATE_UINT32(data, PL061State),
> @@ -88,7 +87,6 @@ static const VMStateDescription vmstate_pl061 = {
>          VMSTATE_UINT32(slr, PL061State),
>          VMSTATE_UINT32(den, PL061State),
>          VMSTATE_UINT32(cr, PL061State),
> -        VMSTATE_UINT32(float_high, PL061State),
>          VMSTATE_UINT32_V(amsel, PL061State, 2),
>          VMSTATE_END_OF_LIST()
>      }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


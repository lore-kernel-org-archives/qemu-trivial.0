Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjs7h-0003FV-PF
	for mharc-qemu-trivial@gnu.org; Fri, 03 Mar 2017 13:40:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjs7f-0003EV-BL
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:40:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjs7e-0001iY-Gl
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:40:11 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:38416)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjs7e-0001hY-B0
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:40:10 -0500
Received: by mail-wm0-x235.google.com with SMTP id t193so22121292wmt.1
	for <qemu-trivial@nongnu.org>; Fri, 03 Mar 2017 10:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Lk08PPtMkGiJpR6I2RgzRME4aZVjjC+8x6pbIWFwQmw=;
	b=fHQMZ3dGc3WHZOhH6p7dmp0OiIZWN2rlmOAyzXPSpkCechBRpDRs7OEyfne6y+nXIE
	YTQbHfnGzD9bf732u4pjm1owZ+BC01p6MsTmmqNJpOXcrSNOw8R7f3XXCgKunvyPlKPB
	AAkODEuReYg2uKQpvPEbIzNE/XOV5D1nx3Bqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Lk08PPtMkGiJpR6I2RgzRME4aZVjjC+8x6pbIWFwQmw=;
	b=tc33j3+6qG70+kcOLdr2KPREKm2I9J6D8LGyvIFyQiHnPSuBZq8mA/5Xsn59StptZD
	FomWuO68gvHUD9/EKPBR+7kHsUYKEk82fTUChR0wv7tMJJXwsCP8tQi/SYHb/1c4PBoG
	oYx/EuCMMdj94GRE2sbf3SiQFciBR9RNlh3I/o2waVv6c+A1G3IG7T8QZvX8aXsZlvZH
	PwsZJ4270sZbCBJBKsrpeAgGtUc6Agaw8Lq9TAb28aWsc8UOqoB1tsVJn3c+aXp6BN9C
	4zZxFbYHSlYhTDAdSe4s/G4zu6Y9DmX8zNPNRZ9hqIVBbPOwGotWSvxXpyzm2QVU4lGN
	rESg==
X-Gm-Message-State: AMke39lOJcvQNDahVaDFw2HNu5NB3wHRA9pirXVYuXWbWcD4uf8hTnwPu3GSdwthNP0T2TWxdX0wXzi76PpPaPO5
X-Received: by 10.28.4.10 with SMTP id 10mr4488940wme.142.1488566409200; Fri,
	03 Mar 2017 10:40:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Fri, 3 Mar 2017 10:39:48 -0800 (PST)
In-Reply-To: <7e582e5ca2aaa7b8b6c1f8a040562b099767ff81.1488504063.git.balaton@eik.bme.hu>
References: <cover.1488504063.git.balaton@eik.bme.hu>
	<7e582e5ca2aaa7b8b6c1f8a040562b099767ff81.1488504063.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2017 18:39:48 +0000
Message-ID: <CAFEAcA8w9ox2KSSvky6aY3sHG=Xq=h7Wu2F_9UHRtQAKCPTrLg@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-trivial] [PATCH v3 04/13] sm501: QOMify
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Mar 2017 18:40:12 -0000

On 3 March 2017 at 01:03, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Adding vmstate saving is not in this patch because the state structure
> will be changed in further patches, then another patch will add
> vmstate descriptor after those changes.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

> +static void sm501_init(SM501State *s, DeviceState *dev, uint32_t base,
> +                       uint32_t local_mem_bytes)
> +{
> +    s->base = base;
> +    s->local_mem_size_index = get_local_mem_size_index(local_mem_bytes);
> +    SM501_DPRINTF("sm501 local mem size=%x. index=%d\n", get_local_mem_size(s),
> +                  s->local_mem_size_index);
> +    if (get_local_mem_size(s) != local_mem_bytes) {
> +        error_report("Warning: sm501 VRAM size adjusted to %" PRIu32,
> +                     get_local_mem_size(s));
> +    }

Just noticed this. I think reporting the error upwards by
failing device realize is better than adjusting the value.
It's what we tend to do for other devices. Management tools
like libvirt prefer to get hard errors if there's a config
file error that means they misconfigure a device.

thanks
-- PMM


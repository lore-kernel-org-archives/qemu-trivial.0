Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ckq10-0003yJ-Do
	for mharc-qemu-trivial@gnu.org; Mon, 06 Mar 2017 05:37:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ckq0w-0003wm-15
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 05:37:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ckq0v-0001GJ-C0
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 05:37:14 -0500
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:38220)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ckq0v-0001Ft-5c
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 05:37:13 -0500
Received: by mail-wm0-x22c.google.com with SMTP id t193so60469258wmt.1
	for <qemu-trivial@nongnu.org>; Mon, 06 Mar 2017 02:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ro9aVxPsa0Rxbel6KEIwfvu+lIvJoNHmg+PSqEmhnvY=;
	b=f8+KBS7FDgb1vFSe9rtnN05r8c7mJNVet46FWdrkHGWE+Bf0Q4ekIlJnEXPQyDCBZU
	mNktU/b3kKYCR0wVr+b9ImqhKPm4BaQWA1p4hwyXNNJLbyhYTjzbRJd1gnTbHTnJvMcN
	FHJ0m3btIYlgx1o0P+sLaXS1vH/amVfY7QgJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ro9aVxPsa0Rxbel6KEIwfvu+lIvJoNHmg+PSqEmhnvY=;
	b=VOZ8SaMbvYpDDM4LTAooRY4JmHiR5c0jbh+R9eT3KFz8blIOhxQytdYbUKK76eH/e9
	IsRcgDk2X0RFNC/48KS1NZvElg1MPM/uZBqMsd7NjhJcE774m9yvl1IaZ6BhjfESkt6b
	HUewYZJtNGfSMdP7nLymDrciFu36jpgyV+Pwg3FDxxmF5nG3deWjwkUVgBLYNKjuNuhn
	Fh24DCAyN7lK68MXIbAzabywQT+xAFty7vd+XKbx9Al3jqBz/iWySKYv+/xR7Oa249Zh
	Qs18hzvj4wWuk6i3nUNlwZCO67nqFI6fUE3yfV6vKOQ3dTaSxAkeRQpSOCFN623No+yY
	rHIw==
X-Gm-Message-State: AMke39lBGpXMdNC/qHPM8nug2Pptl8WigbGICe7n4/O/nTxotgl0mrDEHWGduR5QRXKrpDvf+9GYQaXjzUt+yHq+
X-Received: by 10.28.226.215 with SMTP id z206mr12111839wmg.92.1488796632150; 
	Mon, 06 Mar 2017 02:37:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Mon, 6 Mar 2017 02:36:51 -0800 (PST)
In-Reply-To: <3dd4ea3f9f4575144e1ce48390b463a6744da9c1.1488665935.git.balaton@eik.bme.hu>
References: <cover.1488665935.git.balaton@eik.bme.hu>
	<3dd4ea3f9f4575144e1ce48390b463a6744da9c1.1488665935.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2017 10:36:51 +0000
Message-ID: <CAFEAcA8R=YwrTBcfK98Hzh==mYkCLvnkSYmj9xoNfTGqbReyRA@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Magnus Damm <magnus.damm@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22c
Subject: Re: [Qemu-trivial] [PATCH v4 04/13] sm501: QOMify
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
X-List-Received-Date: Mon, 06 Mar 2017 10:37:18 -0000

On 3 December 2016 at 02:05, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Adding vmstate saving is not in this patch because the state structure
> will be changed in further patches, then another patch will add
> vmstate descriptor after those changes.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


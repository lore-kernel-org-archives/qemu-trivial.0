Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjXfu-0001c2-2C
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 15:50:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjXfr-0001aP-Vv
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:50:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjXfr-0005uY-A9
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:50:08 -0500
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:36400)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjXfr-0005tq-3m
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:50:07 -0500
Received: by mail-wm0-x231.google.com with SMTP id n11so1115295wma.1
	for <qemu-trivial@nongnu.org>; Thu, 02 Mar 2017 12:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eiKf2U0UXG9rq3IQcai9WSWoWNyEW8Z73dBZDYLWGoM=;
	b=AMMVeB2QOmvSO5MRIloUFuL7uOyGWX1CnPKLARUzL2IIwrdXj0S5geV4a4HrQl3rYo
	6DX582hnK0MyMlt9LYiT7+0PqFdC7UbOtZjoZjJbAkkYOH3968c/IN0ejFcwr+OlOrdL
	zZQBEvFiby8jTYdztG+06mlkQmMkI2v6mbqf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eiKf2U0UXG9rq3IQcai9WSWoWNyEW8Z73dBZDYLWGoM=;
	b=O6nsXt2osVZukGbv2gCGkVZAz0WTmiou2BhSkHjtVf0LWyLJGE8vQjw9ybyE0pws7N
	yUt94TNijk0g/V5SEJImnIpVOZnKF1cjwWcLwbF3smzVnfjwcobNdUE+/93/QlhkSQ2N
	JZ0Oo1MkCiWc8iv+SN77DaZuChabR/UNGGyy3QuIbguJ+VFGzs6NJUoI+zvKXHZV3FRH
	7p4Klhd4fRmN83NPpoHrJKAKhomI3vLZcla8+nmqqZVHMwi8ljL+wTWiVHKzXJor4Xon
	KARXMuk2Kl82Phk3/3ocE0d05fIDaoshvj8CbRg86Pry4JN5lr8AK6JyDw+ACzMcKWuO
	1DgQ==
X-Gm-Message-State: AMke39k1bezWZEcr3jDQuD8EThyx7DsfnzAJVWqlEcEDfVBV0Dejh8h3Av6UTGxpuUITvL8NCX859lTlXpBf9QnL
X-Received: by 10.28.172.68 with SMTP id v65mr144720wme.111.1488487806012;
	Thu, 02 Mar 2017 12:50:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 12:49:45 -0800 (PST)
In-Reply-To: <alpine.BSF.2.20.1703022115320.83701@zero.eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<869a8c5b526be9eb1316c9e7c7442bdd1c88c4b2.1488068248.git.balaton@eik.bme.hu>
	<CAFEAcA9zswu1H-66avnAxWdq8QvCWpi1NTbcaGqDE=c=OOHcAw@mail.gmail.com>
	<alpine.BSF.2.20.1703022115320.83701@zero.eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 20:49:45 +0000
Message-ID: <CAFEAcA9PDjSN7pKVde9raHZH3ExWdSNWN82ST4AJLPahWNcKNQ@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::231
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 13/14] sm501: Add reset
 function and vmstate descriptor
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
X-List-Received-Date: Thu, 02 Mar 2017 20:50:08 -0000

On 2 March 2017 at 20:18, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> On Thu, 2 Mar 2017, Peter Maydell wrote:
>>
>> Don't use qemu_register_reset(). Set the appropriate dc->reset
>> function pointers instead.
>
>
> Any reason for that? This way I could save two more boilerplate functions
> because I could define reset function once, otherwise I'd need two versions
> taking sysbus and pci states just to extract the SM501State function and
> call this function. Do you still think I should do that instead?

qemu_register_reset is a pre-QOM method for doing reset;
the standard QOM way of saying "my device has some reset
behaviour" is to set its reset method pointer.
Code calling qemu_register_reset() is generally either (a) doing
something kind of weird or (b) old device code that hasn't yet
been converted to QOM.

> So should it be 4 patches: reset for pci, reset for sysbus, vmstate for pci,
> vmstate for sysbus or 2 patches: reset for both, vmstate for both?

I think I'd go with 2 patches, since the two are going to
share the bulk of the implementation in each case.

thanks
-- PMM


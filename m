Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjXvz-0000yU-8E
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 16:06:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjXvx-0000wE-O4
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 16:06:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjXvw-0006eP-St
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 16:06:45 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:35473)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjXvw-0006e9-N2
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 16:06:44 -0500
Received: by mail-wm0-x22d.google.com with SMTP id v186so1424031wmd.0
	for <qemu-trivial@nongnu.org>; Thu, 02 Mar 2017 13:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B5FxtIlbEj0e2KlaXUg+YDpQ+V/9i12Y0qeZImP777g=;
	b=eq2b0IYWFJ8Errb9678pryi7hcuLDg+BTlmeYQtnUeOQZpjOxhdAsI+cRuQtdpTLUD
	tEX+6QuDwBzgUx8mGVoxL4/UKMxEVnO3XcZ90HKVlMsBgEGEScV0eeBTvxDa4zM7WYsH
	3saTL+mhVDJn4X4zdICUGUbT5NUoJsB4Ybi1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B5FxtIlbEj0e2KlaXUg+YDpQ+V/9i12Y0qeZImP777g=;
	b=p6AoKIgpHdtdzFcrR6kwVwmLk4Xibn1j+GMoQpSn+W2pxUBIkmh+RNnoazX4Xv1HWJ
	bZZouL67YEbxkJLSu8ePkAx85qIXHCYvHColk965DlmZBwk2pdYCKYsnWmulgge+t8lt
	Gx6pnRmUsz4Y2EZs0J/+rpHBzsQ0w6IICbsiALaALeNtvz1hX51/w2A6VDBhRuSe+LD8
	lRmfxLNNB3prEb0dFLWTHqq5ZzqLtrOGYUvi78vUX3ihqptHY0bVVMq20q4BS0kfSjiZ
	QolHtUu6szj3WqcIVSpzIA4T1QtNUmOCa068FwK1/lv9qrSfwZAEKXpH62qRTffuJFoL
	zsNg==
X-Gm-Message-State: AMke39l7YhUeCfKn6/+IxCXC8WfsRAcFspK8XNTkVCMURQ0uGlFXEtZSF/4kbgv7UuPkCPokE0sb+wkYvFBcdqUZ
X-Received: by 10.28.226.215 with SMTP id z206mr200858wmg.92.1488488803709;
	Thu, 02 Mar 2017 13:06:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 13:06:23 -0800 (PST)
In-Reply-To: <alpine.BSF.2.20.1703022152170.83701@zero.eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<869a8c5b526be9eb1316c9e7c7442bdd1c88c4b2.1488068248.git.balaton@eik.bme.hu>
	<CAFEAcA9zswu1H-66avnAxWdq8QvCWpi1NTbcaGqDE=c=OOHcAw@mail.gmail.com>
	<alpine.BSF.2.20.1703022115320.83701@zero.eik.bme.hu>
	<CAFEAcA9PDjSN7pKVde9raHZH3ExWdSNWN82ST4AJLPahWNcKNQ@mail.gmail.com>
	<alpine.BSF.2.20.1703022152170.83701@zero.eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 21:06:23 +0000
Message-ID: <CAFEAcA_iwJe0ufotWZ=L4RYSJBpkDa_1Zt1D80zTAbLzQyYchQ@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
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
X-List-Received-Date: Thu, 02 Mar 2017 21:06:46 -0000

On 2 March 2017 at 20:55, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> On Thu, 2 Mar 2017, Peter Maydell wrote:
>>
>> On 2 March 2017 at 20:18, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>
>>> On Thu, 2 Mar 2017, Peter Maydell wrote:
>>>>
>>>>
>>>> Don't use qemu_register_reset(). Set the appropriate dc->reset
>>>> function pointers instead.
>>>
>>>
>>>
>>> Any reason for that? This way I could save two more boilerplate functions
>>> because I could define reset function once, otherwise I'd need two
>>> versions
>>> taking sysbus and pci states just to extract the SM501State function and
>>> call this function. Do you still think I should do that instead?
>>
>>
>> qemu_register_reset is a pre-QOM method for doing reset;
>> the standard QOM way of saying "my device has some reset
>> behaviour" is to set its reset method pointer.
>> Code calling qemu_register_reset() is generally either (a) doing
>> something kind of weird or (b) old device code that hasn't yet
>> been converted to QOM.
>
>
> Hmm, does having a device with both sysbus and pci versions qualify as
> weird? Does adding a comment saying that this way we don't need two more
> reset functions just to call the registered one justifies using
> qemu_register_reset() or this function is deprecated and should not be used
> and should go with the separate reset functions instead?

Just use the QOM reset method pointers. Every QOM device should have
a reset method, and that should be how it gets
reset. (PCI is special anyway, it needs to get reset when
the guest does a PCI bus reset, and that results in your
device's reset method getting called. Functions registered
with qemu_register_reset() only get called for full system reset.)

thanks
-- PMM


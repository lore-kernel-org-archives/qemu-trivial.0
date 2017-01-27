Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cX9m8-0002i8-Br
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2017 11:53:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cX9m5-0002cd-5P
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2017 11:53:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cX9m4-00071F-BD
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2017 11:53:21 -0500
Received: from mail-ua0-x22d.google.com ([2607:f8b0:400c:c08::22d]:36831)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cX9m4-000715-6p
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2017 11:53:20 -0500
Received: by mail-ua0-x22d.google.com with SMTP id 96so209041094uaq.3
	for <qemu-trivial@nongnu.org>; Fri, 27 Jan 2017 08:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uMtWdgShxc6zhuQTbP+KMn+U8fY4bcPk4F15iES/zbM=;
	b=Lo+JbSR9lo/IAL6FxvJHTTs97UD3t2BWq4bnJFGN6ePf4Y79P5U1bz5PZ/4htuUg63
	pVUR/TigGT1XEn4Ji0UdxLEg55sz6uVjK8gdYkBGistQccCcG4Rh+ZTNV676PIXKNOOA
	OaULFbSxQ+OXXarAzzbzEIQZiOKBJElUWHMLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uMtWdgShxc6zhuQTbP+KMn+U8fY4bcPk4F15iES/zbM=;
	b=LqfzK0iKFPdskjlJxHaA/2rjhdSUP+putG3NTcS5DlG85CskTYJxOWVhXl05dogCcJ
	f6ChRrW7FQc6Ubm0Ebs87ak2Jq4nkElcvD7/7qq1hAT3aYKPwpl2lmkrw9H4YwJgiKXz
	+dzbzAcdRCTfR/HGBRjirmbc3nUt+kkLFPJmSV66+JouUPizDczAQuVck7IjGck3xtxX
	WAVie9Ox42YkLMWeoI/5M1Hmj4OzZ57duJymxv116FZkcjOZ1jvWwRnFkCES9Hrxn4uA
	OyQytNkU19+XovpZjXYRer/M3Nv6ccLoYOPZwQD2vm6/bSMfn0x2shMctjRDpIMUBIoK
	2Ksg==
X-Gm-Message-State: AIkVDXJIIG7QxpsidfzMHNI1ozHfXD+hL1UPoaS80h/JcjcUZLeejuGNOVLCYQ/71MMwurumGddAOqUBL1sLjgX8
X-Received: by 10.159.39.233 with SMTP id b96mr5091487uab.86.1485535999383;
	Fri, 27 Jan 2017 08:53:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.205.2 with HTTP; Fri, 27 Jan 2017 08:52:59 -0800 (PST)
In-Reply-To: <CAKmqyKOGTgKfGdjX4AYvh_yz=mSAgSdAWV=58=0s4w7LXjy2qw@mail.gmail.com>
References: <1485528688-29914-1-git-send-email-thuth@redhat.com>
	<CAKmqyKOGTgKfGdjX4AYvh_yz=mSAgSdAWV=58=0s4w7LXjy2qw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Jan 2017 16:52:59 +0000
Message-ID: <CAFEAcA-fSMkEVh3DOAh0d-JV=SPF6JqfT0SQ4OjwPbss-Jan_Q@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
	Markus Armbruster <armbru@redhat.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22d
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/core/or-irq: Mark the
 device with cannot_instantiate_with_device_add_yet
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
X-List-Received-Date: Fri, 27 Jan 2017 16:53:22 -0000

On 27 January 2017 at 16:40, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Fri, Jan 27, 2017 at 6:51 AM, Thomas Huth <thuth@redhat.com> wrote:
>> The "or-irq" device is just used internally. It's strange to
>> see this device showing up in the "-device ?" help text. Let's mark it
>> with cannot_instantiate_with_device_add_yet to hide it from the users.
>
> I agree that it is strange to be showing up to users, but is this
> really the best way to do this?
>
> I thought we were trying to get rid of
> cannot_instantiate_with_device_add_yet. Would it maybe be better to
> have an internal filed that sets this device as internal?

Yes, I agree; the reason for cannot_instantiate_with_device_add_yet
being such a long and ugly name is so it's easy to grep for
things we in theory might want to fix some day. "We'd rather
this didn't show up in help" is a different question.

(Like a lot of devices, it's pretty useless via -device, though,
because we have no way to wire up qemu_irq lines on the command
line.)

thanks
-- PMM


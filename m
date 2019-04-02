Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBBIm-0006gC-Jv
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2019 00:45:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hBBIi-0006eP-4F
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 00:45:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hBBIf-0006mB-Kd
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 00:45:31 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:41037)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hBBIf-0006ap-Bw
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 00:45:29 -0400
Received: by mail-ot1-x336.google.com with SMTP id 64so10789508otb.8
	for <qemu-trivial@nongnu.org>; Mon, 01 Apr 2019 21:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+m9GJCacx0mqnMG7z/vk/1ziS5FmcbUp8TrSEiJ6EAE=;
	b=PqqJmPHYCSdBVOaGhA2JAx/Y25lcyrjpfH1X0mIvGsY1CL9W15Oybp9sBQrYTtGHga
	/R3XyyzAIJ6UArgBZCPdiKQXboQ9MF70r190Ij30lse6c3aNpNc7ktph7AiKsuE64vt+
	AsMVcUKIGsK2YqkDnIQstxiKi6t6KhoeBv9knq4tve3XFFqEinmYh9KP4zG9uz5xEsI8
	svCwdCIhOu2wEixJgC+eiMOhdJZcvK3qDGUlJo75Ob/3N9RRGcTrmLZ2wckJ1rSYL3b4
	7NwFE0KVEYvGqkQoaOj3/lRUDYBgOjLjd6Yb8k/JlfCePq6hYmOQ506By5N5aZGHdZv+
	LldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+m9GJCacx0mqnMG7z/vk/1ziS5FmcbUp8TrSEiJ6EAE=;
	b=YLgIzqQ1okA73PEJD5oajjq3mEkp3cH7lffKrG9BRJQa5uLqQCvEb4CIKxgN7hBaGo
	EIO2+DBrTM8e216pd+OqyGNEvuM6ZhbMDRtj4Z6/hEaI+4xiN/6l0TcsBXL0pUNpYDr+
	7Tk11gwqsQqOtwnK1qPhC0pI0tgpv+K0VK24b6QHr6yprU4MpdEW+mZ9PhE6PeFExMRY
	YLihSDqIs4vL6WgdZjsIXqYwAZ2l0nP5eVPFvOJQ4q10eC42wkPoPx4OAOEj0nSFYtZN
	t+Pyt7qWhCRmMPUBctZu6x3XdUYcIlY/4MkxUD/iSkCLmy1V0mptvO6v9r3sPXy+FvhV
	MMyg==
X-Gm-Message-State: APjAAAWS374dw4fvXgTbP54rKOGa/gDVUGql/dzzx3Cm+9QMn2gtcFkT
	tO6lfMU3VNNCneTtEVm6fCvhhDdcOyIY+yb7840p7w==
X-Google-Smtp-Source: APXvYqw4xP8MauL+1eqHIY1XvJboprblTywAML309Yt7v0wfym7Ib+kfGBw4NHS/A85sRikI0ic/oeviHEu4qe9p4a4=
X-Received: by 2002:a05:6830:1cb:: with SMTP id
	r11mr37997367ota.302.1554180320393; 
	Mon, 01 Apr 2019 21:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
	<1553849325-44201-5-git-send-email-like.xu@linux.intel.com>
	<87h8bmuj2d.fsf@zen.linaroharston>
	<2546bf3e-2009-5a76-bc63-0ad73d333a78@linux.intel.com>
	<20190401233818.GA22884@habkost.net>
	<965d5d2f-1717-dcd0-8707-f6629f54e504@linux.intel.com>
In-Reply-To: <965d5d2f-1717-dcd0-8707-f6629f54e504@linux.intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Apr 2019 04:45:08 +0000
Message-ID: <CAFEAcA_i9Te5Gs9GWnqH+JvTPFbp80+n2D=VAoC0e2DS7OfSeg@mail.gmail.com>
To: Like Xu <like.xu@linux.intel.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, like.xu@intel.com, 
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::336
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/9] cpu/topology: add ARM
 support for smp machine properties
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
X-List-Received-Date: Tue, 02 Apr 2019 04:45:34 -0000

On Tue, 2 Apr 2019 at 09:46, Like Xu <like.xu@linux.intel.com> wrote:
>
> On 2019/4/2 7:38, Eduardo Habkost wrote:
> > On Mon, Apr 01, 2019 at 10:56:30AM +0800, Like Xu wrote:
> >> On 2019/3/29 17:27, Alex Benn=C3=A9e wrote:
> > [...]
> >>>> @@ -1713,6 +1717,9 @@ static void cortex_a9_initfn(Object *obj)
> >>>>    #ifndef CONFIG_USER_ONLY
> >>>>    static uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegI=
nfo *ri)
> >>>>    {
> >>>> +    MachineState *ms =3D MACHINE(qdev_get_machine());
> >>>
> >>> How expensive is qdev_get_machine? This could potentially be a
> >>> performance issue if this register is read a lot.
> >>
> >> It may not bother us cause the MachineState object would be feteched f=
rom
> >> qemu QOM at its first requested time and save it as static variable fo=
r
> >> incoming requests.
> >
> > We already have a current_machine variable declared in
> > include/hw/boards.h.  We normally avoid using it and use
> > MACHINE(qdev_get_machine()) instead, but I never understood why.
> >
> Which one do you prefer to access smp machine properties?

My suggestion would be that we use qdev_get_machine(). I think
it would be nice to make the remaining dozen or so uses of
the global current_machine outside vl.c use qdev_get_machine()
instead, and then make current_machine local to vl.c instead
of global.

thanks
-- PMM


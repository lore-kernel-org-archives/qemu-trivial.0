Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBBxc-0004YS-8J
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2019 01:27:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hBBxZ-0004X6-OE
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 01:27:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hBBxY-0002a0-TH
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 01:27:45 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:37898)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hBBxY-0002Zc-K3
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 01:27:44 -0400
Received: by mail-oi1-x244.google.com with SMTP id a6so6039640oie.5
	for <qemu-trivial@nongnu.org>; Mon, 01 Apr 2019 22:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YqIKaIfqSNEWoDOMPy7gMeNmf/XmxzovfQL7Wfy4/BI=;
	b=kirIQJBX7N1jrDrYZgfRr1wtRdSjXNxy9OK7aoi79v5DsJ9WZmY2aegIlnwO3cEVxK
	js0fhovAL2kMdTW0jRtJShV2porlGyTIG8PTtMWva61gOhUhNm6KiU/tf13V61wRsPo2
	Sp2uYP7cqY2H8eU7fk4LdkV9QMUrQGpn2XNnZVgo1L3a1oNRJW6xuM7NOt6q2DyRGlxq
	fqUYQ5L2HdXoqypIAy5XkkgtnFaLecBJLe0UpNOGc326zUv/K7juceUBVI879xz+qkD8
	iasECQQRMjlDSXRgyq1hQWa8UQZXvSzzCFgL4IE94Rrgd5bZ0v1nt/ZZd8Be3UwihLHO
	4aMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YqIKaIfqSNEWoDOMPy7gMeNmf/XmxzovfQL7Wfy4/BI=;
	b=JKGRSNToMZmPEByB5eghRQjAwXBbs2kH1A8zVEMPZ0gCzuf8tyy3oOqgZvPYeq0UEb
	0eHg0ZPQ/WcXwogiutuZghXzzc1FYvQuFLGvU1CqhDx6yx94w/04u7lfDIpsF+onCSeN
	ou1xVmmRCbiAQ+lmUj+KF7TINF45nQVVuM43A3MgAHGQEgIKAya1y354/nHg9Y/6DUWt
	ADZatd4ZxrlldkHuINRiboO5a8UVA1RwIbC95N5QDmjs2K86lbNGWVs06EXQ7MRAD/eO
	lezPB6j9LuhGR2Q+Fh0kxKgO65FEPrQbb+iwhF2DEAJZUX/h47IhHVvX7coAqssVSZ32
	ZQgg==
X-Gm-Message-State: APjAAAVTfFkgzpCZcn7gjN55YDVYEJIQyoTld/MWZQv4+Fydp2wM0TbP
	RVmYLlOSZIv0ZTgeDoBlM3vAad9Xw0PErRkbo7rY1A==
X-Google-Smtp-Source: APXvYqyXhzUx6mbXmbRZV87FMJF9zAPGbTuTKXEbOwaQS0bECorf7mYXKtPOYPlxjr5xmXEWkpay+PxepGLzuOQ5L2k=
X-Received: by 2002:aca:b3c2:: with SMTP id c185mr10672401oif.98.1554182863682;
	Mon, 01 Apr 2019 22:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
	<1553849325-44201-5-git-send-email-like.xu@linux.intel.com>
	<87h8bmuj2d.fsf@zen.linaroharston>
	<2546bf3e-2009-5a76-bc63-0ad73d333a78@linux.intel.com>
	<20190401233818.GA22884@habkost.net>
	<965d5d2f-1717-dcd0-8707-f6629f54e504@linux.intel.com>
	<CAFEAcA_i9Te5Gs9GWnqH+JvTPFbp80+n2D=VAoC0e2DS7OfSeg@mail.gmail.com>
	<ca73da94-df07-ac0e-67a4-8c9b18b7dc20@linux.intel.com>
In-Reply-To: <ca73da94-df07-ac0e-67a4-8c9b18b7dc20@linux.intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Apr 2019 05:27:32 +0000
Message-ID: <CAFEAcA__F84deXVLxTp4PCBtGD-8sr1nKz9cvQx4=QsV1ttnfw@mail.gmail.com>
To: Like Xu <like.xu@linux.intel.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, like.xu@intel.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
X-List-Received-Date: Tue, 02 Apr 2019 05:27:46 -0000

On Tue, 2 Apr 2019 at 12:20, Like Xu <like.xu@linux.intel.com> wrote:
>
> On 2019/4/2 12:45, Peter Maydell wrote:
> > My suggestion would be that we use qdev_get_machine(). I think
> > it would be nice to make the remaining dozen or so uses of
> > the global current_machine outside vl.c use qdev_get_machine()
> > instead, and then make current_machine local to vl.c instead
> > of global.

> It looks good to me and I am not sure if this refactoring should be
> added in next patch series or as a separate patch.

Changing the other uses of current_machine is definitely a
refactoring that should be a separate patch series.

thanks
-- PMM


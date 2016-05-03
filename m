Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axU6C-0005Bc-Br
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 02:46:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axOvm-0004h8-P0
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:15:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axOva-0002No-VL
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:15:13 -0400
Received: from mail-ob0-x243.google.com ([2607:f8b0:4003:c01::243]:34298)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>)
	id 1axOvZ-0002EQ-NU; Mon, 02 May 2016 21:15:06 -0400
Received: by mail-ob0-x243.google.com with SMTP id n2so156661obo.1;
	Mon, 02 May 2016 18:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W/tRU9bE/a9S6vtku6CrOHUVynoqJWrsqXvg10tC3NQ=;
	b=e/tIxtXPA1++YMlhboA4R7c/Dyr8rSQjfJXhb/iUxDCx/qzQdm+ImQrQ0yuc2HSobH
	7OZ/6720J39KgbnVVMjmka71sdhVoUE2zzQFrQqiF5+8J2Jdq35TlReatR3+bG9zYNdl
	7OqzycQPqyo50SmwS/Cy8/7CXwujL1VnUHCmcI9YiZO/ovg5jOf9l8Tr9hgWYB5LO4Kw
	daEBvbJTM/LNqkvLDRIX1VXonBK4aAIy932CPfHj4ohUtlfk/Sh7hWbaipuQXVIhr3i+
	gNagcpyAu4QYoA+yh7PvAgfMsCvtV2dyAPyliIti/vaabIJSXyMVllZNZF6e/AA1+f1l
	jL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W/tRU9bE/a9S6vtku6CrOHUVynoqJWrsqXvg10tC3NQ=;
	b=NpYAu6Tkmb8m7jQ2aiqCqsAYvRXCcLmtTctPfC/ywB+ndaIQ2KWgqnIClVHyywu6Cf
	gvoqcKFozGInPZkGelq/vDhMTCtZfYGP8vqCP3O64FmRnusZ0cbqeWy06iNhGiyltdfk
	YYgi3YCivbI4EDbvmM4/WTgRm7yDRU9d6OvRnn/rkJ0+8++rPKxr7wt67N6wx7rtec1m
	D8WFYRpp4CNtpLSNfacDIroAHF3esFk6V4A+Lb3ICN89oaJEf/kJeB60OW7MKSR4XEuj
	PVienaTN1Xm8Xd9LKM68eIXrf4aU9feslf/xV1Pi6WCx2JGJVdFuV/Weey1GlI/fk9IJ
	Ds6w==
X-Gm-Message-State: AOPr4FUleA1Sdw6LxlOw6nkj83BirjoxyanIHUntxkbp8d0K7qwnRK2xldxftOqf8NKsDx9sywoF2TsehWLshw==
X-Received: by 10.182.233.163 with SMTP id tx3mr16299965obc.36.1462238074167; 
	Mon, 02 May 2016 18:14:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.4.120 with HTTP; Mon, 2 May 2016 18:14:14 -0700 (PDT)
In-Reply-To: <CAFEAcA8TjtF=+DY=kDRvK205VGuVPmc3AumvF8QiS0rqX1RiGA@mail.gmail.com>
References: <1462236478-61645-1-git-send-email-chrisfriedt@gmail.com>
	<1462236478-61645-3-git-send-email-chrisfriedt@gmail.com>
	<CAFEAcA8TjtF=+DY=kDRvK205VGuVPmc3AumvF8QiS0rqX1RiGA@mail.gmail.com>
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Mon, 2 May 2016 21:14:14 -0400
Message-ID: <CAF4BF-RUvQyy2RJ+=+9mBM-k81Hgixpu2_0r9X1o=fAiVi4f_w@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Fam Zheng <famz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, G 3 <programmingkidx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::243
X-Mailman-Approved-At: Tue, 03 May 2016 02:46:23 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] Remove unnecessary
 CONFIG_EVENTFD preprocessor conditional to satisfy link
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
X-List-Received-Date: Tue, 03 May 2016 01:15:25 -0000

On Mon, May 2, 2016 at 9:01 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> [ccing somebody else who ran into this, since I've figured out why.]
>
> On 3 May 2016 at 01:47, Christopher Friedt <chrisfriedt@gmail.com> wrote:
>> The file ivshmem.c unconditionally references event_notifier_init_fd()
>> in util/event_notifier-posix.c, even if CONFIG_EVENTFD is not defined.
>
> Yes, but ivshmem.c is only built if CONFIG_IVSHMEM, and
> CONFIG_IVSHMEM is set (in default-configs/pci.mak) to CONFIG_EVENTFD.
> So if CONFIG_EVENTFD is not defined then we should never build ivshmem.o.
>
> The problem here is that you've run into a bug in QEMU's makefiles,

That would explain things.

> where a change in an included .mak file in default-configs fails
> to cause the config-devices.mak file to be rebuilt. In commit
> 330b583 we changed pci.mak so that CONFIG_IVSHMEM is set to
> CONFIG_EVENTFD rather than CONFIG_POSIX, so if your config-devices.mak
> predates that commit then it will have incorrectly not been recreated
> and so your build will still try to build ivshmem.c.
>
> You can check whether this is true by looking at
> (for instance) x86_64-softmmu/config-devices.mak in your build
> tree: if it has a line "CONFIG_IVSHMEM=$(CONFIG_POSIX)" in it
> then it's the out of date version.

$ grep "CONFIG_IVSHMEM" x86_64-softmmu/config-devices.mak
CONFIG_IVSHMEM=$(CONFIG_EVENTFD)

I have been re-configuring on every build, just to eliminate that
potential error source.

> You should be able to fix this by deleting */config-devices.mak
> from your build tree (or by blowing away the build tree entirely
> and recreating it.) Then try rebuilding -- ivshmem.c should not
> be compiled.

I'll give that a go anyway.


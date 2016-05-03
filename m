Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axU6G-0005Ix-4r
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 02:46:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axP6b-0000E4-C1
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:26:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axP6P-0004r7-Ni
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:26:23 -0400
Received: from mail-ob0-x241.google.com ([2607:f8b0:4003:c01::241]:33075)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>)
	id 1axP6O-0004m0-DC; Mon, 02 May 2016 21:26:17 -0400
Received: by mail-ob0-x241.google.com with SMTP id nj8so166105obc.0;
	Mon, 02 May 2016 18:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NPvMVudb/1TGLAw0n/iqf2LbUhMphmW1THAMI4CtW2k=;
	b=RqXxdjr/V7e/Bt7N9+yd1BbgV82k/5T4sFWiSMQjJ8HXYKfdloZADqXmpu1n7SwBlN
	4f+blnzodwEINftLDdKAB8FFgZ03CbIkD+OKDfRY9b2kMbodAFQXXtnlPTXjQ3FxDPEL
	lKxDTUgZtrwUcA0aCcZUem7dLCNJV/gpBxSptBhpr+iRVAIXPyAlSnK3t/Db5MKi/YWU
	iILGyJUAocYKOQbTXjvXDY3TnYvDPRRChi9A3+3cgDTLb8l9aiUR08Yqikri0FwXjC/H
	+EFfVFiHovH8BL4KE6+djCCE9uQu8T0UVgxqHunbu2J03aOo36DFnIylFEEOpedAQ6yG
	xOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NPvMVudb/1TGLAw0n/iqf2LbUhMphmW1THAMI4CtW2k=;
	b=eiRVQ9uCn050k/SxpXtI+Afe7beI8N1q/oNjXyKWc7d5dcjtx1lhnPGF4ncksujTZL
	HUUzu0vK86AdAV76pIGoiFnoqUsG/4Cp4kcAR9J+LSu/lxsWhG+LLDHMY4uuyLl1ATkF
	QoY6vB5m52sykoqSyvN/7GOofn5p+pdjSRlI002lfFs0y/J0K0kNNSGWe8Vdnu7zSpDd
	zu8Euw/TnLfDQswuKSDgOgicGykEw7Tkni/N62QRzdJDnbl4nwwNWFzX02N6WhlJnTOf
	kA6LGjMeRBndUjKr6PWfhjP7DpV3pXnkh648IAoUKnEw7L7XQtMfBZpcxdHkGpgIPR19
	lz5A==
X-Gm-Message-State: AOPr4FU5fL1lLuFdS43PS1Gctpr538QfSPUMIvUX4/0DdUSarKroTiEtOOE/dgBPidEGM5Cv8UJWRs3AREL3WQ==
X-Received: by 10.182.69.41 with SMTP id b9mr13941178obu.79.1462238745452;
	Mon, 02 May 2016 18:25:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.4.120 with HTTP; Mon, 2 May 2016 18:25:26 -0700 (PDT)
In-Reply-To: <CAFEAcA_kViE8oaiPE9SNGSXBRo4vocKuZXQuruyRULrjy9id4A@mail.gmail.com>
References: <1462236478-61645-1-git-send-email-chrisfriedt@gmail.com>
	<1462236478-61645-3-git-send-email-chrisfriedt@gmail.com>
	<CAFEAcA8TjtF=+DY=kDRvK205VGuVPmc3AumvF8QiS0rqX1RiGA@mail.gmail.com>
	<CAF4BF-RUvQyy2RJ+=+9mBM-k81Hgixpu2_0r9X1o=fAiVi4f_w@mail.gmail.com>
	<CAFEAcA_kViE8oaiPE9SNGSXBRo4vocKuZXQuruyRULrjy9id4A@mail.gmail.com>
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Mon, 2 May 2016 21:25:26 -0400
Message-ID: <CAF4BF-RzconSOm++Ey79FO2wm2JSK=PYV5UNnnjZvEyOkf3tgA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Fam Zheng <famz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, G 3 <programmingkidx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::241
X-Mailman-Approved-At: Tue, 03 May 2016 02:46:26 -0400
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
X-List-Received-Date: Tue, 03 May 2016 01:26:35 -0000

On Mon, May 2, 2016 at 9:18 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 3 May 2016 at 02:14, Christopher Friedt <chrisfriedt@gmail.com> wrote:
>> On Mon, May 2, 2016 at 9:01 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> [ccing somebody else who ran into this, since I've figured out why.]
>>>
>>> On 3 May 2016 at 01:47, Christopher Friedt <chrisfriedt@gmail.com> wrote:
>>>> The file ivshmem.c unconditionally references event_notifier_init_fd()
>>>> in util/event_notifier-posix.c, even if CONFIG_EVENTFD is not defined.
>>>
>>> Yes, but ivshmem.c is only built if CONFIG_IVSHMEM, and
>>> CONFIG_IVSHMEM is set (in default-configs/pci.mak) to CONFIG_EVENTFD.
>>> So if CONFIG_EVENTFD is not defined then we should never build ivshmem.o.
>>>
>>> The problem here is that you've run into a bug in QEMU's makefiles,
>>
>> That would explain things.



> Hmm. (Is it set the same for every config-devices.mak for
> every target you're trying to build?)

Ack - too late! I manually removed all of the *-softmmu/ directories
after doing a make clean, because they were still hanging around.
Rebuilding worked fine without PATCH 2/2.

Thanks!


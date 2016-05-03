Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axOzp-0000pd-Kn
	for mharc-qemu-trivial@gnu.org; Mon, 02 May 2016 21:19:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axOzh-0000d0-66
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:19:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axOzT-0003Dp-2w
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:19:15 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:36617)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axOzR-000387-R8
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:19:07 -0400
Received: by mail-vk0-x234.google.com with SMTP id c189so6311922vkb.3
	for <qemu-trivial@nongnu.org>; Mon, 02 May 2016 18:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LilhSAnTDcAmi+EkEH/6sCkJcGv1A7wQf13pCIGY7hU=;
	b=OAIqJIgpP+42nde4u+QqA7ryGxqKDQiiyOTjP8Sh5uG5NUjocOIvAqFX0NK1j/s5Pu
	KbbpF03lFY8t1/6w25CcAxrx/8cs4rFjCNnjL6c5gLKFcNu114YKuB1Jbah2aL2iX21+
	0K6NAbwES000BXJa6h9Y/wAQwyhsHHFI/DjGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LilhSAnTDcAmi+EkEH/6sCkJcGv1A7wQf13pCIGY7hU=;
	b=LLPqXq9XrxMpXzYEhIMEEWoNfNukTu1LH5WaDzcQUPN/FguKt1EQn20AXe0RnD42qc
	OVRNudgwG3PmSNA27l1z94ua7nacNaTyihoNXM7keZ9C1rL2d1ewENHfhDXS1R+KMWbI
	86jLITB0apPKRxNgIzCAdAiSBAwvFMsxDmDSwsfk4z+N+uZnWi9vYDBAk/U9YrObB5yG
	lsLkeFUg7n6PGqXHVDDICRu6+1om48guvyEd683akQTD3fXHZQamsHpX7AkYXiZAGHQ7
	5idnl86cMc9uN5q0iNtjNs2B10CAelgx+y7svWs1NOZr8cfxAykYzjhgUeSfo6VEa8xW
	7TsA==
X-Gm-Message-State: AOPr4FUC67rzKXik27AhnTKq1alJC5lOgO5ta5r/sKpvNZS+Ht1dbkVPjYR1/BSKRz3WII7UyvZ+eCngpeFS+o/G
X-Received: by 10.159.54.232 with SMTP id p95mr12717275uap.107.1462238323851; 
	Mon, 02 May 2016 18:18:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 2 May 2016 18:18:24 -0700 (PDT)
In-Reply-To: <CAF4BF-RUvQyy2RJ+=+9mBM-k81Hgixpu2_0r9X1o=fAiVi4f_w@mail.gmail.com>
References: <1462236478-61645-1-git-send-email-chrisfriedt@gmail.com>
	<1462236478-61645-3-git-send-email-chrisfriedt@gmail.com>
	<CAFEAcA8TjtF=+DY=kDRvK205VGuVPmc3AumvF8QiS0rqX1RiGA@mail.gmail.com>
	<CAF4BF-RUvQyy2RJ+=+9mBM-k81Hgixpu2_0r9X1o=fAiVi4f_w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2016 02:18:24 +0100
Message-ID: <CAFEAcA_kViE8oaiPE9SNGSXBRo4vocKuZXQuruyRULrjy9id4A@mail.gmail.com>
To: Christopher Friedt <chrisfriedt@gmail.com>
Cc: Fam Zheng <famz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, G 3 <programmingkidx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
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
X-List-Received-Date: Tue, 03 May 2016 01:19:27 -0000

On 3 May 2016 at 02:14, Christopher Friedt <chrisfriedt@gmail.com> wrote:
> On Mon, May 2, 2016 at 9:01 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> [ccing somebody else who ran into this, since I've figured out why.]
>>
>> On 3 May 2016 at 01:47, Christopher Friedt <chrisfriedt@gmail.com> wrote:
>>> The file ivshmem.c unconditionally references event_notifier_init_fd()
>>> in util/event_notifier-posix.c, even if CONFIG_EVENTFD is not defined.
>>
>> Yes, but ivshmem.c is only built if CONFIG_IVSHMEM, and
>> CONFIG_IVSHMEM is set (in default-configs/pci.mak) to CONFIG_EVENTFD.
>> So if CONFIG_EVENTFD is not defined then we should never build ivshmem.o.
>>
>> The problem here is that you've run into a bug in QEMU's makefiles,
>
> That would explain things.
>
>> where a change in an included .mak file in default-configs fails
>> to cause the config-devices.mak file to be rebuilt. In commit
>> 330b583 we changed pci.mak so that CONFIG_IVSHMEM is set to
>> CONFIG_EVENTFD rather than CONFIG_POSIX, so if your config-devices.mak
>> predates that commit then it will have incorrectly not been recreated
>> and so your build will still try to build ivshmem.c.
>>
>> You can check whether this is true by looking at
>> (for instance) x86_64-softmmu/config-devices.mak in your build
>> tree: if it has a line "CONFIG_IVSHMEM=$(CONFIG_POSIX)" in it
>> then it's the out of date version.
>
> $ grep "CONFIG_IVSHMEM" x86_64-softmmu/config-devices.mak
> CONFIG_IVSHMEM=$(CONFIG_EVENTFD)

Hmm. (Is it set the same for every config-devices.mak for
every target you're trying to build?)

Next things to check: is CONFIG_EVENTFD definitely not set
in config-host.mak (it shouldn't be)? hw/misc/Makefile.objs
ought to say "obj-$(CONFIG_IVSHMEM) += ivshmem.o", and that
should mean that we don't try to build it...

thanks
-- PMM


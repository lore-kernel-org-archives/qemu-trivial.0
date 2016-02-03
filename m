Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQuxx-0005qK-1K
	for mharc-qemu-trivial@gnu.org; Wed, 03 Feb 2016 05:47:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQuxu-0005o1-2M
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 05:47:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQuxt-0002ls-1l
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 05:47:13 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:33378)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQuxs-0002lg-Tw
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 05:47:12 -0500
Received: by mail-vk0-x235.google.com with SMTP id e64so10979782vkg.0
	for <qemu-trivial@nongnu.org>; Wed, 03 Feb 2016 02:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vH2GSoMsiA91irSo097nyxMPt/d8RknprjQ84U95AgA=;
	b=BmrlTHdZfxEDBHmKaHpI4jf0SGiPLQAAeDWMpaJrMIMIePRfDwhP21AlrPMhvWmQ8P
	LigDGdqxJ9k5VAjQs3Aqhlmds9tB81D14/XBPoqOUMfbgYDI2ZokSX9fBonQNXOCicW1
	DudZEbZ7vsRJ+QXOCmEJ/lPWnwClVAqne2ZzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vH2GSoMsiA91irSo097nyxMPt/d8RknprjQ84U95AgA=;
	b=iTODdb7BYPiB0KMsPNnsWDhskQ4xMMdRkf9+CLvEFs/hlbLF/5z5To3/OwRO5owdWF
	+IiigMZpojK7nqsSwthG4i5Bycg28uJ/v7M4ZZaS9lVSLlVQNWvEQVx37QHiVz3uniPj
	dcsP84wwPZ1yyBu+Br3Mep2NWgOPcKiwFMGRDHYhRBW3vniHfQ/MuXlzLtUXPFh/7lF2
	DlknZkgPgBRIb9hmd8ID0C3rrAhUZ/mmzZNM+HXUFlKJgfEx7JBxJ5afJxpD2uDL/1BJ
	NIERN98Y60HGBiBBwJeIQPDUd7Hf6awF0u7oUZvJEQaec9OK94Jluuq/G5V71k4BINTE
	+4zg==
X-Gm-Message-State: AG10YORey896ge99y9IOzZQlDro8NbdNcFJ2qP08It6T5r40rT2XwUQda8q+FQJGgHnnDJLw+Ci9X2SUSFzNF5Ux
X-Received: by 10.31.131.199 with SMTP id f190mr562981vkd.90.1454496432442;
	Wed, 03 Feb 2016 02:47:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Wed, 3 Feb 2016 02:46:52 -0800 (PST)
In-Reply-To: <56B1A90E.3000506@msgid.tls.msk.ru>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<56B1A90E.3000506@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Feb 2016 10:46:52 +0000
Message-ID: <CAFEAcA9RzHTZhZemvSGZ_Qpji+bu0=13wQJ0ThMbYhYdJ99w1A@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: Wei Huang <wei@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH 1/1] arm: virt: change GPIO trigger
	interrupt to pulse
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Feb 2016 10:47:15 -0000

On 3 February 2016 at 07:15, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 28.01.2016 21:22, Wei Huang wrote:
>> When QEMU is hook'ed up with libvirt/virsh, the first ACPI reboot
>> request will succeed; but the following shutdown/reboot requests
>> fail to trigger VMs to react. Notice that in mach-virt machine
>> model GPIO is defined as edge-triggered and active-high in ACPI.
>> This patch changes the behavior of powerdown notifier from PULLUP
>> to PULSE. It solves the problem described above (i.e. reboot
>> continues to work).
>
> So, what's the outcome of this? :)

This patch is definitely wrong. The patch to fix up the
gpio reset stuff is definitely the right idea. Whether it
fixes the reported failure or some further change is also
needed is currently unclear.

thanks
-- PMM


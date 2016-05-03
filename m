Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axOjZ-0005hX-ON
	for mharc-qemu-trivial@gnu.org; Mon, 02 May 2016 21:02:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axOjR-0005OE-Q3
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:02:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axOjC-0007wm-Ct
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:02:28 -0400
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:33879)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axOjB-0007rx-6X
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:02:18 -0400
Received: by mail-vk0-x22f.google.com with SMTP id m188so6098401vka.1
	for <qemu-trivial@nongnu.org>; Mon, 02 May 2016 18:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bdfWVNbS/MXahpS+btjA8nCLzIw4kdWJ6gK75w8IMoc=;
	b=IrtWTh/jhUOZHj5g1M9gAbk81y4sPLeM+eDss8Pmyxnp7VNscKK5yDEh5j++zxnhWR
	nmHcIaq1cRigov10tjBuTFgcMmzwCU+kkzH9CIr5R+QhpmaSNFduzb5yJyWTU8HXkYHV
	krlC10KxXzm29LqQHDBI4IzZFUTCm3jgtowfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bdfWVNbS/MXahpS+btjA8nCLzIw4kdWJ6gK75w8IMoc=;
	b=KnqCbqI5ouvZoDgF/gvGSGcR+pPT0lDSNSq9JaW0uA5n8u//mTsXA2V8WB/3FP3CEk
	iFogvfnXgkFI5X5zz3u5dO4IpEs2tdLVQpRUGt3LqIpCVaPdV4Do6bS99ko17/8EcNr6
	I4lbLQME0Z3L7bSsm0U5+SLK9afBXAZBCnHFAY3Otvfmj4NF8LUXfjZQDraMKb6NvYkV
	Oa1LLwpoJLaH+pWP/1ojEaetODU6jqBh6reZwm7QLvDqMb1nzrJw+7NEbNR6bxqwApJk
	l/IfLmzwKt/t/dM3fwBf7ytMH+JybzU4Ct3SWB/vhQwO/SKtHPchTDPb7cEkdK9jW7XP
	x3Ow==
X-Gm-Message-State: AOPr4FVSC15M3XInW/0+D3rB7scrwIfMRODRePaMIEJYWN8JRY3hqX8GQTDOVDxfAXptzBLBadz10iDhOf/S2SjJ
X-Received: by 10.31.94.86 with SMTP id s83mr1260234vkb.92.1462237315209; Mon,
	02 May 2016 18:01:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 2 May 2016 18:01:35 -0700 (PDT)
In-Reply-To: <1462236478-61645-3-git-send-email-chrisfriedt@gmail.com>
References: <1462236478-61645-1-git-send-email-chrisfriedt@gmail.com>
	<1462236478-61645-3-git-send-email-chrisfriedt@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2016 02:01:35 +0100
Message-ID: <CAFEAcA8TjtF=+DY=kDRvK205VGuVPmc3AumvF8QiS0rqX1RiGA@mail.gmail.com>
To: Christopher Friedt <chrisfriedt@gmail.com>
Cc: Fam Zheng <famz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, G 3 <programmingkidx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
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
X-List-Received-Date: Tue, 03 May 2016 01:02:40 -0000

[ccing somebody else who ran into this, since I've figured out why.]

On 3 May 2016 at 01:47, Christopher Friedt <chrisfriedt@gmail.com> wrote:
> The file ivshmem.c unconditionally references event_notifier_init_fd()
> in util/event_notifier-posix.c, even if CONFIG_EVENTFD is not defined.

Yes, but ivshmem.c is only built if CONFIG_IVSHMEM, and
CONFIG_IVSHMEM is set (in default-configs/pci.mak) to CONFIG_EVENTFD.
So if CONFIG_EVENTFD is not defined then we should never build ivshmem.o.

The problem here is that you've run into a bug in QEMU's makefiles,
where a change in an included .mak file in default-configs fails
to cause the config-devices.mak file to be rebuilt. In commit
330b583 we changed pci.mak so that CONFIG_IVSHMEM is set to
CONFIG_EVENTFD rather than CONFIG_POSIX, so if your config-devices.mak
predates that commit then it will have incorrectly not been recreated
and so your build will still try to build ivshmem.c.

You can check whether this is true by looking at
(for instance) x86_64-softmmu/config-devices.mak in your build
tree: if it has a line "CONFIG_IVSHMEM=$(CONFIG_POSIX)" in it
then it's the out of date version.

You should be able to fix this by deleting */config-devices.mak
from your build tree (or by blowing away the build tree entirely
and recreating it.) Then try rebuilding -- ivshmem.c should not
be compiled.

We really must track down this dependency bug, it is very confusing
when it bites people.

thanks
-- PMM


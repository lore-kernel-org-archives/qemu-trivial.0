Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ceelJ-0003we-0W
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 04:23:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1ceelG-0003u6-2x
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 04:23:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1ceelE-0007KC-VQ
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 04:23:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44540)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1ceel9-0007Hx-HE; Fri, 17 Feb 2017 04:23:23 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4090E80468;
	Fri, 17 Feb 2017 09:23:23 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-41.phx2.redhat.com
	[10.3.116.41])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1H9NLuI002099; Fri, 17 Feb 2017 04:23:21 -0500
To: Fam Zheng <famz@redhat.com>, Chad Joan <chadjoan@gmail.com>
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
	<CABHMSTUsZy0u4b1b84YC5CgafKvD-Zms5dCQ=31+XnQphUQxLA@mail.gmail.com>
	<20170217064327.GB21716@lemon.lan>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <2a2570bf-2e4b-e793-4362-0a679b182b1e@redhat.com>
Date: Fri, 17 Feb 2017 10:23:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20170217064327.GB21716@lemon.lan>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 17 Feb 2017 09:23:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] Fix build break during
 configuration on musl-libc based Linux systems.
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
X-List-Received-Date: Fri, 17 Feb 2017 09:23:31 -0000

On 02/17/17 07:43, Fam Zheng wrote:
> On Thu, 02/16 12:47, Chad Joan wrote:
>> I am glad others are chiming in and might provide better solutions.
>>
>> Honestly, following the instructions at
>> http://wiki.qemu-project.org/Contribute/SubmitAPatch to-the-letter is quite
>> daunting to me, just to get one line of code changed.  It might help if
>> that page had some kind of dead-simple example for trivial patches;
>> something like:
>> $ cd <QEMU directory>
>> $ git format-patch blah blah blah
>> $ maybe-some-other-command
>> $ # Now copy the contents of file xyz.patch into your email client and send
>> to qemu-devel@nongnu.org and qemu-trivial@nongnu.org
> 
> Makes sense in general except for the sending part - email clients tend to
> damage the patch when you copy and paste by wrapping long lines or messing up
> other things. But your point is taken, we should make the first (or a one-shot)
> contribution as easy as possible.

I disagree (from the sidelines, that is; I'm not a QEMU maintainer --
I'm a co-maintainer elsewhere). The patch submission process exists for
a reason, the goal is to maximize the throughput of long-term
contributors and maintainers, because that's the best for the project's
overall health and progress.

It does not mean that one-off contributions are not welcome -- all
contributions are welcome that follow the process (and beyond that,
everyone is welcome to become a long-term contributor).

Just my two cents, of course; don't take this as an official standpoint
or whatever. (And, I'm saying this after having manually fixed up
garbled patches from one-off contributors.)

Laszlo


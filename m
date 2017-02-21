Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cg6xA-0004Sp-BB
	for mharc-qemu-trivial@gnu.org; Tue, 21 Feb 2017 04:41:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cg6x7-0004QD-HS
	for qemu-trivial@nongnu.org; Tue, 21 Feb 2017 04:41:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cg6x4-0007b5-F5
	for qemu-trivial@nongnu.org; Tue, 21 Feb 2017 04:41:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32870)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cg6x2-0007aE-Ec; Tue, 21 Feb 2017 04:41:40 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7E34781F01;
	Tue, 21 Feb 2017 09:41:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-55.ams2.redhat.com
	[10.36.116.55])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1L9fd1M025100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 21 Feb 2017 04:41:40 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7A6871138647; Tue, 21 Feb 2017 10:41:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: Chad Joan <chadjoan@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Fam Zheng <famz@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
	<CABHMSTUsZy0u4b1b84YC5CgafKvD-Zms5dCQ=31+XnQphUQxLA@mail.gmail.com>
	<20170217064327.GB21716@lemon.lan>
	<CAFEAcA8_f8SVX+rirAFBJ76ZiXaKUwh9uO0AeBFoR7G_q8pGDg@mail.gmail.com>
	<6ab86cf8-4780-ca76-f648-ac0ce211e27b@redhat.com>
	<CABHMSTWN2KdAXDjEEbyWio6rNM2FuDk_NUj40mFW0HdyZFu68g@mail.gmail.com>
	<fc3b6729-6739-5daf-5e78-85fbd7d3260d@redhat.com>
	<CABHMSTUS4Oi5WZt0NcYaOnX9_u8zQeu=CupLVX2LjvD+mTYATg@mail.gmail.com>
	<ac569867-6629-7b56-0bf1-85f15b52f143@redhat.com>
Date: Tue, 21 Feb 2017 10:41:37 +0100
In-Reply-To: <ac569867-6629-7b56-0bf1-85f15b52f143@redhat.com> (Eric Blake's
	message of "Mon, 20 Feb 2017 21:02:13 -0600")
Message-ID: <87wpcjlw32.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 21 Feb 2017 09:41:40 +0000 (UTC)
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
X-List-Received-Date: Tue, 21 Feb 2017 09:41:46 -0000

Eric Blake <eblake@redhat.com> writes:

[...]
> 'git send-email -s' can also add Signed-off-by: lines, if you didn't add
> them earlier (but only if you use send-email, rather than attachments) :)

That's fine, as you *should* use git send-email.

If it looks unattractive to you because it needs some setup, then that's
because you haven't wasted your time failing at all the alternatives.

Hiding patches in attachments counts as failure.

We should be nice about new contributors failures, of course.  Still,
you might want to spend your new contributor goodwill budget on more
interesting mistakes ;)


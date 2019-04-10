Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hE5c1-0000Ye-R7
	for mharc-qemu-trivial@gnu.org; Wed, 10 Apr 2019 01:17:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hE5c0-0000Xh-7w
	for qemu-trivial@nongnu.org; Wed, 10 Apr 2019 01:17:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hE5bz-0006VX-9l
	for qemu-trivial@nongnu.org; Wed, 10 Apr 2019 01:17:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50764)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hE5bw-0006Td-8l; Wed, 10 Apr 2019 01:17:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7CC4437E88;
	Wed, 10 Apr 2019 05:17:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B7FA608A7;
	Wed, 10 Apr 2019 05:17:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 417481138648; Wed, 10 Apr 2019 07:17:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Aruna Jayasena <aruna.15@cse.mrt.ac.lk>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <20190409155635.10276-1-aruna.15@cse.mrt.ac.lk>
	<CAFEAcA-k0KEsjb0VvbhhkpvTN7nFBDNtqKwx-Lai5uYbCkztJA@mail.gmail.com>
	<CAH95U0j6rHGdZj4B8DK-Ty-SqZHMb3Kmg16w+j3jx5bdkeijLQ@mail.gmail.com>
	<CAFEAcA9DSaZE-dsKV4321meT2hBEJRLmWBLF0U5o0jG=mzcmRA@mail.gmail.com>
Date: Wed, 10 Apr 2019 07:17:21 +0200
In-Reply-To: <CAFEAcA9DSaZE-dsKV4321meT2hBEJRLmWBLF0U5o0jG=mzcmRA@mail.gmail.com>
	(Peter Maydell's message of "Tue, 9 Apr 2019 17:50:00 +0100")
Message-ID: <87d0lu4exq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 10 Apr 2019 05:17:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] Header cleanups
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
X-List-Received-Date: Wed, 10 Apr 2019 05:17:29 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 9 Apr 2019 at 17:42, Aruna Jayasena <aruna.15@cse.mrt.ac.lk> wrote:
>>
>> Yeah this is a stand alone patch.
>
> OK, thanks -- just wanted to check there wasn't a missing
> bit. I think this could go in via the qemu-trivial tree
> so I have cc'd them.
>
> We're in the middle of a release at the moment, but we
> should reopen for development in a couple of weeks. If
> this patch still hasn't gone anywhere by a week or so after
> that then please follow up with a 'ping' to check it hasn't
> been forgotten by accident.

Hopefully, qemu-trivial won't wait for the next development cycle to
begin just to queue patches for it.

Regardless, patch submitters should watch their patches and inquire when
they don't get up within a reasonable time frame.  Normally, waiting for
two weeks feels about right.  Perhaps give it an extra week or so when
the release circus is in town (like now).


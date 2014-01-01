Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VyBCw-0004oA-7C
	for mharc-qemu-trivial@gnu.org; Tue, 31 Dec 2013 21:06:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VyBCq-0004ns-CZ
	for qemu-trivial@nongnu.org; Tue, 31 Dec 2013 21:06:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VyBCl-0004pE-CZ
	for qemu-trivial@nongnu.org; Tue, 31 Dec 2013 21:06:48 -0500
Received: from mail-lb0-f176.google.com ([209.85.217.176]:44841)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VyBCl-0004p4-5T
	for qemu-trivial@nongnu.org; Tue, 31 Dec 2013 21:06:43 -0500
Received: by mail-lb0-f176.google.com with SMTP id l4so6551023lbv.35
	for <qemu-trivial@nongnu.org>; Tue, 31 Dec 2013 18:06:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wgV9fOQSFVH2ScgNXypXbP3KjDOhQBSBjmXNtDi0pJc=;
	b=Kox/YM0aYcUip3H0T8O9/Sb54WJfPyOl+N+9AgaI8JrPts0vYtrV10ToV91XzyPxOJ
	u9hfUNfHwCAD8GbsQqJbKOhfLJuXHDcb00VHV7VCOT6+2Ooce2jj4Rp6vMEeFq85EVKI
	70uajyoakgS8xm5ZZeFZ0SqNBfkdAX6FGgzqUscuuxqemdwiOphCI4UWtzX2RipOor60
	X9oQuqsGDYiu0108P+6VHrTs1GFTBaEosXpkqUapgyENQl9vdvD4yc/33++sUl1swvgi
	H2OBT9R7RL+pqZePnvbONE+o/Fbz3ucR14/pKCZakqu85WHlTwePq7CIlz3VHdHixlOr
	CYEw==
X-Gm-Message-State: ALoCoQnmImqOettSSrW3Lcc9s26RoGyZY6UpUxE+uCtPSq3DsQwQoR7zXc8aAWUFFRreGae8YK4A
X-Received: by 10.112.155.106 with SMTP id vv10mr8533lbb.53.1388542001491;
	Tue, 31 Dec 2013 18:06:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.125.3 with HTTP; Tue, 31 Dec 2013 18:06:21 -0800 (PST)
In-Reply-To: <CAJBZ5eP8tRvaQf6qW-zzUs_WQ2WcwTyo0i5Xz3ak8SSprU9vmQ@mail.gmail.com>
References: <1388464944-26911-1-git-send-email-keweihk@gmail.com>
	<CAEgOgz54Zj9w8gQaMNBvVCiFQX5raPFXLGODy97PrD-TmYSBvw@mail.gmail.com>
	<CAJBZ5eP8tRvaQf6qW-zzUs_WQ2WcwTyo0i5Xz3ak8SSprU9vmQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Jan 2014 02:06:21 +0000
Message-ID: <CAFEAcA8iVQWWYDLZLS60U=u=Hyd4WToG_nWtcG0ZHVs7-ELnwA@mail.gmail.com>
To: Kewei Yu <keweihk@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.176
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/1] qtest: Fix the bug
 about disabling vnc causes "make check" hang
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
X-List-Received-Date: Wed, 01 Jan 2014 02:06:53 -0000

On 31 December 2013 13:29, Kewei Yu <keweihk@gmail.com> wrote:
> 2013/12/31 Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>>
>> On Tue, Dec 31, 2013 at 2:42 PM, Kewei Yu <keweihk@gmail.com> wrote:
>> >                                    "%s", qemu_binary, s->socket_path,
>> >                                    s->qmp_socket_path, pid_file,
>> > +                                  qtest_vnc_param ?: "",
>>
>> I do vaguely remember someone going to efforts to remove uses of "? :
>> foo" (with the blank true value).
>
>  I'm not clear the sentence's meaning.

Using the ternary operator "X ? Y : Z" with an empty 2nd operand
"X ?: Y" is not standard C. It's a GCC extension. There was a
suggestion a year or so back that we should remove the uses of
it, but the consensus was that this was unnecessary, since in
practice we rely on other GCC extensions. Clang also supports
this syntax, and it's the only other compiler we care about.

In this case it seems reasonable, especially since the line
immediately below this addition is using it too.

thanks
-- PMM


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cePmS-0000cT-Ay
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2017 12:23:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1cePmO-0000Yn-Ht
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2017 12:23:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1cePmN-0003B9-Iu
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2017 12:23:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50346)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1cePmI-00037t-RF; Thu, 16 Feb 2017 12:23:34 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03AA1C056790;
	Thu, 16 Feb 2017 17:23:35 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-72.phx2.redhat.com
	[10.3.116.72])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1GHNXp3020655; Thu, 16 Feb 2017 12:23:33 -0500
To: Paolo Bonzini <pbonzini@redhat.com>, Chad Joan <chadjoan@gmail.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
Date: Thu, 16 Feb 2017 18:23:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <1933406e-2576-e687-3545-a72f3b999310@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 16 Feb 2017 17:23:35 +0000 (UTC)
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
X-List-Received-Date: Thu, 16 Feb 2017 17:23:41 -0000

On 02/16/17 17:58, Paolo Bonzini wrote:
> 
> 
> On 16/02/2017 17:30, Chad Joan wrote:
>> Hello,
>>
>> This is a one-line patch to the configure script that will allow QEMU to be
>> built on musl-libc based Linux systems.  This problem is only noticeable
>> when QEMU is built with --enable-curses.
>>
>> Detailed reading material if you want to know where this came from:
>> https://bugs.gentoo.org/show_bug.cgi?id=609364
> 
> Hi,
> 
> can you explain exactly which function is missing without
> -D_XOPEN_SOURCE=500?  If it is curses' wide-char functions, why does it
> fail with musl but not with glibc?  Is _XOPEN_SOURCE always defined by
> glibc if you have _D_GNU_SOURCE?

It is not necessarily auto-defined, but the effect is "as if".

It is documented in the libc info:

https://www.gnu.org/software/libc/manual/html_node/Feature-Test-Macros.html#index-_005fXOPEN_005fSOURCE

> Macro: _XOPEN_SOURCE
> Macro: _XOPEN_SOURCE_EXTENDED
>
>     If you define this macro, functionality described in the X/Open
>     Portability Guide is included. This is a superset of the POSIX.1
>     and POSIX.2 functionality and in fact _POSIX_SOURCE and
>     _POSIX_C_SOURCE are automatically defined.
>
>     As the unification of all Unices, functionality only available in
>     BSD and SVID is also included.
>
>     If the macro _XOPEN_SOURCE_EXTENDED is also defined, even more
>     functionality is available. The extra functions will make all
>     functions available which are necessary for the X/Open Unix brand.
>
>     If the macro _XOPEN_SOURCE has the value 500 this includes all
>     functionality described so far plus some new definitions from the
>     Single Unix Specification, version 2.

https://www.gnu.org/software/libc/manual/html_node/Feature-Test-Macros.html#index-_005fGNU_005fSOURCE

> Macro: _GNU_SOURCE
>
>     If you define this macro, everything is included: ISO C89, ISO
>     C99, POSIX.1, POSIX.2, BSD, SVID, X/Open, LFS, and GNU extensions.
>     In the cases where POSIX.1 conflicts with BSD, the POSIX
>     definitions take precedence.

Curiously, I managed to recall this from years ago, when I was still
living and breathing the SUS (and looking frequently at the glibc info too).

Laszlo


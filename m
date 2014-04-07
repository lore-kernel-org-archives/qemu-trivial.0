Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXBoI-0003e1-91
	for mharc-qemu-trivial@gnu.org; Mon, 07 Apr 2014 11:50:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WXBoC-0003Tp-Ka
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 11:50:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WXBo8-0008Ty-7m
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 11:50:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:63840)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WXBnz-0008Sj-Do; Mon, 07 Apr 2014 11:49:51 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s37Fnmxf025116
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 7 Apr 2014 11:49:49 -0400
Received: from blackfin.pond.sub.org (ovpn-116-40.ams2.redhat.com
	[10.36.116.40])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s37Fnkte030398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 7 Apr 2014 11:49:48 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 4743B200D1; Mon,  7 Apr 2014 17:49:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1396019577-2013-1-git-send-email-peter.maydell@linaro.org>
	<1396019577-2013-3-git-send-email-peter.maydell@linaro.org>
	<5340FDA3.1080902@msgid.tls.msk.ru>
	<CAFEAcA_uN=+R6UZ6FiRshH2XvSCYBKwcHZu5ugd_02rKeM=yDQ@mail.gmail.com>
	<53416107.1080709@msgid.tls.msk.ru>
	<CAFEAcA8sr69XWzFjvBg8VN_ih2O=S78jWrXLrshmQAoWXhTQWw@mail.gmail.com>
	<5342B540.4050005@twiddle.net>
	<CAFEAcA_fp604HJ22hX6MWfjCHEjDCdqBh5-wNb3JX_923iuLew@mail.gmail.com>
Date: Mon, 07 Apr 2014 17:49:46 +0200
In-Reply-To: <CAFEAcA_fp604HJ22hX6MWfjCHEjDCdqBh5-wNb3JX_923iuLew@mail.gmail.com>
	(Peter Maydell's message of "Mon, 7 Apr 2014 15:47:49 +0100")
Message-ID: <87mwfx87hh.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Patch Tracking <patches@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/3] int128.h: Avoid
	undefined behaviours involving signed arithmetic
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
X-List-Received-Date: Mon, 07 Apr 2014 15:50:09 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On 7 April 2014 15:25, Richard Henderson <rth@twiddle.net> wrote:
>> On 04/06/2014 08:27 AM, Peter Maydell wrote:
>>> (if C compilers had a "behave
>>> like a sane 2s complement system for signed arithmetic"
>>> option I'd be advocating for us using it...)
>>
>> -fwrapv.
>
> Well, we should use that then :-)

I share your distaste for compilers being perfectly capable to recognize
undefined behavior so they can "optimize" working programs into slightly
faster broken programs, yet unable to warn me about the very same
undefined behavior they so eagerly exploit.

-fwrapv is known to be buggy in gcc 4.1.  Do we care?

It bit the kernel a couple of years ago, and they replaced -fwrapv by
-fno-strict-overflow.

Commit introducing -fwrapv:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=68df3755e383e6fecf2354a67b08f92f18536594

Commit moving to -fno-strict-overflow:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=a137802ee839ace40079bebde24cfb416f73208a

Blog post comparing the two options:
http://www.airs.com/blog/archives/120


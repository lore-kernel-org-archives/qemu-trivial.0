Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W3BBq-0002bm-Ul
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jan 2014 16:06:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1W38Zn-00054M-7z
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 13:19:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1W38Zi-0007aH-7k
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 13:18:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:10355)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>)
	id 1W38Zh-0007a8-Vs; Tue, 14 Jan 2014 13:18:54 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0EIIq4w005647
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 14 Jan 2014 13:18:52 -0500
Received: from localhost (ovpn-116-79.ams2.redhat.com [10.36.116.79])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s0EIIp8U024906; Tue, 14 Jan 2014 13:18:51 -0500
From: Juan Quintela <quintela@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
In-Reply-To: <52D57673.7020100@weilnetz.de> (Stefan Weil's message of "Tue, 14
	Jan 2014 18:40:03 +0100")
References: <1389679228-15870-1-git-send-email-sw@weilnetz.de>
	<52D57343.8000205@msgid.tls.msk.ru> <52D57673.7020100@weilnetz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
Date: Tue, 14 Jan 2014 19:18:50 +0100
Message-ID: <87a9ey1l6d.fsf@elfo.mitica>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Tue, 14 Jan 2014 16:06:25 -0500
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] exec: Exclude non portable function for
	MinGW
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: quintela@redhat.com
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Jan 2014 18:19:04 -0000

Stefan Weil <sw@weilnetz.de> wrote:
> Am 14.01.2014 18:26, schrieb Michael Tokarev:
>> 14.01.2014 10:00, Stefan Weil wrote:
>>> cpu_physical_memory_set_dirty_lebitmap calls getpageaddr and ffsl which are
>>> unavailable for MinGW. As the function is unused for MinGW, it can simply
>>> be excluded from compilation.
>> I applied it to -trivial.  But maybe it's better to just move whole
>> thing to kvm-all.c where
>> it is actually used?
>>
>> Thanks,
>>
>> /mjt
>
> That's a good suggestion.

Let it as your change.  Functions on ram_addr.h should be opaque, and
nothing else should access the bitmap.


>
> Juan, a comment in include/exec/ram_addr.h says that those functions
> will be removed soon. Would you suggest moving them to kvm-all.c now, or
> would you prefer the conditional compilation for MinGW which I
> introduced with my patch?

The "soon" was introduced when Memory API was included, and we are still
waiting on TCG.

Later, Juan.


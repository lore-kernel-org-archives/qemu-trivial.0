Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVy8J-0001UI-9O
	for mharc-qemu-trivial@gnu.org; Thu, 12 Mar 2015 04:06:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVy8G-0001O7-Lm
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 04:06:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVy8F-0002bo-OE
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 04:06:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59660)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVy8B-0002Zk-7w; Thu, 12 Mar 2015 04:06:11 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7947B4176E;
	Thu, 12 Mar 2015 11:06:08 +0300 (MSK)
Message-ID: <550148F0.4030108@msgid.tls.msk.ru>
Date: Thu, 12 Mar 2015 11:06:08 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <55012E99.3030408@msgid.tls.msk.ru>
	<CAFEAcA9sksApiTRo_0RQ588xLYq+Jy26CQ02nKPp4zoFzyV3_Q@mail.gmail.com>
In-Reply-To: <CAFEAcA9sksApiTRo_0RQ588xLYq+Jy26CQ02nKPp4zoFzyV3_Q@mail.gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, 778737@bugs.debian.org,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] configure: enable kvm on x32
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
X-List-Received-Date: Thu, 12 Mar 2015 08:06:18 -0000

12.03.2015 10:16, Peter Maydell wrote:
> On 12 March 2015 at 06:13, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> Here's a trivial change to enable kvm on x32 architecture.
>> I'm not 100% sure the result works correctly in all cases,
>> but this is a good start and in theory everything should
>> work.
> 
> Given the pessimism expressed in this comment, perhaps
> we should delay this to 2.4 and when it's had more
> testing?

There's no pessimism really.  It is a new arch for kvm, so
_something_ might not work.  In practice it works fairy well,
see https://bugs.debian.org/778737 -- at least debian can
be installed in x32 kvm.

And we don't lose anything really because it is a new arch.

That's why it was Cc'd -trivial.

Thanks,

/mjt


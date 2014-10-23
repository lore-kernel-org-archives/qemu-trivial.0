Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhFcC-0005rD-FM
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 06:27:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhFc7-0005kG-Ky
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 06:27:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhFc2-0002Ug-Q9
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 06:27:27 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43749)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XhFbr-0002A3-EB; Thu, 23 Oct 2014 06:27:11 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id ED03145B08;
	Thu, 23 Oct 2014 14:27:09 +0400 (MSK)
Message-ID: <5448D7FD.60501@msgid.tls.msk.ru>
Date: Thu, 23 Oct 2014 14:27:09 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.8.1
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <54369514.5000004@gmail.com> <5448B7C6.8070604@msgid.tls.msk.ru>
	<CAFEAcA-Zg-MUFCnJBeuSjbXyc9Y7W4rLQZ0DXXHJ_ZWKLDo8mw@mail.gmail.com>
	<CAFEAcA_o827huyJeqJty4eBUnXQSRmrP3n967ugr2q7HcJLrhw@mail.gmail.com>
In-Reply-To: <CAFEAcA_o827huyJeqJty4eBUnXQSRmrP3n967ugr2q7HcJLrhw@mail.gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Chen Gang <gang.chen.5i5j@gmail.com>, "rth@twiddle.net" <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] disas/libvixl/a64/instructions-a64.h:
 Remove useless varialbe to avoid building break with '-Werror'
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
X-List-Received-Date: Thu, 23 Oct 2014 10:27:32 -0000

On 10/23/2014 02:09 PM, Peter Maydell wrote:
> On 23 October 2014 10:02, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 23 October 2014 09:09, Michael Tokarev <mjt@tls.msk.ru> wrote:
>>> Applied to trivial (with subject fixup), thanks!
>>
>> Please don't -- as I said, I have a libvixl update in my queue,
>> and these will conflict. I'll apply an appropriate variation of
>> this patch to my target-arm tree.
> 
> ...or maybe I just *thought* I'd said that, since I can't find
> a mail in this thread where I did; sorry.

You did, in a "v2" version.  Which I overlooked really, and tried
to apply the original v1 (which has you reviewed-by as a temp.
workaround).  Oh well.. :)

There's quite a lot of noize about these things recently.

Not applying it.

Thanks,

/mjt\


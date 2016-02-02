Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQWMZ-0004w5-64
	for mharc-qemu-trivial@gnu.org; Tue, 02 Feb 2016 03:31:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aQWMX-0004sy-4r
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 03:31:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aQWMW-0000eA-6O
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 03:31:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:54650)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aQWMR-0000dV-D9; Tue, 02 Feb 2016 03:30:55 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id ABEA8402A9;
	Tue,  2 Feb 2016 11:30:54 +0300 (MSK)
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1454309636-18263-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<1454309636-18263-2-git-send-email-caoj.fnst@cn.fujitsu.com>
	<56B0658A.20605@msgid.tls.msk.ru> <56B0680C.8050200@cn.fujitsu.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56B0693E.5070302@msgid.tls.msk.ru>
Date: Tue, 2 Feb 2016 11:30:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <56B0680C.8050200@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 1/2] Emulated CCID card: QOMify
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
X-List-Received-Date: Tue, 02 Feb 2016 08:31:02 -0000

02.02.2016 11:25, Cao jin wrote:
> On 02/02/2016 04:15 PM, Michael Tokarev wrote:
>> Why did you move the type definition from .c to .h file?
>> It is only referenced in .c, no?
[]
> Yes, that type definition is referred only in .c for now, but we are not sure about it in the future, for better flexibility, I think put it into .h is better. http://wiki.qemu.org/QOMConventions also says:
> 
> DO use TYPE_FOO constants, defined in a header if used in other parts of code

The last words in this sentense makes sense, I think:
"if used in other parts of the code".

So I read it as 2-part suggestion:

1) use TYPE_foo constants instead of "literals", and
2) define them in a header file if used elsewhere too.

The "future flexibility" is, in my opinion, questionable.
If we'll use them in the future, we can always move the
#define to the header file.  For now, there's no need
to clutter the heade more, but there's a good reason
to use the #define in the "home" .c file where this
device is implemented, in all places where the device
name is referenced.

At least that's how I read this (somewhat ambiguous)
suggestion in the wiki.

Thanks,

/mjt


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wi8Gl-00052j-J7
	for mharc-qemu-trivial@gnu.org; Wed, 07 May 2014 16:16:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wi8GZ-0004m1-CE
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 16:16:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wi8GT-0003Ze-8V
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 16:16:35 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42629)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wi8GG-0003X5-3V; Wed, 07 May 2014 16:16:16 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6630840B02;
	Thu,  8 May 2014 00:16:13 +0400 (MSK)
Message-ID: <536A948D.6020000@msgid.tls.msk.ru>
Date: Thu, 08 May 2014 00:16:13 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA-5JGOZDYR5ApPs-tROSh+_CnPB1Zxw3H8CaMgJseMtvQ@mail.gmail.com>
	<536A76C4.2080606@redhat.com>
In-Reply-To: <536A76C4.2080606@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PULL 00/22] Trivial patches for 2014-05-05
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
X-List-Received-Date: Wed, 07 May 2014 20:16:44 -0000

07.05.2014 22:09, Paolo Bonzini wrote:
> Il 07/05/2014 14:50, Peter Maydell ha scritto:
>> git bisect says it's this makefile change.
>>
>> I think the problem here is that the rune for applying obj-specific
>> CFLAGS is only in the Rules.make line for %.o: %.c, and not in
>> the lines for building a .o file from a .cc, .cpp or .m file. That
>> should probably be fixed.
> 
> I thought I had said I would include it together with other build patches...

I don't think you mentioned this patch in particular,
and I haven't seen you commented on it, either.

>  Michael, can you remove it from qemu-trivial?

That's exactly what I did, to have some time to rework it
so it wont cause more issues.

Thanks,

/mjt


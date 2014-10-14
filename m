Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xe8Fo-0003WI-6u
	for mharc-qemu-trivial@gnu.org; Tue, 14 Oct 2014 15:59:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xe8Fg-0003MD-4s
	for qemu-trivial@nongnu.org; Tue, 14 Oct 2014 15:59:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xe8FZ-0000ZS-KE
	for qemu-trivial@nongnu.org; Tue, 14 Oct 2014 15:59:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49666)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xe8FJ-0000V1-LU; Tue, 14 Oct 2014 15:59:01 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 018EA43B73;
	Tue, 14 Oct 2014 23:58:50 +0400 (MSK)
Received: from [192.168.177.103] (aa9300.vpn.tls.msk.ru [192.168.177.103])
	by tsrv.corpit.ru (Postfix) with ESMTP id 58BA8705;
	Tue, 14 Oct 2014 23:58:50 +0400 (MSK)
Message-ID: <543D807A.6000704@msgid.tls.msk.ru>
Date: Tue, 14 Oct 2014 21:58:50 +0200
From: Michael Tokarev <mjt@tls.msk.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, 
	Chen Gang <gang.chen.5i5j@gmail.com>
References: <5439399D.4020004@gmail.com> <54393AF0.1010708@gmail.com>
	<CAFEAcA_c7FE93J_7ZTqZaMG3V6Xx+EW6kAYF6XBqO9YL28+1mg@mail.gmail.com>
In-Reply-To: <CAFEAcA_c7FE93J_7ZTqZaMG3V6Xx+EW6kAYF6XBqO9YL28+1mg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Eric Blake <eblake@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH v2] libvixl: a64: Skip
 "-Wunused-variable" for gcc 5.0.0 or higher
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
X-List-Received-Date: Tue, 14 Oct 2014 19:59:30 -0000

On 11.10.2014 23:25, Peter Maydell wrote:
> On 11 October 2014 15:13, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
>
> MJT: please don't put this in -trivial, it will clash with
> the update to libvixl 1.6 currently on the list.

Actually I'd not put that to anywhere anyway.  Because to me,
*especially* in a case like this when the code is imported from
some other place and will be updated later (so we should not
modify it), this issue can be more easily dealt with externally,
by adding a compiler option in a Makefile.  Provided, ofcourse,
that it is not fixed upstream properly to start with - and if
it is (and this is the very sane way to go really, to fix it
upstream), that fix can be pulled to qemu as well, so no
clashes with further upstream changes will happen.

And aso because really, this prob should be fixed properly, not
worked around like this..

[]
> Some other approaches to this that would confine the
> fix to the makefiles rather than requiring us to modify
> the vixl source itself:
>   a) add a -Wno- option for the affected .o files
>   b) use -isystem rather than -I to include the libvixl
>      directory on the include path
>
> (a)'s probably better I guess.

That's what I'm after too (after trying to fix it properly).
And no, at this time I dont know how gcc5 handles this.

Thanks,

/mjt


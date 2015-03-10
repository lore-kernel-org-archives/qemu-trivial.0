Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVD39-00068Q-5e
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 01:49:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVD36-00065C-Uq
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 01:49:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVD36-0000Io-37
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 01:49:48 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48839)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVD2z-0000Fd-S6; Tue, 10 Mar 2015 01:49:42 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5E89741302;
	Tue, 10 Mar 2015 08:49:40 +0300 (MSK)
Message-ID: <54FE85F4.5040001@msgid.tls.msk.ru>
Date: Tue, 10 Mar 2015 08:49:40 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <cover.1425489273.git.mjt@msgid.tls.msk.ru>
	<CAFEAcA9xPOrFfpx7-_P9xPe-065itFxap5ZKa1w6G4Y-fG3_-A@mail.gmail.com>
In-Reply-To: <CAFEAcA9xPOrFfpx7-_P9xPe-065itFxap5ZKa1w6G4Y-fG3_-A@mail.gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PULL v2 00/46] Trivial patches for 2015-03-04
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
X-List-Received-Date: Tue, 10 Mar 2015 05:49:49 -0000

08.03.2015 15:43, Peter Maydell wrote:
[..]
> Fails to build on clang, I'm afraid:
> 
> /home/petmay01/linaro/qemu-for-merges/disas/cris.c:1218:33: error:
> unused variable 'cris_cond15s' [-Werror,-Wunused-const-variable]
> static const struct cris_cond15 cris_cond15s[] =
>                                 ^
> 1 error generated.

What a wonderful patchset I have in -trivial.  It
had 2 follow-ups each dropping one more patch.  Now
there's one another bad patch, and more, a bad patch
which has already been submitted previously and rejected
because of the same very reason.

I just re-sent the pull request without the patch in question.

I'm sorry for the noize.

Thanks,

/mjt


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VG9Fc-0006Pb-TY
	for mharc-qemu-trivial@gnu.org; Sun, 01 Sep 2013 11:07:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9FW-0006HF-7E
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:07:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9FQ-0002LR-91
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:07:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38506)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VG9FD-0002Jw-NU; Sun, 01 Sep 2013 11:07:15 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 06570400BA;
	Sun,  1 Sep 2013 19:07:15 +0400 (MSK)
Message-ID: <52235822.3040203@msgid.tls.msk.ru>
Date: Sun, 01 Sep 2013 19:07:14 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1375730200-22203-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1375730200-22203-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] configure: disable clang
 -Wstring-plus-int warning
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
X-List-Received-Date: Sun, 01 Sep 2013 15:07:40 -0000

05.08.2013 23:16, Peter Maydell wrote:
> Some versions of clang will warn about adding integers to strings:
>
> disas/i386.c:4753:23: error: adding 'char' to a string does not append
>        to the string [-Werror,-Wstring-plus-int]
>        oappend ("%es:" + intel_syntax);
>                 ~~~~~~~^~~~~~~~~~~~~~
> disas/i386.c:4753:23: note: use array indexing to silence this warning
>        oappend ("%es:" + intel_syntax);
>                        ^
>                 &      [             ]
>
> disas/i386.c uses this idiom to to skip a "%" prefix if using intel
> rather than AT&T syntax. This seems like a reasonable  thing to do,
> and I don't think anybody contributing to QEMU is likely to believe
> that '+' is a string concatenation operator in C, so just disable
> -Wstring-plus-int.

Thanks, applied to the trivial-patches queue.

/mjt


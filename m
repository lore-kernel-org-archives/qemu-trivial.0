Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VMCzL-0002Xq-2U
	for mharc-qemu-trivial@gnu.org; Wed, 18 Sep 2013 04:19:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VMCzF-0002N3-4w
	for qemu-trivial@nongnu.org; Wed, 18 Sep 2013 04:19:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VMCzA-0004oZ-66
	for qemu-trivial@nongnu.org; Wed, 18 Sep 2013 04:19:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58568)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VMCz0-0004lw-5A; Wed, 18 Sep 2013 04:19:34 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9F4FA41487;
	Wed, 18 Sep 2013 12:19:26 +0400 (MSK)
Message-ID: <5239620E.90605@msgid.tls.msk.ru>
Date: Wed, 18 Sep 2013 12:19:26 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Anthony Liguori <anthony@codemonkey.ws>
References: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CA+aC4kv6ijDVhjLSK6LgqmdHbVVJgFEokD3TCYsx9-sT1hZ3+A@mail.gmail.com>
In-Reply-To: <CA+aC4kv6ijDVhjLSK6LgqmdHbVVJgFEokD3TCYsx9-sT1hZ3+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/15] trivial patches for
	2013-09-14
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
X-List-Received-Date: Wed, 18 Sep 2013 08:19:54 -0000

17.09.2013 19:06, Anthony Liguori wrote:
> On Sat, Sep 14, 2013 at 2:47 PM, Michael Tokarev <mjt@tls.msk.ru> wrote=
:
>> Just a bit late but here's the next trivial-patches pull request.
>>
>> Thanks,
>
> Breaks the build:
>
> /home/anthony/git/qemu/cpu-exec.c: In function =E2=80=98cpu_alpha_exec=E2=
=80=99:
> /home/anthony/git/qemu/cpu-exec.c:204:15: error: variable =E2=80=98cpu=E2=
=80=99 might
> be clobbered by =E2=80=98longjmp=E2=80=99 or =E2=80=98vfork=E2=80=99 [-=
Werror=3Dclobbered]

Which system do you use to compile stuff?  I verified the series on a few
versions of Debian and on a FreeBSD system, none shows any bad stuff.
I'd like to test on a system similar to what you use to avoid breakage
in the future.

Speaking of this series, is it okay if I'll rebase with fixups and
re-send the pull request?

Thanks,

/mjt


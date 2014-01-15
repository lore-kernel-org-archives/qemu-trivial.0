Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W3WHs-0004ul-0n
	for mharc-qemu-trivial@gnu.org; Wed, 15 Jan 2014 14:38:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3WHj-0004m9-MG
	for qemu-trivial@nongnu.org; Wed, 15 Jan 2014 14:38:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3WHd-0005mj-OA
	for qemu-trivial@nongnu.org; Wed, 15 Jan 2014 14:37:55 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:54508)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W3WHQ-0005kx-FD; Wed, 15 Jan 2014 14:37:36 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 59BF5413E7;
	Wed, 15 Jan 2014 23:37:35 +0400 (MSK)
Message-ID: <52D6E37F.9050404@msgid.tls.msk.ru>
Date: Wed, 15 Jan 2014 23:37:35 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1389432851-11420-1-git-send-email-pavel.zbitskiy@gmail.com>
	<1389432851-11420-3-git-send-email-pavel.zbitskiy@gmail.com>
	<CAFEAcA9p1W5=-=e0VqJnKGJrakALT-_BCY-4GevYkd6s8JL29w@mail.gmail.com>
In-Reply-To: <CAFEAcA9p1W5=-=e0VqJnKGJrakALT-_BCY-4GevYkd6s8JL29w@mail.gmail.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, pavel.zbitskiy@gmail.com,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/3] linux-user: fixed
 getsockopt() optlen
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
X-List-Received-Date: Wed, 15 Jan 2014 19:38:02 -0000

12.01.2014 23:07, Peter Maydell wrote:
> On 11 January 2014 09:34,  <pavel.zbitskiy@gmail.com> wrote:
>> From: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
>>
>> optlen parameter of getsockopt() of type socklen_t* was read into
>> variable of type socklen_t, that caused zeroing out of upper 4 bytes
>> when running s390x on top of x86_64. This patch changes optlen type
>> to abi_ulong.
> 
> This patch and patch 3 are correct fixes, but shouldn't we be
> more generally using abi_ulong for every argument we read from
> the guest in do_socketcall() ?

I think the current fix is worth to apply anyway, regareless of
further possible rework.

Thanks,

/mjt


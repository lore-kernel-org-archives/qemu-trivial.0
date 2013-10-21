Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VYB7s-00073Q-7E
	for mharc-qemu-trivial@gnu.org; Mon, 21 Oct 2013 04:46:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VYB7p-0006zk-Ri
	for qemu-trivial@nongnu.org; Mon, 21 Oct 2013 04:46:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VYB7l-0004ts-M4
	for qemu-trivial@nongnu.org; Mon, 21 Oct 2013 04:46:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VYB7c-0004se-FF; Mon, 21 Oct 2013 04:45:56 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9CF6142E03;
	Mon, 21 Oct 2013 12:45:55 +0400 (MSK)
Message-ID: <5264E9C3.6090001@msgid.tls.msk.ru>
Date: Mon, 21 Oct 2013 12:45:55 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Petar Jovanovic <Petar.Jovanovic@imgtec.com>
References: <1381496638-29127-1-git-send-email-petar.jovanovic@rt-rk.com>,
	<CAFEAcA8HGFUT8P3unP0FfaxsrORm1uHewEb_8DrKFqXqY8wtJg@mail.gmail.com>
	<56EA75BA695AE044ACFB41322F6D2BF40224FF76@BADAG02.ba.imgtec.org>
In-Reply-To: <56EA75BA695AE044ACFB41322F6D2BF40224FF76@BADAG02.ba.imgtec.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Riku Voipio <riku.voipio@linaro.org>,
	Petar Jovanovic <petar.jovanovic@rt-rk.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: pass correct
 parameter to do_shmctl()
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
X-List-Received-Date: Mon, 21 Oct 2013 08:46:11 -0000

12.10.2013 00:44, Petar Jovanovic wrote:
> ________________________________________
> From: Peter Maydell [peter.maydell@linaro.org]
> Sent: Friday, October 11, 2013 9:10 PM
> To: Petar Jovanovic
> Cc: QEMU Developers; QEMU Trivial; Riku Voipio; Petar Jovanovic; Aurelien Jarno
> Subject: Re: [Qemu-devel] [PATCH] linux-user: pass correct parameter to do_shmctl()
>
> On 11 October 2013 22:03, Petar Jovanovic <petar.jovanovic@rt-rk.com> wrote:
>> From: Petar Jovanovic <petar.jovanovic@imgtec.com>
>>
>> Fix shmctl issue by passing correct parameter buf to do_shmctl().
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
>> It would be nice if you gave more detail than "shmctl issue"...
>
> Yes, indeed. However, this is a bit tricky, because it can be associated
> with different issues, and this particular fix is a follow up to an
> another change [1] that I posted previously that defines arch-specific
> structs target_ipc_perm and target_shmid_ds. The layout of the structs
> is important.

What "[1]" are you referring to?

> This particular change will for instance, when joined with the
> preceding change, make the code correctly return values in the buf
> struct after:
>
> shmctl(shm_id, IPC_STAT, &buf)
>
> Different architectures benefit from these two patches.

Shouldn't the two patches be applied together and be routed via some
other, "non-trivial" tree instead?

Thanks,

/mjt


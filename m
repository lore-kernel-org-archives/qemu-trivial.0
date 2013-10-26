Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VZztE-0006TG-Tz
	for mharc-qemu-trivial@gnu.org; Sat, 26 Oct 2013 05:10:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VZzt8-0006Q0-Tc
	for qemu-trivial@nongnu.org; Sat, 26 Oct 2013 05:10:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VZzt3-0002vN-QI
	for qemu-trivial@nongnu.org; Sat, 26 Oct 2013 05:10:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40999)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VZzst-0002mR-Ar; Sat, 26 Oct 2013 05:10:15 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C1A0A4390F;
	Sat, 26 Oct 2013 13:10:14 +0400 (MSK)
Message-ID: <526B86F6.8090900@msgid.tls.msk.ru>
Date: Sat, 26 Oct 2013 13:10:14 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Alex Bligh <alex@alex.org.uk>
References: <1375814713-27542-1-git-send-email-alex@alex.org.uk>
	<7863EB11B2F7575807D316E3@nimrod.local>
In-Reply-To: <7863EB11B2F7575807D316E3@nimrod.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] audio/mixeng_template.h: fix inline
	declaration
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
X-List-Received-Date: Sat, 26 Oct 2013 09:10:36 -0000

22.10.2013 13:26, Alex Bligh =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ping
>
> I think this is should go to qemu-trivial
>
> --On 6 August 2013 19:45:13 +0100 Alex Bligh <alex@alex.org.uk> wrote:
>
>> Fix error: =E2=80=98inline=E2=80=99 is not at beginning of declaration
>> [-Werror=3Dold-style-declaration]

Thanks, applied to the trivial patches queue.

/mjt


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnLJf-0006FG-3M
	for mharc-qemu-trivial@gnu.org; Wed, 29 Apr 2015 02:17:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnLJa-00066G-8p
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 02:17:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnLJZ-00083O-8n
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 02:17:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42328)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YnLJU-00082P-Mg; Wed, 29 Apr 2015 02:17:40 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A5F9342A44;
	Wed, 29 Apr 2015 09:17:39 +0300 (MSK)
Message-ID: <55407783.5090606@msgid.tls.msk.ru>
Date: Wed, 29 Apr 2015 09:17:39 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Thomas Huth <huth@tuxfamily.org>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
References: <20150428082846.1348066e@thh440s> <20150428083849.5319c456@tpl530>
In-Reply-To: <20150428083849.5319c456@tpl530>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2 0/7] Remove more unused functions
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
X-List-Received-Date: Wed, 29 Apr 2015 06:17:47 -0000

28.04.2015 09:38, Thomas Huth wrote:
>> Date: Mon, 27 Apr 2015 20:09:50 +0200
>> From: Stefan Weil <sw@weilnetz.de>
>>
>> Am 27.04.2015 um 13:27 schrieb Michael Tokarev:
>>> 14.03.2015 09:19, Thomas Huth wrote:
>>>> Here are some more patches to remove completely unused functions
>>>> from QEMU. Please review carefully, some of the functions might
>>>> still get usefull in the future again, so if you discover one,
>>>> please let me know, then I'll remove it from the patch series
>>>> again.
>>> Applied to -trivial, thank you!
>>>
>> I'm sorry that I did not notice this series earlier.
>>
>> The function serial_set_frequency() is used in my personal branch for 
>> MIPS AR7.
> 
> Ok, since this function still could be again useful in the future,
> could you simply drop the related patch from your queue again, Michael?
> (or just drop the related hunks in the patch if you've got some spare
> time to rework it? If not, I could do that at a later point in time and
> send a new patch).

Piggy-back.  Oh well :)

I removed the patch named "Remove various unused functions" for now.
Because if I'll try to edit it, it'll be difficult for me to retain
your s-o-b.

You can resend this one with the right set of functions being removed.

Thanks,

/mjt


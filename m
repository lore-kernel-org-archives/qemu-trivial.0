Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RTezG-0002n9-Cf
	for mharc-qemu-trivial@gnu.org; Thu, 24 Nov 2011 14:29:34 -0500
Received: from eggs.gnu.org ([140.186.70.92]:40690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RTezD-0002dk-7o
	for qemu-trivial@nongnu.org; Thu, 24 Nov 2011 14:29:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RTezC-0000xx-33
	for qemu-trivial@nongnu.org; Thu, 24 Nov 2011 14:29:31 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:47908)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1RTezA-0000xb-6f; Thu, 24 Nov 2011 14:29:28 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	7F1B8728188B; Thu, 24 Nov 2011 20:29:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id hWn3tC+vI+lM; Thu, 24 Nov 2011 20:28:56 +0100 (CET)
Received: from flocke.weilnetz.de (p5086FE3A.dip.t-dialin.net [80.134.254.58])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	2395D7281889; Thu, 24 Nov 2011 20:28:56 +0100 (CET)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1RTeyT-0001cF-PD; Thu, 24 Nov 2011 20:28:45 +0100
Message-ID: <4ECE9AED.3070209@weilnetz.de>
Date: Thu, 24 Nov 2011 20:28:45 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <CAGtkxYxddRxBCJib+0xid-2BcS4WaUoxE1-Hc6FcsVwBDHVK4Q@mail.gmail.com>	<CAOfR6VHZHvcp-808F5n2NPv4E_zUjeToNBjx_2FyM+Wjb+oY5A@mail.gmail.com>
	<20111124102712.GA27170@stefanha-thinkpad.localdomain>
In-Reply-To: <20111124102712.GA27170@stefanha-thinkpad.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Mark <wudx05@gmail.com>,
	Zhi Hui Li <zhihuili@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] os-win32.c : fix memory leak
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
X-List-Received-Date: Thu, 24 Nov 2011 19:29:32 -0000

Am 24.11.2011 11:27, schrieb Stefan Hajnoczi:
> On Thu, Nov 24, 2011 at 05:15:30PM +0800, Mark wrote:
>    
>> If you free the string, it will cause the environment variable unavailable.
>>   More details please see the following text extracted from manual of
>> "putenv":
>>
>>         The  libc4  and  libc5  and  glibc 2.1.2 versions conform to SUSv2:
>> the pointer string given to putenv() is used.  In particular, this
>>         string becomes part of the environment; changing it later will
>> change the environment.  (Thus, it is an error is to call putenv() with
>>         an automatic variable as the argument, then return from the calling
>> function while string is still part of the environment.)  However,
>>         glibc 2.0-2.1.1 differs: a copy of the string is used.  On the one
>> hand this causes a memory leak, and on the other hand  it  violates
>>         SUSv2.  This has been fixed in glibc 2.1.2.
>>      
> I don't think this matters since os-win32.c is only built for mingw,
> which uses the Microsoft C runtime and not glibc.
>
> However, there is no documentation for putenv(3) on MSDN because the
> function has been deprecated :(.  So I think the safest thing to do is
> to assume this will leak memory but we are not allowed to free the
> string.
>    

MS claims that putenv is a POSIX function, so I also expected
that free / f_free is not allowed.

I now wrote a short test which indicates that g_free would work:
getenv returns a pointer which is completely different from
the one passed to putenv.

Nevertheless, there is a better solution using _putenv_s.
I'll send a patch.

Regards,
Stefan Weil



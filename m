Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtaHg-0008TL-P3
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2015 07:01:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZtaHX-0008AB-Cu
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 07:01:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZtaHU-0002u6-6T
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 07:01:43 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:45865)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZtaHK-0002mD-9W; Tue, 03 Nov 2015 07:01:30 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 729F1407C3;
	Tue,  3 Nov 2015 15:01:21 +0300 (MSK)
Message-ID: <5638A211.3080809@msgid.tls.msk.ru>
Date: Tue, 03 Nov 2015 15:01:21 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
References: <1445263720-6765-1-git-send-email-pbonzini@redhat.com>
	<56281CAE.1060505@twiddle.net>
In-Reply-To: <56281CAE.1060505@twiddle.net>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] target-alpha: fix uninitialized variable
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
X-List-Received-Date: Tue, 03 Nov 2015 12:01:51 -0000

22.10.2015 02:15, Richard Henderson wrote:
> On 10/19/2015 04:08 AM, Paolo Bonzini wrote:
>> I am not sure why the compiler does not catch it.  There is no
>> semantic change since gen_excp returns EXIT_NORETURN, but the
>> old code is wrong.
>>
>> Reported by Coverity.
>>
>> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
>> ---
>>   target-alpha/translate.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Reviewed-by: Richard Henderson <rth@twiddle.net>
> 
> I assume this will go in via trivial.

Richard, after your patch 522a0d4e3c0d397ffb45ec400d8cbd426dad9d17
"target-*: Advance pc after recognizing a breakpoint", this code
needs another review I think, as you modified the subsequent line ;)
Please take a look.

Thanks,

/mjt


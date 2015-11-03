Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtaMH-0008Ds-A8
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2015 07:06:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZtaME-00089S-SN
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 07:06:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZtaME-000456-1n
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 07:06:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52065)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZtaM9-00044O-Kf; Tue, 03 Nov 2015 07:06:29 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id DE54AC0D61D7;
	Tue,  3 Nov 2015 12:06:27 +0000 (UTC)
Received: from [10.36.112.70] (ovpn-112-70.ams2.redhat.com [10.36.112.70])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA3C6N3m017808
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 3 Nov 2015 07:06:26 -0500
To: Michael Tokarev <mjt@tls.msk.ru>, Richard Henderson <rth@twiddle.net>,
	qemu-devel@nongnu.org
References: <1445263720-6765-1-git-send-email-pbonzini@redhat.com>
	<56281CAE.1060505@twiddle.net> <5638A211.3080809@msgid.tls.msk.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5638A33F.50503@redhat.com>
Date: Tue, 3 Nov 2015 13:06:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <5638A211.3080809@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Tue, 03 Nov 2015 12:06:36 -0000



On 03/11/2015 13:01, Michael Tokarev wrote:
> 22.10.2015 02:15, Richard Henderson wrote:
>> On 10/19/2015 04:08 AM, Paolo Bonzini wrote:
>>> I am not sure why the compiler does not catch it.  There is no
>>> semantic change since gen_excp returns EXIT_NORETURN, but the
>>> old code is wrong.
>>>
>>> Reported by Coverity.
>>>
>>> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
>>> ---
>>>   target-alpha/translate.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Reviewed-by: Richard Henderson <rth@twiddle.net>
>>
>> I assume this will go in via trivial.
> 
> Richard, after your patch 522a0d4e3c0d397ffb45ec400d8cbd426dad9d17
> "target-*: Advance pc after recognizing a breakpoint", this code
> needs another review I think, as you modified the subsequent line ;)
> Please take a look.

It's okay, I noticed the conflict.  Assigning the return value of
gen_excp is still the right thing to do.

Paolo


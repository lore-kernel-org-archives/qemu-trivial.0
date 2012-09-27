Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1THL1z-00084t-9B
	for mharc-qemu-trivial@gnu.org; Thu, 27 Sep 2012 16:49:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1THL1u-0007pT-IA
	for qemu-trivial@nongnu.org; Thu, 27 Sep 2012 16:49:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1THL1t-0007Em-7k
	for qemu-trivial@nongnu.org; Thu, 27 Sep 2012 16:49:54 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:50870)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1THL1q-0007Cd-MC; Thu, 27 Sep 2012 16:49:50 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	4B697728003D; Thu, 27 Sep 2012 22:49:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id QjhgQrLUTNio; Thu, 27 Sep 2012 22:49:48 +0200 (CEST)
Received: from flocke.weilnetz.de (p54AD9EBA.dip.t-dialin.net [84.173.158.186])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	B2193728003C; Thu, 27 Sep 2012 22:49:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1THL1o-0001ck-BU; Thu, 27 Sep 2012 22:49:48 +0200
Message-ID: <5064BBEC.8000007@weilnetz.de>
Date: Thu, 27 Sep 2012 22:49:48 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20120724 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>
References: <1348772258-31168-1-git-send-email-sw@weilnetz.de>
	<5064A546.9080302@redhat.com>
In-Reply-To: <5064A546.9080302@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: Fix spelling in
 comment (enought -> enough, insure -> ensure)
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
X-List-Received-Date: Thu, 27 Sep 2012 20:49:57 -0000

Am 27.09.2012 21:13, schrieb Eric Blake:
> On 09/27/2012 12:57 PM, Stefan Weil wrote:
>> Signed-off-by: Stefan Weil<sw@weilnetz.de>
>> ---
>>
>> As a non native speaker, I feel that 'ensure' is better here than 'insure'.
>> Could a native speaker please confirm that?
>
> As a US speaker, I've seen both words used interchangeably.  I also
> checked dictionary.com, where both words imply a guarantee, but 'insure'
> has a connotation of a guarantee against loss (think insurance policy)
> while 'ensure' tends to be used in most other situations.  That is, I am
> in favor of this spelling change for connotation reasons.  But as Peter
> pointed out, the sentence has more problems than just a spelling choice.
>
>> - * For the error advice packets must first insure that the
>> - * packet is large enought to contain the returned ip header.
>> + * For the error advice packets must first ensure that the
>> + * packet is large enough to contain the returned ip header.
>>    * Only then can we do the check to see if 64 bits of packet
>>    * data have been returned, since we need to check the returned
>>    * ip header length.

Thanks for your and Peter's annotations.

It looks like these lines of comment are much older than QEMU.
I found code from 1995 which already contains them.

They are spread in BSD, Apple and Microsoft code,
so maybe we should add a comment which marks them
as a historic artefact which must be preserved :-)

I might also try to improve that sentence by adding 'we':

+ * For the error advice packets we must first ensure that the
+ * packet is large enough to contain the returned ip header.


or

+ * For the error advice packets we must first ensure that
+ * they are large enough to contain the returned ip header.

ICMP_ADVLENMIN seems to be the minimum length which meaningful
'error advice packets' must have.

Regards

Stefan



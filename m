Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VUj1P-0001uZ-5M
	for mharc-qemu-trivial@gnu.org; Fri, 11 Oct 2013 16:09:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VUj1I-0001mn-Hr
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 16:09:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VUj1D-0007Nf-Pk
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 16:09:08 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=43082
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VUj13-0007Kg-Oz; Fri, 11 Oct 2013 16:08:53 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	82B7B72819F6; Fri, 11 Oct 2013 22:08:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id OHEwZhDBqcEq; Fri, 11 Oct 2013 22:08:50 +0200 (CEST)
Received: from [192.168.178.35] (p54AD83DE.dip0.t-ipconnect.de
	[84.173.131.222])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	6EBF472809F3; Fri, 11 Oct 2013 22:08:49 +0200 (CEST)
Message-ID: <52585AD0.9090105@weilnetz.de>
Date: Fri, 11 Oct 2013 22:08:48 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Don Koch <dkoch@verizon.com>
References: <1381520073-32674-1-git-send-email-sw@weilnetz.de>
	<52585983.1000606@terremark.com>
In-Reply-To: <52585983.1000606@terremark.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] misc: Spelling and
	grammar fixes in comments
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
X-List-Received-Date: Fri, 11 Oct 2013 20:09:13 -0000

Am 11.10.2013 22:03, schrieb Don Koch:
> On 10/11/2013 03:34 PM, Stefan Weil wrote:
>> * it's -> its
>> * grammar fix in ui/vnc-enc-zywrle.h
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>
>> This is v3 of http://patchwork.ozlabs.org/patch/257416/.
>>
>> v3:
>> Don't try to improve a strange sentence in the same context ("Of cause [...]").
>>
>>  qapi-schema.json    |    2 +-
>>  slirp/if.c          |    2 +-
>>  ui/vnc-enc-zywrle.h |    2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/qapi-schema.json b/qapi-schema.json
>> index 60f3fd1..a003aa1 100644
>> --- a/qapi-schema.json
>> +++ b/qapi-schema.json
>> @@ -1914,7 +1914,7 @@
>>  #
>>  # Since: 0.14.0
>>  #
>> -# Notes: This command only exists as a stop-gap.  It's use is highly
>> +# Notes: This command only exists as a stop-gap.  Its use is highly
>>  #        discouraged.  The semantics of this command are not guaranteed.
>>  #
>>  #        Known limitations:
>> diff --git a/slirp/if.c b/slirp/if.c
>> index 87ca8a5..fb7acf8 100644
>> --- a/slirp/if.c
>> +++ b/slirp/if.c
>> @@ -142,7 +142,7 @@ diddit:
>>  
>>  /*
>>   * Send a packet
>> - * We choose a packet based on it's position in the output queues;
>> + * We choose a packet based on its position in the output queues;
>>   * If there are packets on the fastq, they are sent FIFO, before
>>   * everything else.  Otherwise we choose the first packet from the
>>   * batchq and send it.  the next packet chosen will be from the session
>> diff --git a/ui/vnc-enc-zywrle.h b/ui/vnc-enc-zywrle.h
>> index 1ff40b1..d436d58 100644
>> --- a/ui/vnc-enc-zywrle.h
>> +++ b/ui/vnc-enc-zywrle.h
>> @@ -305,7 +305,7 @@ static inline void harr(int8_t *px0, int8_t *px1)
>>     |L1H0H1H0|L1H0H1H0|L1H0H1H0|L1H0H1H0| : level 1
>>  
>>   In this method, H/L and X0/X1 is always same position.
>> - This lead us to more speed and less memory.
>> + This leads us to more speed and less memory.
>>   Of cause, the result of both method is quite same
>>   because it's only difference that coefficient position.
>>  */
>>
> Since you're in the neighborhood, this paragraph needs more fixes:
>
>  In this method, H/L and X0/X1 is always in the same position.

Shouldn't it be "are always"? :-)

>  This leads us to more speed and less memory.
>  Of course, the result of both methods is the same
>  because the only difference is the coefficient position.
>
> Thanks,
> -d

Maybe. Please let us fix that in a later patch.
See also the previous discussion
(http://patchwork.ozlabs.org/patch/257416/).

Regards,
Stefan



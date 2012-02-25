Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1ImV-00061m-Ef
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2012 09:39:27 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S1ImN-0005dE-5Q
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 09:39:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S1ImH-0005mz-8V
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 09:39:18 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:42734)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1S1Im5-0005mM-AW; Sat, 25 Feb 2012 09:39:01 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	E7989728009A; Sat, 25 Feb 2012 15:38:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id TDiXGTdla7uE; Sat, 25 Feb 2012 15:38:58 +0100 (CET)
Received: from [192.168.0.108] (188-192-104-186-dynip.superkabel.de
	[188.192.104.186])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	3DCEB7280099; Sat, 25 Feb 2012 15:38:58 +0100 (CET)
Message-ID: <4F48F281.901@weilnetz.de>
Date: Sat, 25 Feb 2012 15:38:57 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.27) Gecko/20120216 Thunderbird/3.1.19
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>
References: <1330178223-31717-1-git-send-email-sw@weilnetz.de>
	<4F48EDA3.2080700@redhat.com>
In-Reply-To: <4F48EDA3.2080700@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vnc: Add break statement
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
X-List-Received-Date: Sat, 25 Feb 2012 14:39:25 -0000

Am 25.02.2012 15:18, schrieb Eric Blake:
> On 02/25/2012 06:57 AM, Stefan Weil wrote:
>> This was not a bug, but it is not common practice to omit the break statement
>> from the last case statement before an empty default case.
>>
>> Any change of the default case would introduce a bug.
>>
>> This was reported as a warning by splint.
>>
>> Signed-off-by: Stefan Weil<sw@weilnetz.de>
>> ---
>>   ui/vnc-enc-hextile-template.h |    1 +
>>   1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/ui/vnc-enc-hextile-template.h b/ui/vnc-enc-hextile-template.h
>> index b9f9f5e..a7310e1 100644
>> --- a/ui/vnc-enc-hextile-template.h
>> +++ b/ui/vnc-enc-hextile-template.h
>> @@ -175,6 +175,7 @@ static void CONCAT(send_hextile_tile_, NAME)(VncState *vs,
>>   	    /* we really don't have to invalidate either the bg or fg
>>   	       but we've lost the old values.  oh well. */
>>   	}
>> +        break;
> TABs vs. space looks odd.  Does this file also need a whitespace cleanup?

2 times yes.

It's not the only file with tabs instead of spaces.


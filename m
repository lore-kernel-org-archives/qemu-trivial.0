Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1KCF-0005fk-BI
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2012 11:10:07 -0500
Received: from eggs.gnu.org ([208.118.235.92]:49010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S1KC7-0005KD-5q
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 11:10:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S1KC1-0001eg-7M
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 11:09:58 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:42691)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1S1KBp-0001co-3P; Sat, 25 Feb 2012 11:09:41 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	CECEC728009A; Sat, 25 Feb 2012 17:09:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 3EvZiZkPP1x2; Sat, 25 Feb 2012 17:09:39 +0100 (CET)
Received: from [192.168.0.108] (188-192-104-186-dynip.superkabel.de
	[188.192.104.186])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	1A8F37280099; Sat, 25 Feb 2012 17:09:39 +0100 (CET)
Message-ID: <4F4907C2.2080402@weilnetz.de>
Date: Sat, 25 Feb 2012 17:09:38 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.27) Gecko/20120216 Thunderbird/3.1.19
MIME-Version: 1.0
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
References: <1330178223-31717-1-git-send-email-sw@weilnetz.de>
	<4F4904EA.5050002@suse.de>
In-Reply-To: <4F4904EA.5050002@suse.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Sat, 25 Feb 2012 16:10:05 -0000

Am 25.02.2012 16:57, schrieb Andreas F=E4rber:
> Am 25.02.2012 14:57, schrieb Stefan Weil:
>> This was not a bug, but it is not common practice to omit the break=20
>> statement
>> from the last case statement before an empty default case.
>>
>> Any change of the default case would introduce a bug.
>>
>> This was reported as a warning by splint.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>> ui/vnc-enc-hextile-template.h | 1 +
>> 1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/ui/vnc-enc-hextile-template.h=20
>> b/ui/vnc-enc-hextile-template.h
>> index b9f9f5e..a7310e1 100644
>> --- a/ui/vnc-enc-hextile-template.h
>> +++ b/ui/vnc-enc-hextile-template.h
>> @@ -175,6 +175,7 @@ static void CONCAT(send_hextile_tile_,=20
>> NAME)(VncState *vs,
>> /* we really don't have to invalidate either the bg or fg
>> but we've lost the old values. oh well. */
>> }
>> + break;
>> default:
>
> Doesn't that require a fallthrough comment for other tools then?
>
> Andreas

It was a fall through (so a comment would have satisfied static code
analyzers), but with the added 'break' it no longer is.

As I tried to explain in the commit message, a fall through would
not be reasonable in this special case.

Cheers, Stefan



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RZJQX-0007ss-8a
	for mharc-qemu-trivial@gnu.org; Sat, 10 Dec 2011 04:41:05 -0500
Received: from eggs.gnu.org ([140.186.70.92]:47248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RZJQU-0007hr-9n
	for qemu-trivial@nongnu.org; Sat, 10 Dec 2011 04:41:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RZJQT-00031i-6m
	for qemu-trivial@nongnu.org; Sat, 10 Dec 2011 04:41:02 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:36365)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1RZJQR-000318-2m; Sat, 10 Dec 2011 04:40:59 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	81CE0728188B; Sat, 10 Dec 2011 10:40:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id NfzdeJRUgHmU; Sat, 10 Dec 2011 10:40:05 +0100 (CET)
Received: from [192.168.178.20] (p5086E0E3.dip.t-dialin.net [80.134.224.227])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	3E1A9728188A; Sat, 10 Dec 2011 10:40:05 +0100 (CET)
Message-ID: <4EE328EA.6030308@weilnetz.de>
Date: Sat, 10 Dec 2011 10:39:54 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
References: <1323472786-26821-1-git-send-email-sw@weilnetz.de>	<1323472786-26821-2-git-send-email-sw@weilnetz.de>
	<4EE2ACB3.1000704@suse.de>
In-Reply-To: <4EE2ACB3.1000704@suse.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/6] Add spelling exceptions
	for codespell
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
X-List-Received-Date: Sat, 10 Dec 2011 09:41:03 -0000

Am 10.12.2011 01:49, schrieb Andreas F=E4rber:
> Am 10.12.2011 00:19, schrieb Stefan Weil:
>> This file can be used with codespell to suppress wrong
>> misspelling reports.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>> scripts/codespell.exclude | 215=20
>> +++++++++++++++++++++++++++++++++++++++++++++
>> 1 files changed, 215 insertions(+), 0 deletions(-)
>> create mode 100644 scripts/codespell.exclude
>>
>> diff --git a/scripts/codespell.exclude b/scripts/codespell.exclude
>> new file mode 100644
>> index 0000000..d69c946
>> --- /dev/null
>> +++ b/scripts/codespell.exclude
>> @@ -0,0 +1,215 @@
>> + .rela.bss : { *(.rela.bss) }
>> + .rela.bss : { *(.rela.bss) }
> [...]
>
> I don't like this.
>
> Instead I suggest to keep a word list (that isn't whitespace-sensitive)
> and to generate the .exclude file via shell script (grep -r) on the fly=
.
>
> Andreas

grep -w. The solution which you suggest would need a list of filenames
and words because those words are only accepted in the given files.

The resulting exception list would also suppress real misspellings
of the given words in the given files which is not what we want.
If this seems acceptable, the exception list can be created using
a small shell script.

I don't say that an exception list is a nice solution (I also don't like=20
it),
but that's the way codespell works with the Linux kernel code, too.

Yes, the list is whitespace sensitive, but even if whitespace of the=20
affected
lines is changed, that's not a big problem. You will get some false
misspelling reports and either ignore them or update the exception list.

We could also change the code to reduce the need for spelling exceptions.
Renaming the variable aSign (which is reported as misspelling of assign)
would reduce the exception list a lot.

Regards,
Stefan



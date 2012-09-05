Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9Isz-0000Jl-8t
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 12:55:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T9Isr-0008OZ-L2
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 12:55:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T9Isl-000533-T5
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 12:55:21 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:48634)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T9Isg-0004tR-9u; Wed, 05 Sep 2012 12:55:10 -0400
Received: by lbbgm13 with SMTP id gm13so486280lbb.4
	for <multiple recipients>; Wed, 05 Sep 2012 09:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=tjKglbrwnnE0xUKHgFzl72hmJUlcuQtW6iQdlcbNJ58=;
	b=PO4SmmBqNfwG6nJEZFKE/2xx5N1kmUYfF4ngiQXNdntpTzRBBtqWUlZgtJgReu923o
	W/AiOLPWJVMgTPXSckuEJ5oCe6LYjoQseCPXkYcUgYNjMQIKYvr45rXpYBWbuOx7Wwqq
	lH/LXu30zPWRNZEM0lyHDxnrjnI07VKm/TmcJ30+G7c31WFGnlEcx3UT9JdwkVab+Gqi
	Inob4Tqyf5vXQQcTufiN/MZpegykD5c7ecWsQixkK32tS1DoXRGhJpSPMmGL939mV/Xk
	M3tN4E3M4VmNoyYA9bMi7b+guXKJNwC74eRTqpfvOmbYpjrhdk/O39GuYs+wrWGhRZIp
	7CMw==
MIME-Version: 1.0
Received: by 10.152.132.133 with SMTP id ou5mr20811637lab.45.1346864107717;
	Wed, 05 Sep 2012 09:55:07 -0700 (PDT)
Received: by 10.112.99.129 with HTTP; Wed, 5 Sep 2012 09:55:07 -0700 (PDT)
In-Reply-To: <504774FF.6000501@suse.de>
References: <1346703803-22003-1-git-send-email-sw@weilnetz.de>
	<504774FF.6000501@suse.de>
Date: Wed, 5 Sep 2012 17:55:07 +0100
Message-ID: <CAJSP0QXtri4UNmdriCFiTg4_m+-a0CBpG36FYFdXQ1XcJywNww@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sparc-dis: Remove redundant
	NULL check
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
X-List-Received-Date: Wed, 05 Sep 2012 16:55:27 -0000

On Wed, Sep 5, 2012 at 4:51 PM, Andreas F=E4rber <afaerber@suse.de> wrote:
> Am 03.09.2012 22:23, schrieb Stefan Weil:
>> Report from smatch:
>> sparc-dis.c:2664 build_hash_table(14) info:
>>  redundant null check on hash_buf calling free()
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>
>> Coding style was not fixed.
>>
>> - sw
>>
>>  sparc-dis.c |    3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/sparc-dis.c b/sparc-dis.c
>> index cdd337a..ef28835 100644
>> --- a/sparc-dis.c
>> +++ b/sparc-dis.c
>> @@ -2660,8 +2660,7 @@ build_hash_table (const sparc_opcode **opcode_tabl=
e,
>>
>>    memset (hash_table, 0, HASH_SIZE * sizeof (hash_table[0]));
>>    memset (hash_count, 0, HASH_SIZE * sizeof (hash_count[0]));
>> -  if (hash_buf !=3D NULL)
>> -    free (hash_buf);
>> +  free (hash_buf);
>>    hash_buf =3D malloc (sizeof (* hash_buf) * num_opcodes);
>>    for (i =3D num_opcodes - 1; i >=3D 0; --i)
>>      {
>
> *-dis sounds like binutils - did upstream drop the if, too?
> If not, then diverging for a non-issue does not seem necessary.

Ah, good point.  I don't think we should apply this patch :P.

Dropping the patch from qemu-trivial until this discussion finishes.

Stefan


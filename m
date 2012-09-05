Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9JCe-0004dj-Uf
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 13:15:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1T9JCd-0004bx-EA
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 13:15:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1T9JCc-0003TJ-9f
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 13:15:47 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:38677)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1T9JCZ-0003S7-FA; Wed, 05 Sep 2012 13:15:43 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	193CA728002B; Wed,  5 Sep 2012 19:15:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id VPHI5NCGhkyb; Wed,  5 Sep 2012 19:15:40 +0200 (CEST)
Received: from flocke.weilnetz.de (p5086FA69.dip.t-dialin.net [80.134.250.105])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	191CD7280029; Wed,  5 Sep 2012 19:15:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1T9JCV-0001SW-B1; Wed, 05 Sep 2012 19:15:39 +0200
Message-ID: <504788BB.7030609@weilnetz.de>
Date: Wed, 05 Sep 2012 19:15:39 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20120724 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1346703803-22003-1-git-send-email-sw@weilnetz.de>	<504774FF.6000501@suse.de>
	<CAJSP0QXtri4UNmdriCFiTg4_m+-a0CBpG36FYFdXQ1XcJywNww@mail.gmail.com>
In-Reply-To: <CAJSP0QXtri4UNmdriCFiTg4_m+-a0CBpG36FYFdXQ1XcJywNww@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>, qemu-devel@nongnu.org
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
X-List-Received-Date: Wed, 05 Sep 2012 17:15:48 -0000

Am 05.09.2012 18:55, schrieb Stefan Hajnoczi:
> On Wed, Sep 5, 2012 at 4:51 PM, Andreas F=E4rber<afaerber@suse.de>  wro=
te:
>> Am 03.09.2012 22:23, schrieb Stefan Weil:
>>> Report from smatch:
>>> sparc-dis.c:2664 build_hash_table(14) info:
>>>   redundant null check on hash_buf calling free()
>>>
>>> Signed-off-by: Stefan Weil<sw@weilnetz.de>
>>> ---
>>>
>>> Coding style was not fixed.
>>>
>>> - sw
>>>
>>>   sparc-dis.c |    3 +--
>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/sparc-dis.c b/sparc-dis.c
>>> index cdd337a..ef28835 100644
>>> --- a/sparc-dis.c
>>> +++ b/sparc-dis.c
>>> @@ -2660,8 +2660,7 @@ build_hash_table (const sparc_opcode **opcode_t=
able,
>>>
>>>     memset (hash_table, 0, HASH_SIZE * sizeof (hash_table[0]));
>>>     memset (hash_count, 0, HASH_SIZE * sizeof (hash_count[0]));
>>> -  if (hash_buf !=3D NULL)
>>> -    free (hash_buf);
>>> +  free (hash_buf);
>>>     hash_buf =3D malloc (sizeof (* hash_buf) * num_opcodes);
>>>     for (i =3D num_opcodes - 1; i>=3D 0; --i)
>>>       {
>>
>> *-dis sounds like binutils - did upstream drop the if, too?
>> If not, then diverging for a non-issue does not seem necessary.
>
> Ah, good point.  I don't think we should apply this patch :P.
>
> Dropping the patch from qemu-trivial until this discussion finishes.
>
> Stefan

AFAIK, binutils moved to GPL 3. Therefore I don't expect that
QEMU will update to upstream in the next years.

We'll have to maintain the code which we have.

Try "git log *-dis.c" or "gitk *-dis.c": there are already lots
of more trivial changes which got applied to the disassembler files.

=3D> The patch should be applied.

Regards,
Stefan



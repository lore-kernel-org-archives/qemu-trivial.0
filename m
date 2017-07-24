Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZiuS-0005wa-VX
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 15:20:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dZiuQ-0005v2-C4
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 15:20:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dZiuN-0006vY-6m
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 15:20:50 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:59111)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1dZiuM-0006v1-Sg; Mon, 24 Jul 2017 15:20:47 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue104 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0Md4Bm-1dHVZ30Uqo-00IGtB; Mon, 24 Jul 2017 21:20:35 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-24-f4bug@amsat.org>
	<4de3bb09-6894-ee92-eb49-0f64efe1bad8@vivier.eu>
	<0a7a2681-4702-5334-aaa8-e477aaa5c98a@twiddle.net>
	<6c893f10-2772-8a2e-b247-388222589c83@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <7b6e6fcf-8870-cbc0-216d-fc9eeafc3346@vivier.eu>
Date: Mon, 24 Jul 2017 21:20:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <6c893f10-2772-8a2e-b247-388222589c83@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:27xotgXITi776W/Lx2FzVs4UgDxDIo60zgvoPMfMn2pEX68Vt4q
	WEgs6fby71wPcG29HvJoYJhavsN+G43dTbIfG1PUEtfYSjGUQvZy8m975IG3wVTIlJqTH+J
	g1LK/fLha87PvAN8ojcgPzoCQQ2laDvjZLoU/1yCubKuQ8Wlb7+gbLtZpY0NMYLxzvd+LA1
	lmfHiKZEsLKc2R2tWZrJw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:wYyCi3gL34k=:oJMSMiXk4qSKd9GwKPkGbS
	t7yC6yE+tJvHk7d3V4x9JXZm7q/YtP8KExb1PmFuSBk7pmuYoo2q638kP/5Tf+9nfjQhlYFT+
	v3Qg2kgiVXzT8x7q9cD5hvR9pbRMISjY5WwbkYlsvmjFcfl9sbPMHWKLYOBW5L2bk/mPC7k9c
	0HhnxQTrk5KDr/TbKaHab2Nw9CGiHZ0pAyQnAR9BdU3v0QMdOw4h6lcK2orkS4XRHhvM1gxhE
	TbxKSNUl4LMafjFIykrPRenlA3R1fvdw7jNZjUHRGyeTdmGpSbO1HSKIfsdpAxjHdzqu+lJlQ
	1zgLE3sj5ZTZvIIbj9oZYaZoGDuLgkjWUioG31oYDKkRNJFj0K9qogRtW7TC8/eiKiEptEORn
	6IUt2uksUJfSr+4KhnvJviR0AR5r/Axkkgo9wkWJWXDJMFyNFmV0AuyPtha1GQAwkXGOlL4jo
	zEQ7SMRtS3WG7s+3LQ2R9evuT9692rcKQsjkWuHG9/cmVr/3SHGWkRt0iZHs92vJg0UHMjvzI
	YNHqz1KxLwCf3f86JuD6GjYx0nM5NIQQxxNNw5+XFp2fcZxnDYlYrHLP3ENt/SOqTcQ9HOPgm
	8mmbA4Dk8PMPiUTywpCz8NUT5sUl80NlQWhIm6XRyYZS36Z3mDBphpfOz+RBU8tjYM106+KRG
	B+tHldpSQlpKD6rcD3rLY7xS2MXIhT1k776xHGy4JO5+zwpI9ZLqPfxUqVqosDhCPXlVYbrpT
	Bkb2RED0c8c2UCqFZdESciz4WSiHDGmzx7S5huZA3Fp9xpX5DWG7hkms9Gk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.13
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.10 23/35]
 m68k/translate: fix incorrect copy/paste
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Jul 2017 19:20:51 -0000

Le 24/07/2017 à 21:19, Philippe Mathieu-Daudé a écrit :
> On 07/24/2017 04:01 PM, Richard Henderson wrote:
>> On 07/24/2017 11:54 AM, Laurent Vivier wrote:
>>> Le 24/07/2017 à 20:27, Philippe Mathieu-Daudé a écrit :
>>>> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
>>>> index ada2a91b64..1a2f421aab 100644
>>>> --- a/target/m68k/translate.c
>>>> +++ b/target/m68k/translate.c
>>>> @@ -1321,7 +1321,8 @@ static void gen_cc_cond(DisasCompare *c,
>>>> DisasContext *s, int cond)
>>>>       case 5: /* CS (C) */
>>>>           /* Some cases fold C into X.  */
>>>>           if (op == CC_OP_ADDB || op == CC_OP_ADDW || op ==
>>>> CC_OP_ADDL ||
>>>> -            op == CC_OP_ADDB || op == CC_OP_ADDW || op ==
>>>> CC_OP_ADDL) {
>>>> +            op == CC_OP_SUBB || op == CC_OP_SUBW || op ==
>>>> CC_OP_SUBL ||
>>>> +            op == CC_OP_LOGIC) {
>>>
>>> According to commit (db3d7945) introducing the incorrect copy/paste, I
>>> don't think we need the CC_OP_LOGIC here. Logic operations never
>>> generates X flags (whereas they can generate Z and and N).
>>
>> Indeed, look at the comment below.  LOGIC is supposed to fall through
>> to the code that produces TCG_COND_NEVER.
> 
> Indeed I also miss-copypasted :)
> 
> So the correct fix would be:?
> 
>          if (op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL ||
> -            op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL) {
> +            op == CC_OP_SUBB || op == CC_OP_SUBW || op == CC_OP_SUBL) {

yes

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Laurent


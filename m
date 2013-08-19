Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VBRyU-0005HA-5W
	for mharc-qemu-trivial@gnu.org; Mon, 19 Aug 2013 12:06:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1VBRyO-00057U-E4
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 12:06:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1VBRyI-0000J2-Mn
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 12:06:28 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:42942
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1VBRy9-0000Gh-0K; Mon, 19 Aug 2013 12:06:13 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 2813E265C31B;
	Mon, 19 Aug 2013 18:05:42 +0200 (CEST)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WiKfLg81yORC; Mon, 19 Aug 2013 18:05:42 +0200 (CEST)
Received: from [10.10.1.88] (pompomgalli.act-europe.fr [10.10.1.88])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id BEB20265C315;
	Mon, 19 Aug 2013 18:05:41 +0200 (CEST)
Message-ID: <52124255.6090603@adacore.com>
Date: Mon, 19 Aug 2013 18:05:41 +0200
From: Fabien Chouteau <chouteau@adacore.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
References: <1375447708-14545-1-git-send-email-chouteau@adacore.com>
	<52122832.9000501@suse.de>
In-Reply-To: <52122832.9000501@suse.de>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] Improve Monitor disas
	with symbol lookup
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
X-List-Received-Date: Mon, 19 Aug 2013 16:06:33 -0000

On 08/19/2013 04:14 PM, Andreas F=E4rber wrote:
> Am 02.08.2013 14:48, schrieb Fabien Chouteau:
>> Part of M731-018.
>>
>> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
>> ---
>>  disas.c |   16 ++++++++++++----
>>  1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/disas.c b/disas.c
>> index 71007fb..3ffb3ae 100644
>> --- a/disas.c
>> +++ b/disas.c
>> @@ -480,11 +480,19 @@ void monitor_disas(Monitor *mon, CPUArchState *e=
nv,
>>  #endif
>> =20
>>      for(i =3D 0; i < nb_insn; i++) {
>> -	monitor_printf(mon, "0x" TARGET_FMT_lx ":  ", pc);
>> +        const char *sym =3D lookup_symbol(pc);
>> +
>> +        monitor_printf(mon, "0x" TARGET_FMT_lx " ", pc);
>> +        if (sym[0] !=3D '\0') {
>> +            monitor_printf(mon, "<%s>:  ", sym);
>> +        } else {
>> +            monitor_printf(mon, ":  ");
>> +        }
>=20
> Independent of PMM's comment, I think you meant
>=20
> +        monitor_printf(mon, "0x" TARGET_FMT_lx, pc);
> +        if (sym[0] !=3D '\0') {
> +            monitor_printf(mon, " <%s>:  ", sym);
> +        } else {
> +            monitor_printf(mon, ":  ");
> +        }
>=20
> to keep the output unchanged.
>=20
> Could you please put the tab fixing into a preceding patch for
> readability and prepend a cover letter?


OK, will do.

--=20
Fabien Chouteau


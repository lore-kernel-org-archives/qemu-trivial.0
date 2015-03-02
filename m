Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YSOUf-0007er-SR
	for mharc-qemu-trivial@gnu.org; Mon, 02 Mar 2015 06:26:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YSOUZ-0007Ta-Kt
	for qemu-trivial@nongnu.org; Mon, 02 Mar 2015 06:26:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YSOUY-0006UO-Lx
	for qemu-trivial@nongnu.org; Mon, 02 Mar 2015 06:26:31 -0500
Received: from mail-r83.rz.uni-mannheim.de ([134.155.96.83]:43580)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1YSOUU-0006Sz-Dg; Mon, 02 Mar 2015 06:26:26 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail-r83.rz.uni-mannheim.de (Postfix) with ESMTP id A0BA2102C00;
	Mon,  2 Mar 2015 12:26:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from mail-r83.rz.uni-mannheim.de ([134.155.96.83])
	by localhost (smtp.mail.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bR1gw6oYSjDU; Mon,  2 Mar 2015 12:26:24 +0100 (CET)
Received: from [134.155.36.73] (edv13.bib.uni-mannheim.de [134.155.36.73])
	by mail-r83.rz.uni-mannheim.de (Postfix) with ESMTPSA id 19A46102B31;
	Mon,  2 Mar 2015 12:26:23 +0100 (CET)
Message-ID: <54F448E3.3070401@weilnetz.de>
Date: Mon, 02 Mar 2015 12:26:27 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1425215915-26043-1-git-send-email-sw@weilnetz.de>
	<54F443AE.2000708@msgid.tls.msk.ru>
In-Reply-To: <54F443AE.2000708@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 134.155.96.83
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] disas/microblaze: Fix warnings caused by
 missing 'static' attribute
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
X-List-Received-Date: Mon, 02 Mar 2015 11:26:36 -0000

Am 02.03.2015 um 12:04 schrieb Michael Tokarev:
> 01.03.2015 16:18, Stefan Weil wrote:
>> Warnings from the Sparse static analysis tool:
> [...]
>> @@ -738,7 +737,9 @@ get_field_special (long instr, struct op_code_struct * op)
>>     default :
>>       {
>>         if ( ((((instr & IMM_MASK) >> IMM_LOW) ^ op->immval_mask) & 0xE000) == REG_PVR_MASK) {
>> -	 sprintf(tmpstr, "%spvr%d", register_prefix, (unsigned short)(((instr & IMM_MASK) >> IMM_LOW) ^ op->immval_mask) ^ REG_PVR_MASK);
>> +	  sprintf(tmpstr, "%s%u", pvr_register_prefix,
>> +                 (unsigned short)(((instr & IMM_MASK) >> IMM_LOW) ^
>> +                                  op->immval_mask) ^ REG_PVR_MASK);
> Is this word wrapping intentionally put into this patch or
> was it supposed to be a separate patch?
>
> Thanks,
>
> /mjt

It's part of the fix ("%spvr%d", register_prefix was replaced by "%s%u",
pvr_register_prefix).

The wrapping was needed to satisfy codecheck.pl.

Stefan



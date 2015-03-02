Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YSO9S-0005HE-8m
	for mharc-qemu-trivial@gnu.org; Mon, 02 Mar 2015 06:04:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YSO9L-00050r-8H
	for qemu-trivial@nongnu.org; Mon, 02 Mar 2015 06:04:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YSO9F-0008A4-23
	for qemu-trivial@nongnu.org; Mon, 02 Mar 2015 06:04:35 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49138)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YSO99-00088P-5m; Mon, 02 Mar 2015 06:04:23 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 07B4B40268;
	Mon,  2 Mar 2015 14:04:15 +0300 (MSK)
Message-ID: <54F443AE.2000708@msgid.tls.msk.ru>
Date: Mon, 02 Mar 2015 14:04:14 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1425215915-26043-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1425215915-26043-1-git-send-email-sw@weilnetz.de>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
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
X-List-Received-Date: Mon, 02 Mar 2015 11:04:39 -0000

01.03.2015 16:18, Stefan Weil wrote:
> Warnings from the Sparse static analysis tool:
[...]
> @@ -738,7 +737,9 @@ get_field_special (long instr, struct op_code_struct * op)
>     default :
>       {
>         if ( ((((instr & IMM_MASK) >> IMM_LOW) ^ op->immval_mask) & 0xE000) == REG_PVR_MASK) {
> -	 sprintf(tmpstr, "%spvr%d", register_prefix, (unsigned short)(((instr & IMM_MASK) >> IMM_LOW) ^ op->immval_mask) ^ REG_PVR_MASK);
> +	  sprintf(tmpstr, "%s%u", pvr_register_prefix,
> +                 (unsigned short)(((instr & IMM_MASK) >> IMM_LOW) ^
> +                                  op->immval_mask) ^ REG_PVR_MASK);

Is this word wrapping intentionally put into this patch or
was it supposed to be a separate patch?

Thanks,

/mjt


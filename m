Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W1N9Q-00067n-DC
	for mharc-qemu-trivial@gnu.org; Thu, 09 Jan 2014 16:28:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <0intro@gmail.com>) id 1W1N9O-00067g-9D
	for qemu-trivial@nongnu.org; Thu, 09 Jan 2014 16:28:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <0intro@gmail.com>) id 1W1N9N-0004Uw-GH
	for qemu-trivial@nongnu.org; Thu, 09 Jan 2014 16:28:26 -0500
Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235]:54388)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <0intro@gmail.com>) id 1W1N9N-0004Uq-91
	for qemu-trivial@nongnu.org; Thu, 09 Jan 2014 16:28:25 -0500
Received: by mail-wi0-f181.google.com with SMTP id hq4so4064570wib.2
	for <qemu-trivial@nongnu.org>; Thu, 09 Jan 2014 13:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=u4X50cNoszVPc/Pnoyv97u7AMKPfMUpakU2O6uY93es=;
	b=UzRSplR/olvQM1w+qQH8C8MbxOB1b6svJB4JgHfuDQZUEcthUbrabdvqKJ6YFvGIhZ
	B6k+TzmZN3EuCPfzNeVMBMWVOwgAIhXVbHbuGWhq+6+3LCbIvXCZSNfShz26W/6qG6sC
	/baBCw/Mf1Ll3mRhjkXp5hY+lonoFy+OchHSet770BJe92MXK81zFvvx27i9C5NYmd8Q
	8wnaiBMvTmcKDK0Si3zEI1l2DDh9c0ejc4JcTbdC2oot8uE/LtDDAaoSB8cPzP+IMhhC
	V2SuQ9EeH8ZzGW+falkffPQRx279n7s8lhq66W5BG3rlssU1b1ZLodFifQmP2UeHv/Ok
	o4RQ==
X-Received: by 10.180.12.115 with SMTP id x19mr28406714wib.49.1389302903642;
	Thu, 09 Jan 2014 13:28:23 -0800 (PST)
Received: from zinc.9fans.fr ([2001:470:cce3:200:a288:b4ff:fe18:d06c])
	by mx.google.com with ESMTPSA id z2sm9558957wiy.11.2014.01.09.13.28.22
	for <qemu-trivial@nongnu.org>
	(version=SSLv3 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Jan 2014 13:28:23 -0800 (PST)
Date: Thu, 9 Jan 2014 22:28:19 +0100
From: David du Colombier <0intro@gmail.com>
To: qemu-trivial@nongnu.org
Message-ID: <20140109222819.7bcf055a@zinc.9fans.fr>
In-Reply-To: <1387981063-14880-1-git-send-email-0intro@gmail.com>
References: <1387981063-14880-1-git-send-email-0intro@gmail.com>
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::235
Subject: Re: [Qemu-trivial] [PATCH] ide: cmd_exec_dev_diagnostic() always
 set error register to 0x01
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
X-List-Received-Date: Thu, 09 Jan 2014 21:28:27 -0000

> This notably fix IDE CD probing on the Plan 9 operating system,
> which rely on the error register set by the Execute Device
> Diagnostic command to detect drive configurations.
>=20
> Thanks to R=C3=A9mi Pommarel for reporting this issue.
>=20
> Signed-off-by: David du Colombier <0intro@gmail.com>
> ---
>  hw/ide/core.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index e1f4c33..7783d58 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -1321,6 +1321,7 @@ static bool cmd_exec_dev_diagnostic(IDEState
> *s, uint8_t cmd) s->status =3D 0; /* ATAPI spec (v6) section 9.10
> defines packet
>                          * devices to return a clear status register
>                          * with READY_STAT *not* set. */
> +        s->error =3D 0x01;
>      } else {
>          s->status =3D READY_STAT | SEEK_STAT;
>          /* The bits of the error register are not as usual for this
> command!

Ping.

--=20
David du Colombier


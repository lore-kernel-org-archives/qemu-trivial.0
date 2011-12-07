Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RYGNC-0007MR-SK
	for mharc-qemu-trivial@gnu.org; Wed, 07 Dec 2011 07:13:18 -0500
Received: from eggs.gnu.org ([140.186.70.92]:32930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zwu.kernel@gmail.com>) id 1RYGN5-0006wg-2O
	for qemu-trivial@nongnu.org; Wed, 07 Dec 2011 07:13:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zwu.kernel@gmail.com>) id 1RYGN4-0005ni-85
	for qemu-trivial@nongnu.org; Wed, 07 Dec 2011 07:13:11 -0500
Received: from mail-vx0-f173.google.com ([209.85.220.173]:46626)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zwu.kernel@gmail.com>)
	id 1RYGN2-0005n4-3t; Wed, 07 Dec 2011 07:13:08 -0500
Received: by vcbfl11 with SMTP id fl11so349434vcb.4
	for <multiple recipients>; Wed, 07 Dec 2011 04:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=OEJ+XbDlEx3KtsGojA3nOsHyb/Jwzdnc+9Wfje5oa3w=;
	b=xB0OBGpmydjXfkwPMsrDxLIZL5W7GrHXI++e21rlTcl+2siHnJ/wME0JJQfStKchow
	z/Mw5RDPYOWv/gLyZYdAykwXduiYjOguVwKs6BFFW50ACBRrmWJDunigF1o26KYzxKyn
	UcBNCRs0VgNE/q3D2qB7H5FS1fn4Ae4hMGt8g=
MIME-Version: 1.0
Received: by 10.220.230.6 with SMTP id jk6mr2112982vcb.117.1323259986786; Wed,
	07 Dec 2011 04:13:06 -0800 (PST)
Received: by 10.220.175.202 with HTTP; Wed, 7 Dec 2011 04:13:06 -0800 (PST)
In-Reply-To: <1322905525-354-1-git-send-email-sw@weilnetz.de>
References: <1322905525-354-1-git-send-email-sw@weilnetz.de>
Date: Wed, 7 Dec 2011 20:13:06 +0800
Message-ID: <CAEH94LgMfEgcqMh5ObAS1vpyVCkSTYz=a58tc0P7qGqwdddvqA@mail.gmail.com>
From: Zhi Yong Wu <zwu.kernel@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.220.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Convert keymap file to
	UTF-8 encoding
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
X-List-Received-Date: Wed, 07 Dec 2011 12:13:16 -0000

On Sat, Dec 3, 2011 at 5:45 PM, Stefan Weil <sw@weilnetz.de> wrote:
> Most QEMU files either are pure ASCII or use UTF-8.
> Convert this keymap file which still used ISO-8859-1 to UTF-8.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> =A0pc-bios/keymaps/is | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/pc-bios/keymaps/is b/pc-bios/keymaps/is
> index 21dc1fd..935ac1d 100644
> --- a/pc-bios/keymaps/is
> +++ b/pc-bios/keymaps/is
> @@ -1,4 +1,4 @@
> -# 2004-03-16 Halld=F3r Gu=F0mundsson and Morten Lange
Can you let me know how you see that it is ISO-8859-1 coding, not
UTF-8? They look same to me.
> +# 2004-03-16 Halld=F3r Gu=F0mundsson and Morten Lange
> =A0# Keyboard definition file for the Icelandic keyboard
> =A0# to be used in rdesktop 1.3.x ( See rdesktop.org)
> =A0# generated from XKB map de, and changed manually
> --
> 1.7.0.4
>
>



--=20
Regards,

Zhi Yong Wu


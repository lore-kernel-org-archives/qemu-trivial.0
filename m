Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U8zF3-0004IB-2Z
	for mharc-qemu-trivial@gnu.org; Fri, 22 Feb 2013 15:29:13 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1U8zEu-0003rh-Gd
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 15:29:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1U8zEo-0001JL-IS
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 15:29:04 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:48279)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1U8zEb-0001GF-I8; Fri, 22 Feb 2013 15:28:45 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	846F57280047; Fri, 22 Feb 2013 21:28:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id HkI4-FchSDvT; Fri, 22 Feb 2013 21:28:38 +0100 (CET)
Received: from [192.168.178.35] (p54AD9A8B.dip.t-dialin.net [84.173.154.139])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	8A071728004A; Fri, 22 Feb 2013 21:28:38 +0100 (CET)
Message-ID: <5127D4F5.5000002@weilnetz.de>
Date: Fri, 22 Feb 2013 21:28:37 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <5127CF6D.2060104@siemens.com>
In-Reply-To: <5127CF6D.2060104@siemens.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH][RESENT] configure: Create
 link to icon bitmap for out-of-tree builds
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
X-List-Received-Date: Fri, 22 Feb 2013 20:29:11 -0000

Am 22.02.2013 21:05, schrieb Jan Kiszka:
> This allows to pick up the icon when starting QEMU directly from an
> out-of-tree build directory.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  configure |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/configure b/configure
> index 0eb25dd..265d8f7 100755
> --- a/configure
> +++ b/configure
> @@ -4342,6 +4342,7 @@ FILES="$FILES tests/tcg/lm32/Makefile po/Makefile"
>  FILES="$FILES pc-bios/optionrom/Makefile pc-bios/keymaps"
>  FILES="$FILES pc-bios/spapr-rtas/Makefile"
>  FILES="$FILES roms/seabios/Makefile roms/vgabios/Makefile"
> +FILES="$FILES pc-bios/qemu-icon.bmp"
>  for bios_file in \
>      $source_path/pc-bios/*.bin \
>      $source_path/pc-bios/*.aml \

I have a similar patch in my tree since two years (don't know
why I never sent it). The only difference is the order (I prefer
alphabetic order for such lines). If you decide to reorder,
you may add my Reviewed-by as well.

Reviewed-by: Stefan Weil <sw@weilnetz.de>



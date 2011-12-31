Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rgx0J-00050g-Tr
	for mharc-qemu-trivial@gnu.org; Sat, 31 Dec 2011 06:21:35 -0500
Received: from eggs.gnu.org ([140.186.70.92]:51327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Rgx0G-0004p1-LY
	for qemu-trivial@nongnu.org; Sat, 31 Dec 2011 06:21:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Rgx0F-0005nR-NF
	for qemu-trivial@nongnu.org; Sat, 31 Dec 2011 06:21:32 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:42328)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Rgx0D-0005n4-Ll; Sat, 31 Dec 2011 06:21:29 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	969E0728CD6F; Sat, 31 Dec 2011 12:21:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id IIicNITK3QkC; Sat, 31 Dec 2011 12:20:58 +0100 (CET)
Received: from [192.168.178.20] (p5086ED51.dip.t-dialin.net [80.134.237.81])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	E32697282E58; Sat, 31 Dec 2011 12:20:57 +0100 (CET)
Message-ID: <4EFEF00F.1070306@weilnetz.de>
Date: Sat, 31 Dec 2011 12:20:47 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.24) Gecko/20111108 Thunderbird/3.1.16
MIME-Version: 1.0
To: Sebastian Herbszt <herbszt@gmx.de>
References: <5DE30B86318741F8B2D56EA407C5A8DB@FSCPC>	<4EFE4483.1010707@weilnetz.de>
	<1325289569$267@local>	<CAFEAcA9f4Bb=UOs3+=S=aZxaUN+Pb1MUROhSZCF+Sm1uTuyStw@mail.gmail.com>
	<1325330087$3142@local>
In-Reply-To: <1325330087$3142@local>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH V2] Make python mandatory
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
X-List-Received-Date: Sat, 31 Dec 2011 11:21:33 -0000

Am 31.12.2011 12:14, schrieb Sebastian Herbszt:
> Make python mandatory.
>
> Signed-off-by: Sebastian Herbszt <herbszt@gmx.de>
> ---
> configure | 10 +++-------
> 1 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/configure b/configure
> index 640e815..a54439d 100755
> --- a/configure
> +++ b/configure
> @@ -1185,13 +1185,9 @@ if test "$solaris" = "yes" ; then
> fi
> fi
>
> -if test "$guest_agent" != "no" ; then
> - if has $python; then
> - :
> - else
> - echo "Python not found. Use --python=/path/to/python"
> - exit 1
> - fi
> +if ! has $python; then
> + echo "Python not found. Use --python=/path/to/python"
> + exit 1
> fi
>
> if test -z "$target_list" ; then

Reviewed-by: Stefan Weil <sw@weilnetz.de>

Maybe this patch can be applied via qemu-trivial.

Regards,

Stefan Weil



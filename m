Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XwPwo-0003X0-4B
	for mharc-qemu-trivial@gnu.org; Thu, 04 Dec 2014 01:31:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1XwPwg-0003ND-Bc
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 01:31:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1XwPwa-00006d-Af
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 01:31:22 -0500
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:50492)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1XwPwL-0008Vh-AF; Thu, 04 Dec 2014 01:31:01 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	6F011118109D; Thu,  4 Dec 2014 07:31:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id sz6WLh98bCms; Thu,  4 Dec 2014 07:30:58 +0100 (CET)
Received: from [192.168.178.35] (p54AC92B4.dip0.t-ipconnect.de
	[84.172.146.180])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	620361180040; Thu,  4 Dec 2014 07:30:58 +0100 (CET)
Message-ID: <547FFFA1.1090505@weilnetz.de>
Date: Thu, 04 Dec 2014 07:30:57 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <1417673896-14832-1-git-send-email-famz@redhat.com>
In-Reply-To: <1417673896-14832-1-git-send-email-famz@redhat.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.3] configure: Replace
 which(1) with "has"
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
X-List-Received-Date: Thu, 04 Dec 2014 06:31:28 -0000

Am 04.12.2014 um 07:18 schrieb Fam Zheng:
> Using "has" is more slick because which(1) is not always there.
> 
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 47048f0..cae588c 100755
> --- a/configure
> +++ b/configure
> @@ -2727,7 +2727,7 @@ fi
>  if test "$modules" = yes; then
>      shacmd_probe="sha1sum sha1 shasum"
>      for c in $shacmd_probe; do
> -        if which $c >/dev/null 2>&1; then
> +        if has $c; then
>              shacmd="$c"
>              break
>          fi


Reviewed-by: Stefan Weil <sw@weilnetz.de>



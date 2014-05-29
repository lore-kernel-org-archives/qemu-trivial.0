Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WpzpY-0003L0-BO
	for mharc-qemu-trivial@gnu.org; Thu, 29 May 2014 08:53:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WpzpR-0003CN-3Z
	for qemu-trivial@nongnu.org; Thu, 29 May 2014 08:53:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WpzpL-0000PD-C6
	for qemu-trivial@nongnu.org; Thu, 29 May 2014 08:53:05 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:39048)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Wpzp9-0000NG-IH; Thu, 29 May 2014 08:52:47 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	E311611822B5; Thu, 29 May 2014 14:52:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id agbLhyewvXbZ; Thu, 29 May 2014 14:52:35 +0200 (CEST)
Received: from [192.168.178.35] (p54AC99A6.dip0.t-ipconnect.de
	[84.172.153.166])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	75D5411822B4; Thu, 29 May 2014 14:52:33 +0200 (CEST)
Message-ID: <53872D8F.2060308@weilnetz.de>
Date: Thu, 29 May 2014 14:52:31 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1401361215-25752-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1401361215-25752-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: Remove unused
	zero_ethaddr[] variable
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
X-List-Received-Date: Thu, 29 May 2014 12:53:11 -0000

Am 29.05.2014 13:00, schrieb Peter Maydell:
> The zero_ethaddr[] array is never used; delete it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> clang 3.4 warns about unused const variables like this and
> also about unused functions; we have over 400 such warnings
> currently, of which some are simple "forgot to clean up
> redundant code" like this one, some are deliberate in some
> sense (usually the function/var is used in one config but not
> another), and some are outright bugs. Anybody feel like wading
> through them? :-)

I can add some more:

* Missing 'static' attributes for local variables and functions

* Use of 0 instead of NULL for pointers (do we want to fix those?)

> 
>  slirp/slirp.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/slirp/slirp.c b/slirp/slirp.c
> index 3fb48a4..b7f3726 100644
> --- a/slirp/slirp.c
> +++ b/slirp/slirp.c
> @@ -37,8 +37,6 @@ static const uint8_t special_ethaddr[ETH_ALEN] = {
>      0x52, 0x55, 0x00, 0x00, 0x00, 0x00
>  };
>  
> -static const uint8_t zero_ethaddr[ETH_ALEN] = { 0, 0, 0, 0, 0, 0 };
> -
>  u_int curtime;
>  
>  static QTAILQ_HEAD(slirp_instances, Slirp) slirp_instances =
> 

Reviewed-by: Stefan Weil <sw@weilnetz.de>



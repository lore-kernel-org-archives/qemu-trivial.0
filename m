Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dQbJ6-0001xJ-BB
	for mharc-qemu-trivial@gnu.org; Thu, 29 Jun 2017 11:24:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1dQbJ1-0001te-FQ
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 11:24:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1dQbJ0-0000Jn-Mx
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 11:24:31 -0400
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:37592)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1dQbIw-0000IV-UW; Thu, 29 Jun 2017 11:24:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id B4282104478;
	Thu, 29 Jun 2017 17:24:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (mail-r83.rz.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id WRFqzChOIrNg; Thu, 29 Jun 2017 17:24:24 +0200 (CEST)
Received: from [134.155.36.73] (edv13.bib.uni-mannheim.de [134.155.36.73])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPSA id 9687A1040BA;
	Thu, 29 Jun 2017 17:24:24 +0200 (CEST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
	<alex.bennee@linaro.org>, "Emilio G . Cota" <cota@braap.org>,
	Yang Zhong <yang.zhong@intel.com>
Cc: qemu-trivial@nongnu.org
References: <20170629150308.22766-1-f4bug@amsat.org>
	<20170629150308.22766-5-f4bug@amsat.org>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <8e5fee51-a858-61d5-a10d-8f7e803d6a97@weilnetz.de>
Date: Thu, 29 Jun 2017 17:24:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170629150308.22766-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 134.155.96.80
Subject: Re: [Qemu-trivial] [PATCH v2 4/5] MAINTAINERS: update TCI entry
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
X-List-Received-Date: Thu, 29 Jun 2017 15:24:35 -0000

Am 29.06.2017 um 17:03 schrieb Philippe Mathieu-Daud=C3=A9:
> moved in 244f1441 to tcg/
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 530293044b..9bad523060 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1654,7 +1654,7 @@ TCI target
>  M: Stefan Weil <sw@weilnetz.de>
>  S: Maintained
>  F: tcg/tci/
> -F: tci.c
> +F: tcg/tci.c
>  F: disas/tci.c
> =20
>  Block drivers


Thank you for this fix.

Reviewed-by: Stefan Weil <sw@weilnetz.de>




Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g86Qj-0001Oh-Ca
	for mharc-qemu-trivial@gnu.org; Thu, 04 Oct 2018 12:24:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1g86Qh-0001N2-5I
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:24:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1g86Qe-0002RK-Fp
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:24:47 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:36769)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1g86Qe-0002R5-6s; Thu, 04 Oct 2018 12:24:44 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MgARS-1fV9xy0uJa-00hefZ; Thu, 04 Oct 2018 18:24:28 +0200
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MgARS-1fV9xy0uJa-00hefZ; Thu, 04 Oct 2018 18:24:28 +0200
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
	Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-7-crosa@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <4f0850d2-3baa-7acc-d34b-98f074f1a2f8@vivier.eu>
Date: Thu, 4 Oct 2018 18:24:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181004161852.11673-7-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nNVFfkHLwFKXyMo8LcI/i3Evxl1gBf9Nb0GlN9peE6k3Wt8zH5V
	1DcpKzaRRbtKLPEuOzw6+cqCVnisyfWe5872DdlXxzdPmZQcYlDy4r8cNLxIPyLm23ICUXC
	mp/R25cgV1VoLtJaGYeWCThfLJsi86MSdJ4M1F+8CFI3RqzCe/wp6XQS6FncPT6WlWb0f2r
	1wAeUXdgmY81TDEQ1xXpA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:uV3K68qSZ2Y=:Js76rXJzwyhAoV1Hav+Ajv
	TIgj5MOJXyb9jobVbYpnYR/PA6SPMS+nNyd0KuJIOEDTclNAqUMeFzDUVa79Z6skoScx5Valx
	vltL7zHIyWKf6YRAc2bw1gJu4Yxqh4Rha6x9EhUJsWwoEsvFfAQ31cddK6gB0m4cXLRTVPqSj
	gU2EOeeSEoq83nkHwH1gf7VoOwC/qBDIlo3aX3BnKgg1cEFEh3Nv8o/01ELsgM0pUQwYj1B44
	26Xscr3vcPIXm2/CoL5Ur+0SFuzc+6yP364gaRoa23/r0Yd88MSFA1eWDjN9748NUytiPBmU5
	yLPkIhWAXneqAIfZZUdBq9E7Hjy+eriTZhFMsH8Po48EkhSytSHIJqkQ2wo+1BkQ6kehhLki+
	hyDiYY1xpEzFo2n+o77BsxuZc8DbygsRUHv2SgXHe/S97DrfwFK6is6eSQRwjx61HURhRNbUo
	5XoxBcRPwo1vHoeKAiWko45h+zlkdEl/OfT5n7mUU/LU9g2h6plqGHVrPzXUi3R6yl4JTI/Y4
	Tblwx6oe4KdC9S1Dxif8gtYUWeu2VZkI8n7z8WpcB2dYlxI9JUmz33pn5gyoHV9UItRFnZ6oI
	IwH5oLUm4hMY9jjt7f+yRdS3PdNsCKCBO3ESKZ57KCbscfK82aCdtawr3oILN83FFqCMwj9k6
	AtMgX/aAUyxgf9iRcme0onqFkCMxVaxehxXX0P/HbojjrsO/c4h3hpyk+wag8NCdqSPDjzRRh
	s/YWNNntWh/9tZGw
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: Re: [Qemu-trivial] [PATCH 06/10] thunk.c: clean up commented out
 definition
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
X-List-Received-Date: Thu, 04 Oct 2018 16:24:48 -0000

Le 04/10/2018 à 18:18, Cleber Rosa a écrit :
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  thunk.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/thunk.c b/thunk.c
> index d5d8645cd4..e351ae53af 100644
> --- a/thunk.c
> +++ b/thunk.c
> @@ -21,8 +21,6 @@
>  #include "qemu.h"
>  #include "exec/user/thunk.h"
>  
> -//#define DEBUG
> -

Generally we use that to enable easily existing debug traces.

In this case, if you remove the "#define" I think you should also
replace the "#ifdef DEBUG"s by some trace_XXXX() functions.

Thanks,
Laurent



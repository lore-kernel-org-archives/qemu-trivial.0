Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynu8O-0001PZ-Gh
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 15:28:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Ynu8M-0001MY-8c
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 15:28:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Ynu8L-0007hJ-3r
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 15:28:30 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:39726)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Ynu8G-0007gS-At; Thu, 30 Apr 2015 15:28:24 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	3A5D41181897; Thu, 30 Apr 2015 21:28:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Ccw9GHOVgleE; Thu, 30 Apr 2015 21:28:20 +0200 (CEST)
Received: from [192.168.178.24] (p54AC809E.dip0.t-ipconnect.de
	[84.172.128.158])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	16B13118188E; Thu, 30 Apr 2015 21:28:20 +0200 (CEST)
Message-ID: <55428253.5020300@weilnetz.de>
Date: Thu, 30 Apr 2015 21:28:19 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <CAFEAcA_g1SgYSPqaiP-eewaY1AbKLAJoReWYgD5kvhEW5JbW8w@mail.gmail.com>
	<1430421390-2787-1-git-send-email-cota@braap.org>
In-Reply-To: <1430421390-2787-1-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] i440fx-test: guard
 ARRAY_SIZE definition with #ifndef
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
X-List-Received-Date: Thu, 30 Apr 2015 19:28:31 -0000

Am 30.04.2015 um 21:16 schrieb Emilio G. Cota:
> ARRAY_SIZE is defined in osdep.h so having an unconditional
> definition here is fragile.
>
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>   tests/i440fx-test.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/i440fx-test.c b/tests/i440fx-test.c
> index d0bc8de..d610e66 100644
> --- a/tests/i440fx-test.c
> +++ b/tests/i440fx-test.c
> @@ -27,7 +27,9 @@
>   
>   #define BROKEN 1
>   
> +#ifndef ARRAY_SIZE
>   #define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
> +#endif
>   
>   typedef struct TestData
>   {

Why not include osdep.h via qemu-common.h and remove all other include 
statements which then are no longer needed? I'd prefer that variant.

Cheers
Stefan



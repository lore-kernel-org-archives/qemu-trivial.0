Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfZ65-0000e9-TZ
	for mharc-qemu-trivial@gnu.org; Fri, 25 Sep 2015 15:55:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZfZ63-0000bv-IF
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 15:55:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZfZ62-0003G5-Pv
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 15:55:55 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=40427
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1ZfZ5w-00030r-RZ; Fri, 25 Sep 2015 15:55:48 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	0FA0B11810B3; Fri, 25 Sep 2015 21:55:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id DjmghSTfM2f3; Fri, 25 Sep 2015 21:55:44 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (p54AC9FC4.dip0.t-ipconnect.de
	[84.172.159.196])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	4A52B11810A4; Fri, 25 Sep 2015 21:55:44 +0200 (CEST)
Message-ID: <5605A6BF.5050803@weilnetz.de>
Date: Fri, 25 Sep 2015 21:55:43 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: QEMU Developer <qemu-devel@nongnu.org>
References: <1426328388-2888-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1426328388-2888-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Antony Pavlov <antonynpavlov@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/arm/digic: Fix memory
 leak reported by Coverity
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
X-List-Received-Date: Fri, 25 Sep 2015 19:55:56 -0000

Am 14.03.2015 um 11:19 schrieb Stefan Weil:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/arm/digic_boards.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
> index 7114c36..ad70f7b 100644
> --- a/hw/arm/digic_boards.c
> +++ b/hw/arm/digic_boards.c
> @@ -109,6 +109,7 @@ static void digic_load_rom(DigicBoardState *s, hwaddr addr,
>          }
>  
>          rom_size = load_image_targphys(fn, addr, max_size);
> +        g_free(fn);
>          if (rom_size < 0 || rom_size > max_size) {
>              error_report("Couldn't load rom image '%s'.", filename);
>              exit(1);
> 

Ping? Maybe this old patch can be applied to qemu-trivial.

fn = qemu_find_file() allocates memory, so g_free is needed.

Regards
Stefan


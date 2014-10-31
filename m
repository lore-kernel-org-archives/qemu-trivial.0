Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkGjv-0006pM-1Z
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 14:15:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1XkGjn-0006h7-F1
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 14:15:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1XkGji-00011S-6Y
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 14:15:51 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:45165)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1XkGjS-0000u0-QH; Fri, 31 Oct 2014 14:15:30 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	968C6118109D; Fri, 31 Oct 2014 19:15:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id CA2UAW2xg7_2; Fri, 31 Oct 2014 19:15:26 +0100 (CET)
Received: from [192.168.178.24] (p54ACA151.dip0.t-ipconnect.de [84.172.161.81])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	C39641180040; Fri, 31 Oct 2014 19:15:25 +0100 (CET)
Message-ID: <5453D1BD.10902@weilnetz.de>
Date: Fri, 31 Oct 2014 19:15:25 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.1.2
MIME-Version: 1.0
To: SeokYeon Hwang <syeon.hwang@samsung.com>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org
References: <1414742525-18639-1-git-send-email-syeon.hwang@samsung.com>
In-Reply-To: <1414742525-18639-1-git-send-email-syeon.hwang@samsung.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 37.221.199.173
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vdi: wrapped uuid_unparse()
	in #ifdef
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
X-List-Received-Date: Fri, 31 Oct 2014 18:15:56 -0000

Am 31.10.2014 um 09:02 schrieb SeokYeon Hwang:
> Wrapped uuid_unparse() in #ifdef to avoid "-Wunused-function" on clang 3.4 or later.
>
> Signed-off-by: SeokYeon Hwang <syeon.hwang@samsung.com>
> ---
>   block/vdi.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/block/vdi.c b/block/vdi.c
> index 19701ee..e1d211c 100644
> --- a/block/vdi.c
> +++ b/block/vdi.c
> @@ -137,12 +137,14 @@ static inline int uuid_is_null(const uuid_t uu)
>       return memcmp(uu, null_uuid, sizeof(uuid_t)) == 0;
>   }
>   
> +# if defined(CONFIG_VDI_DEBUG)
>   static inline void uuid_unparse(const uuid_t uu, char *out)
>   {
>       snprintf(out, 37, UUID_FMT,
>               uu[0], uu[1], uu[2], uu[3], uu[4], uu[5], uu[6], uu[7],
>               uu[8], uu[9], uu[10], uu[11], uu[12], uu[13], uu[14], uu[15]);
>   }
> +# endif
>   #endif
>   
>   typedef struct {

This code is only used on build hosts without libuuid development header 
files, so the warning can be avoided by installing that header files. 
Nevertheless, I think it is fine for qemu-trivial.

Reviewed-by: Stefan Weil <sw@weilnetz.de>



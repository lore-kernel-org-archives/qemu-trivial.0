Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RG19g-0002v9-U9
	for mharc-qemu-trivial@gnu.org; Tue, 18 Oct 2011 00:19:56 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RG19e-0002nz-Ah
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2011 00:19:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RG19d-0001H6-De
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2011 00:19:54 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:36736)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1RG19b-0001D3-2Q; Tue, 18 Oct 2011 00:19:51 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	0318E72834F7; Tue, 18 Oct 2011 06:19:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id m4gi28VAw5gJ; Tue, 18 Oct 2011 06:19:18 +0200 (CEST)
Received: from [192.168.178.20] (p5086E1C8.dip.t-dialin.net [80.134.225.200])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	C42E172834F6; Tue, 18 Oct 2011 06:19:18 +0200 (CEST)
Message-ID: <4E9CFE3C.80205@weilnetz.de>
Date: Tue, 18 Oct 2011 06:19:08 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: Trevor Saunders <trev.saunders@gmail.com>
References: <1318903592-4851-1-git-send-email-trev.saunders@gmail.com>
In-Reply-To: <1318903592-4851-1-git-send-email-trev.saunders@gmail.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Jes Sorensen <Jes.Sorensen@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] correctly null terminate
	the process name
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
X-List-Received-Date: Tue, 18 Oct 2011 04:19:55 -0000

Am 18.10.2011 04:06, schrieb Trevor Saunders:
> strncpy() doesn't garentee the copied string will be null terminated if
> the original is longer than the length to copy.
>
> Signed-off-by: Trevor Saunders<trev.saunders@gmail.com>
> ---
>   os-posix.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/os-posix.c b/os-posix.c
> index dbf3b24..92dcc97 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -149,8 +149,8 @@ void os_set_proc_name(const char *s)
>       char name[16];
>       if (!s)
>           return;
> -    name[sizeof(name) - 1] = 0;
>       strncpy(name, s, sizeof(name));
> +    name[sizeof(name) - 1] = 0;
>       /* Could rewrite argv[0] too, but that's a bit more complicated.
>          This simple way is enough for `top'. */
>       if (prctl(PR_SET_NAME, name)) {

Reviewed-by: Stefan Weil <sw@weilnetz.de>



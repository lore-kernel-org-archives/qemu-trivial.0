Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQL4o-00034E-BG
	for mharc-qemu-trivial@gnu.org; Sat, 28 May 2011 11:05:18 -0400
Received: from eggs.gnu.org ([140.186.70.92]:43826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QQL4l-00030J-NU
	for qemu-trivial@nongnu.org; Sat, 28 May 2011 11:05:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QQL4k-0005TB-M2
	for qemu-trivial@nongnu.org; Sat, 28 May 2011 11:05:15 -0400
Received: from fmmailgate03.web.de ([217.72.192.234]:47964)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1QQL4i-0005Su-BQ; Sat, 28 May 2011 11:05:12 -0400
Received: from smtp05.web.de  ( [172.20.4.166])
	by fmmailgate03.web.de (Postfix) with ESMTP id AE07218F6A239;
	Sat, 28 May 2011 17:05:10 +0200 (CEST)
Received: from [87.173.108.219] (helo=[10.0.1.1])
	by smtp05.web.de with asmtp (TLSv1:AES128-SHA:128) (WEB.DE 4.110 #2)
	id 1QQL4g-0008Rk-00; Sat, 28 May 2011 17:05:10 +0200
Message-Id: <3FB3F9C7-2BDB-4363-A744-07E3AD68A4AC@web.de>
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
To: Alexandre Raymond <cerbere@gmail.com>
In-Reply-To: <1306516951-31105-3-git-send-email-cerbere@gmail.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v936)
Date: Sat, 28 May 2011 17:05:09 +0200
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
	<1306516951-31105-3-git-send-email-cerbere@gmail.com>
X-Mailer: Apple Mail (2.936)
Sender: andreas.faerber@web.de
X-Sender: Andreas.Faerber@web.de
X-Provags-ID: V01U2FsdGVkX1/6AzEyB++4D9kjFk+RBT3BXV1A1adnvuDdlYxN
	ClRVBuXJlsiQy1qGT+Ke4cV9EwXEjuQkTaHYr4VRGwNuaiewF1
	Q5fTryUj4hWa6rnSfkig==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.234
Cc: qemu-trivial@nongnu.org, Tristan Gingold <gingold@adacore.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/6] Cocoa: avoid displaying
	window when command-line contains '-h'
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
X-List-Received-Date: Sat, 28 May 2011 15:05:16 -0000

Am 27.05.2011 um 19:22 schrieb Alexandre Raymond:

> There was already a check in place to avoid displaying a window
> in certain modes such as vnc, nographic or curses.
>
> Add a check for '-h' to avoid displaying a window for a split-
> second before showing the usage information.
>
> Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
> ---
> ui/cocoa.m |    3 ++-
> 1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 20f91bc..7fb8d96 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -865,7 +865,8 @@ int main (int argc, const char * argv[]) {
>
>     /* In case we don't need to display a window, let's not do that */
>     for (i = 1; i < argc; i++) {
> -        if (!strcmp(argv[i], "-vnc") ||
> +        if (!strcmp(argv[i], "-h") ||
> +            !strcmp(argv[i], "-vnc") ||
>             !strcmp(argv[i], "-nographic") ||
>             !strcmp(argv[i], "-curses")) {
>                 return qemu_main(gArgc, gArgv);

Nack. I have a patch from Tristan queued (sorry, forgot to send pull  
request before my vacation), please rebase against that.

Cf. http://repo.or.cz/w/qemu/afaerber.git/shortlog/refs/heads/cocoa-for-upstream

Also, your patch fails to detect -help.

BTW -M ? and others face a similar detection issue, so I believe while  
adding to this list is a handy short-term fix, we need a better  
solution there. Suggestions and patches welcome.

Andreas


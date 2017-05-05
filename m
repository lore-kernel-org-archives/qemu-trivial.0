Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d6Wg6-0006OI-7N
	for mharc-qemu-trivial@gnu.org; Fri, 05 May 2017 02:25:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d6Wg4-0006MR-0j
	for qemu-trivial@nongnu.org; Fri, 05 May 2017 02:25:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d6Wg3-00030V-8e
	for qemu-trivial@nongnu.org; Fri, 05 May 2017 02:25:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39347)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d6Wfy-0002zH-R0; Fri, 05 May 2017 02:25:15 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 27F7940384;
	Fri,  5 May 2017 09:25:14 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id A410519;
	Fri,  5 May 2017 09:14:26 +0300 (MSK)
To: Kamil Rytarowski <n54@gmx.com>, qemu-trivial@nongnu.org
References: <20170425131828.22480-1-n54@gmx.com>
Cc: peter.maydell@linaro.org, qemu-devel <qemu-devel@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <690b205a-e3d1-f378-97a8-dca129743826@msgid.tls.msk.ru>
Date: Fri, 5 May 2017 09:14:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170425131828.22480-1-n54@gmx.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] scripts/qemu-binfmt-conf.sh: Fix shell
 portability issue
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
X-List-Received-Date: Fri, 05 May 2017 06:25:21 -0000

25.04.2017 16:18, Kamil Rytarowski wrote:
> Appease pkgsrc and use portable shell variable comparison.
> This switches "==" to "=". It should not be a functional change.

Applied to -trivial, thanks!

/mjt

> Signed-off-by: Kamil Rytarowski <n54@gmx.com>
> ---
>  scripts/qemu-binfmt-conf.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
> index 0f1aa63872..8afc3eb5bb 100755
> --- a/scripts/qemu-binfmt-conf.sh
> +++ b/scripts/qemu-binfmt-conf.sh
> @@ -284,12 +284,12 @@ while true ; do
>          shift
>          # check given cpu is in the supported CPU list
>          for cpu in ${qemu_target_list} ; do
> -            if [ "$cpu" == "$1" ] ; then
> +            if [ "$cpu" = "$1" ] ; then
>                  break
>              fi
>          done
>  
> -        if [ "$cpu" == "$1" ] ; then
> +        if [ "$cpu" = "$1" ] ; then
>              qemu_target_list="$1"
>          else
>              echo "ERROR: unknown CPU \"$1\"" 1>&2
> 	



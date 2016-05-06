Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ayl4j-0001Hg-5T
	for mharc-qemu-trivial@gnu.org; Fri, 06 May 2016 15:06:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ayl4Z-0000w9-Hl
	for qemu-trivial@nongnu.org; Fri, 06 May 2016 15:06:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ayl4N-0001rp-Q1
	for qemu-trivial@nongnu.org; Fri, 06 May 2016 15:05:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49584)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ayl3f-0001QH-8u; Fri, 06 May 2016 15:05:03 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5AED140619;
	Fri,  6 May 2016 22:04:38 +0300 (MSK)
To: Wei Jiangang <weijg.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1461665601-14908-1-git-send-email-weijg.fnst@cn.fujitsu.com>
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, qemu-block@nongnu.org,
	mreitz@redhat.com
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <572CEAC5.60806@msgid.tls.msk.ru>
Date: Fri, 6 May 2016 22:04:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <1461665601-14908-1-git-send-email-weijg.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] iotests: fix the redirection order in 083
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
X-List-Received-Date: Fri, 06 May 2016 19:06:07 -0000

26.04.2016 13:13, Wei Jiangang wrote:
> It should redirect stdout to /dev/null first,
> then redirect stderr to whatever stdout currently points at.

Actually this is interesting.

By doing this like it was done initially, we see any possible
errors from grep or python, because errors will go to initial stdout.
Now, errors are sent to /dev/null too.

:)

JFYI.

/mjt

> Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
> ---
>  tests/qemu-iotests/083 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qemu-iotests/083 b/tests/qemu-iotests/083
> index aa99278..7d368b5 100755
> --- a/tests/qemu-iotests/083
> +++ b/tests/qemu-iotests/083
> @@ -44,7 +44,7 @@ choose_tcp_port() {
>  
>  wait_for_tcp_port() {
>  	while ! (netstat --tcp --listening --numeric | \
> -		 grep "$1.*0\\.0\\.0\\.0:\\*.*LISTEN") 2>&1 >/dev/null; do
> +		 grep "$1.*0\\.0\\.0\\.0:\\*.*LISTEN") >/dev/null 2>&1; do
>  		sleep 0.1
>  	done
>  }
> @@ -71,7 +71,7 @@ EOF
>  		nbd_url="nbd:127.0.0.1:$port:exportname=foo"
>  	fi
>  
> -	$PYTHON nbd-fault-injector.py $extra_args "127.0.0.1:$port" "$TEST_DIR/nbd-fault-injector.conf" 2>&1 >/dev/null &
> +	$PYTHON nbd-fault-injector.py $extra_args "127.0.0.1:$port" "$TEST_DIR/nbd-fault-injector.conf" >/dev/null 2>&1 &
>  	wait_for_tcp_port "127\\.0\\.0\\.1:$port"
>  	$QEMU_IO -c "read 0 512" "$nbd_url" 2>&1 | _filter_qemu_io | _filter_nbd
>  
> 



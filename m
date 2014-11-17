Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqPdg-0003vE-Bx
	for mharc-qemu-trivial@gnu.org; Mon, 17 Nov 2014 11:58:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XqPdZ-0003iI-Ni
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 11:58:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XqPdU-0002PM-UZ
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 11:58:49 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:54903)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XqPdK-0002MS-HT; Mon, 17 Nov 2014 11:58:34 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 031C542DE2;
	Mon, 17 Nov 2014 19:58:25 +0300 (MSK)
Received: from wh.tls.msk.ru (wh.tls.msk.ru [192.168.177.7])
	by tsrv.corpit.ru (Postfix) with ESMTP id 8A935711;
	Mon, 17 Nov 2014 19:58:25 +0300 (MSK)
Message-ID: <546A2931.20209@msgid.tls.msk.ru>
Date: Mon, 17 Nov 2014 19:58:25 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
	<1416046008-7880-2-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1416046008-7880-2-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, weidong.huang@huawei.com,
	peter.huangpeng@huawei.com, zhang.zhanghailiang@huawei.com
Subject: Re: [Qemu-trivial] [PATCH 1/9] l2tpv3: fix fd leak
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
X-List-Received-Date: Mon, 17 Nov 2014 16:58:54 -0000

15.11.2014 13:06, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> In this false branch, fd will leak when it is zero.
> Change the testing condition.

Why fd==0 is a concern here?  It is a very unlikely
situation that fd0 will be picked - firstly because
fd0 is almost always open, and second - even if it
isn't open, it will be picked much earlier than this
code path, ie, some other file will use fd0 before.

But even if the concern is real (after all, better
stay correct than spread bad code pattern, even if
in reality we don't care as this can't happen), why
not add 0 to the equality?

Why people especially compare with -1?  Any negative
value is illegal here and in lots of other places,
and many software packages used to return -errno in
error cases, which is definitely != -1.  I'm not
saying that comparing with -1 is bad in _this_
particular case, but why not do it generally in
all cases?

More, comparing with 0 is faster and shorter than
comparing with -1...

So if it were me, I'd change it to >= 0, not to
== -1.  Here and in all other millions of places
in qemu code where it compares with -1... ;)

Thanks,

/mjt
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  net/l2tpv3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/l2tpv3.c b/net/l2tpv3.c
> index 528d95b..b2b0fc0 100644
> --- a/net/l2tpv3.c
> +++ b/net/l2tpv3.c
> @@ -746,7 +746,7 @@ int net_init_l2tpv3(const NetClientOptions *opts,
>      return 0;
>  outerr:
>      qemu_del_net_client(nc);
> -    if (fd > 0) {
> +    if (fd != -1) {
>          close(fd);
>      }
>      if (result) {
> 



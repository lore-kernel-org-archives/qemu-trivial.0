Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buhsu-0004n5-H0
	for mharc-qemu-trivial@gnu.org; Thu, 13 Oct 2016 11:25:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1buaA1-0003Z6-0x
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 03:10:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1bua9w-0001lH-JS
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 03:10:36 -0400
Received: from [59.151.112.132] (port=27563 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>)
	id 1bua9q-0001dO-FL; Thu, 13 Oct 2016 03:10:26 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="11896629"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Oct 2016 15:10:14 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4C564466FE08;
	Thu, 13 Oct 2016 15:10:11 +0800 (CST)
Received: from [10.167.226.56] (10.167.226.56) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 13 Oct 2016 15:10:11 +0800
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, <qemu-trivial@nongnu.org>
References: <1476341848-1940-1-git-send-email-zhang.zhanghailiang@huawei.com>
CC: <jasowang@redhat.com>, <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
From: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
Message-ID: <19db71b8-5437-9588-42a3-46202071f8e3@cn.fujitsu.com>
Date: Thu, 13 Oct 2016 15:11:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1476341848-1940-1-git-send-email-zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.56]
X-yoursite-MailScanner-ID: 4C564466FE08.A7550
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhangchen.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
X-Mailman-Approved-At: Thu, 13 Oct 2016 11:25:27 -0400
Subject: Re: [Qemu-trivial] [PATCH] colo-compare: remove unused struct
 CompareChardevProps and 'props' variable
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
X-List-Received-Date: Thu, 13 Oct 2016 07:10:40 -0000



On 10/13/2016 02:57 PM, zhanghailiang wrote:
> After commit 0a73336d, 'props' variable in find_and_check_chardev()
> is unused. Remove it, togther with struct CompareChardevProps.
>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>

Reviewed-by: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>

Thanks
Zhang Chen

> ---
>   net/colo-compare.c | 8 --------
>   1 file changed, 8 deletions(-)
>
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index 47703c5..4be6fc3 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -92,10 +92,6 @@ typedef struct CompareClass {
>       ObjectClass parent_class;
>   } CompareClass;
>   
> -typedef struct CompareChardevProps {
> -    bool is_socket;
> -} CompareChardevProps;
> -
>   enum {
>       PRIMARY_IN = 0,
>       SECONDARY_IN,
> @@ -573,8 +569,6 @@ static int find_and_check_chardev(CharDriverState **chr,
>                                     char *chr_name,
>                                     Error **errp)
>   {
> -    CompareChardevProps props;
> -
>       *chr = qemu_chr_find(chr_name);
>       if (*chr == NULL) {
>           error_setg(errp, "Device '%s' not found",
> @@ -582,8 +576,6 @@ static int find_and_check_chardev(CharDriverState **chr,
>           return 1;
>       }
>   
> -    memset(&props, 0, sizeof(props));
> -
>       if (!qemu_chr_has_feature(*chr, QEMU_CHAR_FEATURE_RECONNECTABLE)) {
>           error_setg(errp, "chardev \"%s\" is not reconnectable",
>                      chr_name);

-- 
Thanks
zhangchen





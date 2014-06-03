Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WroZQ-0007xg-Dq
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jun 2014 09:16:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenliang88@huawei.com>) id 1WrjCr-0005Vs-EZ
	for qemu-trivial@nongnu.org; Tue, 03 Jun 2014 03:32:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenliang88@huawei.com>) id 1WrjCl-0000RK-Ap
	for qemu-trivial@nongnu.org; Tue, 03 Jun 2014 03:32:25 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:17443)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenliang88@huawei.com>)
	id 1WrjCY-0000Kc-90; Tue, 03 Jun 2014 03:32:06 -0400
Received: from 172.24.2.119 (EHLO szxeml209-edg.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id APL90992; Tue, 03 Jun 2014 15:31:50 +0800 (CST)
Received: from SZXEML407-HUB.china.huawei.com (10.82.67.94) by
	szxeml209-edg.china.huawei.com (172.24.2.184) with Microsoft SMTP
	Server (TLS) id 14.3.158.1; Tue, 3 Jun 2014 15:31:49 +0800
Received: from [127.0.0.1] (10.177.24.88) by szxeml407-hub.china.huawei.com
	(10.82.67.94) with Microsoft SMTP Server id 14.3.158.1; Tue, 3 Jun 2014
	15:31:39 +0800
Message-ID: <538D79D4.5000900@huawei.com>
Date: Tue, 3 Jun 2014 15:31:32 +0800
From: ChenLiang <chenliang88@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>
References: <538C6F98.5070005@gmail.com>
In-Reply-To: <538C6F98.5070005@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.24.88]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
X-Mailman-Approved-At: Tue, 03 Jun 2014 09:15:59 -0400
Cc: quintela@redhat.com, QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, dgilbert@redhat.com,
	QEMU Developers <qemu-devel@nongnu.org>, owasserm@redhat.com,
	arei.gonglei@huawei.com, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH-trivial] arch_init.c: Always
 be sure that 'encoded_buf' and 'current_buf' are lock protected
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
X-List-Received-Date: Tue, 03 Jun 2014 07:32:31 -0000

On 2014/6/2 20:35, Chen Gang wrote:

> 'encoded_buf' and 'current_buf' are lock protected during using in
> save_xbzrle_page() in ram_save_page(), and during freeing in
> migration_end().
> 
> So recommend to let them lock protected during starting, just like we
> have done to 'cache'.
> 
> 
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  arch_init.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch_init.c b/arch_init.c
> index 23044c1..784922c 100644
> --- a/arch_init.c
> +++ b/arch_init.c
> @@ -783,12 +783,12 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>              error_report("Error creating cache");
>              return -1;
>          }
> -        XBZRLE_cache_unlock();
> 
>          /* We prefer not to abort if there is no memory */
>          XBZRLE.encoded_buf = g_try_malloc0(TARGET_PAGE_SIZE);
>          if (!XBZRLE.encoded_buf) {
>              error_report("Error allocating encoded_buf");
> +            XBZRLE_cache_unlock();
>              return -1;
>          }
> 
> @@ -797,8 +797,10 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>              error_report("Error allocating current_buf");
>              g_free(XBZRLE.encoded_buf);
>              XBZRLE.encoded_buf = NULL;
> +            XBZRLE_cache_unlock();
>              return -1;
>          }
> +        XBZRLE_cache_unlock();
> 
>          acct_clear();
>      }


It isn't necessary.

Best regards.
ChenLiang



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WroZO-0007xc-Rc
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jun 2014 09:16:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenliang88@huawei.com>) id 1WrizG-0002D3-Dh
	for qemu-trivial@nongnu.org; Tue, 03 Jun 2014 03:18:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenliang88@huawei.com>) id 1WrizB-0003hW-KP
	for qemu-trivial@nongnu.org; Tue, 03 Jun 2014 03:18:22 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:32615)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenliang88@huawei.com>)
	id 1Wriz1-0003dk-9y; Tue, 03 Jun 2014 03:18:07 -0400
Received: from 172.24.2.119 (EHLO szxeml213-edg.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BUP45119; Tue, 03 Jun 2014 15:17:47 +0800 (CST)
Received: from SZXEML421-HUB.china.huawei.com (10.82.67.160) by
	szxeml213-edg.china.huawei.com (172.24.2.30) with Microsoft SMTP Server
	(TLS) id 14.3.158.1; Tue, 3 Jun 2014 15:17:47 +0800
Received: from [127.0.0.1] (10.177.24.88) by szxeml421-hub.china.huawei.com
	(10.82.67.160) with Microsoft SMTP Server id 14.3.158.1; Tue, 3 Jun 2014
	15:17:40 +0800
Message-ID: <538D768D.5050904@huawei.com>
Date: Tue, 3 Jun 2014 15:17:33 +0800
From: ChenLiang <chenliang88@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>
References: <538C6B37.2030400@gmail.com>
In-Reply-To: <538C6B37.2030400@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.24.88]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
X-Mailman-Approved-At: Tue, 03 Jun 2014 09:15:58 -0400
Cc: quintela@redhat.com, QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, dgilbert@redhat.com,
	QEMU Developers <qemu-devel@nongnu.org>, owasserm@redhat.com,
	arei.gonglei@huawei.com, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH-trivial] arch_init.c: Free
 'cache' in cache_fini() to avoid memory leak
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
X-List-Received-Date: Tue, 03 Jun 2014 07:18:27 -0000

On 2014/6/2 20:16, Chen Gang wrote:

> Call g_free() after cache_fini() in migration_end(), but do not call
> g_free() after call cache_fini() in xbzrle_cache_resize() which will
> cause memory leak.
> 
> cache_init() and cache_fini() are pair, so need let cache_fini() call
> g_free(cache) to match cache_init(), then fix current issue too.
> 
> 
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  arch_init.c  | 1 -
>  page_cache.c | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch_init.c b/arch_init.c
> index 9f1a174..23044c1 100644
> --- a/arch_init.c
> +++ b/arch_init.c
> @@ -739,7 +739,6 @@ static void migration_end(void)
>      XBZRLE_cache_lock();
>      if (XBZRLE.cache) {
>          cache_fini(XBZRLE.cache);
> -        g_free(XBZRLE.cache);
>          g_free(XBZRLE.encoded_buf);
>          g_free(XBZRLE.current_buf);
>          XBZRLE.cache = NULL;
> diff --git a/page_cache.c b/page_cache.c
> index b033681..89bb1ec 100644
> --- a/page_cache.c
> +++ b/page_cache.c
> @@ -109,6 +109,7 @@ void cache_fini(PageCache *cache)
>  
>      g_free(cache->page_cache);
>      cache->page_cache = NULL;
> +    g_free(cache);
>  }
>  
>  static size_t cache_get_cache_pos(const PageCache *cache,


Reviewed-by: ChenLiang <chenliang88@huawei.com>



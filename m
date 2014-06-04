Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ws7cV-00075C-Py
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jun 2014 05:36:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1Ws7cN-00073u-Ox
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 05:36:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1Ws7cH-0007r7-KD
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 05:36:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:31416)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1Ws7cH-0007q7-AN; Wed, 04 Jun 2014 05:36:17 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s549ZfYx015621
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 4 Jun 2014 05:35:41 -0400
Received: from work-vm (vpn1-7-57.ams2.redhat.com [10.36.7.57])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s549ZaOK015683
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Wed, 4 Jun 2014 05:35:39 -0400
Date: Wed, 4 Jun 2014 10:35:36 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Message-ID: <20140604093535.GB2618@work-vm>
References: <538C6B37.2030400@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <538C6B37.2030400@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: quintela@redhat.com, QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>, arei.gonglei@huawei.com,
	Eric Blake <eblake@redhat.com>
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
X-List-Received-Date: Wed, 04 Jun 2014 09:36:30 -0000

* Chen Gang (gang.chen.5i5j@gmail.com) wrote:
> Call g_free() after cache_fini() in migration_end(), but do not call
> g_free() after call cache_fini() in xbzrle_cache_resize() which will
> cause memory leak.
> 
> cache_init() and cache_fini() are pair, so need let cache_fini() call
> g_free(cache) to match cache_init(), then fix current issue too.
> 
> 
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>

Yes, good catch.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

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
> -- 
> 1.7.11.7
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


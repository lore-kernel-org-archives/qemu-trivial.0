Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WthHt-0000lj-LJ
	for mharc-qemu-trivial@gnu.org; Sun, 08 Jun 2014 13:53:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WthHl-0000b6-2J
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 13:53:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WthHe-0005Ws-Ja
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 13:53:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42884)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WthHS-0005Qi-2j; Sun, 08 Jun 2014 13:53:18 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D110640E06;
	Sun,  8 Jun 2014 21:53:13 +0400 (MSK)
Message-ID: <5394A309.2010808@msgid.tls.msk.ru>
Date: Sun, 08 Jun 2014 21:53:13 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>, quintela@redhat.com, 
	arei.gonglei@huawei.com, Eric Blake <eblake@redhat.com>, 
	dgilbert@redhat.com, owasserm@redhat.com
References: <538C6B37.2030400@gmail.com>
In-Reply-To: <538C6B37.2030400@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH-trivial] arch_init.c: Free 'cache' in
 cache_fini() to avoid memory leak
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
X-List-Received-Date: Sun, 08 Jun 2014 17:53:43 -0000

02.06.2014 16:16, Chen Gang wrote:
> Call g_free() after cache_fini() in migration_end(), but do not call
> g_free() after call cache_fini() in xbzrle_cache_resize() which will
> cause memory leak.
> 
> cache_init() and cache_fini() are pair, so need let cache_fini() call
> g_free(cache) to match cache_init(), then fix current issue too.

Applied to -trivial, with the following commit message:

migration: Plug memory leak in migrate-set-cache-size command

We call g_free() after cache_fini() in migration_end(), but we don't
call it after cache_fini() in xbzrle_cache_resize(), leaking the
memory.

cache_init() and cache_fini() are a pair.  Since cache_init()
allocates the cache, let cache_fini() free it.  This plugs the leak.

Thanks,

/mjt


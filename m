Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ws6O2-00007y-Ra
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jun 2014 04:17:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1Ws6Ns-0008NA-8Y
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 04:17:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1Ws6Nj-0004PN-7k
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 04:17:20 -0400
Received: from oxygen.pond.sub.org ([2a01:4f8:201:233:1::3]:50937)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1Ws6NQ-00044h-TR; Wed, 04 Jun 2014 04:16:53 -0400
Received: from blackfin.pond.sub.org (p5B32B63A.dip0.t-ipconnect.de
	[91.50.182.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by oxygen.pond.sub.org (Postfix) with ESMTPSA id 71EE820DA7;
	Wed,  4 Jun 2014 10:16:44 +0200 (CEST)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id ABBCD30403AF; Wed,  4 Jun 2014 10:16:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
References: <538C6B37.2030400@gmail.com>
Date: Wed, 04 Jun 2014 10:16:43 +0200
In-Reply-To: <538C6B37.2030400@gmail.com> (Chen Gang's message of "Mon, 02 Jun
	2014 20:16:55 +0800")
Message-ID: <8761kh2iok.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:201:233:1::3
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
X-List-Received-Date: Wed, 04 Jun 2014 08:17:29 -0000

Chen Gang <gang.chen.5i5j@gmail.com> writes:

> Call g_free() after cache_fini() in migration_end(), but do not call
> g_free() after call cache_fini() in xbzrle_cache_resize() which will
> cause memory leak.
>
> cache_init() and cache_fini() are pair, so need let cache_fini() call
> g_free(cache) to match cache_init(), then fix current issue too.

I'm not sure I get you.  Is the following accurate?

    migration: Plug memory leak in migrate-set-cache-size command

    We call g_free() after cache_fini() in migration_end(), but we don't
    call it after cache_fini() in xbzrle_cache_resize(), leaking the
    memory.

    cache_init() and cache_fini() are a pair.  Since cache_init()
    allocates the cache, let cache_fini() free it.  This plugs the leak.


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WrRAz-0002VG-Ur
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jun 2014 08:17:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WrRAo-0002Hq-Sc
	for qemu-trivial@nongnu.org; Mon, 02 Jun 2014 08:17:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WrRAf-00061V-RK
	for qemu-trivial@nongnu.org; Mon, 02 Jun 2014 08:17:06 -0400
Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e]:50272)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WrRAN-0005p3-7e; Mon, 02 Jun 2014 08:16:39 -0400
Received: by mail-pd0-f174.google.com with SMTP id r10so3361322pdi.33
	for <multiple recipients>; Mon, 02 Jun 2014 05:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=F4cDXuKRydItrVDc0C4C2aHy3PwjTyyCxufksH48qq4=;
	b=L0NqJrrSNuIXauAdEAlM/732NFzihePOpk7NuOM4f8/8sLLioC9xhRG3SAHWm3uK9X
	MvXoEaCQAJzFM9PDXoVK3grEr63bnBhbqoABygeLhkOVP0tZlKTulHydwtcPEl+6MzK6
	DGM0yjBQGYIa59M7kY8ehzA92HWYzF3HyYpGnksjGwyg2qAOySvg06xcyguevLxFz0/g
	HVeDHO2lsZ2gDfXMUbxinrPzt5qfzcbGgYOPWqy0hL2UPxiz4s7MMS+omjD9ML/k8ZKR
	6Klg4UcX78v0g6d+nAG8ylx96M+8721C0Cen6G1cGowrzX+REqkPwANc10qldgHnB1Vn
	uI4w==
X-Received: by 10.66.254.198 with SMTP id ak6mr4087336pad.156.1401711397473;
	Mon, 02 Jun 2014 05:16:37 -0700 (PDT)
Received: from [192.168.1.104] ([223.72.65.106])
	by mx.google.com with ESMTPSA id br1sm5351919pbc.6.2014.06.02.05.16.34
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 02 Jun 2014 05:16:36 -0700 (PDT)
Message-ID: <538C6B37.2030400@gmail.com>
Date: Mon, 02 Jun 2014 20:16:55 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, quintela@redhat.com, 
	arei.gonglei@huawei.com, Eric Blake <eblake@redhat.com>, 
	dgilbert@redhat.com, owasserm@redhat.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22e
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH-trivial] arch_init.c: Free 'cache' in
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
X-List-Received-Date: Mon, 02 Jun 2014 12:17:16 -0000

Call g_free() after cache_fini() in migration_end(), but do not call
g_free() after call cache_fini() in xbzrle_cache_resize() which will
cause memory leak.

cache_init() and cache_fini() are pair, so need let cache_fini() call
g_free(cache) to match cache_init(), then fix current issue too.


Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 arch_init.c  | 1 -
 page_cache.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch_init.c b/arch_init.c
index 9f1a174..23044c1 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -739,7 +739,6 @@ static void migration_end(void)
     XBZRLE_cache_lock();
     if (XBZRLE.cache) {
         cache_fini(XBZRLE.cache);
-        g_free(XBZRLE.cache);
         g_free(XBZRLE.encoded_buf);
         g_free(XBZRLE.current_buf);
         XBZRLE.cache = NULL;
diff --git a/page_cache.c b/page_cache.c
index b033681..89bb1ec 100644
--- a/page_cache.c
+++ b/page_cache.c
@@ -109,6 +109,7 @@ void cache_fini(PageCache *cache)
 
     g_free(cache->page_cache);
     cache->page_cache = NULL;
+    g_free(cache);
 }
 
 static size_t cache_get_cache_pos(const PageCache *cache,
-- 
1.7.11.7


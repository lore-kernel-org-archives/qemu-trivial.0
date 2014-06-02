Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WrRT6-0007P3-4M
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jun 2014 08:36:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WrRSu-00078E-MP
	for qemu-trivial@nongnu.org; Mon, 02 Jun 2014 08:35:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WrRSl-0004d3-Kr
	for qemu-trivial@nongnu.org; Mon, 02 Jun 2014 08:35:48 -0400
Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234]:48467)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WrRSS-0004Xj-Ab; Mon, 02 Jun 2014 08:35:20 -0400
Received: by mail-pa0-f52.google.com with SMTP id bj1so3815096pad.25
	for <multiple recipients>; Mon, 02 Jun 2014 05:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=4TZ2hvpddV1OLthjzbZgdJ1NZzw+sNxTMpyOsqfrjnw=;
	b=ShW2LeLSlEIZLGuuHx320CZdla7Vz6HuLjZuXTeZdcHskPz8bSwhk2lJgoxT6V3a5s
	ogdlUC7i+r+610MlNir1PXrDPfmE2MCSVQUmwtJRCdsWgy1wiVQpxwn8SDj0Wy6nHtqE
	Uq2wk8zM3SzFMjJ6TfrNWFcg/a1Q7IVluLUU4mi/DvJUtqiXn62zbDSEPpySyhvNcNtk
	Vl9HWAFeurVEKwloNay8O4ISDy8Y+0/dNsWr3xPSXYKhkW6vwrdUJYDBZxa2yrk2WWY9
	O9xerUPEEJ387CDGCDqzGA3MubWNx4DdlH4YtAdWU3fRsNMDOw0Wg0TBCn4Pa/4ZueKn
	Jjcg==
X-Received: by 10.66.218.36 with SMTP id pd4mr39909795pac.141.1401712519206;
	Mon, 02 Jun 2014 05:35:19 -0700 (PDT)
Received: from [192.168.1.104] ([223.72.65.106])
	by mx.google.com with ESMTPSA id
	sv10sm20337909pbc.74.2014.06.02.05.35.16 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 02 Jun 2014 05:35:18 -0700 (PDT)
Message-ID: <538C6F98.5070005@gmail.com>
Date: Mon, 02 Jun 2014 20:35:36 +0800
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
X-Received-From: 2607:f8b0:400e:c03::234
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH-trivial] arch_init.c: Always be sure that
 'encoded_buf' and 'current_buf' are lock protected
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
X-List-Received-Date: Mon, 02 Jun 2014 12:35:58 -0000

'encoded_buf' and 'current_buf' are lock protected during using in
save_xbzrle_page() in ram_save_page(), and during freeing in
migration_end().

So recommend to let them lock protected during starting, just like we
have done to 'cache'.


Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 arch_init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch_init.c b/arch_init.c
index 23044c1..784922c 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -783,12 +783,12 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
             error_report("Error creating cache");
             return -1;
         }
-        XBZRLE_cache_unlock();

         /* We prefer not to abort if there is no memory */
         XBZRLE.encoded_buf = g_try_malloc0(TARGET_PAGE_SIZE);
         if (!XBZRLE.encoded_buf) {
             error_report("Error allocating encoded_buf");
+            XBZRLE_cache_unlock();
             return -1;
         }

@@ -797,8 +797,10 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
             error_report("Error allocating current_buf");
             g_free(XBZRLE.encoded_buf);
             XBZRLE.encoded_buf = NULL;
+            XBZRLE_cache_unlock();
             return -1;
         }
+        XBZRLE_cache_unlock();

         acct_clear();
     }
-- 
1.7.11.7


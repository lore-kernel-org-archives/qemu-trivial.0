Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wfr2j-0000Gm-Pe
	for mharc-qemu-trivial@gnu.org; Thu, 01 May 2014 09:28:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wfr2Y-0008RT-KV
	for qemu-trivial@nongnu.org; Thu, 01 May 2014 09:28:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wfr2P-0007I6-Af
	for qemu-trivial@nongnu.org; Thu, 01 May 2014 09:28:42 -0400
Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231]:65466)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Wfr26-0007EI-Sd; Thu, 01 May 2014 09:28:15 -0400
Received: by mail-pa0-f49.google.com with SMTP id kq14so3623842pab.22
	for <multiple recipients>; Thu, 01 May 2014 06:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=hNHPc88XTb2WevBS6L7qR/pey5zGoKx8hiaKKpWK4zc=;
	b=ren6Wv0E0e/f6j1963GRfF8/1brMs6/X0oWwFrXUC7XacqwyRY1493gjGktg7+cORB
	PAj8Nrwc4WusiRgM46aWj8DZeufn4lupsewcAg7cWfhePgRXOldKFLBp8YimNJbPCle8
	rBPHGtcdkD+aQF35LbNBU9oYZv+U6jFWZc/La3oC19KfEgmfhF8ZlCe7meduhyNwx7T9
	MN7Pll4pVP2LoCu5qoin9XugAJWxEsfDRi5r0zWMBe1DFBXl3WjnXej6X3gVnzkpj8SF
	FXcyXozDACSYCFoqMJJPXC9+6enHd1p4QqMPEz8ssuzoTgfcoRPuFX49fFHaiWtclvJ4
	kbzQ==
X-Received: by 10.66.251.233 with SMTP id zn9mr21330196pac.67.1398950893200;
	Thu, 01 May 2014 06:28:13 -0700 (PDT)
Received: from [192.168.1.101] ([223.72.65.27])
	by mx.google.com with ESMTPSA id
	nw13sm134626977pab.37.2014.05.01.06.28.09 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 01 May 2014 06:28:12 -0700 (PDT)
Message-ID: <53624BEB.7030605@gmail.com>
Date: Thu, 01 May 2014 21:28:11 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: quintela@redhat.com, owasserm@redhat.com, pbonzini@redhat.com, 
	mst@redhat.com, Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] arch_init: Be sure of only one exit entry
 with DPRINTF() for ram_load()
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
X-List-Received-Date: Thu, 01 May 2014 13:28:51 -0000

When DPRINTF() has effect, the original author wants to print all
ram_load() calling results. So need use 'goto' instead of 'return'
within ram_load(), just like other areas have done.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 arch_init.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch_init.c b/arch_init.c
index 60c975d..333f698 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -998,7 +998,8 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
     seq_iter++;
 
     if (version_id < 4 || version_id > 4) {
-        return -EINVAL;
+        ret = -EINVAL;
+        goto done;
     }
 
     do {
@@ -1055,7 +1056,8 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
 
             host = host_from_stream_offset(f, addr, flags);
             if (!host) {
-                return -EINVAL;
+                ret = -EINVAL;
+                goto done;
             }
 
             ch = qemu_get_byte(f);
@@ -1065,14 +1067,16 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
 
             host = host_from_stream_offset(f, addr, flags);
             if (!host) {
-                return -EINVAL;
+                ret = -EINVAL;
+                goto done;
             }
 
             qemu_get_buffer(f, host, TARGET_PAGE_SIZE);
         } else if (flags & RAM_SAVE_FLAG_XBZRLE) {
             void *host = host_from_stream_offset(f, addr, flags);
             if (!host) {
-                return -EINVAL;
+                ret = -EINVAL;
+                goto done;
             }
 
             if (load_xbzrle(f, addr, host) < 0) {
-- 
1.7.11.7


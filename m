Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YKT9Y-0007wa-Ot
	for mharc-qemu-trivial@gnu.org; Sun, 08 Feb 2015 09:48:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bp@alien8.de>) id 1YKQlh-0003GW-9L
	for qemu-trivial@nongnu.org; Sun, 08 Feb 2015 07:15:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bp@alien8.de>) id 1YKQlc-000611-V8
	for qemu-trivial@nongnu.org; Sun, 08 Feb 2015 07:15:17 -0500
Received: from mail.skyhub.de ([78.46.96.112]:50625)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <bp@alien8.de>)
	id 1YKQlc-00060p-Kh
	for qemu-trivial@nongnu.org; Sun, 08 Feb 2015 07:15:12 -0500
X-Virus-Scanned: Nedap ESD1 at mail.skyhub.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1423397709; bh=XAFv/2O/AucB5h8eo3EVMFYna7+Lqrv9rguDEgHyXBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	Content-Type:In-Reply-To; b=ZGImA/Tyw4v52Xc2QbM3NDIKXGbNBlb5Zjwble
	Yod9ndoz4i9vTexGUEAvHMZKxtzGWSM+yfsYTHHCE7AFlay05fzciovpdjBNWBe0MR5
	W/ruFvBy3UFPy5jS8a/pDPTdSx9m8EcWFr3JfC0zff/azyaXdfiQWxmKeHwCUrsHq4=
Received: from mail.skyhub.de ([127.0.0.1])
	by localhost (door.skyhub.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id UMPgofUEk5Hb; Sun,  8 Feb 2015 13:15:09 +0100 (CET)
Received: from pd.tnic (p5DDC71F7.dip0.t-ipconnect.de [93.220.113.247])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id
	3247E1D96FD; Sun,  8 Feb 2015 13:15:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1423397709; bh=XAFv/2O/AucB5h8eo3EVMFYna7+Lqrv9rguDEgHyXBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	Content-Type:In-Reply-To; b=ZGImA/Tyw4v52Xc2QbM3NDIKXGbNBlb5Zjwble
	Yod9ndoz4i9vTexGUEAvHMZKxtzGWSM+yfsYTHHCE7AFlay05fzciovpdjBNWBe0MR5
	W/ruFvBy3UFPy5jS8a/pDPTdSx9m8EcWFr3JfC0zff/azyaXdfiQWxmKeHwCUrsHq4=
Received: by pd.tnic (Postfix, from userid 1000)
	id 46F9B1613BF; Sun,  8 Feb 2015 13:14:38 +0100 (CET)
Date: Sun, 8 Feb 2015 13:14:38 +0100
From: Borislav Petkov <bp@alien8.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20150208121438.GA6290@pd.tnic>
References: <1423340992-3156-1-git-send-email-bp@alien8.de>
	<54D735D4.8000105@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <54D735D4.8000105@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 78.46.96.112
X-Mailman-Approved-At: Sun, 08 Feb 2015 09:48:03 -0500
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>
Subject: [Qemu-trivial] [PATCH] memsave: Improve and disambiguate error
	message
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
X-List-Received-Date: Sun, 08 Feb 2015 12:15:18 -0000

On Sun, Feb 08, 2015 at 11:09:24AM +0100, Paolo Bonzini wrote:
> Cc: qemu-trivial@nongnu.org

Thanks.

But, there's more b0rked with this error message so you might wanna take
the patch below instead.

Btw, what are the vim settings when doing patches for qemu, this must be
documented somewhere as coding style differs significantly from that of
the kernel?

:-)

---
From: Borislav Petkov <bp@suse.de>
Subject: [PATCH] memsave: Improve and disambiguate error message

When requesting a size which cannot be read, the error message shows
a different address which is misleading to the user and it looks like
something's wrong with the address parsing. This is because the input
@addr variable is incremented in the memory dumping loop:

(qemu) memsave 0xffffffff8418069c 0xb00000 mem
Invalid addr 0xffffffff849ffe9c specified

Fix that by saving the original address and size and use them in the
error message:

(qemu) memsave 0xffffffff8418069c 0xb00000 mem
Invalid addr 0xffffffff8418069c/size 11534336 specified

Cc: Anthony Liguori <aliguori@amazon.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Borislav Petkov <bp@suse.de>
---
 cpus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/cpus.c b/cpus.c
index 0cdd1d71560b..a5c7cad00fc9 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1466,6 +1466,7 @@ void qmp_memsave(int64_t addr, int64_t size, const char *filename,
     uint32_t l;
     CPUState *cpu;
     uint8_t buf[1024];
+    int64_t orig_addr = addr, orig_size = size;
 
     if (!has_cpu) {
         cpu_index = 0;
@@ -1489,7 +1490,8 @@ void qmp_memsave(int64_t addr, int64_t size, const char *filename,
         if (l > size)
             l = size;
         if (cpu_memory_rw_debug(cpu, addr, buf, l, 0) != 0) {
-            error_setg(errp, "Invalid addr 0x%016" PRIx64 "specified", addr);
+            error_setg(errp, "Invalid addr 0x%016" PRIx64 "/size %" PRId64
+                             " specified", orig_addr, orig_size);
             goto exit;
         }
         if (fwrite(buf, 1, l, f) != l) {
-- 
2.2.0.33.gc18b867

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--


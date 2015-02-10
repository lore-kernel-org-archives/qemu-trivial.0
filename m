Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLG9N-0004GF-H4
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 14:07:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YLG9K-00048l-93
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 14:07:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YLG9J-00006j-8V
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 14:07:06 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40842)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YLG9E-0008Pz-7J; Tue, 10 Feb 2015 14:07:00 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A9643419B0;
	Tue, 10 Feb 2015 22:06:57 +0300 (MSK)
Message-ID: <54DA56D1.9000100@msgid.tls.msk.ru>
Date: Tue, 10 Feb 2015 22:06:57 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Borislav Petkov <bp@alien8.de>, Paolo Bonzini <pbonzini@redhat.com>
References: <1423340992-3156-1-git-send-email-bp@alien8.de>	<54D735D4.8000105@redhat.com>
	<20150208121438.GA6290@pd.tnic>
In-Reply-To: <20150208121438.GA6290@pd.tnic>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH] memsave: Improve and disambiguate error
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
X-List-Received-Date: Tue, 10 Feb 2015 19:07:07 -0000

08.02.2015 15:14, Borislav Petkov wrote:
> On Sun, Feb 08, 2015 at 11:09:24AM +0100, Paolo Bonzini wrote:
>> Cc: qemu-trivial@nongnu.org
> 
> Thanks.
> 
> But, there's more b0rked with this error message so you might wanna take
> the patch below instead.
> 
> Btw, what are the vim settings when doing patches for qemu, this must be
> documented somewhere as coding style differs significantly from that of
> the kernel?
> 
> :-)
> 
> ---
> From: Borislav Petkov <bp@suse.de>
> Subject: [PATCH] memsave: Improve and disambiguate error message
> 
> When requesting a size which cannot be read, the error message shows
> a different address which is misleading to the user and it looks like
> something's wrong with the address parsing. This is because the input
> @addr variable is incremented in the memory dumping loop:

Applied this version to -trivial, thank you!

/mjt


> (qemu) memsave 0xffffffff8418069c 0xb00000 mem
> Invalid addr 0xffffffff849ffe9c specified
> 
> Fix that by saving the original address and size and use them in the
> error message:
> 
> (qemu) memsave 0xffffffff8418069c 0xb00000 mem
> Invalid addr 0xffffffff8418069c/size 11534336 specified
> 
> Cc: Anthony Liguori <aliguori@amazon.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Borislav Petkov <bp@suse.de>
> ---
>  cpus.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/cpus.c b/cpus.c
> index 0cdd1d71560b..a5c7cad00fc9 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -1466,6 +1466,7 @@ void qmp_memsave(int64_t addr, int64_t size, const char *filename,
>      uint32_t l;
>      CPUState *cpu;
>      uint8_t buf[1024];
> +    int64_t orig_addr = addr, orig_size = size;
>  
>      if (!has_cpu) {
>          cpu_index = 0;
> @@ -1489,7 +1490,8 @@ void qmp_memsave(int64_t addr, int64_t size, const char *filename,
>          if (l > size)
>              l = size;
>          if (cpu_memory_rw_debug(cpu, addr, buf, l, 0) != 0) {
> -            error_setg(errp, "Invalid addr 0x%016" PRIx64 "specified", addr);
> +            error_setg(errp, "Invalid addr 0x%016" PRIx64 "/size %" PRId64
> +                             " specified", orig_addr, orig_size);
>              goto exit;
>          }
>          if (fwrite(buf, 1, l, f) != l) {
> 



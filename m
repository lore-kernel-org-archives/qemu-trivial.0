Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YKOo5-0006g0-ID
	for mharc-qemu-trivial@gnu.org; Sun, 08 Feb 2015 05:09:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YKOo3-0006fZ-11
	for qemu-trivial@nongnu.org; Sun, 08 Feb 2015 05:09:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YKOny-0003sw-6O
	for qemu-trivial@nongnu.org; Sun, 08 Feb 2015 05:09:34 -0500
Received: from mail-wg0-x230.google.com ([2a00:1450:400c:c00::230]:52119)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YKOnx-0003sj-Va; Sun, 08 Feb 2015 05:09:30 -0500
Received: by mail-wg0-f48.google.com with SMTP id x12so21286214wgg.7;
	Sun, 08 Feb 2015 02:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=ExYndRolzt+m+RjcMS+xinU9xzmeq+1pmqz48lj1X7A=;
	b=Xi0wCMPfYio5ba0eU4ku3dyWee2fcpk9Ce7BgKnNWV/GAUwomIz+lhlrFNz1puzmlz
	2GhmVyshS9LqcQT7V0mYiFJVAJGOSFkp069XsRDc5i7IYIOPqybZ0pyxmhi3m6EyKrKh
	9pzzQso12uS3+yRyt4qqVyl07YM463n+gdK+z05owTTIQyEGqTSxUVZ35TS/qMt5//H7
	vfLEuabAc2qfZ2kOrMJxY+MiLiBY+OTGPtWFHJ9018Z2kQ+NP5GyGM4RsnC3Y4OmJnld
	exf6VVJZk1MCC0oLPQB3OlNccndAoHtAHydpAWbnYC03pAHk4U9VRXZ1l6WruF/c+A19
	i7hw==
X-Received: by 10.180.19.7 with SMTP id a7mr22472478wie.62.1423390168885;
	Sun, 08 Feb 2015 02:09:28 -0800 (PST)
Received: from [192.168.10.150] (net-93-66-105-136.cust.vodafonedsl.it.
	[93.66.105.136])
	by mx.google.com with ESMTPSA id v7sm11221556wju.22.2015.02.08.02.09.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Feb 2015 02:09:27 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <54D735D4.8000105@redhat.com>
Date: Sun, 08 Feb 2015 11:09:24 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Borislav Petkov <bp@alien8.de>, qemu-devel@nongnu.org
References: <1423340992-3156-1-git-send-email-bp@alien8.de>
In-Reply-To: <1423340992-3156-1-git-send-email-bp@alien8.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::230
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH] memsave: Add a space after address in
	error message
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
X-List-Received-Date: Sun, 08 Feb 2015 10:09:36 -0000

Cc: qemu-trivial@nongnu.org

On 07/02/2015 21:29, Borislav Petkov wrote:
> From: Borislav Petkov <bp@suse.de>
> 
> Add the missing space to separate address from "specified".
> 
> Cc: Anthony Liguori <aliguori@amazon.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Borislav Petkov <bp@suse.de>
> ---
>  cpus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/cpus.c b/cpus.c
> index 0cdd1d71560b..4fa196d48207 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -1489,7 +1489,7 @@ void qmp_memsave(int64_t addr, int64_t size, const char *filename,
>          if (l > size)
>              l = size;
>          if (cpu_memory_rw_debug(cpu, addr, buf, l, 0) != 0) {
> -            error_setg(errp, "Invalid addr 0x%016" PRIx64 "specified", addr);
> +            error_setg(errp, "Invalid addr 0x%016" PRIx64 " specified", addr);
>              goto exit;
>          }
>          if (fwrite(buf, 1, l, f) != l) {
> 


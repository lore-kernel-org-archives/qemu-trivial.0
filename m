Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UdFpp-000425-M2
	for mharc-qemu-trivial@gnu.org; Fri, 17 May 2013 04:16:17 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UdFpj-0003u0-GV
	for qemu-trivial@nongnu.org; Fri, 17 May 2013 04:16:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UdFpc-0007Jx-Uy
	for qemu-trivial@nongnu.org; Fri, 17 May 2013 04:16:11 -0400
Received: from mail-gg0-x231.google.com ([2607:f8b0:4002:c02::231]:39015)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1UdFAD-0001zK-8Q; Fri, 17 May 2013 03:33:17 -0400
Received: by mail-gg0-f177.google.com with SMTP id r4so665104ggn.36
	for <multiple recipients>; Fri, 17 May 2013 00:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=HwswqXrzYcXdikZyERf650S8J2CntC8by9AMsenicgE=;
	b=HJeqFk7ts64iLg7uo/DNd6HV52nw2rPGdN3OFllT+qIwc5/dx9lt38VZ0dtRy6TB8f
	Yv+NiWxyKY+e1OeYuJLHB1SVJMm0mfS6OCiPMU4W1Ik1sQDazP1rGR2F4GTeqmHkfzqp
	XTL4/TJIhFmfImG9GWeICyeYhvQoS2Bdrkm37uleistKSGA2cRV06P+yZkCbJpYyi8u3
	NVafN0PNzPKIpDYzsGLCgNTMyi+Vfd2ClK7BH9hJtGq6D5FbEWD+Y96hHqkY3nUsr0IN
	NxiaVyGCyVRpDLVT4Ei1IULkOF9LVUxbnDzruITj/K6js6N4pS9YNsO/WNy+R5MbDRfR
	spzQ==
X-Received: by 10.236.220.138 with SMTP id o10mr15706106yhp.149.1368775996645; 
	Fri, 17 May 2013 00:33:16 -0700 (PDT)
Received: from yakj.usersys.redhat.com (net-2-35-204-156.cust.dsl.vodafone.it.
	[2.35.204.156]) by mx.google.com with ESMTPSA id
	s45sm15506031yhk.22.2013.05.17.00.33.10 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 17 May 2013 00:33:15 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5195DD24.10404@redhat.com>
Date: Fri, 17 May 2013 09:32:52 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: Ed Maste <emaste@freebsd.org>
References: <1368718348-15199-1-git-send-email-emaste@freebsd.org>
In-Reply-To: <1368718348-15199-1-git-send-email-emaste@freebsd.org>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c02::231
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for-1.5 v2] Rename hexdump to avoid
	FreeBSD libutil conflict
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
X-List-Received-Date: Fri, 17 May 2013 08:16:16 -0000

Il 16/05/2013 17:32, Ed Maste ha scritto:
> On FreeBSD libutil is used for openpty(), but it also provides a hexdump()
> which conflicts with QEMU's.
> 
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
> v1->v2: Add hexdump() use in iov.c
> 
> If desired I can workaround this via #define hacks in qemu-common.h
> instead; please let me know and I will submit that patch.  This is needed
> to build on FreeBSD.

No, it's fine and should be in 1.5 given the delay.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

>  hw/dma/pl330.c        |    4 ++--
>  include/qemu-common.h |    2 +-
>  util/hexdump.c        |    2 +-
>  util/iov.c            |    2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
> index 8b33138..60f5299 100644
> --- a/hw/dma/pl330.c
> +++ b/hw/dma/pl330.c
> @@ -1157,7 +1157,7 @@ static int pl330_exec_cycle(PL330Chan *channel)
>          if (PL330_ERR_DEBUG > 1) {
>              DB_PRINT("PL330 read from memory @%08x (size = %08x):\n",
>                        q->addr, len);
> -            hexdump((char *)buf, stderr, "", len);
> +            qemu_hexdump((char *)buf, stderr, "", len);
>          }
>          fifo_res = pl330_fifo_push(&s->fifo, buf, len, q->tag);
>          if (fifo_res == PL330_FIFO_OK) {
> @@ -1189,7 +1189,7 @@ static int pl330_exec_cycle(PL330Chan *channel)
>              if (PL330_ERR_DEBUG > 1) {
>                  DB_PRINT("PL330 read from memory @%08x (size = %08x):\n",
>                           q->addr, len);
> -                hexdump((char *)buf, stderr, "", len);
> +                qemu_hexdump((char *)buf, stderr, "", len);
>              }
>              if (q->inc) {
>                  q->addr += len;
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index 7f18b8e..b9057d1 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -443,7 +443,7 @@ int mod_utf8_codepoint(const char *s, size_t n, char **end);
>   * Hexdump a buffer to a file. An optional string prefix is added to every line
>   */
>  
> -void hexdump(const char *buf, FILE *fp, const char *prefix, size_t size);
> +void qemu_hexdump(const char *buf, FILE *fp, const char *prefix, size_t size);
>  
>  /* vector definitions */
>  #ifdef __ALTIVEC__
> diff --git a/util/hexdump.c b/util/hexdump.c
> index 0d0efc8..969b340 100644
> --- a/util/hexdump.c
> +++ b/util/hexdump.c
> @@ -15,7 +15,7 @@
>  
>  #include "qemu-common.h"
>  
> -void hexdump(const char *buf, FILE *fp, const char *prefix, size_t size)
> +void qemu_hexdump(const char *buf, FILE *fp, const char *prefix, size_t size)
>  {
>      unsigned int b;
>  
> diff --git a/util/iov.c b/util/iov.c
> index 78bbbe1..cc6e837 100644
> --- a/util/iov.c
> +++ b/util/iov.c
> @@ -225,7 +225,7 @@ void iov_hexdump(const struct iovec *iov, const unsigned int iov_cnt,
>      size = size > limit ? limit : size;
>      buf = g_malloc(size);
>      iov_to_buf(iov, iov_cnt, 0, buf, size);
> -    hexdump(buf, fp, prefix, size);
> +    qemu_hexdump(buf, fp, prefix, size);
>      g_free(buf);
>  }
>  
> 



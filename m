Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axWv2-0000xe-O4
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 05:47:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1axWus-0000ZS-0T
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 05:47:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1axWug-0003sk-DS
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 05:46:48 -0400
Received: from mail-vk0-x243.google.com ([2607:f8b0:400c:c05::243]:32867)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>)
	id 1axWuf-0003iN-6c; Tue, 03 May 2016 05:46:42 -0400
Received: by mail-vk0-x243.google.com with SMTP id o133so1275408vka.0;
	Tue, 03 May 2016 02:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AsOd5LNlqjT2Ckw/EJvm7JZn/jhoa702AxpQthhm8KU=;
	b=rCULzWuUmtg/bTOOU91eF1AXuwisa5AKpiD3ETgw7WVQweUpsx4qMl7jzyxUOIRHPp
	WXPp48LVP9D7p4TYWxY67/1Ogt0pVuwPjljGt4r2zTPU0MHOIxta8Hdd8jaYiCvkNaLf
	F1bfg95zm1h+OUU62EsNvCMQOkjjFfuGDmRWBpcoLfXoF6+4J9pVqrJZVYO1EdbZXBZd
	THFLvZNg3XwL0hioDbkUqqCWuNp183k5Wzld7J2H9hZftVKZIxa1GZVxWWpWs2LNASUv
	MsAaMudjaPWnDfJ5LPHTCx7UbSoVc+9/DesQ7qhYawH2vDqu9SMXT6C+IJwTB8eiWPFX
	YAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AsOd5LNlqjT2Ckw/EJvm7JZn/jhoa702AxpQthhm8KU=;
	b=MC3f9+hl5xx8pgZ/+zrS8RH+17Mj6o8CTdgyOhvpDsdhMOvSO1Yi7TlVFuhfDUFKuO
	Y5Tqj+7M8LdHNZNe6cV0oxC3LHjRVyfuqLr10RtfIwzXx0SyF7zMgrNhtiX1p6PYynge
	oiEW/Uw4KluAByMJOHcDinwjQTYyTn6+ZANeBNffA8C+uMSQ8Z+ixck0sirFDgF/z4s7
	dewG+78BbTQ6gAT7ET8T9cWKbSCORy0b25eitp+gmNssV8iI8A/FkviPr830M5NH7reR
	dltga3vi7IlFRebahEzLo4Shjp8oreR85VJKmxTO2v6Fwj9mwdvdhg3P6AuniKzm3aF0
	BpAA==
X-Gm-Message-State: AOPr4FX1xRJuIoreqAAtb1ET/Ku4iby3k5dQWC5Pi3Gr9W8puRtwQ3mmYHwclI+fVSmA9AQ/nZx80w+KKqIwrA==
X-Received: by 10.176.69.183 with SMTP id u52mr597897uau.30.1462268769375;
	Tue, 03 May 2016 02:46:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.184.134 with HTTP; Tue, 3 May 2016 02:45:50 -0700 (PDT)
In-Reply-To: <1459861743-4514-1-git-send-email-haris.phnx@gmail.com>
References: <1459861743-4514-1-git-send-email-haris.phnx@gmail.com>
From: haris iqbal <haris.phnx@gmail.com>
Date: Tue, 3 May 2016 15:15:50 +0530
Message-ID: <CAE_WKMyO1LjEZ_T5-O7=X=MOpSe7AqTeXTOOkfiZ114bGjNeDQ@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>, 
	Md Haris Iqbal <haris.phnx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] Changed malloc to
 g_malloc, free to g_free in bsd-user/qemu.h
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 03 May 2016 09:47:03 -0000

Just a reminder. waiting for a review for the previous patch.

On Tue, Apr 5, 2016 at 6:39 PM, Md Haris Iqbal <haris.phnx@gmail.com> wrote:
> Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>
> ---
>  bsd-user/qemu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index 03b502a..5fac42e 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -357,7 +357,7 @@ static inline void *lock_user(int type, abi_ulong guest_addr, long len, int copy
>  #ifdef DEBUG_REMAP
>      {
>          void *addr;
> -        addr = malloc(len);
> +        addr = g_malloc(len);
>          if (copy)
>              memcpy(addr, g2h(guest_addr), len);
>          else
> @@ -383,7 +383,7 @@ static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
>          return;
>      if (len > 0)
>          memcpy(g2h(guest_addr), host_ptr, len);
> -    free(host_ptr);
> +    g_free(host_ptr);
>  #endif
>  }
>
> --
> 1.9.1
>



-- 

With regards,

Md Haris Iqbal,
Placement Coordinator, MTech IT
NITK Surathkal,
Contact: +91 8861996962


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YZOPS-0007Hu-9x
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2015 14:46:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YZOPP-0007Ez-RF
	for qemu-trivial@nongnu.org; Sat, 21 Mar 2015 14:46:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YZOPM-0007YP-CH
	for qemu-trivial@nongnu.org; Sat, 21 Mar 2015 14:46:07 -0400
Received: from mail-we0-x231.google.com ([2a00:1450:400c:c03::231]:35780)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YZOPM-0007YJ-5c; Sat, 21 Mar 2015 14:46:04 -0400
Received: by webcq43 with SMTP id cq43so106180515web.2;
	Sat, 21 Mar 2015 11:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=OMcX0XKb0QR6z3BTuyFa/aLj+zwQkW8OBpF/nska9UA=;
	b=OaxGW8BSQ3uVTxAk0SLydCxtsnqswsTSuKvmI1czEZgspq5Tjbv6RPgc9wj6cOIS2V
	g/wHEIXOSDwn9bSaKW6hc1TZ3li3yNku/ybQQZ0zxIljWNpzQfU4OQ6Rrxv7yUsgMTSx
	2NEilIXcrTDurCkQT+8CW+9Zh+bCB2h/zhTFV66qy23vVsd2jTZ3cjSZ3E85+hufXP/1
	P9/pMv7SEtoO0FrhyPCNJ2Jqd6NT5WyR9UwZRUXRy+5W9+1y5AVWCTuNyisH5kDQ5tLR
	Ddzt1NWebw/PufcRrm1K6Q2cITs6XpaAaSHrAOAXmvsECwsixn6qE7zooRcrOiE7d1Iw
	Ti2A==
X-Received: by 10.180.101.225 with SMTP id fj1mr6254106wib.56.1426963563476;
	Sat, 21 Mar 2015 11:46:03 -0700 (PDT)
Received: from [192.168.10.165] (net-93-66-123-41.cust.vodafonedsl.it.
	[93.66.123.41])
	by mx.google.com with ESMTPSA id k4sm629717wiz.0.2015.03.21.11.46.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Mar 2015 11:46:02 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <550DBC66.1070803@redhat.com>
Date: Sat, 21 Mar 2015 19:45:58 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <550D8014.2020000@redhat.com>
	<1426958949-2729-1-git-send-email-cota@braap.org>
In-Reply-To: <1426958949-2729-1-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] target-i386: remove superfluous
	TARGET_HAS_SMC macro
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
X-List-Received-Date: Sat, 21 Mar 2015 18:46:08 -0000



On 21/03/2015 18:29, Emilio G. Cota wrote:
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>  target-i386/cpu.h | 2 --
>  translate-all.c   | 4 ----
>  2 files changed, 6 deletions(-)
> 
> diff --git a/target-i386/cpu.h b/target-i386/cpu.h
> index 15db6d7..4ee12ca 100644
> --- a/target-i386/cpu.h
> +++ b/target-i386/cpu.h
> @@ -31,8 +31,6 @@
>  /* Maximum instruction code size */
>  #define TARGET_MAX_INSN_SIZE 16
>  
> -/* target supports implicit self modifying code */
> -#define TARGET_HAS_SMC
>  /* support for self modifying code even if the modified instruction is
>     close to the modifying instruction */
>  #define TARGET_HAS_PRECISE_SMC
> diff --git a/translate-all.c b/translate-all.c
> index 9f47ce7..11763c6 100644
> --- a/translate-all.c
> +++ b/translate-all.c
> @@ -1334,8 +1334,6 @@ static inline void tb_alloc_page(TranslationBlock *tb,
>      p->first_tb = (TranslationBlock *)((uintptr_t)tb | n);
>      invalidate_page_bitmap(p);
>  
> -#if defined(TARGET_HAS_SMC) || 1
> -
>  #if defined(CONFIG_USER_ONLY)
>      if (p->flags & PAGE_WRITE) {
>          target_ulong addr;
> @@ -1371,8 +1369,6 @@ static inline void tb_alloc_page(TranslationBlock *tb,
>          tlb_protect_code(page_addr);
>      }
>  #endif
> -
> -#endif /* TARGET_HAS_SMC */
>  }
>  
>  /* add a new TB and link it to the physical page tables. phys_page2 is
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


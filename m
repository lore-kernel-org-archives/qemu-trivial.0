Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YZKOO-0004Ua-19
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2015 10:28:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YZKOL-0004RK-MC
	for qemu-trivial@nongnu.org; Sat, 21 Mar 2015 10:28:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YZKOI-0003Ah-HW
	for qemu-trivial@nongnu.org; Sat, 21 Mar 2015 10:28:45 -0400
Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232]:33794)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YZKOI-0003AQ-9o; Sat, 21 Mar 2015 10:28:42 -0400
Received: by wgs2 with SMTP id 2so4625915wgs.1;
	Sat, 21 Mar 2015 07:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=/Vy4POrjI/l7Feex+Sr/pA3OjKDeLmhxgcQkNntJO+Y=;
	b=FAaecsPToK1ZKnsccB9ztLijLOLYVY1KMit5VTdVQr3zTqnXRcqSHwbvX3CO6EBt2h
	+90B0B2P5k5q981WLaR6cE3VSbpjLEs393KlcTM0ejcpHzFQbuNkBKEdCT8tqBGNJK10
	ZrhmJq/ObBDBTGyVQ7rDKuwEmAnw2Uba+zffnek96b7yE/TfvGcUG+XUUKSgtWza/tQL
	JV7i6T/bW3DSqJ9oeqn1csjQISqM1CiDMN69Ae6vuYEc5s7f5PnGG2x9O0a9dQ+pf4wF
	hcIXWuHxuzGOO1P6mp8+jYpn+u/kmK+4HPNcMHu0ipM7fgvJQe2SZ8psvxEFyfEVXgYo
	dMWQ==
X-Received: by 10.180.106.68 with SMTP id gs4mr4758192wib.39.1426948121052;
	Sat, 21 Mar 2015 07:28:41 -0700 (PDT)
Received: from [192.168.10.150] (net-93-66-123-41.cust.vodafonedsl.it.
	[93.66.123.41]) by mx.google.com with ESMTPSA id
	dj4sm10837498wjc.13.2015.03.21.07.28.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Mar 2015 07:28:39 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <550D8014.2020000@redhat.com>
Date: Sat, 21 Mar 2015 15:28:36 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <1426919112-20726-1-git-send-email-cota@braap.org>
In-Reply-To: <1426919112-20726-1-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::232
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] translate-all: remove superfluous #ifdef
	FOO || 1
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
X-List-Received-Date: Sat, 21 Mar 2015 14:28:46 -0000



On 21/03/2015 07:25, Emilio G. Cota wrote:
> It always evaluates to true.
> 
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>  translate-all.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
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

You are removing the last use of TARGET_HAS_SMC, please remove the
definition as well.

Paolo


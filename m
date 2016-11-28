Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cBNW2-0007JV-EA
	for mharc-qemu-trivial@gnu.org; Mon, 28 Nov 2016 10:06:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cBNVw-0007JJ-SY
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2016 10:06:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cBNVt-00056E-L4
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2016 10:06:40 -0500
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34067)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1cBNVt-00055w-Dj; Mon, 28 Nov 2016 10:06:37 -0500
Received: by mail-wm0-f65.google.com with SMTP id g23so19514570wme.1;
	Mon, 28 Nov 2016 07:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=nPvFeuqgYO53f6xoEXnB7E884Ln2lFO0SqxQzXzoJEI=;
	b=Z5U/QPsACWZMhXaS8U0Iv9xCqyXfLBtAWD/YBRbY2O1dutDP2rfM7UG7Cl+z3HTgq7
	rrTAKtgGdI4eewyJISz6czClVwmZMq1f9gA0YiYXrcSgfddLSwLYtJbFvfrFNWwpPa5A
	g+XVsf4MhbcYBvf9r7jfhRqupwTvdFIzpJ2j4BKfYg/HfL1nbXNIjdRpJP5wa/51b4Wt
	dGY92FuiDtXib8mVkqJtbU1lzNTcG3Wq4X3BZD8IMGbb0HINoeDcaN31sRcjE8K7en2U
	CrN9+d1P5bCJRjce0QZXU7njkSE6oYHvwV71Ne1PRZsMyX8exu4cCQWiAnls4/1m8zXs
	bbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=nPvFeuqgYO53f6xoEXnB7E884Ln2lFO0SqxQzXzoJEI=;
	b=LxH2O3+r0SgBbZiFK12BD0CKJz3YvBxXNqm9xvDKp9ufns2vkIFNBpuJdeL3qxgL8z
	+llzU6QbM4gpHkJ1dPwvcmL+F7IHu1moSoNpgNJ7sNkcuXmqRJr0CnuHL/heZQLaK//O
	KymTrrGGZzn9wNllQfVr340KbxneGeVvs7NnOnZOCUdJrXRr/rNFbYyGZuiUBvFWjEC4
	X99QTCjgQpgnx4pRj11uUtsmc+WDhWJzw9wttEft61YFZV08c7AGkfYU4UCDlRdYYtyI
	+sASDFWGHCoxEC6TlR1qKzFKl+IhGMwEOt96WXxupbtrojTgt15fB/trmrM+qB1fQP2c
	whTA==
X-Gm-Message-State: AKaTC01Fxc26NLOzRGD0w6GXU8lpCDhGO3zLlCo5Q1fNIbKKZjN+UxRPZAWp6NATQ6MYpA==
X-Received: by 10.28.22.193 with SMTP id 184mr20147447wmw.100.1480345535651;
	Mon, 28 Nov 2016 07:05:35 -0800 (PST)
Received: from [192.168.10.165] (94-39-142-71.adsl-ull.clienti.tiscali.it.
	[94.39.142.71]) by smtp.googlemail.com with ESMTPSA id
	14sm29357494wmk.1.2016.11.28.07.05.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Nov 2016 07:05:34 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Adrian Bunk <bunk@stusta.de>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <20161127162817.15144-1-bunk@stusta.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a6630537-d71e-1b1a-4388-c91ba8cacbb7@redhat.com>
Date: Mon, 28 Nov 2016 16:05:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161127162817.15144-1-bunk@stusta.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.65
Subject: Re: [Qemu-trivial] [PATCH] rules.mak: Use -r instead of -Wl,
 -r to fix building when PIE is default
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
X-List-Received-Date: Mon, 28 Nov 2016 15:06:45 -0000



On 27/11/2016 17:28, Adrian Bunk wrote:
> Building qemu fails in distributions where gcc enables PIE
> by default (e.g. Debian unstable) with:
> /usr/bin/ld: -r and -pie may not be used together
> 
> -r and -pie cannot be used together in the linker,
> and position independent is already relocatable.
> 
> Use -r instead of -Wl,-r to avoid gcc passing -r to the
> linker when PIE is enabled.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>

I think this is a bug in the linker.  If the linker is producing
relocatable objects by default, it has no reason to refuse -r.  Have you
tried asking the binutils folks about it too?

But the patch would probably remove the need for LD_REL_FLAGS, based on
a quick look at the GCC source code, so I guess it's fine.

Paolo

> ---
>  rules.mak | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rules.mak b/rules.mak
> index 0333ae3..545ebd9 100644
> --- a/rules.mak
> +++ b/rules.mak
> @@ -93,7 +93,7 @@ module-common.o: CFLAGS += $(DSO_OBJ_CFLAGS)
>  	$(if $(findstring /,$@),$(call quiet-command,cp $@ $(subst /,-,$@),"CP","$(subst /,-,$@)"))
>  
>  
> -LD_REL := $(CC) -nostdlib -Wl,-r $(LD_REL_FLAGS)
> +LD_REL := $(CC) -nostdlib -r $(LD_REL_FLAGS)
>  
>  %.mo:
>  	$(call quiet-command,$(LD_REL) -o $@ $^,"LD","$(TARGET_DIR)$@")
> 


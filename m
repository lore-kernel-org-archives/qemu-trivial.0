Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e3PL6-0001YK-AG
	for mharc-qemu-trivial@gnu.org; Sat, 14 Oct 2017 12:31:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e3PL2-0001X2-Lq
	for qemu-trivial@nongnu.org; Sat, 14 Oct 2017 12:31:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e3PKy-0008BP-NZ
	for qemu-trivial@nongnu.org; Sat, 14 Oct 2017 12:31:00 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:55986)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e3PKy-0008Af-JK; Sat, 14 Oct 2017 12:30:56 -0400
Received: by mail-qt0-x244.google.com with SMTP id v41so14491016qtv.12;
	Sat, 14 Oct 2017 09:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aW6MpctRz/aOXfaEcupbVWDxsKSSJi36zHpFqxdypDw=;
	b=cc+af3cLI+/PBLWp5rR2TEhZxoXbDQT8XP7mntyLmSUmuPVnUKAju9ortIJXv6xBWe
	0shFp+eMAimY7dPweFvMnYuKC2venbHdcaI9nSh4C1fhRhgBGF99bvfr1ZVv8eJvMury
	YJAgWbBTOJdME3yO+fY9rw5RdwCIdiF3vn5VpxDdxjJNyXLOwodH8RKhEV+4cXIzlfe/
	9pFHqfsA+XGRa/X89tstG4O7Z3mCaW0s8pa+Hl7OXvGFPf6v28nbT+nNMPI8KIzWjWBR
	Vqcz9+BSVWxfw/NZ0f58lej1nR5TOr6JDom6HA1AGi42NtEfgjmNzm9jUDPr4YN9bSel
	YFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=aW6MpctRz/aOXfaEcupbVWDxsKSSJi36zHpFqxdypDw=;
	b=lao/5jKSenRZVVZAxUtdhPUE1gTv6B7oRwAvYW5Y00A6nTB03Ruu0lafe6d5wBAmWn
	eazxyASUiywNtfu5udJZjsmHeM4etmnjKAZvRDaA6QT6vSLf5GRHFcPwlXHvXpLNQz8n
	BO17x+2O2U0M9g/SJsjdPPs9vsXuVx9XKmjSfBro0+t0MkKR3EaYGCJ230cpm4ts6DcJ
	ZGrp5w7ctsyTtdA+jYbo1qWe56ARGx3frNc9F7IRByS97PR+25Bt55/Ig7o1woOXvwfM
	/4XqpMWTju5h0v6dayrP1jpAn/uapsbAsIW5qGiUbBiXnLNKQjIGkfqVpA2S4Jq2P1/M
	RuSA==
X-Gm-Message-State: AMCzsaWz1eO/l0jArcNuL+VXn+Y2MJ8f4VNv4gBNYW4XyTBkcwubBWoG
	fHlgXLj6/3Vq6s2WhG/Z4jbaEfeW
X-Google-Smtp-Source: AOwi7QDbcDvG62COy8C43CNO6iZ+DP/MDiHa9ZJ+ubwhN4A//yOuJnymh2/fqNNwMlplsCZEfVuGHA==
X-Received: by 10.237.53.137 with SMTP id c9mr7830577qte.125.1507998654662;
	Sat, 14 Oct 2017 09:30:54 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	q128sm1172594qkb.23.2017.10.14.09.30.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Oct 2017 09:30:53 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
References: <1507930220-17461-1-git-send-email-cota@braap.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <6defdad1-35aa-2849-8483-e714132fc2b1@amsat.org>
Date: Sat, 14 Oct 2017 13:30:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1507930220-17461-1-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] futex: add missing header
 guards
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
X-List-Received-Date: Sat, 14 Oct 2017 16:31:01 -0000

Cc: trivial

On 10/13/2017 06:30 PM, Emilio G. Cota wrote:
> The header file was introduced by fbcc3e5 ("qemu-thread: optimize QemuLockCnt
> with futexes on Linux", 2017-01-16) without header guards. Add them.
> 
> Signed-off-by: Emilio G. Cota <cota@braap.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/qemu/futex.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/qemu/futex.h b/include/qemu/futex.h
> index bb7dc9e..91ae889 100644
> --- a/include/qemu/futex.h
> +++ b/include/qemu/futex.h
> @@ -11,6 +11,9 @@
>   *
>   */
>  
> +#ifndef QEMU_FUTEX_H
> +#define QEMU_FUTEX_H
> +
>  #include <sys/syscall.h>
>  #include <linux/futex.h>
>  
> @@ -34,3 +37,5 @@ static inline void qemu_futex_wait(void *f, unsigned val)
>          }
>      }
>  }
> +
> +#endif /* QEMU_FUTEX_H */
> 


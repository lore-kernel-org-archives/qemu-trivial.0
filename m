Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j20qR-0003cg-Jr
	for mharc-qemu-trivial@gnu.org; Wed, 12 Feb 2020 17:50:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47958)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j20qP-0003cW-I4
 for qemu-trivial@nongnu.org; Wed, 12 Feb 2020 17:50:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j20qO-0005Ua-15
 for qemu-trivial@nongnu.org; Wed, 12 Feb 2020 17:50:57 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55202
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j20qN-0005UB-7G
 for qemu-trivial@nongnu.org; Wed, 12 Feb 2020 17:50:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581547854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2f4SMneFyOP4EZpuhnCgUYEzJ3aqLlkPMYPApKNwY2E=;
 b=IYDMIfNFKuHyoy8XRBkUb1aMw5iwIYjlf1utQfTcfZmZbWBHesey3YHg74o0wy8j9I5EPU
 y5HK0a8r23CzYFFcouk6AQ0Uywzt0b0CBs2EuH6RYr0Sus7jAFcD+6pHJ8NUoh+ya7RDsM
 CKNqnjRIyZLlyVO6BuesMJohhq1nTjg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-rupTOZ4bPkO1GbBdSEZ_4w-1; Wed, 12 Feb 2020 17:50:51 -0500
Received: by mail-wm1-f69.google.com with SMTP id n17so1343847wmk.1
 for <qemu-trivial@nongnu.org>; Wed, 12 Feb 2020 14:50:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jcp2cuRqv/gBSHR2CBLD5Q8MTpSBi69bWNS+nJmJLvE=;
 b=ICGvOz7XPRkYWEXq8Vtqz2FafHXZ0WrbNK8ulxCHFfbsWUETqLeuTtVxO1cSsSY1tP
 3wN07Ev6uQQ5WZRF7Cbvm4cxCAjNLMweJ92/tRd1atICteh2K1om9kHRr+7VVJQth6ta
 2qZ7Yn/shNKZL/xZmwoJEy3ckXZVvwR/An+aWa1LAhh99BRBMH38M3RPsyKChB46cPxd
 ncKsBdO0jhp+OfOIP87gfVN5mtwyF7BmhK1IiuHCEpCgnbsnXSBL6eV/YQQbm795lgT6
 lNnvqWxPG+ORzhcyXZ7aq4EqHDuRh/Jy7USvH8wCYzU7tX+t5WbNSoy0P55FU7XWl0LF
 yz7g==
X-Gm-Message-State: APjAAAXAAh05I2T1ZtrmiAVZHiObdmu61NE2zVKG5zU4aasWKS8e1AHS
 5GQORiPBmG7nWyVNrop5WWvntdz3VEXihbDPn5K1/mDHFdC/yar5JOS6gYit7i4qeKtyHv9atcS
 t5ecbc6g7cL2bsf3tBg==
X-Received: by 2002:a05:600c:10d2:: with SMTP id
 l18mr1353900wmd.122.1581547850892; 
 Wed, 12 Feb 2020 14:50:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqwqRW8m84nNnaZB/IOAjJfsQwuNUy+WU3iBhQlsc4k7Ql7dMDG3c5Xj6agxK4iVJHVIMxpAuQ==
X-Received: by 2002:a05:600c:10d2:: with SMTP id
 l18mr1353891wmd.122.1581547850732; 
 Wed, 12 Feb 2020 14:50:50 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id p5sm272720wrt.79.2020.02.12.14.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2020 14:50:50 -0800 (PST)
Subject: Re: [PATCH] target/ppc/cpu.h: Remove duplicate includes
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, David Gibson <david@gibson.dropbear.id.au>
References: <20200212223207.5A37574637F@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9aeada5e-9df3-310e-ede7-a6935d6285c4@redhat.com>
Date: Wed, 12 Feb 2020 23:50:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200212223207.5A37574637F@zero.eik.bme.hu>
Content-Language: en-US
X-MC-Unique: rupTOZ4bPkO1GbBdSEZ_4w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Feb 2020 22:50:59 -0000

On 2/12/20 11:26 PM, BALATON Zoltan wrote:
> Commit 74433bf083b added some includes but added them twice. Since
> these are guarded against multiple inclusion including them once is
> enough.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   target/ppc/cpu.h | 2 --
>   1 file changed, 2 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 3a1eb76004..07dd2b4da7 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -23,8 +23,6 @@
>   #include "qemu/int128.h"
>   #include "exec/cpu-defs.h"
>   #include "cpu-qom.h"
> -#include "exec/cpu-defs.h"
> -#include "cpu-qom.h"
>  =20
>   /* #define PPC_EMULATE_32BITS_HYPV */

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>



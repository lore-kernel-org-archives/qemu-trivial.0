Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiz48-0001vr-0m
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jul 2019 06:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47840)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hiz44-0001sT-Iv
 for qemu-trivial@nongnu.org; Thu, 04 Jul 2019 06:34:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hiz41-0004pc-Hd
 for qemu-trivial@nongnu.org; Thu, 04 Jul 2019 06:34:07 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45467)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hiz3x-0004mp-Jo
 for qemu-trivial@nongnu.org; Thu, 04 Jul 2019 06:34:03 -0400
Received: by mail-wr1-f65.google.com with SMTP id f9so6040244wre.12
 for <qemu-trivial@nongnu.org>; Thu, 04 Jul 2019 03:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JecvzOILnil/5Py/J52CW2xh+6hPJhjlC3JAJqNvav0=;
 b=g3/QJKCGcH3uwOg/CrJx7y9Hih2OavKoMITSDSDG7AKjFx/OwYh0TrQli40IT8XGIk
 KxoGpfb9FvpLSd8g5L+mynKz4BjrbBiEUI6HT6k/zCUnjMUHlfz+2SWwoRRYk0e4FKgr
 qT6uDtpAorWlA0n4f5gcb9ei8ARBzFDJUvLrtlCznDdBRBrFgd9IrpXb7by6t8Tm+pM6
 UpZKqMc7wCSKKtMVM2vFUhaRqIatA2EfQ3HCOmEao1tE+bHzEPsgTd4bRRf4PRUm6v+z
 ff9JhwLN+k2mavZUPwEM+zp0sfH2c/FVJNuvPlZh88Gw2LZp1XwaOOtSHypcehp0uEQ+
 QiPQ==
X-Gm-Message-State: APjAAAXXr1c8F6BsyKuQCswGOU58j8qsDhOpLMeQwpcIkA6TADI4DWXq
 EY2tPIBEpsmjosx/d9a0vH9mYw==
X-Google-Smtp-Source: APXvYqzfLxK7XE3wwIL/E08m/VYLxtj+i0nfSs3GUQ4biCskWOkcZf2I/QdTUTd+TqIRyaaR7vVxkA==
X-Received: by 2002:adf:f186:: with SMTP id h6mr15765369wro.274.1562236440503; 
 Thu, 04 Jul 2019 03:34:00 -0700 (PDT)
Received: from [192.168.1.38] (56.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.56])
 by smtp.gmail.com with ESMTPSA id 18sm4829527wmg.43.2019.07.04.03.33.59
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 03:33:59 -0700 (PDT)
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>
References: <20190626122042.7656-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <dfa56995-6a66-1aeb-4461-fb2919e8b699@redhat.com>
Date: Thu, 4 Jul 2019 12:33:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190626122042.7656-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-trivial] [PATCH 0/2] hw/timer/m48t59: Convert to trace
 events
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
X-List-Received-Date: Thu, 04 Jul 2019 10:34:09 -0000

ping?

On 6/26/19 2:20 PM, Philippe Mathieu-Daudé wrote:
> Another trivial cleanup series.
> 
> Philippe Mathieu-Daudé (2):
>   MAINTAINERS: Add missing m48t59 files to the PReP section
>   hw/timer/m48t59: Convert debug printf()s to trace events
> 
>  MAINTAINERS                |  2 ++
>  hw/timer/m48t59-internal.h |  5 -----
>  hw/timer/m48t59.c          | 11 +++++------
>  hw/timer/trace-events      |  6 ++++++
>  4 files changed, 13 insertions(+), 11 deletions(-)
> 


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fTBUY-0008AW-2y
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 15:31:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fTBUV-00089q-Er
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 15:31:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fTBUQ-0000mf-Fd
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 15:31:35 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:36354)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fTBUQ-0000mA-AA
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 15:31:30 -0400
Received: by mail-pf0-x241.google.com with SMTP id a12-v6so1943952pfi.3
	for <qemu-trivial@nongnu.org>; Wed, 13 Jun 2018 12:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=I584plQmRnrKsDIsrFZP/Q9dzsQq63GOdYbX3P5/oVQ=;
	b=J/3vYxXSwEFpYXFr7OfE7A0piaajpcMp39HtQgG6zHMlnXiYdmxPrkHnktZE3oJQ0f
	23PKhp5LfxcY2GaiLg1qjADKqEqhu/cRCGOSClIywDEoP7DoFtAhdFL8wKKckGBxIuTG
	axatZdA692nXhb9/8UaFPpGEI44Of1stEzSpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=I584plQmRnrKsDIsrFZP/Q9dzsQq63GOdYbX3P5/oVQ=;
	b=iAqWPYUNRxVDCk0paW7FZrP9iLy7+fnl8cZwJDus6HJfXCnbI8lJ1UbwTrZg61mDZQ
	GFDUVoOdi4AAHlAv+blzruICloP2qRPqw7gtZSny+z1BCiDtJhRsrSjRTewmyc7bYRg+
	WWyUkgT0+p42qsJ6vCW63adj7XdsSm12HjdywSG+LnaCk2IqEaGFSg5nbclanIfU1biW
	EuUuAe2DC71Gg1oUTJy4UJLmIlBcUljxU2m0MQqijBeWyp8/N2SqsLXuQATegtnAFzJr
	ktd7BH1npCdFTt1a+sKC8aVw2rT6cHZ748HVY9c2vv7SdljaNGr2I5ZEZlgx7sVgSfKD
	pmig==
X-Gm-Message-State: APt69E0owhngYKJoann4lyeMFcZlmTk+3PJH4ZFDrV4KZcA2kboAvnDA
	zzYNtf3Wsfk/2ZOo4bKBQ7WP3w==
X-Google-Smtp-Source: ADUXVKLeKjGzwSjG9ZREZvEV7NkOHe6TSjXf2H91dNwJAc7MzolgtjJF8jk+lNtPHaJfmIn242Rarw==
X-Received: by 2002:a62:494f:: with SMTP id
	w76-v6mr6165397pfa.152.1528918289368; 
	Wed, 13 Jun 2018 12:31:29 -0700 (PDT)
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com.
	[173.198.77.219]) by smtp.gmail.com with ESMTPSA id
	n85-v6sm5543811pfa.146.2018.06.13.12.31.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 12:31:28 -0700 (PDT)
To: Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Richard Henderson <rth@twiddle.net>
References: <20180611011501.10235-1-f4bug@amsat.org>
	<20180611011501.10235-12-f4bug@amsat.org>
	<15d222dd-d2e9-4855-62c6-f89f2ee59c52@linaro.org>
	<76aa5170-1d18-8799-6ff1-a7c0dba0b489@redhat.com>
	<8537ca07-2645-6c2c-5945-a91da035b474@linaro.org>
	<a856ef80-fcab-0003-2bdd-89a1849fe857@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7c27cd3e-124c-1c03-46de-1b016b37edf1@linaro.org>
Date: Wed, 13 Jun 2018 09:31:23 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <a856ef80-fcab-0003-2bdd-89a1849fe857@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 11/40] hw/xen: Use the
 IEC binary prefix definitions
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
X-List-Received-Date: Wed, 13 Jun 2018 19:31:36 -0000

On 06/13/2018 02:13 AM, Eric Blake wrote:
> Or spell it UINT64_C(1) if you don't want a cast.

Not unsigned is what I want most.


r~


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hOLhi-0001Ix-4y
	for mharc-qemu-trivial@gnu.org; Wed, 08 May 2019 08:29:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOLhe-0001Hq-UY
	for qemu-trivial@nongnu.org; Wed, 08 May 2019 08:29:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOLhe-00084x-3A
	for qemu-trivial@nongnu.org; Wed, 08 May 2019 08:29:42 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53741)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hOLhd-00084B-Tu
	for qemu-trivial@nongnu.org; Wed, 08 May 2019 08:29:42 -0400
Received: by mail-wm1-f65.google.com with SMTP id 198so3043624wme.3
	for <qemu-trivial@nongnu.org>; Wed, 08 May 2019 05:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JfFuS75QZH+ohLsy6LXoom87KOz5yO8X4rzQoE26WdM=;
	b=noU2DFQ5/VwlPA9yGLiTUEG8yAvCg3BTOQ8QfqBWcHDtiD8rKEbUs2iWNg4JFX1VjI
	RqETC2sDmrK6KpjqhFn6wgDy8EgeX1h9nyuh/gdfi5RfR5ATZAKNfAFC4C0HqAjPRmql
	L8l4C7J6qlK0TKthGI8L3cZBLOTem3BTcWRlbsfbp99smVNHlWYIobgCFocGeYaURcPb
	z2+FTwnPxhTPWYRUT5uh+fz16l6QZjvH+ka0LbDnY54Cft8robNG09NuJ9rJw6m/v2Fn
	Aw9cwTHsO1lfBszAZvsG+8kwv7yrDnCPKAJBwncgo/BlIbiC9R58oBq3oClnmBhlRND/
	V5PQ==
X-Gm-Message-State: APjAAAUIwhesRVM5UcJS237McfQ1Sz7S8Aacbg3yTZeHIAWvq1zGZJnZ
	XNIxuW4/3gE3+v2IJPHZOv90hQ==
X-Google-Smtp-Source: APXvYqx50V4x8C3El4RUMLnjDq146cRyQOX+DhvwIYQe0aWNg8y78cf8Yg8MxltDs5vqi31bxAY5BA==
X-Received: by 2002:a1c:7005:: with SMTP id l5mr2906265wmc.149.1557318580720; 
	Wed, 08 May 2019 05:29:40 -0700 (PDT)
Received: from [10.201.49.229] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
	by smtp.gmail.com with ESMTPSA id
	n2sm35418726wra.89.2019.05.08.05.29.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 05:29:38 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>, 
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
	Beniamino Galvani <b.galvani@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
References: <20190505180719.31913-1-philmd@redhat.com>
	<02ce0766-4464-2c71-6085-7e164d4405af@redhat.com>
	<ffaa93ed-f790-8aba-3683-d1e11e2ac59c@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <63fc48d2-2d33-c6b6-0e22-b8b2578b75ac@redhat.com>
Date: Wed, 8 May 2019 14:29:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ffaa93ed-f790-8aba-3683-d1e11e2ac59c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-trivial] [PATCH] hw/timer: Compile devices not
 target-dependent as common objects
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
X-List-Received-Date: Wed, 08 May 2019 12:29:43 -0000

On 06/05/19 03:06, Philippe Mathieu-Daudé wrote:
>> By the way, I was surprised to see TARGET_FMT_plx there, since I first
>> thought that this would be a target-specific define, too. But apparently
>> it is not. Very confusing. I'd suggest to rename that to HWADDR_FMT_plx
>> instead, what do you think?
> I'd rather use HWADDR_PRIx and slowly kill TARGET_FMT_plx...

Right, either that or rename it to HWADDR_PRI0x.

Paolo


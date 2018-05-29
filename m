Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNZWc-000357-N0
	for mharc-qemu-trivial@gnu.org; Tue, 29 May 2018 03:58:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1fNZWa-00034C-UF
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 03:58:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1fNZWX-0008NN-U6
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 03:58:33 -0400
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:40384)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcel.apfelbaum@gmail.com>)
	id 1fNZWX-0008NA-Nd; Tue, 29 May 2018 03:58:29 -0400
Received: by mail-wr0-x242.google.com with SMTP id l41-v6so23837270wre.7;
	Tue, 29 May 2018 00:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=7nD1BBqpdD4VDLB6Gdpy+0HF08nyq5zzUUygbI+OdKQ=;
	b=fvks6ne/LbTiL6fXruHBq0RjXDXQP6jH3UL3D85IvYXZI/FmuAllFjfYIAaIWvmyH5
	ycF20xSyEtaYXvaV9+Y36tCKQXo4RQxBJTaN9pzfC3jxssfSjepHmNgZDNnF0a3TVLqA
	XI6AW1wgz5zSlERLDGzEfcF91Ok0hjMYx1Q7KPuEyEt7FkZ1NgSO9LmUIhrDgNDLGYEb
	x3ONscAKIIiC3Wy03r1ML8ra2G9aklP645U2C6Bn03qDpmSVt+1QaXx7XdG6iGU6LZeE
	a2VxhPykiinwMBd7ooRwe0uXBd+AFVowhUQK/TkKM6UV0+lbvSXatTobHpwVsvpFX2H4
	uYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=7nD1BBqpdD4VDLB6Gdpy+0HF08nyq5zzUUygbI+OdKQ=;
	b=GNkOvVFQUuJ/cNQ7ZupyoWTVc6J2qtSGOQgoM6I8bFSZffpi6qZqrii5De9g35Lzs3
	hub4U+vWypONpQYZYefpwoA0vu5JVgUlYMjtJbT2PR9UsUvUNVS4hNOSZCDUu9V/mWIR
	6P6FqEap3KEMXGPHztIcA1ZnkKFCnuZCIFcjTstxwfWzt8ljdDgLkm7mA2//KG8IW5NP
	XK33xHnUHxi608v3zyBcKK3XY9W0bdcBz8u183vQRO1UV3cR4opCGiQE93z3JX+dNEd+
	z+VZSqfOMAnRPJt+meXD7QNtbZwEXxKS3lQFh2z5flLigd2pN/0AFoT+3DYyeGbvaqIR
	4KdQ==
X-Gm-Message-State: ALKqPwdB8B59SIOYtmPKvpp+OiZQnCc5AT7ThRt9qd0b24e6OQ2NddEu
	GGuvI8cHf0kb0yi4Fz0d1Pe4UA+u
X-Google-Smtp-Source: AB8JxZrvs7umIPraFBoFXY5ZWDTSt5wZoTTjZ3OYJWNCymDoaOvbFPjRIHlNH2KGa4+Xc0+BKlTHgA==
X-Received: by 2002:adf:e447:: with SMTP id
	t7-v6mr13717312wrm.145.1527580708591; 
	Tue, 29 May 2018 00:58:28 -0700 (PDT)
Received: from localhost.localdomain ([141.226.29.227])
	by smtp.gmail.com with ESMTPSA id
	d7-v6sm13427311wrm.9.2018.05.29.00.58.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 00:58:27 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-20-f4bug@amsat.org>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <a191de37-6b8f-33d3-cd9f-18b14af934b8@gmail.com>
Date: Tue, 29 May 2018 10:58:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180528232719.4721-20-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-trivial] [PATCH v4 19/21] hw/i386/pc: Remove unused
 include
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
X-List-Received-Date: Tue, 29 May 2018 07:58:33 -0000



On 05/29/2018 02:27 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/i386/pc.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index d768930d02..8b0803cb83 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -64,7 +64,6 @@
>   #include "hw/acpi/acpi.h"
>   #include "hw/acpi/cpu_hotplug.h"
>   #include "hw/boards.h"
> -#include "hw/pci/pci_host.h"
>   #include "acpi-build.h"
>   #include "hw/mem/pc-dimm.h"
>   #include "qapi/error.h"

Reviewed-by: Marcel Apfelbaum<marcel.apfelbaum@gmail.com>

Thanks,
Marcel



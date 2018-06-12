Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSqGz-0008Ur-F8
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jun 2018 16:52:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fSqGx-0008TI-6y
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 16:52:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fSqGs-0007XD-Dp
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 16:52:11 -0400
Received: from mail-pg0-x22e.google.com ([2607:f8b0:400e:c05::22e]:34036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fSqGs-0007Wg-6h
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 16:52:06 -0400
Received: by mail-pg0-x22e.google.com with SMTP id q4-v6so147122pgr.1
	for <qemu-trivial@nongnu.org>; Tue, 12 Jun 2018 13:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=b1gSaVppGgIx/EBkII+rv9pTH5Dv7otnmuNFE3mnwEo=;
	b=Ahf8Z/YgRwTJ3H4L+a9+ZsThT7KimdYyHmydoucLlGBO8SFy6BReDSFssxVlTsjkDc
	CX62yIWx432ttZbo6xyOkNdEOnoWcyqh4pfklHzzXD+llk8Op+QzaPdqPhs4taIUJUb+
	cjorbEUwYr+Yve9TxjRAxWy3JZA+5gdO4eteY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=b1gSaVppGgIx/EBkII+rv9pTH5Dv7otnmuNFE3mnwEo=;
	b=SYIKxpsNYTjqGDqINrx75hdNgVffgIbpTa7+K4aK2MtPc325gNigtWiOluRMZOJkqA
	pLngq9p6iqp6V0JdQxeex8M4bfUOj7mtaFJIcP4NAXBMrEjpSmYOMh4rK/OtVgGmoNb7
	q81CJwZ3rCF4UjFHhW/GF13rCZQTcL8FXgcC4w+vlmfbV+037tfdxhcF+RM4N6UvEfKD
	A2r/7DYuekN4ByvjS8hfUwMrPvUx/TCBzMiP4e3t4l/ayFXQ2QWEKV7eyStAPQIePwWw
	1Ba8OmOyb/yx+C+NI2GUnhfiiua1hzVrYJPyDv3tI5i2ile3ht0LWprvENICymLXIatn
	+ahQ==
X-Gm-Message-State: APt69E3jnWaZEzTtZmB7O0WGWbH5P6SaXZddaXoKDXLpZy+FePdr4/1N
	oWSq/vDkIyuaii4Sq6H8JzkZhw==
X-Google-Smtp-Source: ADUXVKKbF54yJGpGDfG6DUjVg9V+OrjfNaDYbycpXM/DzwFJeJeVL3xAN9zPptadFxsLcDGGnPZrdQ==
X-Received: by 2002:a63:6186:: with SMTP id
	v128-v6mr1658401pgb.35.1528836725050; 
	Tue, 12 Jun 2018 13:52:05 -0700 (PDT)
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com.
	[173.198.77.219]) by smtp.gmail.com with ESMTPSA id
	h8-v6sm915047pgq.35.2018.06.12.13.52.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 13:52:04 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, "open list:X86" <xen-devel@lists.xenproject.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Richard Henderson <rth@twiddle.net>
References: <20180611011501.10235-1-f4bug@amsat.org>
	<20180611011501.10235-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <15d222dd-d2e9-4855-62c6-f89f2ee59c52@linaro.org>
Date: Tue, 12 Jun 2018 10:51:59 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180611011501.10235-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22e
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
X-List-Received-Date: Tue, 12 Jun 2018 20:52:12 -0000

On 06/10/2018 03:14 PM, Philippe Mathieu-Daudé wrote:
>      xen_pv_printf(xendev, 1, "type \"%s\", fileproto \"%s\", filename \"%s\","
> -                  " size %" PRId64 " (%" PRId64 " MB)\n",
> +                  " size %" PRId64 " (%llu MB)\n",
>                    blkdev->type, blkdev->fileproto, blkdev->filename,
> -                  blkdev->file_size, blkdev->file_size >> 20);
> +                  blkdev->file_size, blkdev->file_size / MiB);

Having to change printf markup is exactly why you shouldn't use ULL in MiB.


r~


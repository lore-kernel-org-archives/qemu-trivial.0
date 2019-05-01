Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hLq1A-0001uY-W1
	for mharc-qemu-trivial@gnu.org; Wed, 01 May 2019 10:15:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLq16-0001rb-Ox
	for qemu-trivial@nongnu.org; Wed, 01 May 2019 10:15:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLq10-0006fG-A8
	for qemu-trivial@nongnu.org; Wed, 01 May 2019 10:15:22 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:45991)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hLq0y-0006eh-MZ
	for qemu-trivial@nongnu.org; Wed, 01 May 2019 10:15:18 -0400
Received: by mail-pl1-x629.google.com with SMTP id o5so8238424pls.12
	for <qemu-trivial@nongnu.org>; Wed, 01 May 2019 07:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=AaR/jWZxbFEORr7Pg8KcRpvGmry5QEQL1q30DXO3fCE=;
	b=yisvstR0Xv9+2lCuJ7UOkhC3H/nyy2XcjEjhpx2z9K/NVhP/3HAMO/Ce+dHYTovXb3
	39iv8EUqbw78qNDEEXrCShzTt9C4KQjtFUUvd+t5V2nQEg+7O7jDONqzRQQd8glrIr3D
	bZMTYxODYYZ2g3OrrZ0XS1JDfdEYjIZHxck3EIkCfHZTVZ+Ra0ZSXzuZmEDcv7fEzBz8
	mkQYU/QeKSZOJx1NzBVGfeYX8FgKneOnFBMNEqTX1ohnNv8cDXUfoXIiXrSol49Gt32j
	E0LFzC64Os8xjpymBy0RQ2tvo9WNLVOrdkph1homdFOexk8rL2WdLThHJh1Bv/xyc6t6
	dCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=AaR/jWZxbFEORr7Pg8KcRpvGmry5QEQL1q30DXO3fCE=;
	b=MQOrpFcUOeBJTvUL7EUorNpnbCy0+AMCQS4pDONZ4CzLYwMQCJUCz7YjQn039GjLfa
	1Med6gYwmO2yBITVTQBdSsq7dElOAFOm7DRYblFfSRXbYPATuja1rvJULkwbAGKrw4db
	zt95974KD5qc5KbfGQXy4+sdinNNG08MdC6NdIU6SjhJjuR3lYfoQOW5/TafC8clfSz5
	SZdfc2zE1eqyvokjZqMclPxGUzQuyxr3VDCDIfrLwBp+3tcEP0XWCpB75QUaphxqcen3
	94MFzikD5fg5/NZET5UzPJ8DIZsTkVc8Us6c6kZoWLBL4pVcPlbl65echu41U4PCfDMu
	Letw==
X-Gm-Message-State: APjAAAVYIj5HL49rh7lAzz04mt6uJeJ2rJqXqeooLkMhemXLYS2wcSTB
	ZTie7D85UcbdtUilD8okF7X/Cw==
X-Google-Smtp-Source: APXvYqyXs5wsZyEL1g/pKKOaz2QktcJKDIWocVZOHQweP1CKQ70bXkdRin5kQvMD6cAq4MP6qAPnmQ==
X-Received: by 2002:a17:902:5a03:: with SMTP id
	q3mr22132793pli.209.1556720115469; 
	Wed, 01 May 2019 07:15:15 -0700 (PDT)
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
	by smtp.gmail.com with ESMTPSA id
	e23sm8666087pfi.159.2019.05.01.07.15.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 07:15:14 -0700 (PDT)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"riku.voipio@iki.fi" <riku.voipio@iki.fi>,
	"laurent@vivier.eu" <laurent@vivier.eu>,
	"kraxel@redhat.com" <kraxel@redhat.com>,
	"alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1556666645.git.alistair.francis@wdc.com>
	<c4d2b1de9efadcf1c900b91361af9302823a72a9.1556666645.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <035c917e-be1c-1cda-6b1b-337fa804a69b@linaro.org>
Date: Wed, 1 May 2019 07:15:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c4d2b1de9efadcf1c900b91361af9302823a72a9.1556666645.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::629
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 5/5] linux-user/elfload:
 Fix GCC 9 build warnings
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
X-List-Received-Date: Wed, 01 May 2019 14:15:28 -0000

On 4/30/19 4:29 PM, Alistair Francis wrote:
> @@ -2872,7 +2872,7 @@ struct target_elf_prpsinfo {
>      target_gid_t pr_gid;
>      target_pid_t pr_pid, pr_ppid, pr_pgrp, pr_sid;
>      /* Lots missing */
> -    char    pr_fname[16];           /* filename of executable */
> +    char    pr_fname[16] QEMU_NONSTRING; /* filename of executable */

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


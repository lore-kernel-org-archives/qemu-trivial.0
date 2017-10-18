Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4fts-00027m-4y
	for mharc-qemu-trivial@gnu.org; Wed, 18 Oct 2017 00:24:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1e4ftq-00027e-SX
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 00:24:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1e4ftn-0002NW-K0
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 00:24:10 -0400
Received: from mail-pg0-x234.google.com ([2607:f8b0:400e:c05::234]:47188)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1e4ftn-0002Mv-DO; Wed, 18 Oct 2017 00:24:07 -0400
Received: by mail-pg0-x234.google.com with SMTP id r25so3223682pgn.4;
	Tue, 17 Oct 2017 21:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=heBhdBsTaEcevvheMB+hxA3Qegy3KRbSD+uxizfGTxk=;
	b=RgKHI6h7v9tALKM+O75xkJwdhFlr0FPIBmbCAqkiSRGNY27lmOjeb2QnAZF/DsRnqh
	ft0uFHbUeCVEsTSTIYJu0O+I5STdUSSPVX3gVHPXpScSZvNIoQNLISRx9JIKk0cJqeEf
	IfOUU1c9yixA95Pu+R0C/2x4cKHBMXZ7wwxSINvNC5J8Q9PyG8L2G1nsWxDEme9Q3KUI
	uT1RWTt5DuKgnP47hqMGT3rvwsk6KvCsVHMEUgUgDJqROHpau5LQKNRq6s4VoLVfNEz2
	KiHTOUYk2+YgbJ6zLLUArlBaVK7sxD001OjSO66UKfeLFudJK2utB7Z4CyS/HvqJk+gd
	pmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=heBhdBsTaEcevvheMB+hxA3Qegy3KRbSD+uxizfGTxk=;
	b=NdFgePa3Z9RqvZ5sEAbgYbd/CJ/82iGL6glYkDB1GaGsJPPGUQFEUHlC/6nC58VIyy
	twHzAHfgkQKACR5HuBpnN0xlpf2XEjtegpOylV0+Dv21+Ht6dqx+QzUC/x9VgKVrCDlz
	Uhh4Q+qc5FQmypgjbfadzhblbl6toblcWUeMWCtv68MJXWPZsrLEKiKZjxcANDgsQ9wQ
	VX5vtH70udG8yQg5EjEmnsoWAgTuQO15Y7C/wLJat5MFuVbVC3KHqW5WO5wr9E8V/zMO
	4Eim2SGH5OKU9nx2k8l/BR88pgyKaD54p4KwpmMdhu/dvxqBQelvdlen9382G715t+z2
	3AjQ==
X-Gm-Message-State: AMCzsaXxgt5KRf9sqMHmJ+kFx6tIf7yQG+Up/b8z6r5vEE1YiqSq0d1I
	YAR8+NhQGvQsuFrNLBXPVJelQlrg
X-Google-Smtp-Source: AOwi7QCkKzaCDbjdjueUQmf3S+JPulV/WHlESfTMhhyWw287SV1+qXcFIkUhxl71kkt317xFyV610Q==
X-Received: by 10.98.34.131 with SMTP id p3mr13511175pfj.1.1508300646237;
	Tue, 17 Oct 2017 21:24:06 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-104-76.tukw.qwest.net.
	[97.126.104.76]) by smtp.googlemail.com with ESMTPSA id
	u77sm17939538pfd.168.2017.10.17.21.24.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 21:24:05 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20171018000053.27348-1-f4bug@amsat.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <eec60d48-c410-6201-2d67-81e29d6c6c33@twiddle.net>
Date: Tue, 17 Oct 2017 21:24:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171018000053.27348-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::234
Subject: Re: [Qemu-trivial] [PATCH v2] hw/alpha/typhoon: simplify using the
 "unimplemented" sysbus device
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
X-List-Received-Date: Wed, 18 Oct 2017 04:24:11 -0000

On 10/17/2017 05:00 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: add spaces for checkpatch...
> 
> ERROR: spaces required around that '*' (ctx:VxV)
> #82: FILE: hw/alpha/typhoon.c:880:
> +    create_unimplemented_device("pci0-io", 0x801fc000000ULL, 32*MB);
>                                                                 ^
> total: 1 errors, 0 warnings, 57 lines checked

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


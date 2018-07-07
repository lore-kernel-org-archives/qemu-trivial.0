Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fbeE4-0007qI-N9
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jul 2018 23:49:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fbeE2-0007p4-Ku
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 23:49:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fbeDz-0001U3-HU
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 23:49:34 -0400
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:35709)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fbeDz-0001Sx-Ak
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 23:49:31 -0400
Received: by mail-pl0-x244.google.com with SMTP id k1-v6so3671620plt.2
	for <qemu-trivial@nongnu.org>; Fri, 06 Jul 2018 20:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=dYSGRY+7dlcOMiwTo61yy3Dtuqy0BY7RgDlmykicAtU=;
	b=TwW76dj2cGWzrcK1eu1WL43xm8rrFgzYhZWiJCVAqgTkIJEKZ171UyuFsWB3nGZt91
	ZyJ+5ilJc7ei6yNYSMkT4Z7rHXri8AH/kJURVOuBKJ58n6fftU5/pCgCgHzgIZkli9Hw
	Y8Z7aUCJgPAwJUuf/P7CueIf72bCXAYb5qNqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dYSGRY+7dlcOMiwTo61yy3Dtuqy0BY7RgDlmykicAtU=;
	b=skxCdnAJZuZJDeFI9RUFqNQjS9Wcv6LgQgYfa+SzNChhm3DSUbx/eWGsQZcmfJ0SKq
	94E12SDKR6iNR8Bw9E4kz84W8LjtsIgSHOH6tTrxmcXo62hLniyZ2bqPce3aAUeaIZrX
	A9j9EWkcwxSnibNrw4yWbntCLjOtqxuNIxgJjdAjr/gAuLu4OA4LFQuFdnURIEwA0A6E
	P0PWo1Mam0I8ukhgq72LdCGaAWVIlyN/wIB9drl0+T8lemGaXfv7C+7sWZcjl2GpjRJq
	ExGMNPIIxJKEGz4ljp3Vu6hQwODMLa/pukchHppD3m5nJdS9dYVa7gEsh969dElv1V5U
	2X1Q==
X-Gm-Message-State: APt69E05BiHrymllbFCJ3Gi2HnhxIuuEnVB2G8kTRy6RdERjQWZkhQr9
	64NqT2cMRHu8SmX7ECoPUKfmmQ==
X-Google-Smtp-Source: AAOMgpcOOc1qv9HKoZW6JFHC0YvTX9ffvWqo2PrUcDgU6odxY19d9njOFQB9x/GWdfe+FaabAM9hEA==
X-Received: by 2002:a17:902:2d24:: with SMTP id
	o33-v6mr12582927plb.14.1530935369923; 
	Fri, 06 Jul 2018 20:49:29 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	g14-v6sm15282733pgo.76.2018.07.06.20.49.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 20:49:28 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	qemu-devel@nongnu.org
References: <20180706155127.7483-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f7cff7e8-1783-1eeb-151f-7f1a02fb1ca3@linaro.org>
Date: Fri, 6 Jul 2018 20:49:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180706155127.7483-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-3.0 0/3] Sanitize
 linux-user stdout
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
X-List-Received-Date: Sat, 07 Jul 2018 03:49:35 -0000

On 07/06/2018 08:51 AM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (3):
>   linux-user: Do not report "Unsupported syscall" by default
>   linux-user: Do not report "syscall not implemented" by default
>   linux-user: Report error message on stderr, rather than stdout

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


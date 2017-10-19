Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e5K2Z-0002tl-F8
	for mharc-qemu-trivial@gnu.org; Thu, 19 Oct 2017 19:15:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e5K2X-0002tb-CB
	for qemu-trivial@nongnu.org; Thu, 19 Oct 2017 19:15:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e5K2U-0001g8-67
	for qemu-trivial@nongnu.org; Thu, 19 Oct 2017 19:15:49 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:52973)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e5K2T-0001fe-V6
	for qemu-trivial@nongnu.org; Thu, 19 Oct 2017 19:15:46 -0400
Received: by mail-pf0-x241.google.com with SMTP id e64so8194829pfk.9
	for <qemu-trivial@nongnu.org>; Thu, 19 Oct 2017 16:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=0Rpfnj2BWfcUlw/Kc8Ju9TuuGRYTSjChHQwAIbWRroc=;
	b=iblPaignguHKp4Czpe6kdeC1hZ1+RIYHOyslp7jEs4k5TBg8Yf8a/DCe0Ref8loJFY
	ghi3Cyi6C/E9IuvC1oAfQ2gAON/ukQJLdUJCGxd9g0/O/OzWwkFxWF5E65ebPTUVcyyd
	JQavKw8kF0KYPBPHhLukTn1mY/lDZv7e4C9t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0Rpfnj2BWfcUlw/Kc8Ju9TuuGRYTSjChHQwAIbWRroc=;
	b=Qn6u9jfVFo/+PZLaHeKMwS3qaj2+WWsVvVM0fWVQmvb+PrCuwo+w5+7Ys9IbtTx+iW
	QOOzqFVTHq4Kgm1e4MvjmM2F0OmtNpopoUZ+yeK9dls5NzTMfCHEHTvxDXoItwkkM6nQ
	0FNunruzJNlVEJ0NJggEw/l4MXRcBx6ISfAX+m574Guld5FJcsL+fAzq9yheoQT0nV2P
	tTHFwuQj6nM4erTvvVtylPp8lnSBvskkWoD4KoBsqzzUETCl3NwT/5L4ro9zUHrJgu7+
	VGJ2jNKWzeSIRqE9iei5mG7TdvNL+LsOrNd1pc5YZiySRxFK7KzPSEGnhVcmGa2Cj3tb
	FAMg==
X-Gm-Message-State: AMCzsaVT9jfKOPejzKlOUIxFcRwSPMD091xUlrChYeZSJsvawYaAAmDV
	YA5t8eF5fI9V0iJgLi8nDyoUpw==
X-Google-Smtp-Source: ABhQp+QbcbAkhK+jBK1dIyM1sVUJOQBsdr9xudipdaGJa1IVnNYBYE379yuH/77+0J6RgP6dXyr+Sg==
X-Received: by 10.99.3.1 with SMTP id 1mr2698546pgd.111.1508454944807;
	Thu, 19 Oct 2017 16:15:44 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-165-104.tukw.qwest.net.
	[97.113.165.104]) by smtp.gmail.com with ESMTPSA id
	q73sm29513479pfl.146.2017.10.19.16.15.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Oct 2017 16:15:43 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20171017225025.25451-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fb6141dd-d31e-5a8e-6d0d-a00c1ff9aa34@linaro.org>
Date: Thu, 19 Oct 2017 16:15:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171017225025.25451-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/alpha/typhoon: simplify
 using the "unimplemented" sysbus device
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
X-List-Received-Date: Thu, 19 Oct 2017 23:15:50 -0000

On 10/17/2017 03:50 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/alpha/alpha_sys.h |  1 -
>  hw/alpha/pci.c       | 26 --------------------------
>  hw/alpha/typhoon.c   |  6 ++----
>  3 files changed, 2 insertions(+), 31 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


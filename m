Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gygNB-0000Nb-Pv
	for mharc-qemu-trivial@gnu.org; Tue, 26 Feb 2019 12:18:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gygN9-0000NU-Rh
	for qemu-trivial@nongnu.org; Tue, 26 Feb 2019 12:18:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gygN6-0003AU-46
	for qemu-trivial@nongnu.org; Tue, 26 Feb 2019 12:18:26 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42453)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gygN2-000376-RU
	for qemu-trivial@nongnu.org; Tue, 26 Feb 2019 12:18:21 -0500
Received: by mail-pf1-x42c.google.com with SMTP id n74so6543416pfi.9
	for <qemu-trivial@nongnu.org>; Tue, 26 Feb 2019 09:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=K3NpLjts9s/2ahZtZuQkiyVhH7m5HxJDx0hKfFMbOGE=;
	b=M5eSzvelhiPV13VSWM0JuL61iSPyLhW6dZCelokjcuyBJNlUxftcgELv/MsKO1O/L9
	K0v+x8b8kpy3jE2AlZxuuqgz6VrxxPZr4UpDxUlY3SdlpVwzpRxvR87rHee2ZnotOt/J
	60HkoC5Uca6rXoKlEzNYXzY+GD9enX6BbxAUpm3tO4FcfcHAtvi9AXSOTIbLlXulvXcy
	V76ZOqibJrZlMnn08Imo08gTz8FuwMZpof3J+8i1iATn92C+wJgjpz3pIYx3BSd8a6y9
	DYKOBU7AFualv+cF+ns8Tkn6RnbuJI1MmZv7cUCbpT+Nez3gG2O4WIOUoknFIjQeoeap
	oM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=K3NpLjts9s/2ahZtZuQkiyVhH7m5HxJDx0hKfFMbOGE=;
	b=AyD15sgaZJif0pPKhdmzvg68jE7EbMAj9CvV6xWFyzevwoEmk8HRdg02gyUZVNB2Rl
	aONYLQRuHNOoRGOzh1iJobUqxi5sJIp6i7jzIDUariFNxpjqfch+apRL9RP4YHM01GN1
	5wGFN3ytjPX14j4JiynKRjjGql/wZqNRvCr2wN4QlifUpr88EHRsISSClW48xvL6u6Eu
	gP9O593bbpbyefrijbcMZMIPkqpAsvschvmV/7mt81+STX0qDoo5U206Ix0BPXlJXOf1
	7VIk/bAEHGhNSArVCs7lkzMYmuAl43lTIQxj334fiz8lEyR9fJgs5JZiyCE1UzXza5r5
	JKdw==
X-Gm-Message-State: AHQUAua7r/xxaBQgVLG6Av6262fwJQcVzYFuP+Oh5ohWvI2ZQAdJywKp
	JuRgNQiIF0tTTFObLWZBa8jrGZoylk8=
X-Google-Smtp-Source: AHgI3IbXkqSAmUG+DweYNBMa9jEdowrI9g+t7hfFVD3Vp9u+vMXTRos50ZcU98zuM25dMD+a4FV6fw==
X-Received: by 2002:a63:e553:: with SMTP id z19mr25224354pgj.331.1551201499285;
	Tue, 26 Feb 2019 09:18:19 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	a4sm23433880pga.52.2019.02.26.09.18.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Feb 2019 09:18:18 -0800 (PST)
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
References: <155119086741.1037569.12734854713022304642.stgit@bahia.lan>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6559ab4e-abc1-5c48-80a9-3787ae95fda1@linaro.org>
Date: Tue, 26 Feb 2019 09:18:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <155119086741.1037569.12734854713022304642.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42c
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] bswap: Fix accessors syntax
 in comment
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
X-List-Received-Date: Tue, 26 Feb 2019 17:18:28 -0000

On 2/26/19 6:21 AM, Greg Kurz wrote:
> All accessors that have an endian infix DO have an underscore between
> {size} and {endian}.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  include/qemu/bswap.h |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


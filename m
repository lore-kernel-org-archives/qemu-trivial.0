Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eHEjw-0004P3-Jh
	for mharc-qemu-trivial@gnu.org; Tue, 21 Nov 2017 15:01:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eHEju-0004N1-Ho
	for qemu-trivial@nongnu.org; Tue, 21 Nov 2017 15:01:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eHEjp-0001Vv-RM
	for qemu-trivial@nongnu.org; Tue, 21 Nov 2017 15:01:50 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:41418)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eHEjp-0001V2-Kz
	for qemu-trivial@nongnu.org; Tue, 21 Nov 2017 15:01:45 -0500
Received: by mail-wm0-x243.google.com with SMTP id b189so5911793wmd.0
	for <qemu-trivial@nongnu.org>; Tue, 21 Nov 2017 12:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=tYId9cOx+2sgXH1GZS6ihJuBr1C+IhoLKidn+S4vYqs=;
	b=TTOv/yRyOr15JP+cmpGrzFA+qPVDCp+1R3F+GYJHCEM3iHkQVBqa72pmiyblDImiSz
	u98uVWNG54m46KB8RikbiNd/K/S+GMmNCpu6i5SWy2712Uqld1Bmq4tACJ3KWThMgq0M
	DzEV8F1h5q+eWHvbo6PkvNrVAYJ7ciAVsnAHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tYId9cOx+2sgXH1GZS6ihJuBr1C+IhoLKidn+S4vYqs=;
	b=lW5CRHZcU8wKPdDKZa6lsRB1NNXCmo3LKudnA04Dn/CoFCiYYqj8+fhusroTHTAVTG
	1oQN4be/l5yB8ymC+W43BhXTRcIn/ch0GW7OqZ4TT15PDRWGaAAnZR2HU0AMUpboTAwq
	9zwNAQv6+T3m5WNfpVyRSpOdlR6g+Ibf2Vp/ef3bpk3+fnA1QVIm37AaGyOrT20LvxFv
	ZPz4bu8PukHAyE+LKPIgaBcqBGHj1ZYDUJhpmWygSpK8NsHOeRFEDP0K+GDtu+5+C6Sm
	a1VMCO7FR9SSXlHzPHIr99hNvRQM1bDnp7xd8eA1QZnqV84KKuNWJ2HCwQFHRhL8oaP4
	wdBQ==
X-Gm-Message-State: AJaThX7NJhKijVTdj/uByBXPIyjelgeD0Di9zqr3WfIAC/qn8kJ83Zmf
	/Rkq3e3ZP1oxuFAULjIb99PpTA==
X-Google-Smtp-Source: AGs4zMa0UIu7Kj+Q9oyz8cV6cHhKqRwJrsWDInPBOzakK/pXcH9YTqozCtXjQcIGqrF5RakJ6Zs1VQ==
X-Received: by 10.28.202.11 with SMTP id a11mr2214733wmg.77.1511294504359;
	Tue, 21 Nov 2017 12:01:44 -0800 (PST)
Received: from cloudburst.twiddle.net
	(70.red-37-158-60.dynamicip.rima-tde.net. [37.158.60.70])
	by smtp.gmail.com with ESMTPSA id
	o190sm3084626wmd.32.2017.11.21.12.01.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Nov 2017 12:01:43 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
References: <1511276851-17680-1-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d7501f95-225c-b423-3dde-8f9bb04aadd0@linaro.org>
Date: Tue, 21 Nov 2017 21:01:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1511276851-17680-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH]
 accel/tcg/cpu-exec-common.c: Remove unnecessary include of
 memory-internal.h
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
X-List-Received-Date: Tue, 21 Nov 2017 20:01:51 -0000

On 11/21/2017 04:07 PM, Peter Maydell wrote:
> The cpu-exec-common.c file includes memory-internal.h, but it doesn't
> actually use anything from that header. Remove the unnecessary include.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  accel/tcg/cpu-exec-common.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


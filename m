Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSq7z-0004u5-4H
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jun 2018 16:42:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fSq7x-0004tl-Hx
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 16:42:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fSq7u-00016e-Fh
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 16:42:53 -0400
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:40619)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fSq7u-00016C-1X
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 16:42:50 -0400
Received: by mail-pl0-x243.google.com with SMTP id t12-v6so153257plo.7
	for <qemu-trivial@nongnu.org>; Tue, 12 Jun 2018 13:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=3aqevszYTZYj1bGWxByRs2qTHFHlo5pRcOMOtyazFEA=;
	b=jlfPiIxRFCObvoq3sbnr+zuTMikdtwHfmqOTbXjCJ4IDzl4Xl5opbU+8uJkj/u3ujc
	tgAFMbNApua/47QVTEg3WdnFMjCH3Ru1ntks/FzllKzXDF8Dz06+n8yvKfhKQXS6fkEa
	p058TKyP0H+TiEgs5bKIpHHG0ZBNWNWRZ1+WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3aqevszYTZYj1bGWxByRs2qTHFHlo5pRcOMOtyazFEA=;
	b=fXLkiqnmD1xVYxkGWfay1qVrzQOh+3aNY4K/z6oLfIaxDME7sVcSCPAdgPl1qLnjWJ
	9m59tKIacVcQNMaf7xM3sHwMD11kAwhDhaIUYPyfXcvsTVty69zIwoGfctWFMX+rH7ka
	OcFGe1wsFXpX2n4yEhisN29kPMF1QAmNtPhxazGCsmHngUIDEzcM38WyrGPmnN7NPneo
	e30OxIJ+WdWvzAe+V1NE7LfXUixx29U0aWJZi0tX22a0+K24xYNsyO4gz1boDqiPOaQs
	THd0dB/J+Vm2VrD1I8T0wCMCjWypdaf71CihmG2tCiax4vE9+OA/0DTjweAczzBxXPFc
	KoPA==
X-Gm-Message-State: APt69E1vr/DLhm/4azRItrGLwWERvxg8DLBFeKh7FdQL0Tbgyx7ZsqR/
	aAr3EUbSrN60itAI79Donnh3fw==
X-Google-Smtp-Source: ADUXVKJQiNlqsjdJD9jN5lh9ZgBWcoaT1MWxIlI8AuvRBjjje5PpU+wgoKk03uwyyhkrzEFObKQgmg==
X-Received: by 2002:a17:902:563:: with SMTP id
	90-v6mr1993763plf.327.1528836168972; 
	Tue, 12 Jun 2018 13:42:48 -0700 (PDT)
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com.
	[173.198.77.219]) by smtp.gmail.com with ESMTPSA id
	y2-v6sm1305301pfk.82.2018.06.12.13.42.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 13:42:48 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, Thomas Huth
	<thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20180611011501.10235-1-f4bug@amsat.org>
	<20180611011501.10235-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <08e5205f-c3e4-6a13-80da-cde7f51e831b@linaro.org>
Date: Tue, 12 Jun 2018 10:42:43 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180611011501.10235-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 01/40] include: Add IEC
 binary prefixes in "qemu/units.h"
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
X-List-Received-Date: Tue, 12 Jun 2018 20:42:54 -0000

On 06/10/2018 03:14 PM, Philippe Mathieu-Daudé wrote:
> +#define KiB     (1ULL << 10)
> +#define MiB     (1ULL << 20)
> +#define GiB     (1ULL << 30)
> +#define TiB     (1ULL << 40)
> +#define PiB     (1ULL << 50)
> +#define EiB     (1ULL << 60)

Is there any particular reason to force these to be unsigned?
Or, for that matter, 64-bit (at least for the first 3).

I ask because this changes the types of some of the expressions
in which you use these.


r~


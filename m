Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY3Kj-0008E1-1q
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 01:49:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3Kg-0008Bl-7Y
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 01:49:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3Kd-0000zC-5l
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 01:49:34 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:35431)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY3Kc-0000z1-VD
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 01:49:31 -0400
Received: by mail-pf0-x242.google.com with SMTP id c22-v6so474975pfi.2
	for <qemu-trivial@nongnu.org>; Tue, 26 Jun 2018 22:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=JZ6+PJurYr93fa70lhLxMT/28Cg0WoX6QxDuL+4B3Ls=;
	b=DBVRuxYU6QT8WQl6JJUDd2yWRjtGCCZAY0/avV9ek2GHJ8nAQeGsuFEyk1Eet38G4q
	7FdJRUytJw4su+8ESaKm71uS8m2qGlqsC3J7BfDZzY1vSOllsQzcRzMgJaHvmcwnoayV
	rfYTyu4OI/okF+8tfeTuugiWNrWfCHJl2B6nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JZ6+PJurYr93fa70lhLxMT/28Cg0WoX6QxDuL+4B3Ls=;
	b=Q8DbzQtrFlDsAku9mWJXc/s/tk/kk1ghq1Y/13IiWNOD3RyqSoGpSiSl5gtaDYTCZK
	nOSRSnf7LPeQph38vbt1Vt6nYm0EK/JQsBPM45pO7uop8xDkvLNqR0sU3kFdGZjhCnTk
	lHr0hf6YMYuihAW16wBpzLHLDONx1DKfLKJzOQNkafHc8xPu7ZQi0Majc0H6XVK1kkqT
	97frqyG0ClpzbguoKGILheLlEn+Pe7A/ZZZjiUfcFFOuJZEJgPQqExW+aBK3qVKlT35I
	eUDo9t965QcZLMVOlZ7LQOYUMdyIrstXwoVBX6MHjC1CgCPntSKgEiIyh6eOo0b7dH1n
	iKDw==
X-Gm-Message-State: APt69E3V1E9GweHwkurjQSkmH+fffdN0sqyJWKDuRFaEL+Ol60pe+ByU
	iQslO3f37VtkUJP2kx694N68zw==
X-Google-Smtp-Source: ADUXVKLcL6dveLtidEs/LZzZntiyaR9EtoHUrwCxub+7bct+9ICe2/YD+gs0rTuK/BN6BzOrEC+Cog==
X-Received: by 2002:a65:6094:: with SMTP id
	t20-v6mr3989171pgu.264.1530078570049; 
	Tue, 26 Jun 2018 22:49:30 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	n22-v6sm4268992pgv.60.2018.06.26.22.49.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 22:49:29 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <176cf145-d8cc-c875-3981-66b68091b33f@linaro.org>
Date: Tue, 26 Jun 2018 22:49:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 03/46] x86/cpu: Use
 definitions from "qemu/units.h"
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
X-List-Received-Date: Wed, 27 Jun 2018 05:49:35 -0000

On 06/25/2018 05:41 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Acked-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  target/i386/cpu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fYBdz-0000az-0c
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 10:42:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fYBdw-0000Y4-QQ
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 10:42:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fYBdw-00059L-24
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 10:42:00 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:34705)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fYBdv-00058X-SQ
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 10:41:59 -0400
Received: by mail-pf0-x241.google.com with SMTP id g3-v6so1076238pfi.1
	for <qemu-trivial@nongnu.org>; Wed, 27 Jun 2018 07:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=P53lNBYua9/+PqoS2kwEIiTZRgHnmXYmW9wFUKdKB/0=;
	b=OOGi+OSNRW0LFT3f3i8Y9GXGioEu78fyDc1gzrfkdq/cnxD78bT9rINqpUX4stWOAk
	jtwjYqE3H6wXnHvSQJP8GwiYuTfufqPJTykscCfUl43q/ATIlL+fjGC27vpFgWj5mU/D
	3xBOklrv+vulH41JtD7bVQYH9MqkBB/C9IBfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=P53lNBYua9/+PqoS2kwEIiTZRgHnmXYmW9wFUKdKB/0=;
	b=Qkmxqcgs780qTq13JTXZ93XMpzoopEV0Gexf4H6hcpIg9qE+UCwof/sD+pNyR49FYS
	EBRSA2tAMXqjQgUXwS9850ZAt6R3rY7Y6g9G9FEOQ3vrphmHubq83BQuAeO4VDff01kG
	D+MVtysnEcmKW2ahjOrjs9U0ACJY1Pqss2fg6mSl0jEkETApwRrcxocGlfcGp/aKN9rp
	TouT/x3hcCAYvy1cX6MjZ7vbiy0+UgBNSV0UaFKy4QEXLlONnxcmyfChDWPTeR74+oNO
	Ktijj15x9hMT9AaYYyBbjRDmEg59lblI1s/zVTjiP6WsbuXfai2f0O8rMZFBfJjlJwh6
	dxmA==
X-Gm-Message-State: APt69E2y/u8By+90SO1ATeQAgcauiGc4XhF3+nqv5keaRRvZEFjQG7fJ
	ZrH9BUYBvY+fXFVlU3epSk40Dw==
X-Google-Smtp-Source: ADUXVKLC9RUb8oFycimCKjlhCWqQZG7QksBbTkWDtftNFT1WVAWqkCiS4clsbBe7BPwrU0EalWwqew==
X-Received: by 2002:a63:6cc1:: with SMTP id
	h184-v6mr5280159pgc.301.1530110518887; 
	Wed, 27 Jun 2018 07:41:58 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	z19-v6sm5974583pgv.12.2018.06.27.07.41.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jun 2018 07:41:58 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Eric Blake <eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-45-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8f6c4300-b3bb-1274-1aa2-5fb14eb42de2@linaro.org>
Date: Wed, 27 Jun 2018 07:41:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-45-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 44/46] tests/crypto: Use
 the IEC binary prefix definitions
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
X-List-Received-Date: Wed, 27 Jun 2018 14:42:01 -0000

On 06/25/2018 05:42 AM, Philippe Mathieu-Daudé wrote:
> It eases code review, unit is explicit.
> 
> Patch generated using:
> 
>   $ git grep -n '[<>][<>]= ?[1-5]0'
> 
> and modified manually.
> 
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tests/benchmark-crypto-cipher.c | 6 +++---
>  tests/benchmark-crypto-hash.c   | 5 +++--
>  tests/benchmark-crypto-hmac.c   | 6 +++---
>  3 files changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



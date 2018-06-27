Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY4QL-0005jM-N6
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 02:59:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY4QK-0005g8-GD
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:59:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY4QH-0005gj-Fh
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:59:28 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:35709)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY4QH-0005gQ-0C
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:59:25 -0400
Received: by mail-pf0-x242.google.com with SMTP id c22-v6so559900pfi.2
	for <qemu-trivial@nongnu.org>; Tue, 26 Jun 2018 23:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=wLJ44/MlpsPXzUTFs3NHwKVYmaMyagYDVvTVjk2/n3E=;
	b=cDYCN7NM/WoD7NNix0in0HlyaHDoDLunyYpIAW9Y8F1z9Y3CIFgzfFcPipjYeOAhtI
	0DVwVoTETTGDlW7BftoT2DG4ugTy7Ojrz5QY46+NqCpPKFwGP/iZF5I9FXCchR9MoE6K
	0Ocn96ANGEclktW5RDSNoyYdyaElIAmG7v5i4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wLJ44/MlpsPXzUTFs3NHwKVYmaMyagYDVvTVjk2/n3E=;
	b=cBs9BiM9tpeFlrS50q+b+FEKYwFZ9+/O34fOOctdNOjAaWPxgfFkIT8+rBfQtsaMaX
	xlfz6KFJIze3+2vBcKYUzyd+bwDLJ/gjrAo8vsazEUqbhN3X3XUDOX7Rp1bPBB/H87Ia
	ZE/Irk8Z9QkvKM3Coh4L4b8PvNfwPJbJTHQPnyi313rXp3woOar69bGpYa7iaqYCeOnC
	AbpqESvUWxPsxE/s1KGpjw4yVuRrJW/9cRwZECaaPxBsdxy8YJ6a2w1A3ady4yUP+sjX
	lc/swrStZCWsq1cPqkWIHFogpzw1htvWxxnBwU/u6HG0rp9ChFqamijpDNhS3LKoYrJJ
	wBiQ==
X-Gm-Message-State: APt69E1xYkDbrr+a/E3NyWXWjbcE8+ZzY7G9biVrxL1Qr7NoSaH/b4dk
	dMUujrmjhPszGXacF6Mnv60diw==
X-Google-Smtp-Source: ADUXVKJONgxhCZNHrDNoHUX2Riputz5KvyaCBBTAIgfRQCl220a50Pot+KDJk4xF1AiFdAPrsnNYiA==
X-Received: by 2002:a63:9543:: with SMTP id t3-v6mr4008124pgn.77.1530082763772;
	Tue, 26 Jun 2018 23:59:23 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	8-v6sm7587504pfk.132.2018.06.26.23.59.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 23:59:22 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, Marek Vasut <marex@denx.de>,
	Chris Wulff <crwulff@gmail.com>, qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-26-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f723a89f-0614-41cc-e72a-a7cd35fa06be@linaro.org>
Date: Tue, 26 Jun 2018 23:59:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-26-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 25/46] hw/nios2: Use the
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
X-List-Received-Date: Wed, 27 Jun 2018 06:59:29 -0000

On 06/25/2018 05:42 AM, Philippe Mathieu-Daudé wrote:
> It eases code review, unit is explicit.
> 
> Patch generated using:
> 
>   $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/
> 
> and modified manually.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/nios2/boot.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



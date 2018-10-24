Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFHBO-0003oL-Hg
	for mharc-qemu-trivial@gnu.org; Wed, 24 Oct 2018 07:18:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gFHBM-0003nO-H4
	for qemu-trivial@nongnu.org; Wed, 24 Oct 2018 07:18:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gFHBH-00084j-Jx
	for qemu-trivial@nongnu.org; Wed, 24 Oct 2018 07:18:36 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36718)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gFHBH-0007yP-0D
	for qemu-trivial@nongnu.org; Wed, 24 Oct 2018 07:18:31 -0400
Received: by mail-wr1-x42b.google.com with SMTP id y16so5165856wrw.3
	for <qemu-trivial@nongnu.org>; Wed, 24 Oct 2018 04:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=GlLERsdpSLdMaQ2t3xMpanD4Wo9Xn16PbzAjqcGC+68=;
	b=FRUZSTieNyCIz3E9Di71u/qWlhv3PgRKiAR4GxqoLEqE0FXaI0cWvE7C1cLOeH9IQ3
	LT31t28Gb2Y9w19Pt+kSvNYRCz3A9HsagiEt4t/j3+va9J1frAvpIuNpttXUW9Hq/IOQ
	NLqiCgI1kDexBRDlsgH8Z4QdKJfYnt9mHKR0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GlLERsdpSLdMaQ2t3xMpanD4Wo9Xn16PbzAjqcGC+68=;
	b=m/EzPffJ2ONKR7H5KRXf8P8GLfDbjJnaHRMfcP/j/SplTgd4lBdvFNbdD0tkG4M0Pw
	H3btpjIs+UrMkM81867feDxszT7XsHXmWbmww/bse+yE+JjUZg4rT827R0dkpYS46vKN
	JNx3Z0c9dE1Rw5rpvn1xRwba/zGpe2eYcWLfONap0DSCCrR4OKCbqh9lrbHWolTSqCk4
	DvwswHTQ6hf4q3zkN9fag6U+JKPAASnC8jjWw+XVCPZHsh/LRdFKUIN0IqHoRHakuky0
	gvSYk7i4iYYEypPEpIvpO11ZywZ5Lc03YCCBZkRMNBUIg+TssGi6GHSbxiiBZUB3jCgf
	Jt3A==
X-Gm-Message-State: AGRZ1gJP8DIvURpVh2f55lg6olnxwI5tnb2BqLWLBBClobVRfaV5A/Hf
	h//2dAX4vkWeMKgLVRQ3OY4PM2Uxnmw=
X-Google-Smtp-Source: AJdET5fguII28ZdlCu0BOX3ukJNE8GnZ8sBdCjeHrSzKPwS4A88zHZsQEQwd5RgVaedD0CjlaYyAng==
X-Received: by 2002:a5d:6309:: with SMTP id
	i9-v6mr2341887wru.163.1540379905637; 
	Wed, 24 Oct 2018 04:18:25 -0700 (PDT)
Received: from cloudburst.twiddle.net ([185.7.230.213])
	by smtp.gmail.com with ESMTPSA id
	i7-v6sm5890350wmd.41.2018.10.24.04.18.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Oct 2018 04:18:24 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org
References: <1540376314-5727-1-git-send-email-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <04d22eb7-ee97-2362-6bd0-7583fa910c43@linaro.org>
Date: Wed, 24 Oct 2018 12:18:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1540376314-5727-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::42b
Subject: Re: [Qemu-trivial] [PATCH] configs/alpha: Remove unused
 CONFIG_PARALLEL_ISA switch
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
X-List-Received-Date: Wed, 24 Oct 2018 11:18:37 -0000

On 10/24/18 11:18 AM, Thomas Huth wrote:
> We don't use CONFIG_PARALLEL_ISA in any of our Makefiles, so this
> is just a dead config option which can be removed.
> 
> Fixes: a4cb773928e047b137c6998209cf2eec857fac6b
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/alpha-softmmu.mak | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~


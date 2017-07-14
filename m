Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVw9v-0001Q9-VD
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:41:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw9t-0001OK-R8
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:41:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw9q-00034z-OW
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:41:09 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:36155)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVw9q-00034l-K6; Fri, 14 Jul 2017 04:41:06 -0400
Received: by mail-qk0-x241.google.com with SMTP id v17so8979255qka.3;
	Fri, 14 Jul 2017 01:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9NS4Aui9PMiWA5BgurRRexDg+51qyVqbxRuOp9gTVL8=;
	b=neUHefG8qMRbvypfziX7cuh0Z4htGQoEM+JaRUKl3ZLSkz+ECKYG9jLCqHVoay+V8v
	aJdDjkthcPqphMatp93ssMvPZTF9TEWSuKI7w7MoR+u1sM29xND0iHAx4rd2lLYC8tjp
	Dl5UeMG8X7NXX/UTz9xEz22TWyGwI6iIUVjP6XpKNljPWdqnYcpQ/mPU+qpWk49q2daK
	0kK8vCKumK/MKrZza4ankxPzAuvA/yOMgukjn4F7jS716GgQSoV2kgX9TfW65V6FI4j4
	4GOeSWuskhmkeRNCgtxa+d7d+jom2o14BtsZkTm0CFd4IiAOMqpsPaBiW1e4V9tGVYck
	mGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9NS4Aui9PMiWA5BgurRRexDg+51qyVqbxRuOp9gTVL8=;
	b=T9bWWsloTNWmZusujRLlLLY/ndUnXOVEgABUs9zcjhjp4Cieqh4prRbH+kSVC6d1Tb
	ZH4wuL9FVJyvDEK7NPH768CZp9nQFdmHkX1oG3ytUzdHL8Rc4H/06T0m4QcDwLe5crC2
	Q9ONyPJcAAn7JSKOqC1zKNmvDdv3oQs3FuuUHIeen3jkLyHyvDpbw4OqcYQXGFlB77Gh
	ULB4P2xfC6CRRC0tyB9lF7opZgSeY45vc00AVVoKou6D1tM/WuAz2N5btukVwG15pIXS
	HyZ2Qecfp/eeiGhxv7YKiqqc/0yEIwzkFDahTRy9arPx/nPLqRBoZRAG8XN0YeKObF2Z
	+vKQ==
X-Gm-Message-State: AIVw110wMv//mne2Zu3PSAHLtopepntqIOXpDrPwla8wOCn1G+lSCHlf
	n3xR5xMAfo+2Dw==
X-Received: by 10.55.191.66 with SMTP id p63mr9611941qkf.212.1500021666115;
	Fri, 14 Jul 2017 01:41:06 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	o76sm5595896qke.7.2017.07.14.01.41.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:41:05 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-22-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <5e3d13d1-db23-cd98-e695-0fa6e682ac28@twiddle.net>
Date: Thu, 13 Jul 2017 22:41:01 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-22-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 21/29] msix: use
 DIV_ROUND_UP
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
X-List-Received-Date: Fri, 14 Jul 2017 08:41:11 -0000

On 07/13/2017 06:32 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   hw/pci/msix.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~


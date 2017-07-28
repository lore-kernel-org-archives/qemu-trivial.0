Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db3xW-00061L-CD
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 08:01:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1db3xT-0005zQ-LW
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:01:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1db3xQ-0004fW-T5
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:01:31 -0400
Received: from mail-wm0-f52.google.com ([74.125.82.52]:34702)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1db3xQ-0004f2-OG
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:01:28 -0400
Received: by mail-wm0-f52.google.com with SMTP id t138so9348845wmt.1
	for <qemu-trivial@nongnu.org>; Fri, 28 Jul 2017 05:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=1/pKTDFH7oJc1gfG4Y3eks4z6sxxnMqJiB1alaYOYO4=;
	b=c1jXyPPM80KhuKIoBf/EDUAUY2TB5ERLYaCrvlAHlryajQM9DR21orpuvsF6bkqzvN
	TyeKF5zrOqlRy7hafrltsci7nMYJ8xry64CykcpVjI3+6uWLKUm/rouq+JvMs4wFi9ZJ
	q9phwg1YJghqrV0KRA9RROP1xExhQhP7GljGd9WLvPM86dg77/F7JGSYDyq68XDzfSTV
	fAboqdAsGo5T4LMfAgshsK3VqAka/KSt09mAxarvSgt663QeELlxeJOoPHh0vvRNbjzf
	lEIbcaQT3q3Geqa94ROVTIwuMeZF6C5F1EY+uOOrIqv1nC2vAAisvs1QttPo4XiEXkxb
	G3KA==
X-Gm-Message-State: AIVw112H169M0yjP6rcV/KhiB0I/Ew4MNj2Bj1ypkxvkMwwXqRn9MxyK
	i2aVLN4/Zc3vrVPHa3dxnw==
X-Received: by 10.28.131.130 with SMTP id f124mr5545526wmd.25.1501243287409;
	Fri, 28 Jul 2017 05:01:27 -0700 (PDT)
Received: from [192.168.10.165] (94-39-192-75.adsl-ull.clienti.tiscali.it.
	[94.39.192.75]) by smtp.gmail.com with ESMTPSA id
	a31sm47816250wrc.64.2017.07.28.05.01.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 05:01:26 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20170728012542.29975-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <975681ad-8262-af4b-ecb7-8ec1f4379298@redhat.com>
Date: Fri, 28 Jul 2017 14:01:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170728012542.29975-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.52
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.10 0/8] docs: fix
 broken paths
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
X-List-Received-Date: Fri, 28 Jul 2017 12:01:32 -0000

On 28/07/2017 03:25, Philippe Mathieu-Daudé wrote:
> Eric said this can wait 2.11, however these patches don't change any code
> generated, I think the 2.10 users deserve an up-to-date doc :p

I agree, especially because this is a 2.10 regression.

Paolo


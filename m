Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fYBcC-0006qI-Jq
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 10:40:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fYBcA-0006mD-7G
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 10:40:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fYBc6-0003fh-6G
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 10:40:10 -0400
Received: from mail-pl0-x22c.google.com ([2607:f8b0:400e:c01::22c]:40285)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fYBc5-0003el-Rd
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 10:40:06 -0400
Received: by mail-pl0-x22c.google.com with SMTP id t6-v6so1138057plo.7
	for <qemu-trivial@nongnu.org>; Wed, 27 Jun 2018 07:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=KyHgBYl09W5QzAYSaQS3w9JQWZ/ATYoeg38vn6wl6DA=;
	b=LbnbHhYRMyv1Zr0Qhp1h2A9Ftn/z+2mqc1SkWska5bt7N+1bZQWl1ZUIO5fVsVD9Am
	9N5O4RzjeYDoevFkugD7Vg5m4TbDN7+sxu6tR7Aya9qOhlPKG663YLyTty2RbuvOFsKb
	IppVuDIy4kIUv3/HKPFWSzJpkEMWpf18liXNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KyHgBYl09W5QzAYSaQS3w9JQWZ/ATYoeg38vn6wl6DA=;
	b=PjN/HJnKAkF8ie7GaL/R732ZEBMltbeVRx0KDqFLDP29IkOPlgyjdJ0rHCuGDMVAZD
	eMHx2X0bTelC5aBb6S+HHIe4xnYs7uoM86lEl5cAaWFnUvK6fHYwkVPiWmmJZomf2PV+
	KYdoTN2FkyjuOqhHJ1LKiqq5XdPnw1rKmv2Orf7KzLYxqebjup7R6liCNuGyQGdG1bW7
	YTFQ9NwPbfAGsNtM6PK4q3b9fgffbuSoi0DwWV5xXUYeDCEHPNZxq/aG8uxLAGVrz9YI
	JY69uUMY9I1L1UoSD5VE53gM+VI+ioV8zsd6dxrpqL34s5+iy5S3nmSZyBVUfKoreBTf
	BdsQ==
X-Gm-Message-State: APt69E0c5/YQlnpzqP/T1GK3CBPDuJ7U3R6dcE4FM8diWJdq2qMvmnJG
	6jGUsBo9TRBq+S8eJFPtkA+gUg==
X-Google-Smtp-Source: ADUXVKI+FlOgxsHPpEIJJfUWqRRo0BuDdKqLXnrSM7Nk0Hp7PDRm+0FaZJidSzlmvBk7g70J4079KQ==
X-Received: by 2002:a17:902:be0d:: with SMTP id
	r13-v6mr6363526pls.299.1530110404907; 
	Wed, 27 Jun 2018 07:40:04 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	e17-v6sm6748057pgo.70.2018.06.27.07.40.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jun 2018 07:40:04 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Eric Blake <eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-44-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <50b8e622-c57d-804c-a7dc-4683cbecbe56@linaro.org>
Date: Wed, 27 Jun 2018 07:40:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-44-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::22c
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 43/46] vl: Use the IEC
 binary prefix definitions
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
X-List-Received-Date: Wed, 27 Jun 2018 14:40:11 -0000

On 06/25/2018 05:42 AM, Philippe Mathieu-Daudé wrote:
> -            sz <<= 20;
> +            sz *= MiB;
>              if ((sz >> 20) != overflow_check) {

Missed one.

r~


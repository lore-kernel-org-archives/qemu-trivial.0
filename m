Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gpKVH-00018T-D6
	for mharc-qemu-trivial@gnu.org; Thu, 31 Jan 2019 17:08:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gpKVD-0000qT-9U
	for qemu-trivial@nongnu.org; Thu, 31 Jan 2019 17:08:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gpKIt-0001v4-IJ
	for qemu-trivial@nongnu.org; Thu, 31 Jan 2019 16:55:24 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:41783)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gpKIt-0001uT-BI
	for qemu-trivial@nongnu.org; Thu, 31 Jan 2019 16:55:23 -0500
Received: by mail-pl1-x641.google.com with SMTP id u6so2081574plm.8
	for <qemu-trivial@nongnu.org>; Thu, 31 Jan 2019 13:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ryNuwnvWxRgcl1EWV4bTPsxC4OYV30ZLsOur34oB/QA=;
	b=O27LQKCJUILK0x2vRoF89P1RTONN24zUPl33xzC6ZYC8AIYkoNtYp/NMtaPrTAl6qP
	AfGKYCBS9Od6bFBaRoZ3fPDJQ+2eUWIIeMDabDdu9yhbW+2oCBEtxBOG4YA9KQR3ByER
	YjWoj58+xvGgFBChHy9WLNcUzBZXDHCQH0dbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ryNuwnvWxRgcl1EWV4bTPsxC4OYV30ZLsOur34oB/QA=;
	b=tvmUuhxsipDpiS4ZbxaCuino3RdidZOZr9AR7TC77tGg18Y9Qu7iBWeo2huEOZMj6a
	bPlQMYPIInpUnyhObo8aT2g52l1nv0k/OYay8oYtaCXe3hsQzpBt+sgc0i60Dxv/i+zp
	pM4EFha2fSyXJVMwwDUEu7yXMlQJpJBu1K7JEuNE6WrY6YhZtobUL+YsW7A7yiZRnn0K
	QSoNXkP8gvNU97Z9Gdl9+GrTyS7Q375yxHqM8fhJIm9EWeq/AJ/wQYFdpZ1yPiSW9jBU
	zzYyVIiPHgwQ8MmsLkHCOUZdTxIaptjtEHsRIOUxb8zGwKsnj41/rbN2Nh29Mq3zNHvK
	thDQ==
X-Gm-Message-State: AJcUukfb8hqhQAcHaqGP2wabeDLFt6IemO7dlaxaJG5OKIJ7SI3ZyxNa
	9n7hKIIWCkjdyUQVwweSTIbklw==
X-Google-Smtp-Source: ALg8bN4CB7cdgeSpDvXn3hksAqnyAk6oQkt355ABex1IpddHlfBvHbZbh7Vh2hqg5UALXxH4Zps0Zw==
X-Received: by 2002:a17:902:29a7:: with SMTP id
	h36mr37054287plb.244.1548971722067; 
	Thu, 31 Jan 2019 13:55:22 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	t29sm8425149pfa.158.2019.01.31.13.55.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 13:55:21 -0800 (PST)
To: Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Thomas Huth <thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <1548769067-20792-1-git-send-email-thuth@redhat.com>
	<20190129145156.6719b8a4.cohuck@redhat.com>
	<e3dfae55-8733-bd01-1f13-422f343fb258@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <509e6dca-8c78-947f-cf91-15ad02510bba@linaro.org>
Date: Thu, 31 Jan 2019 13:55:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <e3dfae55-8733-bd01-1f13-422f343fb258@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target/s390x: Fix LGPL
 version in the file header comments
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
X-List-Received-Date: Thu, 31 Jan 2019 22:08:08 -0000

On 1/30/19 7:01 AM, Eric Blake wrote:
> On 1/29/19 7:51 AM, Cornelia Huck wrote:
>> Given that there have been several of these cases (and that there's a
>> lot of boilerplate in general): Should we adopt SPDX license
>> identifiers for QEMU, as the Linux kernel did? They also discovered and
>> fixed some problems/oddities while at it.
> 
> I'm also in favor of SPDX license identifiers - their brevity and
> machine-parsability favors more accurate usage and fewer copy/paste
> mistake propagation.

+1.


r~


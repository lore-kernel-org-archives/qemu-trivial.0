Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXcfG-0007RK-Bs
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 20:16:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dXcfE-0007Qc-EF
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 20:16:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dXcfD-0003tz-OL
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 20:16:28 -0400
Received: from mail-qk0-x22b.google.com ([2607:f8b0:400d:c09::22b]:35615)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dXcf9-0003sc-EA; Tue, 18 Jul 2017 20:16:23 -0400
Received: by mail-qk0-x22b.google.com with SMTP id p73so30237575qka.2;
	Tue, 18 Jul 2017 17:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=UG37IWSCbt6fHA+RmEbzdHvlYtAE3ndm+vWiQVoYZV0=;
	b=lV4R/DAIxzh/IopubvcIEGluIAgei8NEbVJlQPthICSauWZs4xIj0vzqksqQ2n1Rga
	nXgXViNaGGgd2zvPDn41FrYAA2T6bN6dp5wtnBewp5t6DcSJvUVKQ8NClCJ8Ugb/pGxD
	/P3S2H6u6lBCZs82z8lj6Ny0uJ3IR46+ipDt1knrJCinxs4GohynbhjDS4US81mo8v6z
	6L4yhEXtawIIDzWhB6xxz1rfP7OychJP/0aletdufi7gEpEMbXSm9cNfaa14+KsF64Sz
	OvYQb75evpEVk4falzO8teJ1yO59mbVRfMJVboOjjRRHBVcOHRUK3kjsy2ZrnMn0iKU0
	EIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UG37IWSCbt6fHA+RmEbzdHvlYtAE3ndm+vWiQVoYZV0=;
	b=ffgWBk4KEwA7UXDvcG7Zk3f723CgbJ0K4iKJ9ZXW7sk/jex6AXOHyXnyAbMjRlurZt
	xauWj0M1dKmYKAYqRhMkGSxuSnhb/dtMj+IjON3uAfoZJk7WFcJEKkxzdBu3NIXuxXu3
	ZPy9oUgLu6aXKBvcUH5r+QOHlQwahu2vxpQR1KqN7bQEgmDAztsHZqfd0oYxmexTmykc
	SXx/EqJit6E3T4SCz9yFNqvYXb9gg62hmN3hl7BxXdHEBi2+op4rVJEodFx5ut1uHHCA
	D5/7JQM94rr/zfewHykdgK1ulrdvzIardDdxL6slQ9o0j+ZLUao/9pfZyziL+bSzMdPX
	SpXQ==
X-Gm-Message-State: AIVw112N8Hs4w8s1bwEK5ec2MwIpPFbdM9rvYfamqTZchyDMLqiS/87m
	rOmzWXsE8Hzn1hMfa8U=
X-Received: by 10.55.97.13 with SMTP id v13mr182333qkb.107.1500423382627;
	Tue, 18 Jul 2017 17:16:22 -0700 (PDT)
Received: from bigtime.twiddle.net ([101.165.234.197])
	by smtp.googlemail.com with ESMTPSA id
	d14sm2142565qtd.21.2017.07.18.17.16.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 17:16:21 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-3-f4bug@amsat.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <6ea7cf54-5dcd-5a91-f0a7-3a7b3b9a4bd4@twiddle.net>
Date: Tue, 18 Jul 2017 14:16:17 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170718061005.29518-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22b
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 02/29] pci: remove
 superfluous parenthesis
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
X-List-Received-Date: Wed, 19 Jul 2017 00:16:29 -0000

On 07/17/2017 08:09 PM, Philippe Mathieu-Daudé wrote:
>   #define IOTEST_TEST(i) (iotest_test[((i) % ARRAY_SIZE(iotest_test))])
>   #define IOTEST_TYPE(i) (iotest_type[((i) / ARRAY_SIZE(iotest_test))])

Looks like  array[(x)] is another candidate.

> -#define IOTEST_MAX_TEST (ARRAY_SIZE(iotest_test))
> -#define IOTEST_MAX_TYPE (ARRAY_SIZE(iotest_type))
> +#define IOTEST_MAX_TEST ARRAY_SIZE(iotest_test)
> +#define IOTEST_MAX_TYPE ARRAY_SIZE(iotest_type)


r~


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ceeAx-0002O7-2l
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 03:45:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ceeAu-0002Lj-AB
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 03:45:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ceeAq-0004p4-Cd
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 03:45:56 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:34545)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1ceeAq-0004oy-5T; Fri, 17 Feb 2017 03:45:52 -0500
Received: by mail-wr0-x242.google.com with SMTP id c4so4516805wrd.1;
	Fri, 17 Feb 2017 00:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=2CsbGhAzSgHdpdXq2AyT/6aLFqXzGd/X1IeE3qcQumM=;
	b=LrG87z1C/P7BI8mOE4vLpsx/6tjr714wnV9w9ZyXGLYfYxA4GKU95cFF3h8c7VRsku
	35afSSiNgc68Cm12IeQynbrF1NUw1ZxOEClITaEVauy52xGy2ma0yZwP4kWod+Zx2gCA
	ZHGooOMSU/FPkLcK2wNI5YHq0WDXu+4gwUkHoZycwZIdu6h7g8Fas5d1+we7Sdax5GLf
	oOv1aeHcMagh6752ojOThHkhGV5o5h3PmkH2QF5KfctxPfYHucquimBRRFvFzYwHknyW
	grexf7Gd8ulWy1Lp+SnVw8XJEd7qwuOBQaF+rSVp1OzLX+Hlp2y/ZVLq9elENzQla4Ts
	G2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=2CsbGhAzSgHdpdXq2AyT/6aLFqXzGd/X1IeE3qcQumM=;
	b=BMSJFleirHyjgWaLJz99BRcqzJ9KkMQBnl/BIaSrnJ5vmKa7dONGZO9SHwOpa5Oas3
	ck/vuvoe42+YQSRE2eil7lKiIpcre0iDR6k8pzJMJY/5GOUeBckcVaRo+jDoO4RFiCnN
	z1Phco7it6wIcHyKcMvFmx3e3uE5GIQUL5tQSALoKKxI0NcMvjyEDWij2oP/zmbACqR7
	5tt8ZHewUQCSfeZ6rVPg0EN4xRq0JG3+0+0vk08iwfeAJFF+ZS/vlthxBRZdD6bqwEAU
	eYW0hLOFtdUBo4wm5RxAg4pWpo+zesxlRCwOQdvFoSn1Iot92ZBqSpLMBvh0tMCsjGLY
	eZ2w==
X-Gm-Message-State: AMke39nmpOf0pIDp1ngghGYLzg8An7Bhx2stqIDLTYG3En5vl1ynZorrY53jAahwNjxXnw==
X-Received: by 10.223.146.196 with SMTP id 62mr5161625wrn.199.1487321151027;
	Fri, 17 Feb 2017 00:45:51 -0800 (PST)
Received: from [192.168.10.165] (94-39-187-56.adsl-ull.clienti.tiscali.it.
	[94.39.187.56]) by smtp.googlemail.com with ESMTPSA id
	q16sm12053594wra.69.2017.02.17.00.45.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Feb 2017 00:45:50 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Laszlo Ersek <lersek@redhat.com>, Chad Joan <chadjoan@gmail.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3bbe3e92-7352-43c3-702a-690c72171cec@redhat.com>
Date: Fri, 17 Feb 2017 09:45:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-trivial] Fix build break during configuration on
 musl-libc based Linux systems.
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
X-List-Received-Date: Fri, 17 Feb 2017 08:45:57 -0000



On 16/02/2017 18:23, Laszlo Ersek wrote:
>> Hi,
>>
>> can you explain exactly which function is missing without
>> -D_XOPEN_SOURCE=500?  If it is curses' wide-char functions, why does it
>> fail with musl but not with glibc?  Is _XOPEN_SOURCE always defined by
>> glibc if you have _D_GNU_SOURCE?
> It is not necessarily auto-defined, but the effect is "as if".
> 
> It is documented in the libc info:
> 
> https://www.gnu.org/software/libc/manual/html_node/Feature-Test-Macros.html#index-_005fXOPEN_005fSOURCE
> 

So is this a musl bug?

Paolo


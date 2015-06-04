Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0W07-00021P-M1
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jun 2015 10:20:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z0W05-0001zz-CS
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 10:20:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z0W00-0007lh-19
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 10:20:05 -0400
Received: from mail-pa0-f46.google.com ([209.85.220.46]:34642)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z0Vzz-0007kO-Rp
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 10:19:59 -0400
Received: by payr10 with SMTP id r10so30711782pay.1
	for <qemu-trivial@nongnu.org>; Thu, 04 Jun 2015 07:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=TCqjPyI4Je6dOvrTOcv729BH2M038l7wJMcBymxNNsA=;
	b=j0VMLZHyIUq27PxV506j6PD6PJWIV8njUhgPwAyD3EhGkgYHiPGhpiAmKaIms+r6Mv
	gk+2fzJYvONx8zGrIp6Udbn+/wACFgpYQ1pUhOMLB/K33Pra3HLRIWV6tQKp9V8BuuRA
	Tu3L03EblOrbvT1ucGgvc5DWWVcGfi921lq9ekUgXrDegfXvF9vs82OmacBregoJEcyc
	2dZbCbkxEqnQR+A4BbCU3phWQwaKnuWK4HUnfKhM21IOd7cqlPNUP48S5J98NQz3uKMF
	ekR5dWCadkWE+dHaSOyUXdXUPSKDjMmwIrHkdVCjfo1uLnKowZFr22lKZ3//NQp8E/Do
	a6ZA==
X-Gm-Message-State: ALoCoQlUBUNQId0awvIi7qfr8qT5Q70CJOSH3QU+ILLekOhIVOInXSpXTmZD0NPFQTd2fGfEwibN
X-Received: by 10.70.103.200 with SMTP id fy8mr68595811pdb.136.1433427598284; 
	Thu, 04 Jun 2015 07:19:58 -0700 (PDT)
Received: from [10.14.6.62] ([167.160.116.183])
	by mx.google.com with ESMTPSA id h11sm4050705pdj.27.2015.06.04.07.19.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 07:19:57 -0700 (PDT)
Message-ID: <55705E8B.4080400@linaro.org>
Date: Thu, 04 Jun 2015 22:19:55 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Shannon Zhao <zhaoshenglong@huawei.com>,
	qemu-devel@nongnu.org
References: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
	<1432972477-13504-2-git-send-email-zhaoshenglong@huawei.com>
	<55705CE0.1040108@msgid.tls.msk.ru>
In-Reply-To: <55705CE0.1040108@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.46
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2 1/7] hw/ppc/ppc440_bamboo.c: Add a
 member in MachineState to store irq array
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Jun 2015 14:20:06 -0000



On 2015/6/4 22:12, Michael Tokarev wrote:
> 30.05.2015 10:54, Shannon Zhao wrote:
>> >From: Shannon Zhao<shannon.zhao@linaro.org>
>> >
>> >Here we add a member in MachineState to store the irq array returned
>> >from qemu_allocate_irqs. Then these irq arrays will be free before QEMU
>> >exit and it fixes the memory leak spotted by valgrind.
> Where the new member (machine->irqs) is being freed?

The machine->irqs will not be freed until the machine dies. Since 
machine init function only runs once and the allocated memories could be 
freed when QEMU exits.

> Can we add the
> generic machinery for it first, and next convert all places to it one
> by one?

-- 
Shannon


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0WUl-000320-VJ
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jun 2015 10:51:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z0WUi-0002z4-LH
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 10:51:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z0WUc-0003yO-Tf
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 10:51:44 -0400
Received: from mail-pa0-f50.google.com ([209.85.220.50]:35504)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z0WUc-0003yB-OL
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 10:51:38 -0400
Received: by padjw17 with SMTP id jw17so31147664pad.2
	for <qemu-trivial@nongnu.org>; Thu, 04 Jun 2015 07:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=tX/MjST8AQ432hWJCg6eDOkUXjF6E7f1VPwEo41bqeE=;
	b=EOk+06uzP5DosJ/8vcjxMHrBrqNqz/5oO8t35C8+7Ao2daVV+T/w8StwY+riunE66g
	iL4PRVJLmkGQzH8sJOXU46lL/wQtLo5cGLKY5moa5id9mAr+taWUj/6U36jnLkLGl4c8
	d1J3Lu4jv7THrhqRzLTeJV3OH1dd+7q+Ne7f86XGIK8NQGWvOLw9E+bn9W7qYttYVOam
	IKPZrnXJPDIJ/yOtkkS9GrCIyiRglZsavOJkyRV7DKZuWT5MBJMz8I15es81XWU+N/HK
	/oR9HGiuzYL3emFRY6gFhEhbCn97bv1c6D9sSbkzBAbhSVNS0yNlMHP3du0CpC14EEte
	YM4g==
X-Gm-Message-State: ALoCoQnJNJ/kv0i51ctfcFZbILkXh62q9dwTJMPx+BDJlWaqo/QwCi6SSB1/nB36lo0YNnngqDkj
X-Received: by 10.66.163.69 with SMTP id yg5mr68089610pab.150.1433429497749;
	Thu, 04 Jun 2015 07:51:37 -0700 (PDT)
Received: from [10.14.6.62] ([167.160.116.183])
	by mx.google.com with ESMTPSA id oo3sm4181169pac.31.2015.06.04.07.51.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 07:51:36 -0700 (PDT)
Message-ID: <557065ED.7010409@linaro.org>
Date: Thu, 04 Jun 2015 22:51:25 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Shannon Zhao <zhaoshenglong@huawei.com>,
	qemu-devel@nongnu.org
References: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
	<1432972477-13504-3-git-send-email-zhaoshenglong@huawei.com>
	<55705E46.4010106@msgid.tls.msk.ru> <55706108.9070903@linaro.org>
	<55706186.5070701@msgid.tls.msk.ru>
In-Reply-To: <55706186.5070701@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.50
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2 2/7] hw/mips/mips_jazz.c: Store irq
 array in MachineState to fix memory leak
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
X-List-Received-Date: Thu, 04 Jun 2015 14:51:45 -0000



On 2015/6/4 22:32, Michael Tokarev wrote:
> 04.06.2015 17:30, Shannon Zhao wrote:
>
>>> >>BTW, there's also cpu_exit_irq in this function whose allocation also
>>> >>suffers from qemu_allocate_irqs(..., 1) API abuse.
>> >
>> >Yeah, missed this one.
> This one isn't that simple, because it passes the result to DMA_init
> which expects a pointer, even if it uses only one element of the
> array.

Yeah, but I think something like below would work.

     cpu_exit_irq = &qemu_allocate_irq(cpu_request_exit, NULL, 0);
     DMA_init(0, cpu_exit_irq);

-- 
Shannon


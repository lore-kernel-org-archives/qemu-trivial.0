Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0WtU-0005r7-CN
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jun 2015 11:17:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z0WtR-0005nR-LB
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 11:17:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z0WtK-0005WN-QZ
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 11:17:17 -0400
Received: from mail-pd0-f172.google.com ([209.85.192.172]:33411)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z0WtK-0005WD-LH
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 11:17:10 -0400
Received: by pdbqa5 with SMTP id qa5so33049202pdb.0
	for <qemu-trivial@nongnu.org>; Thu, 04 Jun 2015 08:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ysaOXJj8MqmzFBqzhKn74O7fRixzUiF/cusP2t3RThQ=;
	b=euiMlhTl+1SloiD9Lo538PZ1JvAsm6XHItnUuN1U4JasDj6Nqnpr+yg1zc9PF8vD3T
	DY7R6LHz4Z860ZSUIgY2Na081Uq55bWHhxj/j2o6Hn7Cx+RLGzgl2RCVyft4pvMTInLe
	HTu7NIEqTY/JV2OKUPe2liaX6Uc6WIbpYTKCdbgWbXT5mc44J74TNtrb5QHIGIVqMYeF
	tJCH0OWNADVKLdR6FNOqPoLc4OsNKuygYe2suHLcaZTY2zygEEeU+xJjcXYWM/jP8OM/
	EF+asy+hJpeApbGWywixev+m2dO8vf+YPXudoYkYpCoJuc+x9W4LbdExBuiGf+pulHtZ
	j1dw==
X-Gm-Message-State: ALoCoQnps5aK8a4tIGRC5pXZobtw79AGuBAapVZj8FJmalPHMQinxreNQrvitUNZhtjk+++7xqnU
X-Received: by 10.67.2.98 with SMTP id bn2mr70785239pad.83.1433431030055;
	Thu, 04 Jun 2015 08:17:10 -0700 (PDT)
Received: from [10.14.6.62] ([167.160.116.183])
	by mx.google.com with ESMTPSA id w6sm4121111pbt.3.2015.06.04.08.17.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 08:17:08 -0700 (PDT)
Message-ID: <55706BF2.2040005@linaro.org>
Date: Thu, 04 Jun 2015 23:17:06 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Shannon Zhao <zhaoshenglong@huawei.com>,
	qemu-devel@nongnu.org
References: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
	<1432972477-13504-3-git-send-email-zhaoshenglong@huawei.com>
	<55705E46.4010106@msgid.tls.msk.ru> <55706108.9070903@linaro.org>
	<55706186.5070701@msgid.tls.msk.ru> <557065ED.7010409@linaro.org>
	<55706775.7090204@msgid.tls.msk.ru>
In-Reply-To: <55706775.7090204@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.172
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
X-List-Received-Date: Thu, 04 Jun 2015 15:17:18 -0000



On 2015/6/4 22:57, Michael Tokarev wrote:
> 04.06.2015 17:51, Shannon Zhao wrote:
>> >Yeah, but I think something like below would work.
>> >
>> >     cpu_exit_irq = &qemu_allocate_irq(cpu_request_exit, NULL, 0);
>> >     DMA_init(0, cpu_exit_irq);
> NO!!!:)

Oh, will rethink about it. But I think maybe it's unnecessary to fix it 
as it actually requires a pointer which stores qemu_irq.

-- 
Shannon


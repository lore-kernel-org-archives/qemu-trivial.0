Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f76t7-0006gO-AM
	for mharc-qemu-trivial@gnu.org; Fri, 13 Apr 2018 18:09:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f76t5-0006e7-8R
	for qemu-trivial@nongnu.org; Fri, 13 Apr 2018 18:09:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f76t0-0000PL-A1
	for qemu-trivial@nongnu.org; Fri, 13 Apr 2018 18:09:43 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:46264)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f76t0-0000P9-5i; Fri, 13 Apr 2018 18:09:38 -0400
Received: by mail-qk0-x244.google.com with SMTP id l16so9762036qke.13;
	Fri, 13 Apr 2018 15:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6U1wYdvA3ia+2Qcp/e0uB9gqV1FtZHe63BZ84blQBiI=;
	b=n7ZjHolhLRTz6p2dS82CMn2VWPbWFr2JzjdYaE9sIELWJteoaY5M8wioOr2U84rM90
	q2UfvgVDMNrLSLBs3JZ2IY+tbtCwCdiMhEIQcnZVcD3mP0UpslrO1cLIQMk48qoM0Sy+
	HSY8GcSkRU1SgXtOQiZX3vyUpGvRaQzGExM4l7/CGWTGd2BFKD9ThPRc+cppZ6ZW7Rdk
	+YSrV/QnsQDQBaBPnag9Ja0JAi05U+or+5Jsajt841KakwhH9zmtPmTN4d0CbXZL0Sq+
	x/zQB3mNL2IBVeTTH1XYYqRLZ5fObnQeJswxPVnHW000j3myZhJB2AKRtuRjt+01B8Ob
	yr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=6U1wYdvA3ia+2Qcp/e0uB9gqV1FtZHe63BZ84blQBiI=;
	b=pMyGS7EVAtA6KLVHkgFHvFrxKPRWTYb2BzV59e4qnjNZ4HB5nZhiDNa23iiQctSrO+
	HcHYFB32O02MnzAv7wY8kWNEqLSuZa2f+qiPO3XArS2mkLEl3SnSX5sY7Fx65N7nyTrN
	BhIdAlYDqB2RQGn47bZV71NbSvwKgnGKC0Fu13IDcLKZ8qdZLKtCHuNfbb0JYwUV2nxm
	wcFkfcl/n7xDeF+q7d2PC5uB+kWyIpDti+6TqGAT7QIHnhsvsq1s0bpV+/v6VFJXkElo
	/Bfl52bqK1tD7VpmxuzNX5pDinCJn4UGv/nX1r+X0ietFRo5eDg1WY5etHr52pqLTzot
	kCXQ==
X-Gm-Message-State: ALQs6tCLgQUedmbrZkUa4ymCgIvzFKEd85BfzGbDo+rmvv9JpURB9rbp
	JANtwYS29ZdB9z1M598RcMTuniKl
X-Google-Smtp-Source: AIpwx4+jhjo7viJuQkAc0Rh97TkY4B00RiG7X/3kAETIIwgEibVS064sSFp4ItyGq4WmfbGmBY3law==
X-Received: by 10.55.172.5 with SMTP id e5mr6383225qkm.81.1523657377614;
	Fri, 13 Apr 2018 15:09:37 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id
	u51sm5647114qtk.58.2018.04.13.15.09.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Apr 2018 15:09:37 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20180413164545.18409-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <87db1aab-1bcb-7ba8-f871-017b7a9c0f6c@amsat.org>
Date: Fri, 13 Apr 2018 19:09:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180413164545.18409-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] acpi: fix a comment about
 aml_call0()
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
X-List-Received-Date: Fri, 13 Apr 2018 22:09:44 -0000

On 04/13/2018 01:45 PM, Marc-André Lureau wrote:
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/acpi/aml-build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 3fa557cea1..1e43cd736d 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -627,7 +627,7 @@ Aml *aml_notify(Aml *arg1, Aml *arg2)
>      return var;
>  }
>  
> -/* helper to call method with 1 argument */
> +/* helper to call method without argument */
>  Aml *aml_call0(const char *method)
>  {
>      Aml *var = aml_alloc();
> 


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eyvY7-0004nr-5e
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2018 04:26:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvY4-0004lQ-F3
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 04:26:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvY1-00042f-RA
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 04:26:12 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34168)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvY1-00042X-Ma; Thu, 22 Mar 2018 04:26:09 -0400
Received: by mail-qt0-x244.google.com with SMTP id l25so8062759qtj.1;
	Thu, 22 Mar 2018 01:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WhdMWrtNRv9CSpG3//4x8n2owXlNL22Wlp5ueAg19C0=;
	b=ouaKQRoLWo56NYhSzlFPZSbKwtHebrkz6/ZGpTFePMuVqhx6I99xt4/WOb6d4JvZTy
	SFJZVZDgE+kwltK26YXWVfmn6Qtd6C3ZfjFDgcinhoVXuCaPSpq0wIBPjuCvBfj042Pu
	I5ucnGOw/OUkpWXBO+UPWTJCfWk8L/nxDQa/NLvIp37iLGIXk8JJ8kjn5yK5+lIiCV/r
	A8ZrSNzpJVRVznuMJMBmE44TvyRTv8/VLhm7eRIDjFHCUeJIRp3pbKgPPOudyww998n6
	ggHdo5bATHFDqBMXVIUE8/S6C4a1EWMim7D6/MlIANQY5XHzuN+iTE3lnXf168tognkY
	9eaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=WhdMWrtNRv9CSpG3//4x8n2owXlNL22Wlp5ueAg19C0=;
	b=I0RK7RKzUMY3otistJFh4rbL6WL71goxM+WYsTUIVF/YaX+Mm7I5f8lHhZqBsjnS/4
	qp2qLms/Lh+iRJhr+VroUWGp/oFe0kWR/jIGgSb2NvDuaW6ysEq+EYv5DhMLYYLcB00I
	Gxk1iNnjj0/6LGVrnpEtkWS1ysWaZPUaGmbx/879MtFe80h9UIaFGsO4gEocQItie9q2
	Qa9J02b8HjxccKkf/rqGhWYUz01KciYzrpgSBylvTpbnCg9wv7FhQSvlAda+1IofiCoy
	wnfrBCMbwSgBHRYBR5harb4DTDyJ5zIdp6AJzMpHlW10ceIiGMb4QQBkzIz928wzyVLF
	Vnmg==
X-Gm-Message-State: AElRT7H6T4TYKXBHZ4dPb/k5NYIkA1b7VBusP3RsRptjJ92eQ7sCNXrB
	vfkdDquuxt3RePgYU3M8H1aclI6b
X-Google-Smtp-Source: AG47ELvJyozq+KqqGRmWpBrTZdWz7iQwlI7CDJMhiLESNk2Ahw/RQjR3LHYSq2uiqau85DRz6C4jRQ==
X-Received: by 10.200.38.123 with SMTP id v56mr11748511qtv.106.1521707169007; 
	Thu, 22 Mar 2018 01:26:09 -0700 (PDT)
Received: from [10.66.0.177] (host157.181-15-149.telecom.net.ar.
	[181.15.149.157]) by smtp.gmail.com with ESMTPSA id
	r51sm4413208qtr.23.2018.03.22.01.26.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Mar 2018 01:26:08 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Yuval Shaia <yuval.shaia@oracle.com>, marcel@redhat.com,
	eblake@redhat.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20180321211056.3339-1-yuval.shaia@oracle.com>
	<20180321211056.3339-3-yuval.shaia@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <319bb756-8cb2-4a0c-a8db-7d43bffe3335@amsat.org>
Date: Thu, 22 Mar 2018 05:26:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180321211056.3339-3-yuval.shaia@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/3] hw/rdma: Use correct
 print format in CHK_ATTR macro
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
X-List-Received-Date: Thu, 22 Mar 2018 08:26:13 -0000

On 03/21/2018 06:10 PM, Yuval Shaia wrote:
> Macro should not cast the given variable to u64 instead it should use
> the supplied format argument (fmt).
> 
> Reported-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Yuval Shaia <yuval.shaia@oracle.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/rdma/rdma_backend.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/rdma/rdma_backend.c b/hw/rdma/rdma_backend.c
> index f1a37ba4a2..0391a7dd95 100644
> --- a/hw/rdma/rdma_backend.c
> +++ b/hw/rdma/rdma_backend.c
> @@ -656,8 +656,8 @@ void rdma_backend_destroy_qp(RdmaBackendQP *qp)
>  #define CHK_ATTR(req, dev, member, fmt) ({ \
>      pr_dbg("%s="fmt","fmt"\n", #member, dev.member, req->member); \
>      if (req->member > dev.member) { \
> -        warn_report("%s = 0x%lx is higher than host device capability 0x%lx", \
> -                    #member, (uint64_t)req->member, (uint64_t)dev.member); \
> +        warn_report("%s = "fmt" is higher than host device capability "fmt, \
> +                    #member, req->member, dev.member); \
>          req->member = dev.member; \
>      } \
>      pr_dbg("%s="fmt"\n", #member, req->member); })
> 


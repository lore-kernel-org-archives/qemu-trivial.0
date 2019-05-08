Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hOQvO-0002sw-6S
	for mharc-qemu-trivial@gnu.org; Wed, 08 May 2019 14:04:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOQvL-0002r7-Rc
	for qemu-trivial@nongnu.org; Wed, 08 May 2019 14:04:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOQvJ-0000n0-DO
	for qemu-trivial@nongnu.org; Wed, 08 May 2019 14:04:11 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:39673)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hOQvJ-0000la-5g
	for qemu-trivial@nongnu.org; Wed, 08 May 2019 14:04:09 -0400
Received: by mail-pl1-x630.google.com with SMTP id g9so2870020plm.6
	for <qemu-trivial@nongnu.org>; Wed, 08 May 2019 11:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=easSRJRIFw2ZrC74E2/GAeMUZZ0pyNjONK6UMe55Q44=;
	b=UyJK1YanHnGSm77ONcpvqeddnbq5xDVq/LLA1BoYlravK5xvzT5PqjX+rIny8OjabM
	nZzQkwm8b6ZW7FOjl65pZglQvLA5FGOMU0qVK0D6zdk1CB0JmU84YinWVoz7kMXhZwqP
	vHZsL0iI/Fu3qMx3dymDuNw1RHHAf9cDlVbqaV/DB5t37aAMIutQ8em308HwIrFNlRHK
	a6RM012h8hH2VxMCNZRPdlvq1avliZcJWggjF0FJ6HOVbYQstIH+/EiyBK3Xf1QyRMs6
	4xxOhVljLg66T5kyBVq7SutuRLtpdlKMr5HqbItd3jc5uekRYrsdMBVPxdpJ1xDiPH9a
	IrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=easSRJRIFw2ZrC74E2/GAeMUZZ0pyNjONK6UMe55Q44=;
	b=WSyT3tyn/PjjidVPgy73+M1MZidAFD8C87ZgRuwVUqjGeOLe+pA9w2mAMbTrUJv4Vs
	9MzH/hHDdIPTkAdAatdevo/Z+8mGKtwX6sPoffDpk/rp9x7ad9vRovKUG7vFeMfuYU07
	uqZ8nKFkmBmRwZc7jZVzz+yH2aDZrEY4Y3NobmVqoQjA+0o/PZBRls/EMuHVbzxDklJl
	QKSrCEWltWHA06mD11n7Qg/Kp7lDZB7Rd20oFB0Qs4nFbvsutFK6IWOWXs9CNA+5e6wc
	EFUZFAPTnz6+/Et0JaBXEK+JpuaHNMnNAv8EOiVg147UklvOqXuQMoeohG++94XGAAa2
	UvbQ==
X-Gm-Message-State: APjAAAVwFlV871bjikKRvGq89fWLfPfjegEgEA6Tbu5F8pWqeRSTMhZi
	Dpf9Uq6q52bxd4Nbth/cmRIhCQ==
X-Google-Smtp-Source: APXvYqzqIFNnlPueyDx1/NkgGUBTstOAARobNQAoVZ6tBmtNRjByruTq2BvJ43h6PZccmSnNgfymhQ==
X-Received: by 2002:a17:902:2825:: with SMTP id
	e34mr49840592plb.264.1557338646109; 
	Wed, 08 May 2019 11:04:06 -0700 (PDT)
Received: from [192.168.1.11] (97-113-27-95.tukw.qwest.net. [97.113.27.95])
	by smtp.gmail.com with ESMTPSA id
	k65sm30883316pfj.141.2019.05.08.11.04.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 11:04:05 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
References: <20190508150608.3311-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d783fdeb-fe7a-fc27-3769-1ca245ffd4c7@linaro.org>
Date: Wed, 8 May 2019 11:04:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508150608.3311-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::630
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] include/exec/poison: Mark
 TARGET_FMT_lu as poisoned, too
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
X-List-Received-Date: Wed, 08 May 2019 18:04:13 -0000

On 5/8/19 8:06 AM, Thomas Huth wrote:
> We already poison TARGET_FMT_lx and TARGET_FMT_ld, but apparently
> forgot to poison TARGET_FMT_lu, too. Do it now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/exec/poison.h | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


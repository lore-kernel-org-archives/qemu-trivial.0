Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1evNlW-0006zK-Ef
	for mharc-qemu-trivial@gnu.org; Mon, 12 Mar 2018 09:45:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1evNlU-0006xm-Gy
	for qemu-trivial@nongnu.org; Mon, 12 Mar 2018 09:45:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1evNlQ-0005Jy-DF
	for qemu-trivial@nongnu.org; Mon, 12 Mar 2018 09:45:24 -0400
Received: from mail-ot0-x231.google.com ([2607:f8b0:4003:c0f::231]:40944)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1evNlQ-0005Fb-8n; Mon, 12 Mar 2018 09:45:20 -0400
Received: by mail-ot0-x231.google.com with SMTP id l12so15290031otj.7;
	Mon, 12 Mar 2018 06:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TBtdgv5rVfYV0FP6oyGcnlUAkcasCx7T5yXBmKgu0Gw=;
	b=CHKdpi+OKnuOpmNMrswyhg8kmZCWOQfI3wdVQLHWWT008jK+Jj8Riqe1Ib8CHuWLRE
	doCqiax1JS0jpHx3Rt45kzMZTDyG8VL9+wWENPuFk/yuOtEth7ZFkloWxevEpLCdrctz
	Gkhl4dBEXmgcjUrdbSZ7zYqYUZDUQ8Gy00Ys2cjsRYjCFBP2hohoFDSFdr7Dh5tj6/7o
	l3MbYtv1PFU5QBGpnj+vH82oiAkk3819WhHhDPMYYXKSzqW9guyTnYDrsGObWi7wY4NE
	9wbp2+F6LGOohr4+fgblSirJSXIGzN8rkn5Szd7+a7J6GFJW4dDuN+Gik4wOlkra2gsl
	crTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TBtdgv5rVfYV0FP6oyGcnlUAkcasCx7T5yXBmKgu0Gw=;
	b=mtB5t0/zn3Pj3q/VcfS4sOAFqKyPfOqgvnVGDh2ksYqH+0fOeZgXxn4NH51aqJ0rqu
	Tp9oBehaT5IPV3jRyNBE63t4DS9hZsM4W1K8Q2gixtOH/7MOPRRHs7AVK52YaAe68tHU
	gVNiPhHRB+bqg8/GeF9l0O7uCdyzB9Wmi3G7vZpUHN8z6OvCsUPvwdcJErcNJAxocLfk
	Txt14S2AGKZGemIe0xXLJ1cZsO9uSk5FM0pHcvjSR7yjOqwiG5X2l8yoSsKW+3v2pDrZ
	fBVTWEOgX8svtB11aluG1Tc/yoH4Mr9rEhktWus9yGaLTdjFPbZ38/DKkF+kKtB1MkEc
	NVNg==
X-Gm-Message-State: AElRT7F9R0lSSVmMb2gg0quHHuLjjpd2Ml7/peAbV3iEbPuzPxu2N0f0
	Pk1Yd9f7+PLz60EUF3KxxTH8g5wN
X-Google-Smtp-Source: AG47ELs5Axhn1KCHOX0sYuaKfG6GSWVEdZuj2inRXlLaOKVUKx1tgPwba2BRsB4NzuWvBqrSShExag==
X-Received: by 10.157.80.131 with SMTP id b3mr5220703oth.74.1520862317802;
	Mon, 12 Mar 2018 06:45:17 -0700 (PDT)
Received: from cloudburst.twiddle.net ([172.56.7.167])
	by smtp.googlemail.com with ESMTPSA id
	s11sm3874491ots.18.2018.03.12.06.45.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Mar 2018 06:45:17 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: Stefan Weil <sw@weilnetz.de>,
	Anatoly Trosinenko <anatoly.trosinenko@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20180127134908.24095-1-anatoly.trosinenko@gmail.com>
	<20180127134908.24095-2-anatoly.trosinenko@gmail.com>
	<aab013fb-5ada-6ee5-d038-0277d8ef0b24@weilnetz.de>
	<CAE5jQCfxjM9ykBCes0oDhrc0B6g8AC5Se39sXBsbZo=-dKQpyg@mail.gmail.com>
	<CAE5jQCe8O3BT=6SDdm2p7J_wxgzZTcqhyS1mfnEr=4tci9fipg@mail.gmail.com>
	<efe4a642-a220-5a40-b1e0-769a4216389d@twiddle.net>
	<CAE5jQCcCA=3kkVa=5eMZs-BGAM_p4fZG+GPu1SmQMg7_sPAH5Q@mail.gmail.com>
	<57abe9de-1258-3624-2f8a-882f1de1d19d@weilnetz.de>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <3f76df88-f08e-1178-52ab-2d9906793540@twiddle.net>
Date: Mon, 12 Mar 2018 15:45:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <57abe9de-1258-3624-2f8a-882f1de1d19d@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::231
Subject: Re: [Qemu-trivial] [PATCH 1/1] tci: eliminate UB due to unaligned
 reads
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
X-List-Received-Date: Mon, 12 Mar 2018 13:45:25 -0000

On 03/03/2018 05:41 PM, Stefan Weil wrote:
> Richard, the discussion about non-portable calls to helper functions is
> not new, but I still have no test case which fails. Do you think of a
> special case (architecture, helper function)?

The two that come to mind immediately are:

i386 with a compiler defaulting to stdcall (which I admit is unlikely; it also
would not work for TCG without modification).

m68k (pointers passed in address registers; integrals passed in data registers).


r~


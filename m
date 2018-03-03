Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1es7v4-0006xP-5n
	for mharc-qemu-trivial@gnu.org; Sat, 03 Mar 2018 09:13:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1es7v0-0006w9-7l
	for qemu-trivial@nongnu.org; Sat, 03 Mar 2018 09:13:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1es7uv-0004mw-9Z
	for qemu-trivial@nongnu.org; Sat, 03 Mar 2018 09:13:46 -0500
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:34430)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1es7uv-0004mI-23; Sat, 03 Mar 2018 09:13:41 -0500
Received: by mail-wr0-x244.google.com with SMTP id o8so1322692wra.1;
	Sat, 03 Mar 2018 06:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=v6kaRuNDpQqnNEKK3pp+dI0x7j0M+8jPGwWkuFoqtbI=;
	b=kpJvbbGAZHV1HF5UCwyDH3vNvoO+wOrCtf7YxfSIpb5Lj+9aAagvB/yGRszITQe5Q9
	CY80bJGeL/v2qFFW4RWzsvdvMgst9rKikSNI25XsYFFBTXsoPdjbAk/FEuYVQm5eatot
	y+0N8y04vTVTNNDCcIds2Hc4+gWX6BKR+9+SBROy5OsSM4b4RwsldA1Yau1q/QcyaPRT
	ZXBD3gjzyZRZfnTUfmJy6NSUWF/8aTBdyhYejL3EaFAHS7sr9I8S/VMs/DGIGUwdZN2e
	ql9o2K15bTHC1WyTXGJiUFK1BFKONwu6cF+H//Fl0BKNlU4jBxa9Q3lJAfqALkb2paR/
	+WrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=v6kaRuNDpQqnNEKK3pp+dI0x7j0M+8jPGwWkuFoqtbI=;
	b=pOeMPQ6JIYld07hP81zPpX6abfajb5Tx3fRpvl5b/8iL3TKd0/gk6Tl00gaRG9mqzF
	4W1mxe6Lri3c1UzYgLgYow19Y007VXDR5YUcAah+ayI2ZiyvWN+nMccU8SkIDbAwAoqk
	KJs+Devaf+SoSVvO5kbVnWvHubbUkwgZznVN0GeLqdvyStT2lMxi5z+CdSJ3i1RHbowP
	wOvaGGySccB0lrXK3CzcCQFsl7pYbebDnPyayl2wlQreOLPpzaAHcC+2Lxnq7t/m5+Rm
	1DnuqyKRI30XWZaIur70gBlkSwK4fcrO9qXtE1c2BWhNXxozdWaMUFoUE5vpiAjeUVi8
	JbdA==
X-Gm-Message-State: APf1xPAyOAza3KfdAOk/UxLJ2CFdPEQCh5A+nlNY7xwqS5+N4fL/MSf4
	0Quyl2mjPLqMshCYN2vnGn/iAX8n
X-Google-Smtp-Source: AG47ELvIL/e34PuOPZcwYHnmory1isGCi5ObfFoXuOjVsrjqhhb+VwhNkC7XGXs3cac6LOU4Z3e84g==
X-Received: by 10.223.157.131 with SMTP id p3mr7614279wre.278.1520086419744;
	Sat, 03 Mar 2018 06:13:39 -0800 (PST)
Received: from cloudburst.twiddle.net ([37.205.61.206])
	by smtp.googlemail.com with ESMTPSA id
	h50sm17684271wrf.65.2018.03.03.06.13.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Mar 2018 06:13:39 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
To: Anatoly Trosinenko <anatoly.trosinenko@gmail.com>
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-trivial@nongnu.org
References: <20180127134908.24095-1-anatoly.trosinenko@gmail.com>
	<20180127134908.24095-2-anatoly.trosinenko@gmail.com>
	<aab013fb-5ada-6ee5-d038-0277d8ef0b24@weilnetz.de>
	<CAE5jQCfxjM9ykBCes0oDhrc0B6g8AC5Se39sXBsbZo=-dKQpyg@mail.gmail.com>
	<CAE5jQCe8O3BT=6SDdm2p7J_wxgzZTcqhyS1mfnEr=4tci9fipg@mail.gmail.com>
	<efe4a642-a220-5a40-b1e0-769a4216389d@twiddle.net>
	<CAE5jQCcCA=3kkVa=5eMZs-BGAM_p4fZG+GPu1SmQMg7_sPAH5Q@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <a9fb7f08-9eeb-4120-620e-1f05715ee329@twiddle.net>
Date: Sat, 3 Mar 2018 06:13:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAE5jQCcCA=3kkVa=5eMZs-BGAM_p4fZG+GPu1SmQMg7_sPAH5Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
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
X-List-Received-Date: Sat, 03 Mar 2018 14:13:48 -0000

On 03/03/2018 06:07 AM, Anatoly Trosinenko wrote:
> Can rewriting TCI in such a way that every operation is aligned at 4- or even
> 8-byte boundary fix the situation or are there some more serious problems?

With the current TCI, there are also problems with calls to helper functions.
The only portable way to do this is to use a library such as libffi.

I once rewrote TCI completely in order to address both problems, but that only
brought questions as to why TCI is useful at all.

So.  Why do you want to use TCI instead of a native TCG backend?


r~


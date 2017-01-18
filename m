Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTsMF-0006dB-TL
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jan 2017 10:41:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTsMD-0006b5-9x
	for qemu-trivial@nongnu.org; Wed, 18 Jan 2017 10:41:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTsM9-0004Vn-KV
	for qemu-trivial@nongnu.org; Wed, 18 Jan 2017 10:41:05 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:36217)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <skiver.cloud.yzy@gmail.com>)
	id 1cTsM7-0004U8-N8; Wed, 18 Jan 2017 10:40:59 -0500
Received: by mail-qt0-x242.google.com with SMTP id l7so2058757qtd.3;
	Wed, 18 Jan 2017 07:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=39d2mEB6stMMmlo2cN3iTerZD8SQaIXZieiBwPcYP48=;
	b=ZtwHjvqU3MEip5H6XiYOdZtKfcKTPIi4D8hj7rL9stgGUf+dr50bvZ58XQHaAlD2k5
	1LeOaIRluqm7RHwXIl2qOdurlaXaUMC9W42oTT91WLcRYkrS8V7kJGFNFO+2PNp1HUr0
	A2VBOmSptSDw6ViUSckp7gdUl3klL/OqaLc9vm7+wmxFHzgFU782SI8ji1WcEe0UBs5X
	lDMNgCUe2d6teW87U/5a65oJFx7gYLKfxDVktLoceUVfM7I2beiJFe+Ry1bQ6qro8GeV
	nnxY60GYhJizxWkp9TgSC8ST1uQCoowv/10ne/L/LlG8w/uTVYYTTc9VA62YOha51i/K
	0RPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=39d2mEB6stMMmlo2cN3iTerZD8SQaIXZieiBwPcYP48=;
	b=qb60HQrsLrq+lHy1i8sYBxpnq+wb98lc68AwAzVtAAoMIYQBOSuMSjoWnRfRHP53pj
	ZXwjQM62S1pnSti5k/qmRb30kc058pKu8iE8jr4KmUiKZNtlqgmofz1Eh9oA6UnD3hUm
	EponRgPUjf5sBiFB7/rJQ9NL2Yz0Be4n9aYFSqU0xG0mvTfuvKMU7oJpVhvMhh73r9b2
	U+QxN2cV8Hm3dncD33+l530H8dIyAUTavKvdayN4Y+P7Oq9QEU4jRNn64fYbq+NKdk/i
	z+zhVOI/mr7xHJH+fR2rWdNper9Ud/RG/OFhmnAf/XGY5krSmq3GdApAteTYGhuYYXm8
	0Xvw==
X-Gm-Message-State: AIkVDXJisg5UqjiBW0cYFcyAiyxUGAOoPLFBbooHOXGTgvdksrF2sdtGGgGyUA+8vxNgbJVpRKRxYbBEXXdrtg==
X-Received: by 10.200.48.14 with SMTP id f14mr3258342qte.236.1484754057600;
	Wed, 18 Jan 2017 07:40:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.82.231 with HTTP; Wed, 18 Jan 2017 07:40:57 -0800 (PST)
In-Reply-To: <20170118021334.GB31883@lemon.Home>
References: <1484702052-7900-1-git-send-email-skiver.cloud.yzy@gmail.com>
	<148470234043.214.7219322137444222645@790289a7ca88>
	<CAHkcwafqx4-vMsCVJOZS04Kb1cRVbu2ea802hjdOhJp2JoPA+A@mail.gmail.com>
	<20170118021334.GB31883@lemon.Home>
From: Yang Ziyue <skiver.cloud.yzy@gmail.com>
Date: Wed, 18 Jan 2017 23:40:57 +0800
Message-ID: <CAHkcwadD67N=EgNEKoctTmCzCQFcy9PMw5xH+ssMviDWwdgg8Q@mail.gmail.com>
To: Fam Zheng <famz@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
	Ziyue Yang <yzylivezh@hotmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] gdbstub.c: fix GDB
 connection segfault caused by empty machines
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
X-List-Received-Date: Wed, 18 Jan 2017 15:41:06 -0000

Got it. Thanks!

2017-01-18 10:13 GMT+08:00 Fam Zheng <famz@redhat.com>:
> On Wed, 01/18 09:34, Yang Ziyue wrote:
>> Oops seems I forgot to check the patch before submitting. Sorry for that.
>> The new patch is tagged as v3 now, but I'm not sure whether it should
>> be tagged as v2 since the origin v2 failed. Is there any specification
>> about this? Thanks!
>
> Hi Ziyue, thanks for submitting the patch. When you repost, use v3 please, a
> (even failed or mistaken) version shouldn't be reused, so that people looking at
> the subjects will know which one is newer.
>
> Fam


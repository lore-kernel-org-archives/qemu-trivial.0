Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f44EE-0001Ik-0q
	for mharc-qemu-trivial@gnu.org; Thu, 05 Apr 2018 08:42:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1f44EB-0001HQ-5n
	for qemu-trivial@nongnu.org; Thu, 05 Apr 2018 08:42:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1f44E6-0000BD-7n
	for qemu-trivial@nongnu.org; Thu, 05 Apr 2018 08:42:55 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:38481)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1f44E6-0000B1-0k; Thu, 05 Apr 2018 08:42:50 -0400
Received: by mail-wm0-x230.google.com with SMTP id i3so6671534wmf.3;
	Thu, 05 Apr 2018 05:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qsOlNG6ytV+REPtdXt3owBOP0prVBYwMRASoLqdvnHA=;
	b=Qs9kxzbgGp1wq40r+5xnhuNaNus9jHDVfZOjvduWk5ujih3CKOrDSMr254+J+vWQjO
	Sfb7LgtSFmLvZcDiVBKN33G53aS249cJZ7Jd6lGu11nGrO4BHxDDpINgy9eMxPyM0k48
	UHPoYtcKhl0RpnIcuh9hDQ09aW1Xd/a7FVgPXKWrN4ZQY4tyhU80gtqFXThJ8aQQ445y
	AFbIMWzfBy3y0TOci5n7eSgksDAMBWJNBR3YKuO3V076fP4mOOODYxAXRRLJ28ox9l6+
	ztbQqlZUAQ6UfqGtlJS347eCcBqti4MYH2ci+6aI6IDLCp9HjXhQzfNIZ0DNLa8xjVyK
	Tb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=qsOlNG6ytV+REPtdXt3owBOP0prVBYwMRASoLqdvnHA=;
	b=c8rFrydodlw9BYLWAfrhgFZ8LP05Tjhg4Jf0nmisgxH9d5XyQCd6SgO8IdbLuwsZVq
	3GbBghnJZLO5X15ryKOMaWYKKXqgkgSha82jKsrqyyVoc3MKQ3s+7nDRfkveboaGnlUu
	HmnBCeOA632adS2EJZ/H80YeHifx8SWW7lkdG+l7N7qWjeorEwZJ9+0SUwfoo0/M321K
	KuzHmHjEvN3uF94BZJO2RjY1vG8h1sRSqiR6qMfKfjuaPvX2NzKXdM5JSE9l24LxLbhS
	39YrykA1FNLeTW821g0Hyk16eSVCwNsRVUO5Xmm0Qnx+Y4qz0uyO7GyDhyOGwbQDZK/X
	lDUQ==
X-Gm-Message-State: ALQs6tANp5aGdj/DgpnOrMMW7RulIn9w86Ih5Jyjg5ChHtmIhdNHu+ao
	Tkt3LJPEe5nGJ7pY1yqvJ6bgJ7Na
X-Google-Smtp-Source: AIpwx48Tk4dm/VIFN09lFZw5JRcpT9AfNBscGRb7pwWY1BAn0BP8njKP0f6myXbjC7eryiX8XDL3tQ==
X-Received: by 10.80.215.138 with SMTP id w10mr2815954edi.10.1522932168572;
	Thu, 05 Apr 2018 05:42:48 -0700 (PDT)
Received: from [192.168.10.150] (94-36-194-48.adsl-ull.clienti.tiscali.it.
	[94.36.194.48]) by smtp.googlemail.com with ESMTPSA id
	u59sm4846146edc.30.2018.04.05.05.42.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Apr 2018 05:42:47 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Eric Blake <eblake@redhat.com>, Su Hang <suhang16@mails.ucas.ac.cn>,
	vsementsov@virtuozzo.com
Cc: qemu-devel@nongnu.org, qemu-trivial <qemu-trivial@nongnu.org>
References: <1522029982-4650-1-git-send-email-suhang16@mails.ucas.ac.cn>
	<2cc2bda7-aeb9-f632-f658-06273fd70311@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; keydata=
	xsEhBFRCcBIBDqDGsz4K0zZun3jh+U6Z9wNGLKQ0kSFyjN38gMqU1SfP+TUNQepFHb/Gc0E2
	CxXPkIBTvYY+ZPkoTh5xF9oS1jqI8iRLzouzF8yXs3QjQIZ2SfuCxSVwlV65jotcjD2FTN04
	hVopm9llFijNZpVIOGUTqzM4U55sdsCcZUluWM6x4HSOdw5F5Utxfp1wOjD/v92Lrax0hjiX
	DResHSt48q+8FrZzY+AUbkUS+Jm34qjswdrgsC5uxeVcLkBgWLmov2kMaMROT0YmFY6A3m1S
	P/kXmHDXxhe23gKb3dgwxUTpENDBGcfEzrzilWueOeUWiOcWuFOed/C3SyijBx3Av/lbCsHU
	Vx6pMycNTdzU1BuAroB+Y3mNEuW56Yd44jlInzG2UOwt9XjjdKkJZ1g0P9dwptwLEgTEd3Fo
	UdhAQyRXGYO8oROiuh+RZ1lXp6AQ4ZjoyH8WLfTLf5g1EKCTc4C1sy1vQSdzIRu3rBIjAvnC
	tGZADei1IExLqB3uzXKzZ1BZ+Z8hnt2og9hb7H0y8diYfEk2w3R7wEr+Ehk5NQsT2MPI2QBd
	wEv1/Aj1DgUHZAHzG1QN9S8wNWQ6K9DqHZTBnI1hUlkp22zCSHK/6FwUCuYp1zcAEQEAAc0f
	UGFvbG8gQm9uemluaSA8Ym9uemluaUBnbnUub3JnPsLBTQQTAQIAIwUCVEJ7AwIbAwcLCQgH
	AwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEH4VEAzNNmmxNcwOniaZVLsuy1lW/ntYCA0Caz0i
	sHpmecK8aWlvL9wpQCk4GlOX9L1emyYXZPmzIYB0IRqmSzAlZxi+A2qm9XOxs5gJ2xqMEXX5
	FMtUH3kpkWWJeLqe7z0EoQdUI4EG988uv/tdZyqjUn2XJE+K01x7r3MkUSFz/HZKZiCvYuze
	VlS0NTYdUt5jBXualvAwNKfxEkrxeHjxgdFHjYWhjflahY7TNRmuqPM/Lx7wAuyoDjlYNE40
	Z+Kun4/KjMbjgpcF4Nf3PJQR8qXI6p3so2qsSn91tY7DFSJO6v2HwFJkC2jU95wxfNmTEUZc
	znXahYbVOwCDJRuPrE5GKFd/XJU9u5hNtr/uYipHij01WXal2cce1S5mn1/HuM1yo1u8xdHy
	IupCd57EWI948e8BlhpujUCU2tzOb2iYS0kpmJ9/oLVZrOcSZCcCl2P0AaCAsj59z2kwQS9D
	du0WxUs8waso0Qq6tDEHo8yLCOJDzSz4oojTtWe4zsulVnWV+wu70AioemAT8S6JOtlu60C5
	dHgQUD1Tp+ReXpDKXmjbASJx4otvW0qah3o6JaqO79tbDqIvncu3tewwp6c85uZd48JnIOh3
	utBAu684nJakbbvZUGikJfxd887ATQRUQnHuAQgAx4dxXO6/Zun0eVYOnr5GRl76+2UrAAem
	Vv9Yfn2PbDIbxXqLff7oyVJIkw4WdhQIIvvtu5zH24iYjmdfbg8iWpP7NqxUQRUZJEWbx2CR
	wkMHtOmzQiQ2tSLjKh/cHeyFH68xjeLcinR7jXMrHQK+UCEw6jqi1oeZzGvfmxarUmS0uRuf
	fAb589AJW50kkQK9VD/9QC2FJISSUDnRC0PawGSZDXhmvITJMdD4TjYrePYhSY4uuIV02v02
	8TVAaYbIhxvDY0hUQE4r8ZbGRLn52bEzaIPgl1p/adKfeOUeMReg/CkyzQpmyB1TSk8lDMxQ
	zCYHXAzwnGi8WU9iuE1P0wARAQABwsEzBBgBAgAJBQJUQnHuAhsMAAoJEH4VEAzNNmmxp1EO
	oJy0uZggJm7gZKeJ7iUpeX4eqUtqelUw6gU2daz2hE/jsxsTbC/w5piHmk1H1VWDKEM4bQBT
	uiJ0bfo55SWsUNN+c9hhIX+Y8LEe22izK3w7mRpvGcg+/ZRG4DEMHLP6JVsv5GMpoYwYOmHn
	plOzCXHvmdlW0i6SrMsBDl9rw4AtIa6bRwWLim1lQ6EM3PWifPrWSUPrPcw4OLSwFk0CPqC4
	HYv/7ZnASVkR5EERFF3+6iaaVi5OgBd81F1TCvCX2BEyIDRZLJNvX3TOd5FEN+lIrl26xecz
	876SvcOb5SL5SKg9/rCBufdPSjojkGFWGziHiFaYhbuI2E+NfWLJtd+ZvWAAV+O0d8vFFSvr
	iy9enJ8kxJwhC0ECbSKFY+W1eTIhMD3aeAKY90drozWEyHhENf4l/V+Ja5vOnW+gCDQkGt2Y
	1lJAPPSIqZKvHzGShdh8DduC0U3xYkfbGAUvbxeepjgzp0uEnBXfPTy09JGpgWbg0w91GyfT
	/ujKaGd4vxG2Ei+MMNDmS1SMx7wu0evvQ5kT9NPzyq8R2GIhVSiAd2jioGuTjX6AZCFv3ToO
	53DliFMkVTecLptsXaesuUHgL9dKIfvpm+rNXRn9wAwGjk0X/A==
Message-ID: <871e05e7-fe17-5531-37d1-d5f41af62eff@redhat.com>
Date: Thu, 5 Apr 2018 14:42:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <2cc2bda7-aeb9-f632-f658-06273fd70311@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RFC v3 for-2.12?]
 scripts/checkpatch.pl: Bug fix
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
X-List-Received-Date: Thu, 05 Apr 2018 12:42:56 -0000

On 04/04/2018 20:28, Eric Blake wrote:
> Perl is not my strongest point, so take my review with a grain of salt.
> However, since I already have a couple of other random patches that may
> still be appropriate for -rc3, I can pick this up in a pull request if I
> get at least one more review (and if no one else picks it up first, such
> as the qemu-trivial process or Paolo's misc tree)
> 

I'll pick this up.  Thanks!

Paolo


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXgyn-0007vx-Fm
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jun 2018 01:57:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1fXgyl-0007uW-73
	for qemu-trivial@nongnu.org; Tue, 26 Jun 2018 01:57:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1fXgyk-0006WM-E1
	for qemu-trivial@nongnu.org; Tue, 26 Jun 2018 01:57:27 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:51953)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1fXgyf-0006V1-SC; Tue, 26 Jun 2018 01:57:22 -0400
Received: by mail-wm0-x242.google.com with SMTP id w137-v6so376698wmw.1;
	Mon, 25 Jun 2018 22:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zaiP6ID7RI9YXXLzOpdOXFXl9722s8i8RB302Tg2JKY=;
	b=sCgv4ZXqmTbYnTQaCiTWe36bpQoe7pVS85RfoI52VZOydEUAOSeXM9ekHjahTtnEwA
	Ne0TiSgjrkDiQelVDUTQONkn56WJqMoaL1a1FlygAWRosl/0h/trIvmjH9mVGWiY4Fo0
	4PPwu9r9pqSXbtGAMyIK82f9quQu+xt/uRWjJhmfsDrIFV5TepQglFZqwoAyf9FAu4Dp
	PdbAWie3bhUegJW9Dx5m53dlcKQKsXmSoVXh3JSQRjxO8rlmVCnnVP3REwfuAWtnLEP7
	qKARahOWwvWfr4jVFgraOuh63rK86PstLnb2d2n4R5JI154Fe+P+Q5HFDzFGbhwoLehz
	mpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=zaiP6ID7RI9YXXLzOpdOXFXl9722s8i8RB302Tg2JKY=;
	b=MN2mq6VhtvKxlrmYgh7dRyrL0/evaQ07p7yg7WNxU7ozovuHoKXs20QA2Dyowc8JoU
	BDjwnHmPtG9p58pHWxdjTh62e/6EN33Z1OWYfnYwdkscFAHJXAgyuSNU8ji7MMDkmisJ
	S9MSZSTSZ5zlxpKo78X/RE+lce+cSALi1PvpDuqWdt9pGo15J+wX6QRBwxeRkSaHkNhQ
	8uYmf2qgiJTeImIdVAUqm19HR3mJ1EQxZQsKYCBMVxlpjhWqmZEvWMAbKC+mpn5EW6D9
	TJp0C293WEcPij+9JliGRykEnF49BK487lSU78oPjQ85EdPRFV1Azd9oubXU4sXZT7mN
	qiqg==
X-Gm-Message-State: APt69E0hIFYu0c7sOd8K97Ae/dtHo5sdsm2llJOcqCQr46rcOOjBPKU4
	HvS+PpFUW4oBIr+6tPARwFc=
X-Google-Smtp-Source: AAOMgpdzQf7KVE6+xtisOMyh0AA4NVXn38zeIsKgQk8/QBtgplrBppqUGacmrymapx6IgMyD3Npbdw==
X-Received: by 2002:a1c:8803:: with SMTP id k3-v6mr404522wmd.6.1529992640343; 
	Mon, 25 Jun 2018 22:57:20 -0700 (PDT)
Received: from [192.168.10.150] ([82.84.124.111])
	by smtp.googlemail.com with ESMTPSA id
	e3-v6sm943436wmd.2.2018.06.25.22.57.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 22:57:19 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
	zhang.zhanghailiang@huawei.com, Ben Warren <ben@skyportsystems.com>,
	qemu-trivial@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
References: <20180619171539.0adc90d6.cohuck@redhat.com>
	<d4e02083-c372-3ce5-d4a2-4809579fc8f2@redhat.com>
	<20180622181108.GY7451@localhost.localdomain>
	<c10c2ffa-7ee2-5106-07d1-528df939d6ad@redhat.com>
	<20180622193522.GI7451@localhost.localdomain>
	<743d495e-51cd-8c8e-293e-026b8dece74a@redhat.com>
	<87lgb3xsv8.fsf@dusky.pond.sub.org>
	<4292432f-5f26-6925-4c14-ad1370e36e5b@redhat.com>
	<20180625173056.GM7451@localhost.localdomain>
	<97504b42-9ebe-45c5-6ff3-b43102c8374a@redhat.com>
	<20180625195126.GN7451@localhost.localdomain>
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
Message-ID: <a931e759-879b-6f6b-3524-4b5a78fed323@redhat.com>
Date: Tue, 26 Jun 2018 07:57:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180625195126.GN7451@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [RFC PATCH 4/4] qemu-options: Do
 not show -enable-kvm and -enable-hax in the docs anymore
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
X-List-Received-Date: Tue, 26 Jun 2018 05:57:28 -0000

On 25/06/2018 21:51, Eduardo Habkost wrote:
>> Before that we should ask what the benefit is in changing the default
>> for qemu-system-*.  Nobody is using it in practice to start QEMU with
>> KVM enabled...
>
> How can you be sure?  If qemu-system-* is installed with KVM
> compiled in, libvirt will probe it using
> "-machine none,accel=kvm:tcg" and run the VM using
> "-machine $MACHINE,accel=kvm".

Right, that needs to be qualified with "without libvirt".

> In either case, I'm not arguing (yet) for changing the default
> upstream.  I'm just arguing for upstream QEMU to not make any
> promises about the default.

It would be a guest ABI breakage for TCG guests, so it would only apply
to new machine types.  I don't think it's worth the complication.

BTW, another thing that needs documenting is ABI promises for HAX and
WHPX.  Both do not support -cpu in any meaningful way, at least WHPX
installs a migration blocker.

Paolo


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fLFRt-0005wQ-V7
	for mharc-qemu-trivial@gnu.org; Tue, 22 May 2018 18:08:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fLFRp-0005v8-Vj
	for qemu-trivial@nongnu.org; Tue, 22 May 2018 18:08:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fLFRm-0005zk-Qp
	for qemu-trivial@nongnu.org; Tue, 22 May 2018 18:08:01 -0400
Received: from mail-pl0-f66.google.com ([209.85.160.66]:32886)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1fLFRm-0005zL-L2
	for qemu-trivial@nongnu.org; Tue, 22 May 2018 18:07:58 -0400
Received: by mail-pl0-f66.google.com with SMTP id n10-v6so11715732plp.0
	for <qemu-trivial@nongnu.org>; Tue, 22 May 2018 15:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=57r24FEbDFttBtEJO8aw7a+9/1TdjZ6b6DkimrL4PIU=;
	b=E4AIC0uf0xm5BYhoMs3tYx8bVlAOP+bn/DHvvYUz0bmXJpsJxs0KfIDBuod+HuPQOw
	3tZ61kBljI9lyJw7YMuApbe3R6mtICWIdgwcSaTmUrACU6m7qKIPDH+oM0okjC63amm0
	2OiGKfw0GtERawC14RSyjpPwfUq/W5jkLhmcAq50xwts8xg+DA2sMDzuiE/4SeOhmK19
	7U6aox8E2CEE9v2tBzT9o5NVfUb5sQP1sX0eWn3cqs6z5KL8PjgNz+OIy4VyjYDp0eJQ
	Umt7bbvqiY39Pkr6JY6klKsjAXNgv6osV4tEea9d95M/S8BV1LHrW3LqeNixvLgm13R6
	G2ww==
X-Gm-Message-State: ALKqPwf40QkM3VEkeXvmvApwW4piu4RTszO+o02BGrV1qhjtphu+xwvp
	Up2Kyw8oZei17Hq/AmYl/E8iMPaqkQU=
X-Google-Smtp-Source: AB8JxZpEswQr0fzKGbp8zMMoWafRqwmZlL71Ev1tmtrr7ihoXTf9CdZd5ykOv749DEiSeHsGyFDxpA==
X-Received: by 2002:a17:902:1aa:: with SMTP id
	b39-v6mr274371plb.120.1527026877765; 
	Tue, 22 May 2018 15:07:57 -0700 (PDT)
Received: from [172.16.10.49] ([72.28.93.232])
	by smtp.gmail.com with ESMTPSA id
	p71-v6sm40446595pfl.170.2018.05.22.15.07.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 May 2018 15:07:57 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	David Hildenbrand <david@redhat.com>
References: <20180522192034.13318-1-pbonzini@redhat.com>
	<CAFEAcA_mU6wvzGCvhv_OvX37QqyNkMdwfM8Kc6swNQK=tCZMYA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <91829340-f17a-1c24-715c-fe0fd6953ebc@redhat.com>
Date: Wed, 23 May 2018 00:07:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_mU6wvzGCvhv_OvX37QqyNkMdwfM8Kc6swNQK=tCZMYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tcg: remove softfloat from
 --disable-tcg builds
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
X-List-Received-Date: Tue, 22 May 2018 22:08:04 -0000

On 22/05/2018 21:27, Peter Maydell wrote:
> On 22 May 2018 at 20:20, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> Even though the presence of softfloat does not cause --disable-tcg builds to fail,
>> it is the single largest .o file in them.  Remove it, since TCG is the only client.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  Makefile.target          |   2 +-
>>  hw/i386/x86-iommu-stub.c | 132 +++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 133 insertions(+), 1 deletion(-)
>>  create mode 100644 hw/i386/x86-iommu-stub.c
> 
> Is this new x86-iommu-stub.c file intended to be in this patch?

No, of course not.  I probably fat fingered a "r" into "f" in git rebase
-i...

Paolo



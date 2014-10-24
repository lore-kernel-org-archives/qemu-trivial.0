Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xha1J-0002qE-WA
	for mharc-qemu-trivial@gnu.org; Fri, 24 Oct 2014 04:14:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Xha18-0002b3-Tv
	for qemu-trivial@nongnu.org; Fri, 24 Oct 2014 04:14:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Xha0z-0004vc-Ry
	for qemu-trivial@nongnu.org; Fri, 24 Oct 2014 04:14:38 -0400
Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233]:45105)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Xha0P-0004qr-EA; Fri, 24 Oct 2014 04:13:53 -0400
Received: by mail-pd0-f179.google.com with SMTP id g10so1037877pdj.24
	for <multiple recipients>; Fri, 24 Oct 2014 01:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=bm9ekcLVJ9/cmbYuVrnkrLJXjLs9Lhi9jbJqYmLh7rY=;
	b=VII/jR84lqSpgT4xtdDYrasjoqWtoK/t9DzefhTNDp953cHDCOmbYXp5JIiBxP0o7d
	C9Vehn0cxk9q/xhJEvp7aMgvwsvvFmTfoNRNblHbrB10stYgfurR7c9L8J7nZMu0GBv7
	JsMIJKkNCICBfM4Svz61/EgPAAWIPxvTARgKuWVc4qaZE1HGN3ohdXLBrvJSWNn1jUYG
	fghwAf3qR28RQ+dNag6tXB+DRSA1ELEe91LGxffAPoBHqhSG3H0P2TMc5K0/EXqF7ZHj
	/nvN8ylb+qYbso0u9GCC7HSGm1KAyZm6tLspH4ZGwBjpjjlimCBgq6e6JBim/3sX5qni
	DWlQ==
X-Received: by 10.68.69.76 with SMTP id c12mr2905283pbu.59.1414138431298;
	Fri, 24 Oct 2014 01:13:51 -0700 (PDT)
Received: from [192.168.2.113] ([124.127.118.42])
	by mx.google.com with ESMTPSA id h6sm3296251pdk.38.2014.10.24.01.13.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Oct 2014 01:13:50 -0700 (PDT)
Message-ID: <544A0B9F.9040500@gmail.com>
Date: Fri, 24 Oct 2014 16:19:43 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Alexander Graf <agraf@suse.de>, 
	pbonzini@redhat.com
References: <543BE352.3080609@gmail.com> <543BE616.1000707@suse.de>
	<544A046D.4090204@msgid.tls.msk.ru>
In-Reply-To: <544A046D.4090204@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::233
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel <qemu-devel@nongnu.org>, kvm@vger.kernel.org
Subject: Re: [Qemu-trivial] [PATCH] target-ppc: kvm: Fix memory overflow
 issue about strncat()
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
X-List-Received-Date: Fri, 24 Oct 2014 08:14:48 -0000


On 10/24/14 15:49, Michael Tokarev wrote:
> On 10/13/2014 06:47 PM, Alexander Graf wrote:
>> On 13.10.14 16:36, Chen Gang wrote:
>>> strncat() will append additional '\0' to destination buffer, so need
>>> additional 1 byte for it, or may cause memory overflow, just like other
>>> area within QEMU have done.
>>>
>>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
>>
>> I agree with this patch. However, the code is pretty ugly - I'm sure it
>> must've been me who wrote it :).
>>
>> Could you please instead rewrite it to use g_strdup_printf() rather than
>> strncat()s? That way we resolve all string pitfalls automatically - and
>> this code is not the fast path, so doing an extra memory allocation is ok.
> 
> I'd just use snprintf() like this:
> 
> diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
> index 9c23c6b..5eaa36c 100644
> --- a/target-ppc/kvm.c
> +++ b/target-ppc/kvm.c
> @@ -1794,8 +1794,7 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
>          return -1;
>      }
> 
> -    strncat(buf, "/", sizeof(buf) - strlen(buf));
> -    strncat(buf, propname, sizeof(buf) - strlen(buf));
> +    snprintf(buf + strlen(buf), sizeof(buf) - strlen(buf), "/%s", propname);
> 
>      f = fopen(buf, "rb");
>      if (!f) {
> 
> the buffer is of size PATH_MAX, and we're looking at /proc filesystem where
> names should be rather short so we're extremly unlikely to hit this prob in
> practice, there's no need to dynamically allocate a buffer for this stuff.
> 
> (Or alternatively there's asprintf(), but still I think it is overkill).
> 
> I can apply the above if everyone agrees.
> 

For me, what you said is reasonable, although I am not sure whether the
patch v2 for g_strdup_printf() was already applied or not.

Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed


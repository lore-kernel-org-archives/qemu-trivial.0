Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZIKDr-0002Of-LA
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jul 2015 13:23:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ZIKDp-0002Ku-5H
	for qemu-trivial@nongnu.org; Thu, 23 Jul 2015 13:23:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ZIKDo-0005Sb-BF
	for qemu-trivial@nongnu.org; Thu, 23 Jul 2015 13:23:53 -0400
Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229]:34819)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1ZIKDj-0005Qu-8x; Thu, 23 Jul 2015 13:23:47 -0400
Received: by wibxm9 with SMTP id xm9so218145865wib.0;
	Thu, 23 Jul 2015 10:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=LdYLTFINmeWJTIBqo05GGrlkBY5kQ/VxUr9n83SiyLU=;
	b=mZNTSOugd+7z57NyeQKThWydXOf/0T1l61fueccbNStn76rllQMoIXECSYAm+2WJg/
	TOOeHWjn752ZYlpFR1KyGw0qte7oKU9SsjdmgHIP/E1cs786Cp+y1xeWM9jq7V5cAv6z
	hmjd7MjfAsmD0eksG+O4fQmtB7bfkmECTrHkzPcdWHLHCb6opRrVA5Wpbbqz7A5yo8j0
	kDkfIOYIfK2roG+0nfoyNTliJK/wphCv/+OvcU6HGIxwzE5+Wqlrl7hxRUtgxzuwdmQf
	56IVYRuKfauJBrcDbi0vdUffIHcX5tUmuF3owJIt7UeZRY1u2DbYNg2Abav5yHvpU3OR
	rstg==
X-Received: by 10.194.2.228 with SMTP id 4mr17045592wjx.146.1437672226658;
	Thu, 23 Jul 2015 10:23:46 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-94-39-188-187.clienti.tiscali.it.
	[94.39.188.187]) by smtp.googlemail.com with ESMTPSA id
	x10sm8491368wjr.25.2015.07.23.10.23.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jul 2015 10:23:45 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Gonglei <arei.gonglei@huawei.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1435917057-9396-1-git-send-email-arei.gonglei@huawei.com>
	<CAFEAcA98iYE=p2vi=5YuUHRV5g-WwVk=dKtQo2qU4OXDa0GBpQ@mail.gmail.com>
	<55B0DD76.4080400@huawei.com> <55B0DE0B.8020704@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <55B12320.6080409@redhat.com>
Date: Thu, 23 Jul 2015 19:23:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.0.1
MIME-Version: 1.0
In-Reply-To: <55B0DE0B.8020704@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::229
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] qemu-doc: fix typos
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
X-List-Received-Date: Thu, 23 Jul 2015 17:23:54 -0000



On 23/07/2015 14:28, Gonglei wrote:
> On 2015/7/23 20:26, Gonglei wrote:
>> On 2015/7/3 17:59, Peter Maydell wrote:
>>> On 3 July 2015 at 10:50,  <arei.gonglei@huawei.com> wrote:
>>>> From: Gonglei <arei.gonglei@huawei.com>
>>>>
>>>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>>>
>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>>
>>> thanks
>>> -- PMM
>>>
>> Hi, Paolo
>>
>> Would you pick up this patch for 2.4-rc3?
>> It's trivial but make sense and no harm.
>>
> Oops, forget to Cc Paolo.

Ok, picked up.

Paolo


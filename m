Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYGdx-0007Vl-JP
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jul 2017 14:57:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dYGdv-0007U1-8Z
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 14:57:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dYGdu-0007Wx-LB
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 14:57:47 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:33231)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dYGdq-0007Vs-8o; Thu, 20 Jul 2017 14:57:42 -0400
Received: by mail-qk0-x241.google.com with SMTP id u126so2298268qka.0;
	Thu, 20 Jul 2017 11:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=S7OBXFz9OQpi0d7dDj6anFPPqGUOrApPikv1e3zvpts=;
	b=mMslVwgGv2lgAmV/mqR9Sc7wA1Po4mWQCwoCwPPHDLDQqq3Ril7SkLFWNHDgGRRc3c
	qdmpNZVd1InCHP9OuJfEJdjXJpXnbBCyojQzyhQPUG8dxdXrH8KfB2uSSaWtAVUOXTox
	8maa0GpLXpMM1pHGjOg07PmDQ1jZUoSfmtGfrTTA4bYyKkxX0veTMDcnmdYMMA3F6ByN
	tiS57JXSJ+xkdn+Zgq8TN6pDZphWPHCfzfRS8M2fdnRSuGUYxCsisdvTEOWSlUhOWgMJ
	SrNn4w/7SrKSuNmoL7faBuvLubhqzoMqM2TVsTT/dxKcAiiwIJutMLGqt4eSus4Q1Hqt
	ZyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=S7OBXFz9OQpi0d7dDj6anFPPqGUOrApPikv1e3zvpts=;
	b=OFih1+SU9/pzL/DaCA4pk1pkYWEeDGY9BpRpQC6RDIXkgBp2Bv0W4S1o7KckoTLiHx
	x9U95CPYZVYzNsiDX6G4lXunzLvhHZnTknuhhxgpwNiyHAauk6AxGi4Z36hsYymfwmNz
	AfhucsZsZ6L1uUm4VJ1CvGEoaxWUCx5NlmcVJddpvrmZlKSUzWnuX+nzI8K8ithJYLtS
	4k5MBtzoXzHukzOl67aakjT3xB6LrjwT7b67IIiyfNS0s/+dHZ/r/GjlAhl7Hp2C0oiP
	CV8OclfxxHSIC37PsD8u8/vkKemyZbrueDsz1yWKGG5Gc8bH+9YGsh1iDt33oxsMTDUK
	arKg==
X-Gm-Message-State: AIVw113yxl0ef8+7R0AVjZmxSYcK/vHd7JGKuqHKUBr0nEYaHgCncCIm
	i277PM6o8mdalA==
X-Received: by 10.55.22.100 with SMTP id g97mr6447086qkh.228.1500577061313;
	Thu, 20 Jul 2017 11:57:41 -0700 (PDT)
Received: from bigtime.twiddle.net (14-203-206-9.tpgi.com.au. [14.203.206.9])
	by smtp.googlemail.com with ESMTPSA id
	p9sm2273618qte.48.2017.07.20.11.57.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jul 2017 11:57:40 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: patches@linaro.org, Cornelia Huck <cohuck@redhat.com>,
	Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
References: <1500568290-7966-1-git-send-email-peter.maydell@linaro.org>
	<d4b6f6a0-3479-795a-97b2-68c98a6b0c24@twiddle.net>
	<c1526558-db87-734b-c1dd-7601ceaa682c@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <06919388-6794-d0a0-f014-b95a9cc68460@twiddle.net>
Date: Thu, 20 Jul 2017 08:57:30 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <c1526558-db87-734b-c1dd-7601ceaa682c@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10] Use qemu_tolower()
 and qemu_toupper(), not tolower() and toupper()
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
X-List-Received-Date: Thu, 20 Jul 2017 18:57:48 -0000

On 07/20/2017 08:48 AM, Eric Blake wrote:
> On 07/20/2017 01:26 PM, Richard Henderson wrote:
>> On 07/20/2017 06:31 AM, Peter Maydell wrote:
>>> gdbstub.c:914:13: warning: array subscript has type 'char'
>>>
>>> This reflects the fact that toupper() and tolower() give
>>> undefined behaviour if they are passed a value that isn't
>>> a valid 'unsigned char' or EOF.
>>
>> Not saying we shouldn't use qemu_tolower etc, but this statement is not
>> true at all.  Officially, the argument to toupper and tolower is type int.
> 
> Correct. Officially, the argument to toupper is an int, but
> range-constrained to the set of ints that represent either EOF or an
> unsigned char value.

Please show me that language in C11 (or any other version).
My copy has:

    7.4.2.2 The toupper function

    Synopsis
1  #include <ctype.h>
    int toupper(int c);

    Description
2  The toupper function converts a lowercase letter to a corresponding
    uppercase letter.

    Returns
3  If the argument is a character for which islower is true and there
    are one or more corresponding characters, as specified by the current
    locale, for which isupper is true, the toupper function returns one
    of the corresponding characters (always the same one for any given
    locale); otherwise, the argument is returned unchanged.

I see nothing about range constraints.  The word "unsigned" does not appear.


r~


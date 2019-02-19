Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwDal-0000YM-MM
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 17:10:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1gwDaj-0000V5-Oh
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 17:10:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1gwDWg-0004PT-5J
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 17:06:06 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:34639)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1gwDWe-0004KD-V1; Tue, 19 Feb 2019 17:06:05 -0500
Received: by mail-ed1-x541.google.com with SMTP id b3so18199138ede.1;
	Tue, 19 Feb 2019 14:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=pkPb1FfgvFeqz3Igzw3bt1zuUSLkxTReB8rhM6ZWcGk=;
	b=XFVZsCEZ/fP9vmrnAIXoGZuVAkwW9qxHfpp24MdkDzKVebbwxd1epApgNUkPrZvaS+
	ntMriNQP75Bf6huefOFikCS9Tcg7WqfT9iI47meKo31AxJAKKIusZgDVY5phqTzkAnv6
	vxZV0lfU0Hl1K//L9Ift2AjyPSSlYt43PmNTKeNgDryGkh3kCpdFmHmAnAd39IP/VM+S
	oWhKCtbbWjpfruquqbaNKnlJ0LeojU28EpTD4GxVl8/KNupW+gl96sD7NhirGej16U/w
	GrPEb/JiW8alQLYCiqZqYn2KMELHZHKevDTXTHNcKnmjCV57oEGp/mY1VW7Jmi1g+J/3
	A/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=pkPb1FfgvFeqz3Igzw3bt1zuUSLkxTReB8rhM6ZWcGk=;
	b=m5HeG68jTMGAPDbJIIDmUNy7A18owy0vMbkef7DTC/19T4ieQO1xNSE5v3lYWDoMjJ
	xPJvZTw1csW06g9SRWmFuY2oKOlFxVS3zGyu7h9/CyzDdv45uHcbyh/AeIJezKlqnPSZ
	TNPJCb7VUbQa3wl2EZymTv043eT4qIjhewp5yFvgK/A8c/171wLRhcAJu8M2ZPRmUkKR
	zXQmgqINH3hVHaRRLYRoiLORyreHAxWo5t7gnb1LFlm2EOpDehrxv8zYkW4ygwO4LlnV
	loLNMvwch/ko01kHiPeaNX01EKk9lRFgjWgGwoUMaM7/OOhCK5uVBOgI99y58bN3iGsY
	Ms6Q==
X-Gm-Message-State: AHQUAuYN2QBogg9gNjjFbBpLzVkSlcH+oLpeXrMgi38/+R+vWRsRfiLW
	3TgXnXWejy1BcOo1AY5gFus=
X-Google-Smtp-Source: AHgI3Ib04HC0M8+p7FP3dyEx/g7mmr52We2vLPAFJkkIjXwpkRhaiw16SWvARwkowrdPWW8Lj0dsjQ==
X-Received: by 2002:a50:9753:: with SMTP id d19mr16828861edb.143.1550613945300;
	Tue, 19 Feb 2019 14:05:45 -0800 (PST)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
	n60sm5008710edc.90.2019.02.19.14.05.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Feb 2019 14:05:44 -0800 (PST)
Date: Tue, 19 Feb 2019 22:05:44 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, imammedo@redhat.com, mjt@tls.msk.ru
Message-ID: <20190219220544.g5uyxxxedmjuzfm3@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20190219013106.17538-1-richardw.yang@linux.intel.com>
	<20190219013106.17538-3-richardw.yang@linux.intel.com>
	<ba83c335-c0f1-5190-33a9-f2f7f44c55f0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba83c335-c0f1-5190-33a9-f2f7f44c55f0@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] CODING_STYLE: indent
 example code as all others
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
X-List-Received-Date: Tue, 19 Feb 2019 22:10:18 -0000

On Tue, Feb 19, 2019 at 06:38:54PM +0100, Philippe Mathieu-Daudé wrote:
>On 2/19/19 2:31 AM, Wei Yang wrote:
>> All the example code are indented with four spaces except this one.
>> 
>> Fix this by adding four spaces here.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> ---
>>  CODING_STYLE | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>> 
>> diff --git a/CODING_STYLE b/CODING_STYLE
>> index 73f66ca185..27581d80c1 100644
>> --- a/CODING_STYLE
>> +++ b/CODING_STYLE
>> @@ -134,10 +134,10 @@ block to a separate function altogether.
>>  When comparing a variable for (in)equality with a constant, list the
>>  constant on the right, as in:
>>  
>> -if (a == 1) {
>> -    /* Reads like: "If a equals 1" */
>> -    do_something();
>> -}
>> +    if (a == 1) {
>> +        /* Reads like: "If a equals 1" */

I don't get your point.

You mean to put it into multiline comments?

>
>I guess you found a bug in the documentation :)
>
>Since 8c06fbdf36bf4d the style asked is:
>
>    We now require Linux-kernel-style multiline comments:
>        /*
>         * line one
>         * line two
>         */
>
>> +        do_something();
>> +    }
>>  
>>  Rationale: Yoda conditions (as in 'if (1 == a)') are awkward to read.
>>  Besides, good compilers already warn users when '==' is mis-typed as '=',
>> 

-- 
Wei Yang
Help you, Help me


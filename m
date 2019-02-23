Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gxKoV-0007Xs-Lm
	for mharc-qemu-trivial@gnu.org; Fri, 22 Feb 2019 19:05:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1gxKoU-0007Xk-0N
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2019 19:05:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1gxKoT-0007qy-6t
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2019 19:05:05 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:46087)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1gxKoS-0007PC-VF; Fri, 22 Feb 2019 19:05:05 -0500
Received: by mail-ed1-x541.google.com with SMTP id f2so3200248edy.13;
	Fri, 22 Feb 2019 16:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=FI7aacWNHjNXoFXKx60Q2IyuJmmw/dfCfO1rmvueY28=;
	b=UE3LTafCto1JSiXjDgkFA9hpGqkTAzpbGUCBaIhQJnjZsMTpFeNxXDHg+RC1WhqCxi
	jYqRsk+Af2+Sxt7isSsfImmzSiAINKstyt7/iB53ZhwHRH4LExrO8WpcqjKVQZhhi+7j
	BeBo6w7ZzjPUFIPw0vu7ihKkU52rWSUgHjKHL4clMI+Ejo7Qgl6FPxqymndIv4qC47cN
	AGkn+zA0FAkQ5vZE8DlHdGrNPNsKMVqQIsKs68UW9DidqEUzn5/bbD/+hLPnOinDoJ8k
	e+mgM8AgOj3Eez47W8vC5eIHwrWjyLfUOC20pjbakmvo6T3/5sSnpzF9Kz15ZiG+VrGx
	y3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=FI7aacWNHjNXoFXKx60Q2IyuJmmw/dfCfO1rmvueY28=;
	b=psfF9mOh3c9kEObN6HM2Q8fL6jAlfBf+nU8ya6K3WcWAk03SzVEd2mvTGO0UR9F9/z
	TDJzHjbf/2FmpyM5RnFiOF1kUNa3fj2LSSHkAYiItS1oLSs21haWzWnpsuxuvIGJmiYl
	WIgeqvKZKAaDbhNk4KFktB4x4+ANxzpW7mkZ/mXkzJFIhEvLiEte0E3Te1h1PYkJU0ex
	slRGtoW4ft4sarjRowJdQSu6JpAZtws8hpH4PM6XZRaYD1PM/m2a9d9FVE4gTl362rw9
	HzWpv0+lHmUOXIke4WGLWKgtINSHoRI5O+Myf5wgc16RGx2GvTxbPpy1hdZsCWnA3ZO7
	sZIw==
X-Gm-Message-State: AHQUAuYgB4+nHhrjjzVOdGgXT/BDt12siWCpZzPRKDGSlpMEkrj7bYZg
	v9eOGFafWCchPWVK1ph/Oro=
X-Google-Smtp-Source: AHgI3IZoFupsdl0+umZ7Awcn4IVUkpHGbm2tGbJZz3zdmiEqgO5IL5nNvqDc6fYDRT2CZsI+8tU9yw==
X-Received: by 2002:a50:86d1:: with SMTP id 17mr5307824edu.191.1550880266457; 
	Fri, 22 Feb 2019 16:04:26 -0800 (PST)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
	cd11sm500749ejb.61.2019.02.22.16.04.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Feb 2019 16:04:25 -0800 (PST)
Date: Sat, 23 Feb 2019 00:04:25 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>, peter.maydell@linaro.org,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru, qemu-devel@nongnu.org,
	philmd@redhat.com
Message-ID: <20190223000425.hjefbg25qlgdwf7t@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20190220031557.26293-1-richardw.yang@linux.intel.com>
	<20190220031557.26293-2-richardw.yang@linux.intel.com>
	<20190221155519.5f199561@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190221155519.5f199561@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 1/2] CODING_STYLE:
 specify the indent rule for multiline code
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
X-List-Received-Date: Sat, 23 Feb 2019 00:05:06 -0000

On Thu, Feb 21, 2019 at 03:55:19PM +0100, Igor Mammedov wrote:
>On Wed, 20 Feb 2019 11:15:56 +0800
>Wei Yang <richardw.yang@linux.intel.com> wrote:
>
>> We didn't specify the indent rule for multiline code here, which may
>> mislead users. And in current code, the code use different rules.
>> 
>> Add this rule in CODING_STYLE to make sure this is clear to every one.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> 
>> ---
>> v3:
>>    * misleading -> mislead
>>    * add comma after arg2 in example
>> v2:
>>    * rephrase changelog suggested by Eric Blake
>>      - remove one redundant line
>>      - fix some awkward grammar
>>      - add { ; at the end of example
>> 
>> c1
>> ---
>>  CODING_STYLE | 23 +++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>> 
>> diff --git a/CODING_STYLE b/CODING_STYLE
>> index ec075dedc4..1359f9ab81 100644
>> --- a/CODING_STYLE
>> +++ b/CODING_STYLE
>> @@ -29,6 +29,29 @@ Spaces of course are superior to tabs because:
>>  
>>  Do not leave whitespace dangling off the ends of lines.
>>  
>> +1.1 Multiline Indent
>> +
>> +There are several places where indent is necessary:
>> +
>> + - struct definition
>> + - if/else
>> + - while/for
>> + - function definition & call
>> +
>> +When breaking up a long line to fit within line widths, align the secondary
>s/widths/width/
>
>> +lines just after the opening parenthesis of the first.
>> +
>> +For example:
>> +
>> +    if (a == 1 &&
>> +        b == 2) {
>> +
>> +    while (a == 1 &&
>> +           b == 2) {
>> +
>> +    do_something(arg1, arg2,
>> +                 arg3);
>> +
>
>there is also another widely used acceptable pattern
>  func_name(arg1, arg2,
>      arg3)
>
>where we indent relative to function name start
>(sound weird to me but I'm not sure how to word it properly)
>

Hmm... we may need to add this exception case.

>>  2. Line width
>>  
>>  Lines should be 80 characters; try not to make them longer.
>

-- 
Wei Yang
Help you, Help me


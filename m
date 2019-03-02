Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h02a0-0002Fq-Hz
	for mharc-qemu-trivial@gnu.org; Sat, 02 Mar 2019 06:13:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1h02Zv-0002Eb-VG
	for qemu-trivial@nongnu.org; Sat, 02 Mar 2019 06:13:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1h02Zv-0003oN-23
	for qemu-trivial@nongnu.org; Sat, 02 Mar 2019 06:13:15 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:41406)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1h02Zu-0003j8-Pr; Sat, 02 Mar 2019 06:13:14 -0500
Received: by mail-ed1-x543.google.com with SMTP id x7so467174eds.8;
	Sat, 02 Mar 2019 03:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=A8hOLtyWSB+hnoRz07lHD7ZGnDEAocJDD5u2GMX9qRY=;
	b=DnkPUdDUbFoY97210N1QcMqRnv5vVkskGOlwqvtsfGllY6rqgKpeCqL4azhssEhL8t
	EG7G6GagTIZ1100CSLVlRn5+DpJVBOJbZyLQLt061rhVo5AWtczugV1ZtQbTddaL53TW
	lsbEpBw8kgmDv3NHi+r9RoXLF8G07Q3f9lEkAnI5envqBSYuSVSefIZlZCcfAF9S+xLK
	VsO7TU7hzDSCnJcbXrJTAfvNAapI3EFEuRPU0XWbFZfh0yrm4TWil01mS138VMxzIf6K
	/hpXfaDv0gzN/ipwpHOb1GNSdTJ73mjL+JljWEwpoBv8Mxl6hg4TB/fnTl+/mtznjHic
	gBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=A8hOLtyWSB+hnoRz07lHD7ZGnDEAocJDD5u2GMX9qRY=;
	b=NKviZQ3h0qVsMG7tsIiSyeOYDSKYfb4AfiIAsYLgEznQBXgRmPAOHzdOz3eyT4ExR9
	YIn/w1wj2PjkW4nts+37xq3ahlu+MIYAwpn270UYg+zpmC5V+hjJ1QPdj1XyGxIyr7ul
	18DSK/kRkuQ8OiFWjZi8rkib15E3uYJbw1kEcAI5oBit8O6Ro38CNnocuLrIP1h/VSoT
	DWoaHCjgjttaPu087ojseOe6yr+0A5kgRfLi7wBPJUWosqkb/rn4WdHLYJKuT/c1q7Ql
	WNtUYE9xJEI54678RGu4UAr3QULG2EMtqRQTEdwBStFb6Zg8WMOwCe2OIphawMoYYog3
	Iyvg==
X-Gm-Message-State: APjAAAUNWt3VeC36AOU/sGAUGCuBgWzgoLdAVhTjeALrv8jPJFrcEY5X
	DvsevWyLnMHpeWIwdHq4OGo=
X-Google-Smtp-Source: APXvYqyY6tDcFvud8B/yPABN9zITQ2R0H6Rh6/iIfD+6YY0gmj84v7KgAf6f9PiqH6qFZ9bRaYG0jg==
X-Received: by 2002:a17:906:7f88:: with SMTP id
	f8mr6334953ejr.108.1551525193350; 
	Sat, 02 Mar 2019 03:13:13 -0800 (PST)
Received: from localhost ([185.92.221.13])
	by smtp.gmail.com with ESMTPSA id s3sm262478edm.78.2019.03.02.03.13.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 02 Mar 2019 03:13:12 -0800 (PST)
Date: Sat, 2 Mar 2019 11:13:11 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>, peter.maydell@linaro.org,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru, qemu-devel@nongnu.org,
	imammedo@redhat.com, philmd@redhat.com
Message-ID: <20190302111311.tmltfdv5dsnkymky@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20190301020147.18567-1-richardw.yang@linux.intel.com>
	<20190301020147.18567-2-richardw.yang@linux.intel.com>
	<20190301095522.65dzdgcwq7ftk5wr@steredhat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190301095522.65dzdgcwq7ftk5wr@steredhat>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::543
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 1/2] CODING_STYLE:
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
X-List-Received-Date: Sat, 02 Mar 2019 11:13:17 -0000

On Fri, Mar 01, 2019 at 10:55:22AM +0100, Stefano Garzarella wrote:
>On Fri, Mar 01, 2019 at 10:01:46AM +0800, Wei Yang wrote:
>> We didn't specify the indent rule for multiline code here, which may
>> mislead users. And in current code, the code use various styles.
>> 
>> Add this rule in CODING_STYLE to make sure this is clear to every one.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> 
>> ---
>> v5:
>>    * different rules -> various styles
>>    * describe function variants separately
>>    * take struct out
>> v4:
>>    * widths -> width
>>    * add an exception example for function
>> v3:
>>    * misleading -> mislead
>>    * add comma after arg2 in example
>> v2:
>>    * rephrase changelog suggested by Eric Blake
>>      - remove one redundant line
>>      - fix some awkward grammar
>>      - add { ; at the end of example
>> ---
>>  CODING_STYLE | 39 +++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>> 
>> diff --git a/CODING_STYLE b/CODING_STYLE
>> index ec075dedc4..e175e6ea9a 100644
>> --- a/CODING_STYLE
>> +++ b/CODING_STYLE
>> @@ -29,6 +29,45 @@ Spaces of course are superior to tabs because:
>>  
>>  Do not leave whitespace dangling off the ends of lines.
>>  
>> +1.1 Multiline Indent
>> +
>> +There are several places where indent is necessary:
>> +
>> + - if/else
>> + - while/for
>> + - function definition & call
>> +
>> +When breaking up a long line to fit within line width, we need a proper indent
>> +for the following lines.
>> +
>> +In case of if/else, while/for, align the secondary lines just after the
>> +opening parenthesis of the first.
>> +
>> +For example:
>> +
>> +    if (a == 1 &&
>> +        b == 2) {
>> +
>> +    while (a == 1 &&
>> +           b == 2) {
>> +
>> +In case of function, there are several variants:
>> +
>> +    * 4 spaces indent from the beginning
>> +    * align the secondary lines just after the opening parenthesis of the
>> +      first
>> +
>> +For example:
>> +
>> +    do_something(x, y,
>> +        z);
>> +
>> +    do_something(x, y,
>> +                 z);
>> +
>> +    do_something(x, do_another(y,
>> +                               z);
>
>Should we close another parenthesis after the "z"?
>

:-(

>The rest LGTM!
>
>Thanks,
>Stefano

-- 
Wei Yang
Help you, Help me


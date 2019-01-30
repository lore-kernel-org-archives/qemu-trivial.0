Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gou9b-0003sR-Mn
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 13:00:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nshah@disroot.org>) id 1gou9Z-0003pw-1l
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 13:00:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nshah@disroot.org>) id 1gou9Y-0004uc-6K
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 13:00:00 -0500
Received: from knopi.disroot.org ([178.21.23.139]:35022)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <nshah@disroot.org>)
	id 1gou9V-0004sg-KJ; Wed, 30 Jan 2019 12:59:58 -0500
Received: from localhost (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0DC51259F0;
	Wed, 30 Jan 2019 18:59:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
	by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5beOYs5I7yB; Wed, 30 Jan 2019 18:59:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1548871192; bh=XXOBVixX62IwLXUD6Mv8NDfgVO2+TcU1+n3875jchtY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=HSLtVHoRn9NBTN1EqSs2y6gMQqqOs4u1r9rDO6kIUNRHl9m5Bqb4lEdGHZ4JFKFQl
	+8sO4VmOi0MgAMAg2MCJwhm+xJJCv7ZFql4dTdcgi+drYMp8QVIVQ4OWu8ZYtWgK6B
	nexeS5veMI4w3hnh9MDb9B4wX/sSJ1G7jPE6mM0LSI7d6VQssAY+1x9NGMM71K/YDS
	uMBOkysihxa3irO7HaL67bgY0jt/evKEoc8AVAfokhqhxKSYdRNC734XEOBlDGM3mG
	vQcFTiRCygpD1WKVdV3xal+Mu+edMgdN+w/0NkhKnglm2Ua1T7xTNB3WKgUjczvq5B
	43rBB4O3J0rNQ==
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20190116183358.30287-1-nshah@disroot.org>
	<20190123185043.GV4136@habkost.net>
From: Nisarg Shah <nshah@disroot.org>
Message-ID: <0f2e88e8-7a69-f5aa-e1df-70cdff2b371e@disroot.org>
Date: Wed, 30 Jan 2019 23:30:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
Mime-Version: 1.0
In-Reply-To: <20190123185043.GV4136@habkost.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.21.23.139
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] device-crash-test: Convert
 to Python 3
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
X-List-Received-Date: Wed, 30 Jan 2019 18:00:01 -0000

Thanks for the review.

On 1/24/19 12:20 AM, Eduardo Habkost wrote:
> 
> This breaks Python 2 support:
> 
> $ python2 scripts/device-crash-test
>    File "scripts/device-crash-test", line 534
>      print("No QEMU binary found", file=sys.stderr)
>                                        ^
> SyntaxError: invalid syntax
> 
> 
Apologies. This is my first patch to qemu and I did not consider 
backward compatibility with Python 2. I'll see if I can fix this.
>>   
>>   import sys
>>   import os
>> @@ -272,7 +272,7 @@ def qemuOptsEscape(s):
>>   
>>   def formatTestCase(t):
>>       """Format test case info as "key=value key=value" for prettier logging output"""
>> -    return ' '.join('%s=%s' % (k, v) for k, v in t.items())
>> +    return ' '.join('%s=%s' % (k, v) for k, v in list(t.items()))
> 
> Why is this necessary?
> 
> 
This was automatically modified by the 2to3 tool. I see that it is not 
really required.

Regards,
Nisarg


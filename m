Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ctyB5-0002hy-5P
	for mharc-qemu-trivial@gnu.org; Fri, 31 Mar 2017 11:09:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cminyard@mvista.com>) id 1ctyB2-0002gP-Bi
	for qemu-trivial@nongnu.org; Fri, 31 Mar 2017 11:09:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cminyard@mvista.com>) id 1ctyAz-0007sS-6A
	for qemu-trivial@nongnu.org; Fri, 31 Mar 2017 11:09:24 -0400
Received: from mail-oi0-x233.google.com ([2607:f8b0:4003:c06::233]:34938)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <cminyard@mvista.com>) id 1ctyAy-0007s3-SV
	for qemu-trivial@nongnu.org; Fri, 31 Mar 2017 11:09:21 -0400
Received: by mail-oi0-x233.google.com with SMTP id f193so63601505oib.2
	for <qemu-trivial@nongnu.org>; Fri, 31 Mar 2017 08:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=n698PRtk5TXX5wJPOcOjUxiGsNOWXx1PJu9gL5RR7tM=;
	b=vNkMyHxofQiy+6d3FSgTWl91ZUVNYyF07A294M3Su37whyFAf0PtOKK8GqkOxCPiGT
	Fq33sT1Ot14TpMBWLDMTDNYajpVquoqzBYcyFshwwGwmrC1K1GUDzK9f0ovoMUl51ODH
	1ZP62NfAXnHRc1QZJBKJsIZ9uoP5UHBPj4rV1paGpggUoN8k1f0umGnszcRsEsoyjFGU
	NBttL9Jq5kYGYBONxIP4eyjkY3L9jiI5HfIRX0KJQwyFZEZXETe++5DOLkCMe4JLmKap
	6VeUniM7PrYZQcrcKfzbqxODeQuSOsQ5b2NxKI5TSDEXWMUSf8CF7Bwpz439qZo6+BnR
	sMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=n698PRtk5TXX5wJPOcOjUxiGsNOWXx1PJu9gL5RR7tM=;
	b=kOBdXOdI5jBdoe2xFuMIvmsT/+U6oU8+p1zmIpKxZSD/8Bp3o7Fa3SAqOXryyMo6sn
	SRqeT9ns4bdTVBpBpTSPlT4swoubzca6Z7fHWELsltndm6+DCK/BENUxFFEDXB/w9Fpr
	U6eZ4XwNaxp4BKsVDCFpFG/p+F81LpLVdQssf6ZsxWZBFe/qIoo5DtmgJqLWOu2r330q
	DeJiutK6H8w7pCQ32lpdTtpTnt5zDTUX8oTqaIabiPw/Bz0WvAaLTnbb9cMmOM/UV6hO
	62WVSQT0KczKTM4R+QkcVTCP3mZAA8Ye7Eidl9Bk/lCM6hCBgoyh6McmS4JLSfXLrP7w
	aCKg==
X-Gm-Message-State: AFeK/H2vkXZZAHeBcT4akipUIfc27VmAnBphO89Mik4H6FxTw8FEcCCDxXJnLe2q0LVGT6m0
X-Received: by 10.157.24.97 with SMTP id t30mr1871874ott.197.1490972959740;
	Fri, 31 Mar 2017 08:09:19 -0700 (PDT)
Received: from [192.168.27.3] ([47.184.141.54])
	by smtp.gmail.com with ESMTPSA id
	d37sm2479159oic.38.2017.03.31.08.09.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 08:09:19 -0700 (PDT)
To: Eric Blake <eblake@redhat.com>, minyard@acm.org, qemu-devel@nongnu.org
References: <1490970783-29231-1-git-send-email-minyard@acm.org>
	<8e26dbca-d2be-01bc-bfa3-a73fcb9d1498@redhat.com>
Cc: qemu-trivial@nongnu.org, Ed Maste <emaste@freebsd.org>
From: Corey Minyard <cminyard@mvista.com>
Message-ID: <fca372b3-da5d-9132-1571-47fcce011cb1@mvista.com>
Date: Fri, 31 Mar 2017 10:09:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <8e26dbca-d2be-01bc-bfa3-a73fcb9d1498@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::233
Subject: Re: [Qemu-trivial] [PATCH for-2.9? v4] ipmi: Fix macro issues
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
X-List-Received-Date: Fri, 31 Mar 2017 15:09:25 -0000

On 03/31/2017 10:04 AM, Eric Blake wrote:
> On 03/31/2017 09:33 AM, minyard@acm.org wrote:
>> From: Corey Minyard <cminyard@mvista.com>
>>
>> Macro parameters should almost always have () around them when used.
>> llvm reported an error on this.
>>
>> Remove redundant parenthesis and put parenthesis around the entire
>> macros with assignments in case they are used in an expression.
>>
>> The macros were doing ((v) & 1) for a binary input, but that only works
>> if v == 0 or if v & 1.  Changed to !!(v) so they work for all values.
> s/&/==/
>

I originally wrote v == 1, but I realized that it worked with anything 
where the
bottom bit of v was set.  Thus, v & 1.

>> Remove some unused macros.
>>
>> Reported in https://bugs.launchpad.net/bugs/1651167
> Might also be worth adding that an audit of the code finds no semantic
> change, that this is just cleaning up the compiler warning.

Will do.

Thanks,

-corey
>
>> Signed-off-by: Corey Minyard <cminyard@mvista.com>
>> ---
>>
>> Changes since the last revision:
>>
>>    * Added the !!(v) change
>>
>>   hw/ipmi/isa_ipmi_bt.c | 34 ++++++++++++----------------------
>>   1 file changed, 12 insertions(+), 22 deletions(-)
> Reviewed-by: Eric Blake <eblake@redhat.com>
>



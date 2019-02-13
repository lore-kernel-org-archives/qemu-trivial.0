Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtudG-0007kY-5J
	for mharc-qemu-trivial@gnu.org; Wed, 13 Feb 2019 08:31:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51082)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1gtudD-0007jd-G2
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 08:31:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1gtudB-0005r6-Km
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 08:31:19 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:40076)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1gtud9-0005YC-Do; Wed, 13 Feb 2019 08:31:17 -0500
Received: by mail-ed1-x541.google.com with SMTP id 10so1919259eds.7;
	Wed, 13 Feb 2019 05:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=k/YY6dc+sT9aS+rnD0yr6vFShhKAutobaV0rWv5i4fc=;
	b=a8UB9gFJzCWOb2WptLdeO2fNBQZboY/DnC0rBAv/OVg2sVmS3ucA31Mh12T861ApDz
	dSJhvweKBTXrMEQEUGjv3AlCDFV8r58yF3sFvmCVVR4PHu5ZQ0PA8VV99rswRt/7TTBv
	77G08aPR8o8ju1xmc5hjDf1CPSDGR7lbQqnl0qZcQnjegWJWdwLiXF+/VjFeuKEzXrMN
	0GxC//2+wcV7p7dZMy8wOjl6BlBSvuu6y/wrgS35lYBNZ5T1wSkcPWBAV8whq2k+OHnA
	GsAZ1TGdOFF8+ryxM2KEIFMK7nBH/pyh4Z002h3r+iRp1MsMlXib2QkkwAmDGqWDBMAF
	v9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=k/YY6dc+sT9aS+rnD0yr6vFShhKAutobaV0rWv5i4fc=;
	b=ONLAdQaeYigRvZN6nLZqqvi+IvUEgYUV8Bl4pw8/xu9LyAz+xF8tz7+J8zxEqXdP79
	sRzpEnCEqTyZcOuyF9Wh7wYXIn5rutMDaEyxNQn2T0pEvnd86a1Ow73NbeXl/sfAox/s
	leYo1xVvZoc6EBmYj7a5Z56lY89A5vtJ0vzWNg5FhyZwWgSd2LOnOGnlmVns9WG8Hhag
	khRQJKT4aSf54igvtxwsYz5dW179wCOYxUHI6/n7r5FeeJxgMIyY90atfsgvxsHmADAr
	SS+rRPLLLq9JIKWhwaXkhGk72ONCXOmZU7sk5RK2NGjr4GUTJEYcmgwUPR+oHrrEq2kR
	ZhdA==
X-Gm-Message-State: AHQUAuYvbl5229cNe2RNXRq6FLtmN2tiFxwkvNQYmLudVg+uejii31sY
	kaxwAtJU0UoAVNK/9VbOffE=
X-Google-Smtp-Source: AHgI3IaLqzGVvSD5t2+RNRRzQ+QuZOlniiX1Hn97mqDaWuB8BfmKgiGmW6N18fCYh8g+0wdWe44awg==
X-Received: by 2002:a17:906:3290:: with SMTP id
	16mr381754ejw.166.1550064665208; 
	Wed, 13 Feb 2019 05:31:05 -0800 (PST)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
	h21sm3615413edq.80.2019.02.13.05.31.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Feb 2019 05:31:03 -0800 (PST)
Date: Wed, 13 Feb 2019 13:31:03 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>,
	Wei Yang <richardw.yang@linux.intel.com>, qemu-trivial@nongnu.org,
	imammedo@redhat.com, qemu-devel@nongnu.org
Message-ID: <20190213133103.rrkqryspehgeotly@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20190130000653.16267-1-richardw.yang@linux.intel.com>
	<20190212052224.GA4839@richard>
	<20190212003414-mutt-send-email-mst@kernel.org>
	<4d6f639b-fe11-7048-3975-ee1c1875b8d3@vivier.eu>
	<3d700eed-5637-b05a-63c2-9f73a465bcb5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d700eed-5637-b05a-63c2-9f73a465bcb5@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 0/3] Trivial cleanup in
 hw/acpi
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
X-List-Received-Date: Wed, 13 Feb 2019 13:31:21 -0000

On Wed, Feb 13, 2019 at 09:56:38AM +0100, Philippe Mathieu-Daudé wrote:
>Hi Laurent,
>
>On 2/13/19 9:49 AM, Laurent Vivier wrote:
>> On 12/02/2019 06:34, Michael S. Tsirkin wrote:
>>> On Tue, Feb 12, 2019 at 01:22:24PM +0800, Wei Yang wrote:
>>>> On Wed, Jan 30, 2019 at 08:06:50AM +0800, Wei Yang wrote:
>>>>> There are several functions/variable which are not used anymore.
>>>>>
>>>>> This serials just remove those without functional change.
>>>>>
>>>>> v3: add ack and repost in a new thread
>>>>> v2: change commit log from "is now used in no place" to "in not used anymore"
>>>>
>>>> Michael,
>>>>
>>>> Looks this serials is not merged yet.
>>>>
>>>> Is there any problem I need to fix?
>>>
>>> Yes pls repost with fixed reviewed-by tags.
>> 
>> Or I can take the series through the trivial branch and update manually
>> Philippe's lastname?
>
>I appreciate the help with manual update, however Wei is not the only
>one having this problem (other developpers has non-ASCII in their name,
>and use such tags).
>I'd rather prefer we find a proper configuration setup to help the
>community.
>

How you configure your git send-email? or related facility?

>Another (fair) approach is to forbid non-ASCII chars in all part of patches.
>
>Regards,
>
>Phil.

-- 
Wei Yang
Help you, Help me


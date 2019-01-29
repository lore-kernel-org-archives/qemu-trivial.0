Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goOfq-0004ru-AE
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2019 03:23:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1goOfo-0004rS-9C
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 03:23:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1goOfn-0002yv-Gr
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 03:23:12 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35214)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1goOfn-0002yN-9G
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 03:23:11 -0500
Received: by mail-wr1-f67.google.com with SMTP id 96so20996366wrb.2
	for <qemu-trivial@nongnu.org>; Tue, 29 Jan 2019 00:23:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ioNTFpSqasIuIUbyU9bZ25c2tMVbjnsE1DzeBimRaXM=;
	b=bIXt7pyhVb6VXIoJDFvieTpNxgYO8F2gT6KX7Z8IcNyWXbAZERG5cX84Wwk2m+9wNy
	ouzFhZEdA58Xw7JG6vKGchbw/NV/ET8N9fqL7W0BpWDCv6jpf+FyrSLGw/LvcuwlciAU
	y0+66JqiTg/mcdSgz0KRC3gPM8oNXPBFJbGSlD6svZlvEOO3OlmOuUzE6WI0BAUG8aza
	5teOG2NRJtKAzLHucvhvVCs2hLjrZDB6XduVZRmV/v/nAWGrfjzgKu79I79UtlYWbafL
	f68PtV4sHlYFOdhh2CYB3op+0Fk2qZNwARr8eB+T1pn51AX2dZysY+6xG3s7IF3/TeOJ
	C1Ew==
X-Gm-Message-State: AJcUukdEEcdZp492WuWJG0binPaPxZ36Vw5N0sy/hDJB8Pxj7Br2dvOn
	fav7yRAsJX6noEXhxLeWKLkQ8A==
X-Google-Smtp-Source: ALg8bN7eDpCKJCPOSbj+dK3FyqQSCwlCQ5xtqFFQXsZ0a+4XRLvLUBRw/zx/OOMsNQGcGdZGQ683gQ==
X-Received: by 2002:adf:97d1:: with SMTP id t17mr25077336wrb.283.1548750190156;
	Tue, 29 Jan 2019 00:23:10 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	z9sm125854328wrs.63.2019.01.29.00.23.09
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 00:23:09 -0800 (PST)
To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, imammedo@redhat.com,
	laurent@vivier.eu, mst@redhat.com
References: <20190125060157.29935-1-richardw.yang@linux.intel.com>
	<20190129000820.31190-1-richardw.yang@linux.intel.com>
	<feb8687e-0d0c-a20a-9b37-c8284aaae9f5@redhat.com>
	<20190129080455.GA10084@richard>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <91c53c72-8e9c-f68d-1dc8-f6320ed3dfc0@redhat.com>
Date: Tue, 29 Jan 2019 09:23:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190129080455.GA10084@richard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/3] Trivial cleanup in
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
X-List-Received-Date: Tue, 29 Jan 2019 08:23:13 -0000

On 1/29/19 9:04 AM, Wei Yang wrote:
> On Tue, Jan 29, 2019 at 07:56:54AM +0100, Philippe Mathieu-Daudé wrote:
>> Hi Wei,
>>
>> On 1/29/19 1:08 AM, Wei Yang wrote:
>>> There are several functions/variable which are not used anymore.
>>>
>>> This serials just remove those without functional change.
>>>
>>> Wei Yang (3):
>>>   hw/i386/pc.c: remove unused function pc_acpi_init()
>>>   hw/acpi: remove unused function acpi_table_add_builtin()
>>>   hw/acpi: remove unnecessary variable acpi_table_builtin
>>>
>>>  hw/acpi/core.c         | 10 +---------
>>>  hw/i386/pc.c           | 27 ---------------------------
>>>  include/hw/acpi/acpi.h |  1 -
>>>  include/hw/i386/pc.h   |  1 -
>>>  4 files changed, 1 insertion(+), 38 deletions(-)
>>>
>>
>> Please do not post iterated series in reply to previous version, but as
>> new thread:
>> - patches are parsed by scripts
>> - some email clients can tag a thread as "reviewed, skip" and replies to
>> this thread will be masked.
>>
> 
> Well, do I need to repost it in a new thread?

It depends who will take this patchset and his mood :)
Let's wait and see.


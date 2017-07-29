Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dbFyI-00019G-Mz
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 20:51:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbFyG-000185-NN
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 20:51:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbFyG-0008RO-4m
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 20:51:08 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:34017)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbFyA-0008MF-2d; Fri, 28 Jul 2017 20:51:02 -0400
Received: by mail-qk0-x241.google.com with SMTP id q66so22465474qki.1;
	Fri, 28 Jul 2017 17:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=zdla8HvBfvGX4+AtbyLZA7vbf79ND7/dBwdR5NyjSN8=;
	b=RsWwyPZ6OUn47H1k+Foqmp/w6Ow6GtSWLBHa8LnMsH6LENkMIB26EUqGRB1Cb6kw1E
	Gxm7r4I6qkdmF05fC6HrpDAcAti/uu1UdyzQ30e+MTK4FZj3QHeCq5LZvMuW6jU39Ntz
	tpgh8YO4AMlYb8XYIlxNDRqSyFA6p8tSdFr6g9vWl2vDBMbNaDh4TPO7dQfonGDPkpnt
	6g5XYYfTidl54h4c9wMbW6vo0jcOGD/bYM8HaOeuVhj3LytzqQDBMbrOL143pxBxu8Vz
	G2omKci760o770BSNTNpjTKZqxbGBpmyckArbVN3fby98Y4lFB/DYeOO2kePDe2HNH6N
	zRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zdla8HvBfvGX4+AtbyLZA7vbf79ND7/dBwdR5NyjSN8=;
	b=dpSaln50dHuStYbBs0zT1QHQdh754y6GQYJ8rd2PlSgZ8wKIzV4z3jmkynAHqmhxSo
	R9utVsKO0LRoKjyZ6e0y1iyrPPut9hZ8i4YeRHjlUqR2ZE4e7qnCdcAWfJyDSyuLfH7S
	rVingFmZBdklwgLsiUW0Eo1ysNrPgoYlvJJrf6fRz0tF7YPBqovSdJaQWYyrCSxrIIfW
	BlJQKp7y9mMcxEWkwL3LC/KzyYFqBiHRbsZ0akU8j4UcU8Y9ZVdhAq2qicPf4ZsV2eqG
	O3cSZdgnUcdOrtU31gsuvW4gcgAQMRxnfEVSQJZmBEK9xlPaIa5Pp4ipF5he0yCFRsc0
	rrNg==
X-Gm-Message-State: AIVw111RNKY4pQK5LO7jZFzGNY1E1uQ9QGKdwLWcz6MoVAl53fH/SHDm
	xt1rv66YM1CFz3fq1OM7cQ==
X-Received: by 10.55.4.131 with SMTP id 125mr11834432qke.193.1501289461473;
	Fri, 28 Jul 2017 17:51:01 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	c199sm16895101qka.9.2017.07.28.17.50.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 17:50:59 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-17-f4bug@amsat.org>
	<7100714b-6789-15e4-f883-9e8684ddc9e7@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <07a7006e-394d-adfe-0525-b0daa008bd43@amsat.org>
Date: Fri, 28 Jul 2017 21:50:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <7100714b-6789-15e4-f883-9e8684ddc9e7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [PATCH 16/47] MAINTAINERS: add missing entry for
 gdb
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
X-List-Received-Date: Sat, 29 Jul 2017 00:51:09 -0000

On 07/28/2017 09:00 AM, Paolo Bonzini wrote:
> On 28/07/2017 07:35, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   MAINTAINERS | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 9670a3901a..653c2a1db1 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1320,6 +1320,7 @@ L: qemu-devel@nongnu.org
>>   S: Odd Fixes
>>   F: gdbstub*
>>   F: gdb-xml/
>> +F: scripts/qemugdb/
> 
> This is unrelated.  It's for debugging QEMU, while the others are for
> debugging QEMU guests.

Thank for clarifying it, dropped.

> 
> Paolo
> 
>>   Memory API
>>   M: Paolo Bonzini <pbonzini@redhat.com>
>>
> 


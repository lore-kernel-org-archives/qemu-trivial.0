Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnAE8-0005tf-SN
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 17:08:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37780)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAE5-0005qg-TW
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:08:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAE4-0008N4-VY
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:08:41 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35959)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAE0-0008Lk-HU; Wed, 30 Aug 2017 17:08:36 -0400
Received: by mail-qt0-x243.google.com with SMTP id e2so6169800qta.3;
	Wed, 30 Aug 2017 14:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=VBuwkpRpb3BecmNtHmhR9s12eROWJP7VddKivxCCnxU=;
	b=XdmmJGtcfCrzVjwU0/Efij/lxT2cqsb8H1qFEPilQX6iI1v24ziWIe3BYTmbPEShrE
	r3EeuZ4EEy6f6PQsHaziWogov1g/erjAthBltBz3dhI+Qsv5wyGiQgVz1a9oKNWMzrMa
	Cp4Q1+S7Nn1dGHD/zWbCFKHlA+znFzVdbOxDcocPgYjC0XCbhxdir8H/AjZ0jQbelJdF
	YfL0CL82xEbWhwQeCVSJI7EspvjHFsBUmXb5uMiGGKI4KzjrBfwWUEtc1otBoT5CpUK1
	bKQEIEAY66Ku5ZlkhjjkCZcucD3nZ14LEATU0sMTIgIkopM99zZeSEFvh9sec8hNEQJA
	OTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VBuwkpRpb3BecmNtHmhR9s12eROWJP7VddKivxCCnxU=;
	b=FfDODtwdta19iLtUIzVTw9+gIrWF0IgxJhuO6Va0BmS076HsFkFWN/CGhbOgv6otWL
	0n19cjgA32WewH9z7HB8c4WlbPFqqxfd0gflpvvuQTKEbSw0SGF2i0UIz8Qve+olviZ+
	05GHTSKl2pqebrHzc6T9fpgAme1Hl7+9NOoMUQBpVj0ZX2eyN+RJcmwmjHUcXiaqleEi
	lX/oVY5eyNI/F43JJiZsxnXiyIiyin0e8Rq8k4Pfh9sobMti1mcMOvpDwJYgn+6AOI8m
	5TscyZ2Q9DzQbnuEJ+d/TTJAeFK7gD0UqeA6qMokS5aQMUe4ZN92G7de36S41+YS5Fpg
	qiOA==
X-Gm-Message-State: AHYfb5hBCmO47Ae0e/l/lNaRYD2IK0cMWRGIFL+wkcDRNv60UQplPibl
	+XXfBHbXcilvPkC2u5IcxQ==
X-Received: by 10.200.50.156 with SMTP id z28mr4176410qta.98.1504127315780;
	Wed, 30 Aug 2017 14:08:35 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	a50sm4388110qtc.25.2017.08.30.14.08.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:08:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-2-f4bug@amsat.org>
	<3be12552-daf6-450f-765e-ce390c4bf3c6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3f5c7cc2-16b6-4e72-707d-58b29f0f376a@amsat.org>
Date: Wed, 30 Aug 2017 18:08:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <3be12552-daf6-450f-765e-ce390c4bf3c6@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [RFC PATCH 01/47] MAINTAINERS: add
 missing entry for documentation
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
X-List-Received-Date: Wed, 30 Aug 2017 21:08:43 -0000

On 07/28/2017 03:47 AM, Thomas Huth wrote:
> On 28.07.2017 07:35, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>
>> because having only a "Build system architecture" entry in Documentation seems
>> odd to me, so RFC.
>>
>>   MAINTAINERS | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5ea273f899..972118e70b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1886,6 +1886,9 @@ W: http://patchew.org/QEMU/
>>   
>>   Documentation
>>   -------------
>> +Overall
>> +F: docs/
> 
> But it also does not make sense to add such an entry without a "M:"
> line, does it?

Indeed, dropped.


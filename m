Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1da128-0001va-Hw
	for mharc-qemu-trivial@gnu.org; Tue, 25 Jul 2017 10:42:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1da125-0001qz-2e
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 10:41:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1da11z-0000sq-Rn
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 10:41:57 -0400
Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d]:36182)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1da11z-0000sY-O7; Tue, 25 Jul 2017 10:41:51 -0400
Received: by mail-qk0-x22d.google.com with SMTP id d136so73921694qkg.3;
	Tue, 25 Jul 2017 07:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TQgMsa+7OU32RG/XcZN3RoIMN/Kxy97EVgW9jwtWqUM=;
	b=nZDP3onF45eKm7K4oe2Yqo6EdHz+/1nvwAOWfhAU8I4/ovuK4upFP01010TB93KlII
	zOGsxOlem5PnSVxXLXiBjhQA6Lqzg4Nu/YiOEzHttPf+UtyyWn/H0u+p4w4p3LZNjr0d
	C7Thku3OSs2zb1lfXtrVYycbqC1WLlW5wfngRI2ZELRjO/+/rhfC5dpGZPcbfMnsSCr0
	MKmYsPnCKWS5KldENgRvfwpwl6NhUqhWiOezsnUHrNlVhrrFYEMstyhGeVuHpd3uOz8j
	1P/ZDnhigDqdSZ3GEwZ7WGCWV7MYMs67i1ItvrxTILwRGAqHOm3kE1qTl/waasYh43yU
	YSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TQgMsa+7OU32RG/XcZN3RoIMN/Kxy97EVgW9jwtWqUM=;
	b=M/TPwWyB4ZUrbV3KJFUcYOqXz+waiJDe8v8q/PvQeu2N/fmON1Up53m/IXuX1FoM0D
	mXoDO2scv2sPUI052OmIy7E/iU3udER1YE+0n6SKcuFRfqR9n51KTvtLIj67cwl/yglr
	R5oOWeBUKpFlygHdtIqh9LmZJM6V2gb2nCxQOx4r6RU1EZTGiZll5OrVtiFCNRdPgqmv
	FqdY+UeYSuimYjYz1ccbU1dPF0ZU7jKIAewlAnESAMlvKXrL85VQGvYqZbZ0/INQbY7b
	VRm1txU0nKR4mXTfOc2yFQeEAQusJ8CNIYtgZf2wcZkyW/m+G5FJTocePZh1r9yxDh1M
	I4fw==
X-Gm-Message-State: AIVw112e9xyvBWLpowVF+ThBYN9SVZ9Kgtt/Dlz7s+OIPK0h40bXeFBK
	bed9VTFBKWV5e3SNJ/rF1Q==
X-Received: by 10.55.129.7 with SMTP id c7mr7489729qkd.29.1500993710543;
	Tue, 25 Jul 2017 07:41:50 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	s18sm10290183qts.77.2017.07.25.07.41.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jul 2017 07:41:49 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-36-f4bug@amsat.org> <87lgncehbq.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5effed07-96c1-ae79-32a5-46b75516bf21@amsat.org>
Date: Tue, 25 Jul 2017 11:41:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <87lgncehbq.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22d
Subject: Re: [Qemu-trivial] [RFC PATCH for 2.10 35/35] script to run docker
 image
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
X-List-Received-Date: Tue, 25 Jul 2017 14:41:58 -0000

> This isn't appropriate for 2.10 now we are feature frozen. That said I

Surely. From the cover:

"... provided at the end of this series as RFC for people wanted
to give a try (also include 'dockershell' script and a fix in 
./configure). These RFC patches (33-35) are not expected to enter 2.10."

Peter also commented on the "./configure" patch, so I probably 
mis-titled "RFC" those patch

http://lists.nongnu.org/archive/html/qemu-devel/2017-07/msg07584.html:
"I prefixed this patch 'RFC' to not consider it but provide it
if someone wanted to reproduce the analysis. Maybe I should prefix it
'XXX' next time or 'NOT FOR MERGE'."

better "NOT FOR REVIEW" or "!RFC"? :p

> have pondered a helper script for this sort of thing before. As it stand
> I just rely on my shell to remember the correct invocation for me.
> 
> This is the sort of functionality we would need for maybe cross
> compiling tests using docker.

This script is way incomplete and far being finished.

Regards,

Phil.


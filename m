Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1da1ND-0003zP-Lg
	for mharc-qemu-trivial@gnu.org; Tue, 25 Jul 2017 11:03:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1da1NA-0003vr-DP
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 11:03:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1da1N6-0003Tg-Fn
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 11:03:44 -0400
Received: from mail-wr0-x22b.google.com ([2a00:1450:400c:c0c::22b]:35963)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1da1N6-0003T7-9z
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 11:03:40 -0400
Received: by mail-wr0-x22b.google.com with SMTP id y43so120271328wrd.3
	for <qemu-trivial@nongnu.org>; Tue, 25 Jul 2017 08:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=18+x72kwgz1NMJs6pGFLcV9TX3Hy9WZ+0BE1Y+kOz8g=;
	b=OvPxHqyRKh6d3ZwwnalFWSBFxjNcdE10Yh0VxIv4dwUBLuG3FIuRptzTT8TQIwOhwU
	7Z7w7Rj/bpdNNqqFUfPEaBrzityw0zL4q/MejUhwyfhpCD/qaCOENq6EhOBaErkKEREZ
	bKuvYcLcNwXJHwnwsBRZ1D8/VNFk9nnElDUS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=18+x72kwgz1NMJs6pGFLcV9TX3Hy9WZ+0BE1Y+kOz8g=;
	b=kA/kwykDTvWLAbvvEx4kBn7p3iWZvAUnu02oWNE6PGbKtrCkyrX30fdSkWqZSSCcjp
	LQ0QbIfiYz+Dh8EMQJeUfg6+Wb3mi0ZyjUECCjSYc8f3vmWLVbmkrGvHvtITvmdbUD/x
	jVu0AnSVQCV4YDFR11lpG44XmY8X3KDqieAwIC5tPmClTzuUAHrAdzo10GJkn+YGWDfV
	Y6ofZBqILtRiOH7Q1q+7TazOEpGeyozbCWCrQscB6MbJZKG5y0qMJLqlfW3ih2GrzuiS
	/ihGLFawno7QWvU2AsPYCtscJ3Iir0ywXQ5TLuzEDccJrDsrvdy6znQINP4+dGk1AK2N
	Q+tw==
X-Gm-Message-State: AIVw110qHNV7L7k0O7iHR+eY6C9zzGW0TQgJiPBy1lK7N+m/GYu4w4jI
	72hu33CuMoSG21SZ
X-Received: by 10.223.129.245 with SMTP id 108mr19740810wra.67.1500995018993; 
	Tue, 25 Jul 2017 08:03:38 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	i32sm33026263wra.5.2017.07.25.08.03.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jul 2017 08:03:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 253733E0085;
	Tue, 25 Jul 2017 16:03:37 +0100 (BST)
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-36-f4bug@amsat.org>
	<87lgncehbq.fsf@linaro.org>
	<5effed07-96c1-ae79-32a5-46b75516bf21@amsat.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Eric Blake <eblake@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
	<marcandre.lureau@redhat.com>, Fam Zheng <famz@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
In-reply-to: <5effed07-96c1-ae79-32a5-46b75516bf21@amsat.org>
Date: Tue, 25 Jul 2017 16:03:37 +0100
Message-ID: <87eft4eeye.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22b
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
X-List-Received-Date: Tue, 25 Jul 2017 15:03:45 -0000


Philippe Mathieu-Daudé <f4bug@amsat.org> writes:

>> This isn't appropriate for 2.10 now we are feature frozen. That said I
>
> Surely. From the cover:
>
> "... provided at the end of this series as RFC for people wanted
> to give a try (also include 'dockershell' script and a fix in
> ./configure). These RFC patches (33-35) are not expected to enter
> 2.10."

My mistake - I hadn't gone over the cover letter. I would usually expect
a series with [PATCH for 2.10] just to contain stuff being considered
for the immediate future.

>
> Peter also commented on the "./configure" patch, so I probably
> mis-titled "RFC" those patch
>
> http://lists.nongnu.org/archive/html/qemu-devel/2017-07/msg07584.html:
> "I prefixed this patch 'RFC' to not consider it but provide it
> if someone wanted to reproduce the analysis. Maybe I should prefix it
> 'XXX' next time or 'NOT FOR MERGE'."
>
> better "NOT FOR REVIEW" or "!RFC"? :p

Better to post a logically separate series. It's fine to make an
in-flight series a pre-requisite though (not that I think you need it
here).

>> have pondered a helper script for this sort of thing before. As it stand
>> I just rely on my shell to remember the correct invocation for me.
>>
>> This is the sort of functionality we would need for maybe cross
>> compiling tests using docker.
>
> This script is way incomplete and far being finished.
>
> Regards,
>
> Phil.


--
Alex Bennée


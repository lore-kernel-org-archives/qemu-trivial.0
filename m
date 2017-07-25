Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1da1au-0006ez-97
	for mharc-qemu-trivial@gnu.org; Tue, 25 Jul 2017 11:17:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1da1ar-0006ci-5G
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 11:17:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1da1ap-0000s3-Uy
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 11:17:53 -0400
Received: from mail-io0-x22f.google.com ([2607:f8b0:4001:c06::22f]:33255)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1da1an-0000qp-SR; Tue, 25 Jul 2017 11:17:49 -0400
Received: by mail-io0-x22f.google.com with SMTP id j32so36359260iod.0;
	Tue, 25 Jul 2017 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=28nouHF9rDTlZJvEvWfbkRF+rCvTAWMkfDRKGQXKHvM=;
	b=spz+oKPsel+nsJhwKHzhmf35RP+smag4XhQIXuDqrH0KVTq0cAWCN3WbcGQUpPABa/
	C+NqeOAI8sHFenj0gQGoB0ytKVJCKJCrvnxPoX00/OOnHBMOH6Sk4yGuPWQpOgzcOUHh
	snmguI08FIaNbpTOEnlCGrnGS6VjtKI+A9A/g2tJWJN3dbNSY/G6GtPOcsKjdxPujlsS
	ObYv3NyKEyHW9xB4WcvuoFlL+ib7Lj8Vj/E3ZUc2Y7IuXzXXql4//fnjE6476DuFcuPf
	5NXiYvbPoJvilQReNqaMDMAk9u8y/phP0OGWvY0CDPgCf12vV0t7XEbY1h1+jYQsqcUf
	+U8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=28nouHF9rDTlZJvEvWfbkRF+rCvTAWMkfDRKGQXKHvM=;
	b=tgKlth6IQEXWTHWaSU+aARBO0yFesM3d0si6Qd7Q9niFPS15qiiBOfNnRG2Z0+6oki
	2eqHV0gNi1UWKVz0s9dlubAu7ZQdz1+qBvk2CupGRKM30Mvcnz4J3r4TVHQ7RIO2x1Lc
	+RetY30abN0pD8d5zKvdwnHQaO6uosQVgRXK/qPc05zgyz6HWeNTocuIanikks+toXzQ
	kn5QFGGN1OLMvhOqxuLZAK/GDPl9ozNiq2L8muGcvnwumYZnw35Wh8obnzKk3YVn2f0J
	uSurvhYCDwAA70KhQhezgKUwgY1p0qPxp76rKlIwmC0GfZrcnaR4eVFE7sHWIhZJ5GTf
	dVEg==
X-Gm-Message-State: AIVw112haV57lJGsb+AB9N7v08bFjrlw6HpkxaSndlkcQC3lwVjjtHra
	UgWc1MLMrhMAUqim04CYK0FU8eQyzw==
X-Received: by 10.107.146.198 with SMTP id u189mr1629975iod.7.1500995869096;
	Tue, 25 Jul 2017 08:17:49 -0700 (PDT)
MIME-Version: 1.0
Sender: philippe.mathieu.daude@gmail.com
Received: by 10.107.152.16 with HTTP; Tue, 25 Jul 2017 08:17:48 -0700 (PDT)
In-Reply-To: <87eft4eeye.fsf@linaro.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-36-f4bug@amsat.org>
	<87lgncehbq.fsf@linaro.org>
	<5effed07-96c1-ae79-32a5-46b75516bf21@amsat.org>
	<87eft4eeye.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 25 Jul 2017 12:17:48 -0300
X-Google-Sender-Auth: f7evSpKW0WYvksx_9ALvOuDQw_k
Message-ID: <CAAdtpL7qoN=Nn-ubFgmotB=O_BNMQ4nq4crKThuyBaORYbDi-g@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Eric Blake <eblake@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	Fam Zheng <famz@redhat.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::22f
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
X-List-Received-Date: Tue, 25 Jul 2017 15:17:54 -0000

On Tue, Jul 25, 2017 at 12:03 PM, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>> This isn't appropriate for 2.10 now we are feature frozen. That said I
>>
>> Surely. From the cover:
>>
>> "... provided at the end of this series as RFC for people wanted
>> to give a try (also include 'dockershell' script and a fix in
>> ./configure). These RFC patches (33-35) are not expected to enter
>> 2.10."
>
> My mistake - I hadn't gone over the cover letter. I would usually expect
> a series with [PATCH for 2.10] just to contain stuff being considered
> for the immediate future.

Ah I see, I used --subject-prefix=3D'PATCH for 2.10' thinking "I'v to
remember to mark the 3 last patches as "RFC" and when I prefixed with
"RFC" I forgot to remove the "for 2.10" suffix. My bad!


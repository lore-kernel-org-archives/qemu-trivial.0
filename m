Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eYeTM-00078T-Pc
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jan 2018 15:56:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYeTK-00076t-3B
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 15:56:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYeTJ-0007ZD-4q
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 15:56:42 -0500
Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c]:42150)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYeTD-0007UI-R0; Mon, 08 Jan 2018 15:56:35 -0500
Received: by mail-qk0-x22c.google.com with SMTP id d202so15906915qkc.9;
	Mon, 08 Jan 2018 12:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dc7eJOFbBY+NhOYhq6WSz8r3idI8dcGfX7sRzsSx0d0=;
	b=rPMaXkpqG5U0e8ToRaX7rL7rmwUeKNulwjy3Tg5flOuQUB6jxCICrFYXM5pQRtwjbH
	oTjwlD5ullrHIGfgFULEt7PcbAln7skECopvnZiAxGZX1R/tWE41GK6wr7JJoNQS7LtF
	txSC9ZFq/FUu+or7GfBf48eaEWjNrghBgEc8MwtKz8A0r4wQ65LLl+K8q6EgvbneKpg8
	DL+zZ4QGv7YzE9cuyLI2Idpo9v+oSj+L29foPrpwvKbps3v4m1fNg3sVZPDG3PLcenRu
	iq2dFuKMkcp7RamN0OYPfe9nTc/dsluSjtJTQYACd6MlF8EuD5+M1SLDmA17fxoyjcJ6
	pw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=dc7eJOFbBY+NhOYhq6WSz8r3idI8dcGfX7sRzsSx0d0=;
	b=tLRDJHRHUKgf5hlh5rv6ZXmuKrdAcScijOTQZRIxhvLDqdMr4CJFOaF5Xn5ry0Dj2R
	CL7vantZwOqcDKkzMhqgdaUWAi8TkNjo8jqTPMqCj3vOmTLpTjAuVabpu8t+szGwp9d4
	LK5OW81rDRGh176lzfiJjDlYtLLZwjAtU41fedsrQHUcQjKuXUPvCo185/+dePFSeNw4
	ZLTkAxvfFoSDut/XhNDLNzRPm/BnQL9274tFrhl3+wf6HDpb4+gpJkyiNCuU+Z/j3c5B
	3xas6jniXzCdO6ulYS26lBM2yaN3ANaToHqRjzHFkDbPYmeiQ4K0b6qakj0RhH7vRDAK
	h5qw==
X-Gm-Message-State: AKGB3mJSfK2DSHGybf42ULUetS9buIe1vg7LO9NHgBL2v+SApnIFA4Wd
	YnfLkr2QvJUts+9mAces/Y36B3WeO8M=
X-Google-Smtp-Source: ACJfBouJ11FxF+Sz2WfKqoOM2RTiLjADYgRmxNJelZtSs0Vg03l9Lika1BOCPkuK8sMqdStDUZ56Qg==
X-Received: by 10.55.42.21 with SMTP id q21mr17341826qkh.282.1515444994878;
	Mon, 08 Jan 2018 12:56:34 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	z17sm7860156qti.59.2018.01.08.12.56.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 12:56:34 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Dmitry Fleytman <dmitry.fleytman@gmail.com>
Cc: qemu trival <qemu-trivial@nongnu.org>,
	Qemu Developers <qemu-devel@nongnu.org>
References: <20180108183406.17623-1-f4bug@amsat.org>
	<40FDE9D4-5C84-4734-A50A-9F9C8CC63D9E@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <63c52643-defd-a0ac-14f6-aabff83a4f16@amsat.org>
Date: Mon, 8 Jan 2018 17:56:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <40FDE9D4-5C84-4734-A50A-9F9C8CC63D9E@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22c
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: update Dmitry Fleytman email
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
X-List-Received-Date: Mon, 08 Jan 2018 20:56:43 -0000

On 01/08/2018 04:21 PM, Dmitry Fleytman wrote:
> Thanks Philippe,
> 
> My patch is hanging on the list for some time already: http://lists.nongnu.org/archive/html/qemu-trivial/2017-12/msg00189.html

Oops Ok I didn't notice it.


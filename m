Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTktq-0005Hu-Tr
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jan 2017 02:43:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTktm-0005Gg-6k
	for qemu-trivial@nongnu.org; Wed, 18 Jan 2017 02:43:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTktl-0001NP-DX
	for qemu-trivial@nongnu.org; Wed, 18 Jan 2017 02:43:14 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:33572)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <skiver.cloud.yzy@gmail.com>)
	id 1cTktj-0001LP-GF; Wed, 18 Jan 2017 02:43:11 -0500
Received: by mail-qt0-x244.google.com with SMTP id n13so615061qtc.0;
	Tue, 17 Jan 2017 23:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qHAf5+H1Vnn4Br0+qCfNLicrxZJKnizJ6ZROL/djtDE=;
	b=LK5loFNocuA7UGyXkeVueEMXRwY0wpLFc1fX0pY24NHA7L0H+g6iK9fyV2/3JIHW3S
	JNXAE5D7q8LSenejfqx03aa7ErhLF+3h/uKVqdU63yk/d9Dl2T1EsGsOTOUa2gIxjZ/5
	wXxGrO14UNVqqww9rUuB7PNeKLjEuQimDYPuZtwYmucyUAHJTKbNmAwAEtlPAE0RSg1d
	HYgapj8jsRAZP2uM97bIBEjzT22OkOkwtYrblrke9m+m2o44c5YyYvAKzg1KoXJ93YAk
	bVc4RvJ4/mrb+HM3T6NTZNYVa6mp8uOrtPEXwPfY4bqDHmJFRmmFBtbphWltLKrr5beH
	ywNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qHAf5+H1Vnn4Br0+qCfNLicrxZJKnizJ6ZROL/djtDE=;
	b=GybppQr8qlE48kefMYT/cDoVlvyiILtvitXZD5vJCoUDEm9Qv074P36HuwTANJJ7f7
	PjNbDq53Oiw6lorHcBVO4O0GoAbWzx74ua/U26+aWsN9jRrtEgAoh48N1viAhiPPOTt6
	X1X0qN09HPx2i0xUDG+Df0/0F16AQnllJ9gCs4IyET50cT6NJ10cbzqE8vJ3zcbBHtRx
	+G5v5h6Z94Ne3grydk8X0ZDye7u+vN4RqQDyOBPSTY706Q5X08KzLnPntfiyk0vaPYbm
	5JfT/goXNNo4l8RWv3vPWRR7MFZ+vL8IuouOW889r5CUJd6IdBOnbPwxmiBszF4JcT8c
	/Qsw==
X-Gm-Message-State: AIkVDXLfGGh0MduC8MD5pISfOCVp8EhzTI73ddve4nUiuVPnko/e+i9TA62RtGNIY+StwN2E7u9qlz3lc8/teA==
X-Received: by 10.237.62.107 with SMTP id m40mr1786055qtf.196.1484725386347;
	Tue, 17 Jan 2017 23:43:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.82.231 with HTTP; Tue, 17 Jan 2017 23:43:06 -0800 (PST)
In-Reply-To: <66ed2121-c207-d2f4-2e05-b6474bfa6a49@redhat.com>
References: <1484709699-3455-1-git-send-email-skiver.cloud.yzy@gmail.com>
	<66ed2121-c207-d2f4-2e05-b6474bfa6a49@redhat.com>
From: Yang Ziyue <skiver.cloud.yzy@gmail.com>
Date: Wed, 18 Jan 2017 15:43:06 +0800
Message-ID: <CAHkcwacJ_BBOTDBxrDejqNiuzWcfrjVRWM-yNeuRF98tEc+xPw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
	Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ziyue Yang <yzylivezh@hotmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [PATCH v4 1/2] gdbstub.c: fix GDB connection
 segfault caused by empty machines
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
X-List-Received-Date: Wed, 18 Jan 2017 07:43:15 -0000

Hi Thomas,

I'm not quite sure about that, but did you mean that I should mention
the second patch before the Sign-off line instead of in the commit
message?
Thanks!

Ziyue Yang


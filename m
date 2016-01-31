Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPnbm-00042b-MO
	for mharc-qemu-trivial@gnu.org; Sun, 31 Jan 2016 03:43:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aPnbk-000424-Jl
	for qemu-trivial@nongnu.org; Sun, 31 Jan 2016 03:43:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aPnbh-0003DO-Db
	for qemu-trivial@nongnu.org; Sun, 31 Jan 2016 03:43:44 -0500
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:36198)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aPnbh-0003Cq-7h
	for qemu-trivial@nongnu.org; Sun, 31 Jan 2016 03:43:41 -0500
Received: by mail-wm0-x236.google.com with SMTP id p63so31250193wmp.1
	for <qemu-trivial@nongnu.org>; Sun, 31 Jan 2016 00:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-type:content-transfer-encoding;
	bh=bIRLwkhS7JSqA0Hv74K/40WKU3mu5YL3quSFAIKITe0=;
	b=elFrMusHvbNBnZ5mxtadU5VlRiIYaULgW2F7si/G+c5byjm4PXQTg4pbwQF5OwfMue
	5DqiyR/AkwD6sDpg3dpSOiy+opIKJ6eDmlSvlJLhWd89hz3JEFIpwb8AxRsd2gSm/Ah1
	K6Ya8C9rWL+BhuuNhBQGKinlmZc9cLgTBK+MY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=bIRLwkhS7JSqA0Hv74K/40WKU3mu5YL3quSFAIKITe0=;
	b=hHo2NZITzJO83br3HLYuA/JZIG7g773M/90KSJMbP3CxJpYZoVMXVqSoH+z4XLvFcc
	scHjaJvaI7BPRrI8NELFZrnsgcxJ5h0ltYiiBe/5VZyKUSK/CIhY7RULshHtMvFvuq8o
	tsxzQ4ILtmY/N9zZI/7/jy/DVnMij/sNAb90xg/zoJpJPux26+D0Wz0q56rUnoHovoxa
	B1Q1asjM6JHy9tk7v2lzh1RzK4ioyNPYf0s466a36aE1qXj8w9viwOqrfunwBhkqKu6S
	yuTY/5kZZFlyoMl9tqeA9gjg7weO1AvFJxaJizgbjt6ErNA8jWhQBL/l1oK4QwYA+0Xx
	0FHQ==
X-Gm-Message-State: AG10YOSARxA7lR56lY+PpGrStrGt3nlUl5UtXzHVINFf2tVN3vMQyfooBJ0N3MpuRMq4H9Yf
X-Received: by 10.28.179.84 with SMTP id c81mr5998648wmf.30.1454229820170;
	Sun, 31 Jan 2016 00:43:40 -0800 (PST)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	u69sm5873931wmu.20.2016.01.31.00.43.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Jan 2016 00:43:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 060063E013A;
	Sun, 31 Jan 2016 08:43:38 +0000 (GMT)
References: <1453991009-32736-1-git-send-email-alex.bennee@linaro.org>
	<56AC86FF.2050806@msgid.tls.msk.ru>
User-agent: mu4e 0.9.17; emacs 25.0.50.9
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Michael Tokarev <mjt@tls.msk.ru>
In-reply-to: <56AC86FF.2050806@msgid.tls.msk.ru>
Date: Sun, 31 Jan 2016 08:43:37 +0000
Message-ID: <877fiqyw92.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::236
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	stefanha@redhat.com, pbonzini@redhat.com, david@gibson.dropbear.id.au
Subject: Re: [Qemu-trivial] [PATCH v3 0/3] Travis updates
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 31 Jan 2016 08:43:45 -0000


Michael Tokarev <mjt@tls.msk.ru> writes:

> 28.01.2016 17:23, Alex Bennée wrote:
>> Hi,
>>
>> The first patch has been reviewed and signed off. Long term I think
>> it is worth applying but it look like the performance increase it
>> negligible compared to the old style VM builds at the moment. I
>> suspect this may be because the new infrastructure is under more load
>> as more projects have migrated.
>
> I'm applying all this to -trivial, but without trying to understand
> what it is all about, as I don't know travis.

Maybe we should hold off for now until the later ones have been reviewed
(David has some comments on 2/3). I guess it was really a question of if
trivial is the right tree for these patches to go upstream.

Maybe what's really needed is a build and test automation tree (and
associated maintainer)? Peter any comments?

>
> Thanks,
>
> /mjt


--
Alex Bennée


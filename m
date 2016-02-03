Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aR2Qf-000451-Qo
	for mharc-qemu-trivial@gnu.org; Wed, 03 Feb 2016 13:45:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aR2Qd-00042Y-RR
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 13:45:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aR2Qb-0005v3-DL
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 13:45:23 -0500
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:37739)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aR2Qa-0005uq-3a
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 13:45:21 -0500
Received: by mail-wm0-x232.google.com with SMTP id l66so84242962wml.0
	for <qemu-trivial@nongnu.org>; Wed, 03 Feb 2016 10:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-type:content-transfer-encoding;
	bh=VPHbWFFqUB0/0F8PrGcpoDwV3jYwEP0Myzy2Dzgi8A0=;
	b=elg8u3c7+rBLg5adcpgEdpNWAmvCooZ7fLHZWzbVbxHnf7c9vGQuBWWBnbzNHJeTGW
	76Fh+gluyfdDlLnsShyeAdGHAkaBwfhUddEoSR9wOwJQz3uS3DCpSXVWJV/5G+VauPAn
	bYpUisfyvr/CpfHJrUscL5tNdFOu5ZYVwANY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=VPHbWFFqUB0/0F8PrGcpoDwV3jYwEP0Myzy2Dzgi8A0=;
	b=T/yB7LnDo1CPEzynvHt2XE8m3MJKmjP1sYfSF9PxlEGvM1CI9ywJqAH9u4h6mPE05E
	NRMnQOpGpG/dgSKvHEmLzcowxmozEmQI9FjibrEK4+BW+O/d5e4KitIuJz9UsooGANCw
	/gAU4mh+TO3GO9ifYaDEPICYhEV8YGYHsWL1/GEKjdQGw1FBh0sAFpOeQSq6CVmQW6Ae
	wJuxiosIDjHejAsF5pz1YaD5fJPlSmTcATDtnQS73hpA+4U6CoXriNHUbbJ6Nar1Ff/B
	e6aTS7u7amNHPhPzb/K6N5V7a3jaDkPAXqGjPjFH166d1SlmocQ/Jipu7NI6iC14o3h+
	/WaQ==
X-Gm-Message-State: AG10YOReLvnK7jxjPjJLxRdXofia9+XGFvG0tbfMcAiKqlNxr4bwmcbC6TXjb1Vglo5XSMD0
X-Received: by 10.28.3.134 with SMTP id 128mr5292917wmd.92.1454525119265;
	Wed, 03 Feb 2016 10:45:19 -0800 (PST)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	z137sm9179916wmc.8.2016.02.03.10.45.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Feb 2016 10:45:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 6AD263E01B1;
	Wed,  3 Feb 2016 18:45:17 +0000 (GMT)
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-6-git-send-email-alex.bennee@linaro.org>
	<55C8FE48.6010900@codeaurora.org>
User-agent: mu4e 0.9.17; emacs 25.0.90.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Christopher Covington <cov@codeaurora.org>
In-reply-to: <55C8FE48.6010900@codeaurora.org>
Date: Wed, 03 Feb 2016 18:45:17 +0000
Message-ID: <87zivhocoy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::232
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, crosthwaitepeter@gmail.com,
	pbonzini@redhat.com, rth@twiddle.net
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 05/11] qemu-log: Improve
	the "exec" TB execution logging
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
X-List-Received-Date: Wed, 03 Feb 2016 18:45:24 -0000


Christopher Covington <cov@codeaurora.org> writes:

> Hi Peter, Alex,
>
> On 08/03/2015 05:14 AM, Alex Bennée wrote:
>> From: Peter Maydell <peter.maydell@linaro.org>
>>
<snip>
>
> Do you think there's some way to log the loop count when a circular chain is
> executed?

Possibly but I'm going to treat this as a future enhancement.

--
Alex Bennée


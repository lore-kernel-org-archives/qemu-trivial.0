Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dfS84-0002ZU-Ca
	for mharc-qemu-trivial@gnu.org; Wed, 09 Aug 2017 10:38:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1dfS82-0002ZF-2e
	for qemu-trivial@nongnu.org; Wed, 09 Aug 2017 10:38:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1dfS7z-0003WF-1D
	for qemu-trivial@nongnu.org; Wed, 09 Aug 2017 10:38:34 -0400
Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233]:38413)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1dfS7y-0003US-NC
	for qemu-trivial@nongnu.org; Wed, 09 Aug 2017 10:38:30 -0400
Received: by mail-wr0-x233.google.com with SMTP id f21so24744117wrf.5
	for <qemu-trivial@nongnu.org>; Wed, 09 Aug 2017 07:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=XCX9poUp7mLQ2D8Zu/YmnC1gJ8mYLLaaSCr7Y3MbvSk=;
	b=VygPnV8xMiuLYaEcT5GodNr/ThRfrs7mXBhLJssdKX1tTWnqt3HeVkHk8pupQ3yu4C
	vzEpMWXinsBi/7XI1xjGGMZY/F6+VVRxuwvl0ZFDzqiItU+hF+HHDtSKYrGLHtso+EC+
	UapIDuZYqFyb/iiQZsMZiAlubhCvvKL2SpU00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=XCX9poUp7mLQ2D8Zu/YmnC1gJ8mYLLaaSCr7Y3MbvSk=;
	b=lA+811XMomAsQoMd5+dZICRxNJBCP5WkpSSwC4/m1Q8scIk7fqgvg4SOixStYprBbJ
	2qcUXh7Bq1KEqXTxHQgv+iVS7D4eWrF3FEvS7bYhwRixM1J3IiPZ+4lYUp33X4GZGu4J
	5pwDhWDr+G1VnhLLQYtfK0QLQLmq+GHSDNSCsuHVUzk8Ldbyl4aAdSNnr2EP2JunU0yc
	r7XRu8smTPAIpm6hO5Y5Cbnq+T7DOLEVd9IMXb5eEahyDl1Icv/dSO6yNMZspe/c3GR8
	/PFqnfJ0kKriBcvpBjulBrHB+L4FVi3CqVcbzfT+ubIMtDpnVEXh+FxRGQF6SeIHMXFR
	Rn5A==
X-Gm-Message-State: AHYfb5hwR21JJS1NJLQTQvXRK6SVVzRMP8heKtbKwfg0/C6JMdv3KpS6
	EyXW0Bcq6cU85s38
X-Received: by 10.223.175.38 with SMTP id z35mr5445363wrc.213.1502289509475;
	Wed, 09 Aug 2017 07:38:29 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	l43sm5144163wrl.33.2017.08.09.07.38.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Aug 2017 07:38:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 0510D3E009F;
	Wed,  9 Aug 2017 15:38:28 +0100 (BST)
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-19-f4bug@amsat.org>
	<87mv7aumav.fsf@linaro.org>
	<8e2e3aa5-4459-76ba-3309-af6b30220346@amsat.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Richard Henderson <rth@twiddle.net>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
In-reply-to: <8e2e3aa5-4459-76ba-3309-af6b30220346@amsat.org>
Date: Wed, 09 Aug 2017 15:38:27 +0100
Message-ID: <87fud0vmak.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::233
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 18/47] MAINTAINERS: add
 missing TCG entry
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
X-List-Received-Date: Wed, 09 Aug 2017 14:38:35 -0000


Philippe Mathieu-Daudé <f4bug@amsat.org> writes:

> On 08/08/2017 12:11 PM, Alex Bennée wrote:
>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> [...]>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 8cb94af6c5..6b83dac812 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1633,6 +1633,7 @@ Common code
>>>   M: Richard Henderson <rth@twiddle.net>
>>>   S: Maintained
>>>   F: tcg/
>>> +F: disas.c
>>
>> Is this really TCG only? Can't the monitor call monitor_disas in any
>> mode?
>
> Indeed, this doesn't seem TCG only.
>
> Do you think there should be another entry in "Block QAPI, monitor,
> command line"?
> or this file (and related include) rather deserves an own section
> (possibly tagged Odd Fixes) to unburden Richard?

Well the default for un-matched files is qemu-devel right? It would be
nice for it to be properly maintained but that requires someone to
step-up to the plate.

--
Alex Bennée


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnAOO-0007lZ-CS
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 17:19:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAOM-0007ja-84
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:19:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAOL-0003kQ-IT
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:19:18 -0400
Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231]:34259)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAOH-0003iZ-3G; Wed, 30 Aug 2017 17:19:13 -0400
Received: by mail-qk0-x231.google.com with SMTP id a77so33402888qkb.1;
	Wed, 30 Aug 2017 14:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=6jk6JCRlV6y9oCfrEo+QK4GoRWY2Knl83JNxiAqf+ns=;
	b=N3jObEGgaUFApfX2prWnGseeBwwky+qSfXQrONU7FsszLHCe/LY3MtCJUZTSvc9u6j
	ortGJFiHbbzMLwuFm7QX4d2/DRT9H+j5NFbRDQDON2Y+mofyvXzivw0zaQiLE/WJbUMC
	lYO8E1MBow2SBAbxMMfg7sfmEehl8Jwy8eqn55xFWiD3CKLfNu5dRPhyOiOJEMJhgZNJ
	Ppm5IKWSjrije2gFjV5dpT/o4P0QX8QoXBZExelh/lJZYP5DWTAeCAn5sokUmoZYpHd4
	J3uNPACS7VqCpOXku/wUpgh0fTEpUV06Wldb7jUlZddMAcCHc4lIPYgW/FICOEvt8HUl
	2GTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6jk6JCRlV6y9oCfrEo+QK4GoRWY2Knl83JNxiAqf+ns=;
	b=QIwoGeio2hA/UTTLwxXszqpguZDzu66kO+uH9npUZIgzp4nCLjLoTVRCR8/OyNwO+O
	vL6Hg7ZL6BqA9uqqQKntEBEutU0dH1c42FpQ5cLBl4knzBcBcPpFw9Nq0wA8eSJwr7Cv
	jpXXiaGEN5wDl6eF1TulgP57LdpUxGi3NnyiMT8BCQYWBcl/++2WfcDjweQifISvDtFZ
	VoDs4TwJdaqfZlsePpKrJeoskkqI1WI5ZY7sDIyhML5r8Jl2qxNZoiLM8rZxIGeCQxad
	0P6mUb+r1RxbjBJs6Jx2kTB/Nr6rZAT7Zx/kWG2oPI7X0NVAE9O3hkcaX+BPcdw+Qj8y
	hx1w==
X-Gm-Message-State: AHYfb5hJVT5IA5gFs+qA3dCRPFT5BuEyWClIUGKjvYgF3TeA4UhJu6EX
	F+Je5U7qrquqvn7icrC8Vw==
X-Received: by 10.55.160.22 with SMTP id j22mr957121qke.88.1504127952474;
	Wed, 30 Aug 2017 14:19:12 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	z20sm4427909qta.12.2017.08.30.14.19.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:19:11 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20170728053610.15770-1-f4bug@amsat.org>
	<87mv6k2apd.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <96185d9e-289a-3335-3b0d-d38d5522ddce@amsat.org>
Date: Wed, 30 Aug 2017 18:19:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <87mv6k2apd.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::231
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 00/47] add missing entries
 in MAINTAINERS
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
X-List-Received-Date: Wed, 30 Aug 2017 21:19:19 -0000

Hi Markus,

On 08/28/2017 08:28 AM, Markus Armbruster wrote:
> Where do we stand with this series?

I was giving time to eventual adoptive maintainers until 2.11 opening :)

Regards,

Phil.


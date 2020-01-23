Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iuhC2-0003f7-HS
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jan 2020 13:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47449)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iuhBy-0003Zk-S5
 for qemu-trivial@nongnu.org; Thu, 23 Jan 2020 13:26:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iuhBx-0004PA-KY
 for qemu-trivial@nongnu.org; Thu, 23 Jan 2020 13:26:58 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38759)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iuhBx-0004OV-Dv
 for qemu-trivial@nongnu.org; Thu, 23 Jan 2020 13:26:57 -0500
Received: by mail-wm1-x344.google.com with SMTP id u2so3572112wmc.3
 for <qemu-trivial@nongnu.org>; Thu, 23 Jan 2020 10:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=7dXJiqFh/Qd0FgxO2ZOIyemz+7W8bSpsp6lnmrr/4EQ=;
 b=W2JJ4TeRyjyoPxJ9+jIE+APwYqc31Ed4827OmakVFGzMwG6cyXM93/MSUZOuZ9Fy4u
 Av25d6W3rWFuHkAGv4A9SX7ik1hVA45gqkX43xzSCDkkw/XsmJVi0H2vlBDshf62Ynlw
 yRO8fycmV9FeS44u3Bq/fHZBJ+GUKKNXZ1fz0wUMUzcWkS1gk91/tRTSXYv9/4NrsT6p
 UTkFElrJeWj47WjiD43EgBn5W+CjCzcHr++dZ1Vj8xsyOggXfOhRpBZojh+LR6rjC8zA
 yMQ7l3wTg8pMIb6eyw0Otb3OOxOGmqUaLdQaEAW4qElAPjaZj7HR1bGIErdFn+7jwyUz
 mh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=7dXJiqFh/Qd0FgxO2ZOIyemz+7W8bSpsp6lnmrr/4EQ=;
 b=lltEq197dP4KdP0SjYrY28OQwQmaUlRAqMQoOC3erlyIs+WVIY9Ju/11J0xeB0qLgc
 iENVVSU8BkYvBZ5rjMCSTR29dZTzQovI+VkVOfUmcHWZq32aC5Z+ZMWdsftb6NVkTAi1
 FrqI58+OoHJOdxhAwgStzHleCX4gFFINKSQmHyKQ27uTqApmJgPOYY3X/c0pr7G1VfXE
 naL01cr+jaJWiC3CD1lx7R8bP3MxnxGTTLIMFW7xVEzItbA6R4ywzoTnYKE0akPeQA/n
 tlau9PiFTPaGhrlOhRBmwEH1R1vSObVFEUsha6ujzSa08Z4+jUnlMvdYXYdVB//QpPmE
 sUvg==
X-Gm-Message-State: APjAAAXoJFcyPKKV6zh0vafO16q4eCaa1gcaexQQYo01iO+Rj8Q/07RH
 PWQbzlUkF0kFaSsdqgIq7jonqA==
X-Google-Smtp-Source: APXvYqy33tetM39E+6BoKwUeZDxw3JJOKqAWYoioWj4ZqTs+QVvOzkPsrX/1nM6Y2uAXHJVewNTAIw==
X-Received: by 2002:a05:600c:2507:: with SMTP id
 d7mr5226059wma.28.1579804015556; 
 Thu, 23 Jan 2020 10:26:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a5sm3552190wmb.37.2020.01.23.10.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 10:26:54 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 66A121FF87;
 Thu, 23 Jan 2020 18:26:53 +0000 (GMT)
References: <20191217173252.4672-1-philmd@redhat.com>
 <6a8266c6-7c6d-3139-249f-2dd46c98e02f@redhat.com>
 <87blquza17.fsf@linaro.org>
 <47e28e48-362a-39ea-ee58-9bbe7d222394@redhat.com>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, Fam Zheng
 <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>, Hannes
 Reinecke <hare@suse.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, Jason Wang
 <jasowang@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Reitz <mreitz@redhat.com>, Andrew Jeffery <andrew@aj.id.au>, Peter
 Chubb <peter.chubb@nicta.com.au>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, Kevin
 Wolf <kwolf@redhat.com>, =?utf-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?=
 <dirty.ice.hu@gmail.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 0/6] Fix more GCC9 -O3 warnings
In-reply-to: <47e28e48-362a-39ea-ee58-9bbe7d222394@redhat.com>
Date: Thu, 23 Jan 2020 18:26:53 +0000
Message-ID: <878slyyqoi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jan 2020 18:27:00 -0000


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 1/23/20 12:28 PM, Alex Benn=C3=A9e wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> On 12/17/19 6:32 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> Fix some trivial warnings when building with -O3.
>>>> Philippe Mathieu-Daud=C3=A9 (6):
>>>>     audio/audio: Add missing fall through comment
>>>>     hw/display/tcx: Add missing fall through comments
>>>>     hw/net/imx_fec: Rewrite fall through comments
>>>>     hw/timer/aspeed_timer: Add a fall through comment
>>>>     hw/scsi/megasas: Silent GCC9 duplicated-cond warning
>>>>     qemu-io-cmds: Silent GCC9 format-overflow warning
>>>
>>> Sorry, this series failed because I used this tag in the first patch:
>>>
>>> Cc: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>
>>>
>>> Then git-send-email was happy with --dry-run, but then failed:
>>> (body) Adding cc: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmai=
l.com> from line
>>> 'Cc: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>'
>>> 5.1.1 <K  v  g  >: Recipient address rejected: User unknown in local
>>> recipient table
>>>
>>> Note to self, enclose utf-8 names, as:
>>> Cc: "K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n" <dirty.ice.hu@gmail.com>
>> I never have to with my tags:
>> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Is it possible to be more even utf-8? Sounds like a bug in the git
>> tools
>> to me.
>
> The problem is the comma.
> What do you mean by "more UTF-8"?

It was a joke - I think you are either utf-8 clean or not. Now the
question is should the tools have slurped the coma as part of the name?
Is it a localisation issue?

--=20
Alex Benn=C3=A9e


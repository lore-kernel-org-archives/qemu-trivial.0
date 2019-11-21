Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iXpDU-0006Os-E5
	for mharc-qemu-trivial@gnu.org; Thu, 21 Nov 2019 11:22:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58922)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iXpDR-0006OS-TV
 for qemu-trivial@nongnu.org; Thu, 21 Nov 2019 11:21:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iXpDP-0006Dx-VA
 for qemu-trivial@nongnu.org; Thu, 21 Nov 2019 11:21:56 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:57321
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iXpDP-0006DO-I5
 for qemu-trivial@nongnu.org; Thu, 21 Nov 2019 11:21:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574353313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=scMVOKhhnarm2rX1omDGXP2fWXr4AuzuqRDPv4KsTMM=;
 b=VNnTj5a3VCOkxiwwaFfg+Kzqsx2BxS5dLN1FCS27+YU+coswUpoZ+5wePCyOhc82pFc+WD
 8AsCJHyMsp8SG3ZdII+XhhVHTIq+tdcRMIR0s938n/nHYxXCF01yXUwBblG8vwp6zmGJJB
 kv4i/jf0eF4XiL6Whriz6yjwWUh99r0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-8vQdvV6kMa2OF9SG53jRlA-1; Thu, 21 Nov 2019 11:21:51 -0500
Received: by mail-wm1-f71.google.com with SMTP id f16so1802172wmb.2
 for <qemu-trivial@nongnu.org>; Thu, 21 Nov 2019 08:21:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UvgkVKx6y7zbjfT0M18/Aez5VyDE64BT7zXNYYM1x2c=;
 b=W7WOft27G2AkceXnmJG6cdbaN78SFUb7Gw+XMLugssophT0NnkH/ZtyypWQANsuYbd
 qd0ctIdvwxy/n0nUkAxxIuV3kaqZN7FpWdeJGrSL+j9jyttDZVaHogi/W6xpe8pGlPVi
 PuIFBp1M+momkZf2iorD+nn1v+aVvQqWnYeziYPnTALB/djYpD2Yca1y1oEi+eCvlXik
 W3PWTnPEOPBGloOLqWLfHMXsRvDE9z5gO/Mkfb0JcVrgAjEF9ScIJpb+bC7vcAr8nDX3
 VyPxjqPXBabkErzbRpZo3kdqlc4dvbpfMuv6F8ixyDS8SWu1m1p0/iit74DxiPW4RW5B
 AFKQ==
X-Gm-Message-State: APjAAAW9fWaq47DdHerLepwzALqbA0Ee0qw6HNkPPZu5542z8iUS0xLV
 fY99Cd3E7hbzyo11WPK36kklcvBwbxfjhw78TwAUkdcLw3rB1oNSxlfhyKtUyFXbizvoODM6cCa
 ACrX1FV2T3tn8qOQxRA==
X-Received: by 2002:adf:dfc6:: with SMTP id q6mr12412981wrn.235.1574353310876; 
 Thu, 21 Nov 2019 08:21:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqy1n2eMfsl4b+hzdMl8YJ9Rsg6m/UiZol5dO05bLRMb/+kOgc+3RXXKm+jF80xL6puxjQ4S7g==
X-Received: by 2002:adf:dfc6:: with SMTP id q6mr12412956wrn.235.1574353310694; 
 Thu, 21 Nov 2019 08:21:50 -0800 (PST)
Received: from [192.168.1.35] (131.red-88-21-102.staticip.rima-tde.net.
 [88.21.102.131])
 by smtp.gmail.com with ESMTPSA id c144sm179727wmd.1.2019.11.21.08.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2019 08:21:50 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH 0/2] hw/timer/m48t59: Convert to trace events
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>, qemu-ppc@nongnu.org
References: <20190626122042.7656-1-philmd@redhat.com>
 <dfa56995-6a66-1aeb-4461-fb2919e8b699@redhat.com>
 <87r2219rk7.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1d3151eb-841d-0e03-46d5-c48107ce821c@redhat.com>
Date: Thu, 21 Nov 2019 17:21:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <87r2219rk7.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-MC-Unique: 8vQdvV6kMa2OF9SG53jRlA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Thu, 21 Nov 2019 16:21:59 -0000

On 11/21/19 4:28 PM, Markus Armbruster wrote:
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>=20
>> ping?
>=20
> Did this fall through the cracks?

Certainly =3D) Thanks for noticing.
This now need a (trivial) rebase.
I'll respin for 5.0.

>> On 6/26/19 2:20 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>> Another trivial cleanup series.
>>>
>>> Philippe Mathieu-Daud=C3=A9 (2):
>>>    MAINTAINERS: Add missing m48t59 files to the PReP section
>>>    hw/timer/m48t59: Convert debug printf()s to trace events
>>>
>>>   MAINTAINERS                |  2 ++
>>>   hw/timer/m48t59-internal.h |  5 -----
>>>   hw/timer/m48t59.c          | 11 +++++------
>>>   hw/timer/trace-events      |  6 ++++++
>>>   4 files changed, 13 insertions(+), 11 deletions(-)
>>>



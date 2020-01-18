Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1isti0-0002B1-AU
	for mharc-qemu-trivial@gnu.org; Sat, 18 Jan 2020 14:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50523)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1isthu-00023U-VO
 for qemu-trivial@nongnu.org; Sat, 18 Jan 2020 14:24:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1istht-0001pY-T0
 for qemu-trivial@nongnu.org; Sat, 18 Jan 2020 14:24:30 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42758
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1istht-0001pB-Pm
 for qemu-trivial@nongnu.org; Sat, 18 Jan 2020 14:24:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579375469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Yt0cLPEtWQSPHouvmP/tZdV+Nm8YIxHarzWfnOxaVo=;
 b=bjl/JYVYkfEwtsqjSkUHk+n0NFnF+yBnmRCt9ince3fy6MAtQTcEoxDp/9PKU0Vh93lubw
 pAm6lCWjix8HUm6Amqg4EqpszbXnIxWsSOL5SNtQ+B3fbAtpKgpIJJ5TPHm2qGfQtkywBA
 n5T4RF7mbSdKjpL9l7j46I5xiW2i2xc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-Uce0T4mxPy63383NJ10F1g-1; Sat, 18 Jan 2020 14:24:26 -0500
Received: by mail-wr1-f69.google.com with SMTP id c6so11968639wrm.18
 for <qemu-trivial@nongnu.org>; Sat, 18 Jan 2020 11:24:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HVQGz5YSjkxifvvhIhHWjfL482L8+9+PoGYqgiTx25Q=;
 b=tbC4YZVcRuvvRv3gIrjc1ohDKuWEiXw8wowXqgHyV591mCSFaLNMIIh0Fj8RXf/Rsk
 Py3MngYm0YLJP0msgr0zp91WBD8e0mTZO8HCP7Uw7iFv1uSgmKjBnt0R3tTlu0IZVTBg
 Gw7TWW0+kHO+o8xHwhI0LuGdnFkUJaXK9o9WKb2J9JW9ECGLo1UcAPpNZhlTJkOcMyKY
 Q19iuMsdGqOBvF7o+A7fElncWWJOyRgLzQSkQ3RatAJ1GUo1p+s0rtCAwD833GjnW0Lk
 mCHUf9I2AtZYTuH+z8DRhOYg7sn5dKDE1JziVjczAEh2P/FigEBSTwtkCO+XxXpsWz5/
 Quww==
X-Gm-Message-State: APjAAAXGYljdzzvRHXGfDbweuaoHKNUEdou0/r3V+oxX93xMJnnEMPl/
 3spdpfm1SUcyb1neR9BRAFYSjnIVTQl2R1oOzx/U3Hn8LN6kZfozjKg4hZCVB4niVG5ETArei4p
 b43nZ8Z9H1B6//HRJNg==
X-Received: by 2002:a05:600c:22c8:: with SMTP id
 8mr11144090wmg.178.1579375464908; 
 Sat, 18 Jan 2020 11:24:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqzr2J7LFfbWffIMbkkV/P11lGmOvpf23+ujij+Fop3va/bWuyYFQlaPyZuyRXbCLuugRtCRlw==
X-Received: by 2002:a05:600c:22c8:: with SMTP id
 8mr11144060wmg.178.1579375464682; 
 Sat, 18 Jan 2020 11:24:24 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:e0d6:d2cd:810b:30a9?
 ([2001:b07:6468:f312:e0d6:d2cd:810b:30a9])
 by smtp.gmail.com with ESMTPSA id h17sm41015708wrs.18.2020.01.18.11.24.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jan 2020 11:24:24 -0800 (PST)
Subject: Re: [PATCH 0/6] Fix more GCC9 -O3 warnings
To: Markus Armbruster <armbru@redhat.com>,
 "Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.au>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Hannes Reinecke <hare@suse.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Kevin Wolf <kwolf@redhat.com>, Joel Stanley <joel@jms.id.au>
References: <20191217173252.4672-1-philmd@redhat.com>
 <84fthiaahd.wl-Peter.Chubb@data61.csiro.au>
 <87a77q9njk.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <97c34bbd-79d2-070e-a35e-4fdf68b2e291@redhat.com>
Date: Sat, 18 Jan 2020 20:24:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <87a77q9njk.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-MC-Unique: Uce0T4mxPy63383NJ10F1g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Sat, 18 Jan 2020 19:24:32 -0000

On 18/12/19 07:05, Markus Armbruster wrote:
> "Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.au>
> writes:
>=20
>>>>>>> "Philippe" =3D=3D Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> w=
rites:
>>
>> Philippe> Fix some trivial warnings when building with -O3.
>>
>> For compatibility with lint and other older checkers, it'd be good to ke=
ep
>> this as /* FALLTHROUGH */ (which gcc should accept according to its
>> manual).
>=20
> We have hundreds of /* fall through */ comments already.
>=20
>> Fixing the comments' placement is a different matter, and should be
>> done.  Seems to me that until gcc started warning for this, noone had
>> actually run a checker, and the comments were just for human info.
>>
>> Peter C
>=20

Queued, thanks.

Paolo



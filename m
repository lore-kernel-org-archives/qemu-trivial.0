Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1itr6R-0006YF-C1
	for mharc-qemu-trivial@gnu.org; Tue, 21 Jan 2020 05:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37842)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1itr6O-0006V9-5x
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 05:49:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1itr6M-0000tA-SN
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 05:49:44 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:51042
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1itr6M-0000t0-PO
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 05:49:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579603782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FSa46ZYyGmie/bVkHIG0X5JHtwyUvx9RKZ7BbDRX9ZM=;
 b=PKPHX+4mSu62k4sH9J8eQ7nHvxfiTjpQSiKADJYwxeBb2qS6AB3IqxGTcpArCeIBdmhGWh
 BCJGuLU1GhWswBuGv1OXuQizu60E0eB6jbLPldcfiWeuNxtJi9+14y8hbrR1GuOCUvatEs
 waoSsiVx8etI0gQt7azYI85EED75jn4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-P1SNBDdZPfCw1COhH8dHJg-1; Tue, 21 Jan 2020 05:49:38 -0500
Received: by mail-wm1-f71.google.com with SMTP id q206so457112wme.9
 for <qemu-trivial@nongnu.org>; Tue, 21 Jan 2020 02:49:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IDMnGMJ6Cs/whFH4XpRx3WeUmxqpk22bAwxooOpZMug=;
 b=bMzpxxD0nezrDYL2F9ah9ftFOR/inqmquP1MWtR26uN0Blxb7kbBHOnlqt/GCfiPL0
 PEKqkWnFtbypGpcvQLSp4kEVPSRucGYoXe8UDcC9l4bhMGX77PVNR9cM5aPy80djLNk4
 WqDTT1qr4NW2n+wWS2K0iFUvuBbgCgsivOSvU/jR71pii2D/mXRzkFMvsflKq3pwL2W6
 Y5vxH54PWfUqwbObuAr1qXKaRQ9s/VsQiMCqAi2ECxw96aliDTJV0Ai/0nGWLjOcpMvn
 oG6YXSIdZOSNrqsyaYc3yvjpAWyUzKfAxZdSxN2m7faBl3nL9MNHdB2ymg+K5ovE4xz/
 KDtg==
X-Gm-Message-State: APjAAAUDYQcopq14PPFJuu+eNuTonzHp4rkQFLcvp0fp1aWTKzShnB4A
 VB6I4QZCXngP17RRmOrjEQxUfyQhFmURAhc6b+AQxPOWMSboNKZ1yYZ2iARu9BWvkSYtbxzGCgj
 Qq/68nqfWIHqLVcGrsw==
X-Received: by 2002:a1c:23d7:: with SMTP id j206mr3830833wmj.39.1579603777205; 
 Tue, 21 Jan 2020 02:49:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqzGgPRbDGWXfiDpsQoV7Fde7/+KMQy7QRwbv8JZ8kZVmU295Mk9Ff6VypESFdv/IqR1lYIGdA==
X-Received: by 2002:a1c:23d7:: with SMTP id j206mr3830811wmj.39.1579603776906; 
 Tue, 21 Jan 2020 02:49:36 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:b509:fc01:ee8a:ca8a?
 ([2001:b07:6468:f312:b509:fc01:ee8a:ca8a])
 by smtp.gmail.com with ESMTPSA id k7sm3243589wmi.19.2020.01.21.02.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 02:49:36 -0800 (PST)
Subject: Re: [PATCH 0/6] Fix more GCC9 -O3 warnings
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.au>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
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
 <97c34bbd-79d2-070e-a35e-4fdf68b2e291@redhat.com>
 <db49a831-df35-c209-5db5-0631a5ef2497@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <12b8431d-3d29-cdbe-b952-eac23c35be0a@redhat.com>
Date: Tue, 21 Jan 2020 11:49:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <db49a831-df35-c209-5db5-0631a5ef2497@redhat.com>
Content-Language: en-US
X-MC-Unique: P1SNBDdZPfCw1COhH8dHJg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Tue, 21 Jan 2020 10:49:45 -0000

On 20/01/20 20:02, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Paolo,
>=20
> On 1/18/20 8:24 PM, Paolo Bonzini wrote:
>> On 18/12/19 07:05, Markus Armbruster wrote:
>>> "Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.au>
>>> writes:
>>>
>>>>>>>>> "Philippe" =3D=3D Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>=
 writes:
>>>>
>>>> Philippe> Fix some trivial warnings when building with -O3.
>>>>
>>>> For compatibility with lint and other older checkers, it'd be good
>>>> to keep
>>>> this as /* FALLTHROUGH */ (which gcc should accept according to its
>>>> manual).
>>>
>>> We have hundreds of /* fall through */ comments already.
>>>
>>>> Fixing the comments' placement is a different matter, and should be
>>>> done.=C2=A0 Seems to me that until gcc started warning for this, noone=
 had
>>>> actually run a checker, and the comments were just for human info.
>>>>
>>>> Peter C
>>>
>>
>> Queued, thanks.
>=20
> Thanks, but I sent a v2 (20191218192526.13845-1-philmd@redhat.com) with:
>=20
> - addressed Thomas and Aleksandar comments
> - dropped 'hw/scsi/megasas: Silent GCC9 duplicated-cond warning'
> - dropped 'qemu-io-cmds: Silent GCC9 format-overflow warning'
>=20
> See:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg666280.html
>=20
> Can you queue it instead?

Yes, I replaced it.

Paolo



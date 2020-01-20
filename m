Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1itcJe-0000Q6-I5
	for mharc-qemu-trivial@gnu.org; Mon, 20 Jan 2020 14:02:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33551)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itcJY-0000Lm-Cb
 for qemu-trivial@nongnu.org; Mon, 20 Jan 2020 14:02:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itcJT-0006jN-Kk
 for qemu-trivial@nongnu.org; Mon, 20 Jan 2020 14:02:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50806
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itcJT-0006iv-Fm
 for qemu-trivial@nongnu.org; Mon, 20 Jan 2020 14:02:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579546935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EhCNMjX983nC8F7qVvCJbWLa8D2WM/aCqt/wvcrqF5c=;
 b=ayqVauGT1mbCPcPyPp1qf+Q6Sto6OrYVodB9iXxN9IfS6/6eu0vXbcFtqu/aO2+yY01e23
 tFekkY6zWmmUpwnPNYtdeVGvDlfzP+gfupeRhc7ldscH+ufFAJKkEey7m8H8LxillG2S1A
 9kdh/yuXDpLnJR6Uzn5JsefivVmXWkY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-oFLgGBLqPY6KhiI3MT-zQw-1; Mon, 20 Jan 2020 14:02:13 -0500
Received: by mail-wr1-f71.google.com with SMTP id f15so209233wrr.2
 for <qemu-trivial@nongnu.org>; Mon, 20 Jan 2020 11:02:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EJI/jxaTJNO4GsVuiSQITtTXsjQkBuso2rOaws0BmPk=;
 b=aWi2w0xjlX4s3lUTjuHIife06oE1zSmNGl80nXoN3te48SIQtzcC2wiSCAwHvwK8cJ
 MZHUOwR2xtBahlOxsFA8/marf8W98MwZFugRlaI6OU+GnfvhNb2qcEpuZnyM9rLR47Ty
 2GZTyN93kys/Sl5JVpy+cuDMObk26WwhcU0r0X/5VOYaSH1B5P5c4mxzgFjHuS7CvpFa
 T0USY4+EA4uBBvqrKasJRTslR4GWqM5+cQAJ1m2+ZQT1utljOHWL79EWe3GagPQ4QSe7
 NTzo9jui8S/mcCgp3YFw9Zc95wvUvEtcW74XZWiGJPUlXdsionWYHLMOtl9GMcjhrBhQ
 Dc6g==
X-Gm-Message-State: APjAAAXKyOhNsqx6rY3zdEwzNOJ4tkx0vlxVUnIuH+p6BwZXpWV5AP2e
 tZwzb96ZRE2GNpYTrm171pb9SHKGrUn5Vy3BMSasASYp8URb1+YzlWKh0/jAMj/xnkLLimZUwst
 GWlb28E2CC/rOTtdKEQ==
X-Received: by 2002:a5d:448c:: with SMTP id j12mr886392wrq.125.1579546931750; 
 Mon, 20 Jan 2020 11:02:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqz2cZTFEZVZvE3m3/E8DIYUdIJXEOKgSXPPCBDN2N9+6dZ0ycPEn2e0TmzY3FIQfFgw8Qq0jA==
X-Received: by 2002:a5d:448c:: with SMTP id j12mr886366wrq.125.1579546931571; 
 Mon, 20 Jan 2020 11:02:11 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id s128sm391543wme.39.2020.01.20.11.02.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2020 11:02:10 -0800 (PST)
Subject: Re: [PATCH 0/6] Fix more GCC9 -O3 warnings
To: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <db49a831-df35-c209-5db5-0631a5ef2497@redhat.com>
Date: Mon, 20 Jan 2020 20:02:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <97c34bbd-79d2-070e-a35e-4fdf68b2e291@redhat.com>
Content-Language: en-US
X-MC-Unique: oFLgGBLqPY6KhiI3MT-zQw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Mon, 20 Jan 2020 19:02:24 -0000

Hi Paolo,

On 1/18/20 8:24 PM, Paolo Bonzini wrote:
> On 18/12/19 07:05, Markus Armbruster wrote:
>> "Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.au>
>> writes:
>>
>>>>>>>> "Philippe" =3D=3D Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =
writes:
>>>
>>> Philippe> Fix some trivial warnings when building with -O3.
>>>
>>> For compatibility with lint and other older checkers, it'd be good to k=
eep
>>> this as /* FALLTHROUGH */ (which gcc should accept according to its
>>> manual).
>>
>> We have hundreds of /* fall through */ comments already.
>>
>>> Fixing the comments' placement is a different matter, and should be
>>> done.  Seems to me that until gcc started warning for this, noone had
>>> actually run a checker, and the comments were just for human info.
>>>
>>> Peter C
>>
>=20
> Queued, thanks.

Thanks, but I sent a v2 (20191218192526.13845-1-philmd@redhat.com) with:

- addressed Thomas and Aleksandar comments
- dropped 'hw/scsi/megasas: Silent GCC9 duplicated-cond warning'
- dropped 'qemu-io-cmds: Silent GCC9 format-overflow warning'

See:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg666280.html

Can you queue it instead?



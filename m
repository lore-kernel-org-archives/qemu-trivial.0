Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHPqI-0001Ck-M5
	for mharc-qemu-trivial@gnu.org; Mon, 07 Oct 2019 06:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58581)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iHPqB-00014X-80
 for qemu-trivial@nongnu.org; Mon, 07 Oct 2019 06:02:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iHPq9-0006A1-Hj
 for qemu-trivial@nongnu.org; Mon, 07 Oct 2019 06:02:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35542)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iHPq7-00068S-Bu
 for qemu-trivial@nongnu.org; Mon, 07 Oct 2019 06:02:05 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C345FC057F31
 for <qemu-trivial@nongnu.org>; Mon,  7 Oct 2019 10:01:58 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id b6so7329556wrw.2
 for <qemu-trivial@nongnu.org>; Mon, 07 Oct 2019 03:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vn3Z8/PHN+wHRrA5EwDE1JrUgVbGfslZkn0GNYob4BU=;
 b=XvpBP8edmw7Tu8DFpcX/LS51z6Px+OS1jv5sYv1miEpDECxBhiLl4LcGkQz2UOfRKr
 mM5bKG8/rvLzthR4F5U0V3jh2FgYUL22hqt/OUNtjeKKy77QkLK45PIvoRtjdtIIggIn
 m/3/wcgUDSYF7ydN4s2we7F8cUfo+i5/HpW8Xb/TgAH1qJQ8Cz1MVz5T5Szv315h+Xy/
 4KOUU4wGkDKhwLLC8bzdTU4RUtszytpG0cDBzg8q7EKYMTKYnmVnFEHNrDkF/g9GI0Zg
 SB1QReiwwx+VWBc6q92M2TCuZatcHdCYOmHSDDGC+5oqHgofbeCQgqCUL/WvbtCcAm7r
 ZHyQ==
X-Gm-Message-State: APjAAAVSf6XfMtHd4G5uBUFsfjJCYXsd1ivZK4seRD/h8PdgH6n6DEng
 gZBx5HTA1RcVVfnzI+Wbjz7P2f6QXHcVmxJXA9I53VBIM7we7/74g8LN3PwIhmbyp1rRHIZmKJ8
 pUQpvN8PmuVcJ6jJPqQ==
X-Received: by 2002:a1c:4886:: with SMTP id
 v128mr19888203wma.176.1570442517476; 
 Mon, 07 Oct 2019 03:01:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyvmMKsTfyRyGqTf7buoZ0JfHYf4CUSzym7F2Frn6hcMWbXZ9SBP4QnBLuNm3cPPbOIqym4bA==
X-Received: by 2002:a1c:4886:: with SMTP id
 v128mr19888181wma.176.1570442517239; 
 Mon, 07 Oct 2019 03:01:57 -0700 (PDT)
Received: from [192.168.1.115] (46.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.46])
 by smtp.gmail.com with ESMTPSA id c9sm14324577wrt.7.2019.10.07.03.01.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2019 03:01:56 -0700 (PDT)
Subject: Re: [PATCH 00/11] hw: Convert various reset() handler to DeviceReset
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20190926151733.25349-1-philmd@redhat.com>
 <20191005174531-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9a20b4a9-b255-95e9-1e27-94e294e21042@redhat.com>
Date: Mon, 7 Oct 2019 12:01:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191005174531-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Mon, 07 Oct 2019 10:02:13 -0000

Hi Michael,

On 10/5/19 11:46 PM, Michael S. Tsirkin wrote:
> On Thu, Sep 26, 2019 at 05:17:22PM +0200, Philippe Mathieu-Daud=C3=A9 w=
rote:
>> Hi.
>>
>> Following the thread discussion between Peter/Markus/Damien about
>> reset handlers:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg617103.html
>> I started to remove qemu_register_reset() calls from few qdevified
>> devices (the trivial ones).
>>
>> Regards,
>>
>> Phil.
>=20
> How do you want these patches merged? Trivial tree?

I was hoping Eduardo would take them but he is busy and I even forgot to=20
Cc him. They might go via Trivial or else via Paolo's Misc...

>> Philippe Mathieu-Daud=C3=A9 (11):
>>    hw/acpi/piix4: Convert reset handler to DeviceReset
>>    hw/ide/piix: Convert reset handler to DeviceReset
>>    hw/isa/piix4: Convert reset handler to DeviceReset
>>    hw/pci-host/piix: Convert reset handler to DeviceReset
>>    hw/ide/sii3112: Convert reset handler to DeviceReset
>>    hw/ide/via82c: Convert reset handler to DeviceReset
>>    hw/isa/vt82c686: Convert reset handler to DeviceReset
>>    hw/input/lm832x: Convert reset handler to DeviceReset
>>    hw/pci-host/bonito: Convert reset handler to DeviceReset
>>    hw/timer/etraxfs: Convert reset handler to DeviceReset
>>    hw/misc/vmcoreinfo: Convert reset handler to DeviceReset


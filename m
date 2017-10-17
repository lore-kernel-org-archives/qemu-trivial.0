Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FgU-00076U-58
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:24:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FgR-00074n-Ad
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:24:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FgM-0002H4-CD
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:24:35 -0400
Received: from mail-qt0-x22b.google.com ([2607:f8b0:400d:c0d::22b]:53473)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FgM-0002Gm-5G; Mon, 16 Oct 2017 20:24:30 -0400
Received: by mail-qt0-x22b.google.com with SMTP id n61so80452qte.10;
	Mon, 16 Oct 2017 17:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:from:to:cc:references:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=uRcGpz2dVMKg82Bu+z/sdV0WGC6q2d5lc5kUqNXhOJU=;
	b=imGD6rv8Gh323f+WNSt/y0ZOl0CHwLSVjmUtVDavntTh77cyvj/Bfm1L9IVc297Pw9
	BzzniCn/XbFGImVvir3qjvWf71pH9CJDPB9l37pfXj7YHoD2N5wHB/78tT5P5N0WISsT
	S+AAPN8kn//3ToRrzyivCVTDZ9C6TzF1G+3E2GuP678fQFqVaXyl67O862CU5Eu5egaH
	O+s+9bgKxZFagG917bNcnNzq+Y26gv76eleHAZH/SheINnEzcBuXfHpOGdvAspUuNrq+
	69G+X7EZJYKVzLxpAjpWhSAACP2gBMhY31c9Cqy2Z+O9Y+9TuHpwv0aTy+3nCuOpJOVU
	aStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:from:to:cc:references:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=uRcGpz2dVMKg82Bu+z/sdV0WGC6q2d5lc5kUqNXhOJU=;
	b=lDxTqtlcbX0UGcPtdrGL8++kDdUvkhMgDYVbecuGrWpxN0Ka5TXy5dURDldWzrx9jL
	A+wnJZkx5oRApNMMIe9TD0hiMX901LWT7pz08a/5WrPzEoINrQpcSUXOLiR4D9uU/mKA
	Ag79vPf6K69YXyAmzFUxabbCToPC5KtKaMFm6EWKxrUdRtp6Y9trTwZszusb/CxQt21K
	s7Hf9CBvCxr9qPbsfY3gkmie37tiEvCTqar1Q7sQDcrIxgtb7JXp90i8Go34FMmFVdUB
	qwdzSRrNWTe7kyIHCGKi++WkvhicbaAGJVX0s1LZQskW6Dp/L5txtDs+cCHct47qtgTE
	sSpA==
X-Gm-Message-State: AMCzsaWpkNzZktW+KmNye9U7WwRq2PRcGXCQthPBAmA51pbHlsYOiPmf
	kahOI2ddkdjvXUnbH641gp0moqzkvd0=
X-Google-Smtp-Source: AOwi7QDCHIYlWuySPoYlQaoHG9DZdEKU6G4xfvAh2fGM/FD0rf4ge+3ijFLtmKWIno5UxvGp6Ki/9w==
X-Received: by 10.200.12.69 with SMTP id l5mr17348155qti.268.1508199869439;
	Mon, 16 Oct 2017 17:24:29 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	u127sm498778qkf.79.2017.10.16.17.24.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:24:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Marcel Apfelbaum <marcel@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>, 
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-trivial@nongnu.org
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922160111.31885-5-f4bug@amsat.org>
	<8a52b6be-ce55-307f-2bba-85858f739210@redhat.com>
	<72e73fee-0e1e-6988-038d-a9823e7b6d19@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <222c1152-fecb-f8ca-2714-43bf3678a34c@amsat.org>
Date: Mon, 16 Oct 2017 21:24:23 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <72e73fee-0e1e-6988-038d-a9823e7b6d19@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22b
Subject: Re: [Qemu-trivial] [PATCH 27/34] hw/pci: declare
 pci_nic_init_nofail() in "hw/net/pci.h"
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
X-List-Received-Date: Tue, 17 Oct 2017 00:24:36 -0000

Hi Marcel,

>> It seems the patch is doing much more than
>> what is mentioned in the subject.
>>
[...]
>> Can you add a short explanation on how the split
>> helps removing i386/pc dependency from non-PC world?
>> - it is not straight forward, at least for me.
> 
> I thought there was an old dependency on "hw/pci/pci.h" to something
> from i386/pc, so every machine using a PCI NIC would have this
> dependency. Extracting the NIC part as "hw/net/pci.h" would solve this
> issue. I didn't check attentively but it seems I was wrong, so I'll
> either drop this patch or reword it.

I finally opted to drop it for this series and include it reworded in
part 2 which include more PCI-related patches.

Regards,

Phil.


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4R2W-0008Hi-8F
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 08:32:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4R2P-00088I-2S
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 08:32:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4R2F-00061y-RA
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 08:32:01 -0400
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233]:52766)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4R2F-00061i-MK; Tue, 17 Oct 2017 08:31:51 -0400
Received: by mail-qk0-x233.google.com with SMTP id b15so1729768qkg.9;
	Tue, 17 Oct 2017 05:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QDsAWCsuKf2j8avGV2BmqhW8RFJXWzOs54Hr37qiXkY=;
	b=jnXjkigCRGncW0kCTWUHP+6WPeWaf/brNlviE/sSd7ftBSVgJKjsTEJXpbjdFHNEbn
	5aRusMM6bY0E2sGKVUl5Jsn6Mm3PmWQ7fz+aJQKIJir97wvzesckJsg7fEvFAOPMe2K/
	3RXnUHL2Odl3WBjK0hy7Vg4fFHHZHRqtMt/zs9q5+glS8Wz5Pr1z9wPBqRv2Kh6PlVka
	gGsnZsCk53MeaaDsIxtg1g5l4dvooYtlkKp/K+ji4MR041fRgu/xZF9VlIi2KHIRDb25
	lNT054UMj3zGJdDmjuAsZOcrNGt/sbrNV1vsSDqYXfoQnDds0K28pu+9n1BTC8E5utkv
	02iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=QDsAWCsuKf2j8avGV2BmqhW8RFJXWzOs54Hr37qiXkY=;
	b=KTkKQbY1ZC+Q6lGZ6g0l23109pMiUcbgjRAfV5KSDyh/UG4XYUhdS6ozdMStXsY/vL
	hzJEsc5pxd2ZyA+1jjbVJifNC4eDzRRGqioku4sPfMmAc2cwhQfO04gEcQpr/l32DJKY
	otTg1ZU/lqqtgj6oaTQAq7JpPjfMzN8bFvLDsfoa4m06sxO69ngB4U82j/BFI4iV1243
	j8fsN8o3Tsl3PFLcbFRk9YpgfUleyA+1zv7v0r2Pf+xAz1hfXT9Zn8Zb3Sat4f4n96he
	e9a96qbhttSv9Is+A4HfvAdNgGt50CSgmdC6U4AyYqLCV6kxjXF/piM/6RDBxxM4zdVx
	rmMQ==
X-Gm-Message-State: AMCzsaWL2BvC8+KCMxA1MzaUDRmKTb36A4mpyf05hPpbQM7uPVF8+jrr
	My6cKH7wqIpMy0K16ntZ1gYJViZU
X-Google-Smtp-Source: ABhQp+QicUiPFdo8icdtPgplWT5RoCVJw0YN3rB4kdNkaNmtAksUwckup7fIe5wb4dpT7ztB/CUADg==
X-Received: by 10.55.197.20 with SMTP id p20mr18446755qki.229.1508243510938;
	Tue, 17 Oct 2017 05:31:50 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	q49sm6347620qtq.80.2017.10.17.05.31.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 05:31:50 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20171017001209.32276-1-f4bug@amsat.org>
	<20171017001209.32276-37-f4bug@amsat.org>
	<0e1e9d13-9b7f-ef72-757b-7b4262986a48@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <7070309a-db76-b9ca-7f2c-0b0bbf5b509a@amsat.org>
Date: Tue, 17 Oct 2017 09:31:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <0e1e9d13-9b7f-ef72-757b-7b4262986a48@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::233
Subject: Re: [Qemu-trivial] [PATCH v2 36/39] i386/pc: move pvpanic.c from
 hw/misc/ to hw/i386/
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
X-List-Received-Date: Tue, 17 Oct 2017 12:32:06 -0000

On 10/17/2017 08:04 AM, Paolo Bonzini wrote:> pvpanic does not _have_ to
be i386-specific, and losing the
> configurability with default-configs/ is a bit of a pity (there are
> people who change the configurations), so I think it's better to leave
> out this change.

Good to know, OK! (patch dropped)


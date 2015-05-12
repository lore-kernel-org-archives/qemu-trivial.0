Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ys52y-0008GZ-Si
	for mharc-qemu-trivial@gnu.org; Tue, 12 May 2015 03:56:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Ys52u-0008DA-99
	for qemu-trivial@nongnu.org; Tue, 12 May 2015 03:56:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Ys52r-0002k4-K6
	for qemu-trivial@nongnu.org; Tue, 12 May 2015 03:56:08 -0400
Received: from mail-pa0-f49.google.com ([209.85.220.49]:33856)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Ys52r-0002jO-FH
	for qemu-trivial@nongnu.org; Tue, 12 May 2015 03:56:05 -0400
Received: by pacyx8 with SMTP id yx8so138063670pac.1
	for <qemu-trivial@nongnu.org>; Tue, 12 May 2015 00:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=RiWOtkX+APbFVxutShcrj37RD5DeWnnUMTpX/kBiByM=;
	b=Ju6putT2xG72HzWMNXdUdD4AHJ58vAvHxxXjTkbji3sernDZ96Tz6e+C765NNobWKR
	NjSicQ95uTcA/PtFtS3y2ak79lKHuECjhbUARnd2R47yDNmEM5MMhvfiaemY7I+npd6y
	grwYm4LFLOcXKcHYokpr5CMLyRBYq3qHuAsP4dUU/hkvcBBnfLmA/GygU/vMvSVIzVoj
	joGifs1lHb9PLvT5+iHW139M2Ex2n9qpuz4i52k7kMktwB1M81pu9sVh+cpaqTrxWM27
	a5Lbk0mLdrNDYf32pSeoohUIUPn4DZkIK7ip0ryxR1eXXgwmd6IEU4HgEd8fM86f6jfk
	imHA==
X-Gm-Message-State: ALoCoQmy/QgJxqaFBNz1s8QtogCJH7MLACYuHgoz5P0qhVqJFoBfSp2zJF0ksnEEsJynEaoJLeJg
X-Received: by 10.67.2.98 with SMTP id bn2mr26383818pad.83.1431417364509;
	Tue, 12 May 2015 00:56:04 -0700 (PDT)
Received: from [10.13.2.46] ([180.150.141.243])
	by mx.google.com with ESMTPSA id
	qs8sm11879539pbc.38.2015.05.12.00.56.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 May 2015 00:56:03 -0700 (PDT)
Message-ID: <5551B20C.2030402@linaro.org>
Date: Tue, 12 May 2015 15:55:56 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
	<1431397521-2316-2-git-send-email-shannon.zhao@linaro.org>
	<CAFEAcA99yzgDZHCcZyODHmn_q=Yo3PxsBMdiiSfMKS1WW5cRdg@mail.gmail.com>
In-Reply-To: <CAFEAcA99yzgDZHCcZyODHmn_q=Yo3PxsBMdiiSfMKS1WW5cRdg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.49
Cc: hangaohuai@huawei.com, QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH 1/6] hw/s390x/s390-virtio-bus: Remove
 meaningless blank Property
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 12 May 2015 07:56:12 -0000



On 2015/5/12 15:52, Peter Maydell wrote:
> On 12 May 2015 at 03:25,  <shannon.zhao@linaro.org> wrote:
>> > From: Shannon Zhao <shannon.zhao@linaro.org>
>> >
>> > Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> > ---
>> >  hw/s390x/s390-virtio-bus.c | 15 ---------------
>> >  1 file changed, 15 deletions(-)
>> >
>> > diff --git a/hw/s390x/s390-virtio-bus.c b/hw/s390x/s390-virtio-bus.c
>> > index 1a72b56..273bd9c 100644
>> > --- a/hw/s390x/s390-virtio-bus.c
>> > +++ b/hw/s390x/s390-virtio-bus.c
>> > @@ -536,17 +536,12 @@ static unsigned virtio_s390_get_features(DeviceState *d)
>> >
> Net and scsi are already fixed in master (I had to do that
> as part of the conflict resolution between your virtio
> patches and Cornelia's).

Ok, so need to respin?

-- 
Shannon


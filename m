Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z2gzY-0002oV-7w
	for mharc-qemu-trivial@gnu.org; Wed, 10 Jun 2015 10:28:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z2gzW-0002ni-Bb
	for qemu-trivial@nongnu.org; Wed, 10 Jun 2015 10:28:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z2gzR-0000jS-Cp
	for qemu-trivial@nongnu.org; Wed, 10 Jun 2015 10:28:30 -0400
Received: from mail-qk0-f174.google.com ([209.85.220.174]:35391)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z2gzR-0000jE-99
	for qemu-trivial@nongnu.org; Wed, 10 Jun 2015 10:28:25 -0400
Received: by qkhq76 with SMTP id q76so25851355qkh.2
	for <qemu-trivial@nongnu.org>; Wed, 10 Jun 2015 07:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=sj5ptDSxZ+sdpiV97I0HcuYjBOCZuRBn4CTK6+fP7uE=;
	b=QLPNtVrjesK/vq9QSJ42sFHWVRrLf1inoWZ+da9Ot2ou4+++l3vcSRSyzJ6ZIq9y0O
	uy1H6YS5GhNHv0tp8xqLUT6YUD7q25LjTXiKxq5NOqNUZnMIA7Y4mbBjdFRud9soz22+
	u6DScGxd/8bvQNFZ3th6+4/qqu9+64CyJjYgQIjaB8mIM3G4Q/SjqTAcAKzJDzXMnoEh
	JAGAOK9zGYnsvgeTK8j3z+tak6HTjoUjsTOPXYdzdUlaHaXtk8gUnXUxhXBikYP9Wc4Z
	nf79en65CTbVYLn0MgdXWtweV4xlHoFDlfoKLjL8UvgOHzetP26e3FsZX/dXXR0VL0C4
	105w==
X-Gm-Message-State: ALoCoQkv3Jdy52e9kZgSv/rI+6k41YmMQRLP6ywpXS52j4IjZCkSZdemz2PckzcdqmQzMd2gmGWW
X-Received: by 10.140.22.147 with SMTP id 19mr4195182qgn.52.1433946504942;
	Wed, 10 Jun 2015 07:28:24 -0700 (PDT)
Received: from [10.205.28.38] ([167.160.116.2])
	by mx.google.com with ESMTPSA id n64sm4190936qkh.31.2015.06.10.07.28.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Jun 2015 07:28:23 -0700 (PDT)
Message-ID: <55784985.6000608@linaro.org>
Date: Wed, 10 Jun 2015 22:28:21 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1430321049-11859-1-git-send-email-shannon.zhao@linaro.org>
	<55783923.2000203@linaro.org>
	<20150610152104-mutt-send-email-mst@redhat.com>
	<55783DD0.7080307@linaro.org>
	<20150610160042-mutt-send-email-mst@redhat.com>
In-Reply-To: <20150610160042-mutt-send-email-mst@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.174
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, zhaoshenglong@huawei.com,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 0/7] virtio: inline private qdev
 properties into virtio devices
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
X-List-Received-Date: Wed, 10 Jun 2015 14:28:31 -0000



On 2015/6/10 22:01, Michael S. Tsirkin wrote:
> On Wed, Jun 10, 2015 at 09:38:24PM +0800, Shannon Zhao wrote:
>>
>>
>> On 2015/6/10 21:21, Michael S. Tsirkin wrote:
>>> On Wed, Jun 10, 2015 at 09:18:27PM +0800, Shannon Zhao wrote:
>>>> Ping?
>>>> Have these patches been missed?
>>>
>>> I see them upstream. See e.g. da3e8a23492dbc13c4b70d90b6ae42970624e63a.
>>> What's missing?
>>>
>>
>> da3e8a23492dbc13c4b70d90b6ae42970624e63a is "virtio-net: Move
>> DEFINE_VIRTIO_NET_FEATURES to virtio-net", not this patchset.
>
> Oh right, I just saw Cornelia sent a minor comment which wasn't
> addressed.
>
Yeah, and I ask whether it needs to repin. Could you help deal the 
indentations?

> Also, I'd rather this is rebased on top of Gerd's virtio 1 tree -
> I plan to merge them today.
>

I pull master, apply Gerd's virtio-1 patchset "[PATCH 00/33] virtio 1.0 
patch series rebased", then apply these patches. No conflicts and 
compile pass. I guess you could apply these directly.

PS: The [PATCH 01/33] of Gerd's virtio-1 patchset is already in master.

Thanks,

-- 
Shannon


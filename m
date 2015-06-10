Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z2h94-0007TE-8F
	for mharc-qemu-trivial@gnu.org; Wed, 10 Jun 2015 10:38:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z2h8v-0007KX-Om
	for qemu-trivial@nongnu.org; Wed, 10 Jun 2015 10:38:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z2h8r-0006Kz-M7
	for qemu-trivial@nongnu.org; Wed, 10 Jun 2015 10:38:13 -0400
Received: from mail-qk0-f179.google.com ([209.85.220.179]:32878)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z2h8r-0006Ko-Ic
	for qemu-trivial@nongnu.org; Wed, 10 Jun 2015 10:38:09 -0400
Received: by qkhg32 with SMTP id g32so26118296qkh.0
	for <qemu-trivial@nongnu.org>; Wed, 10 Jun 2015 07:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=4ntwU6Kg+w7ZOTKOxupgzFO6XgMv2YCC7CAw8sSkoB8=;
	b=B59Us+QdPQtlHmITTZMgwCp8WDWjCla8ZPwAGzxdXWYwwLaFbTMb6g8oyAeCFHW0wP
	edcyH6etOeR2w/yys3Ws2Oizoa6XDO80UYJtbsqcauefLprLxj5CW6mX5BzM0a9NCfC8
	SbHVUPIrGuHXB3KexXafCqwg9JWfXqRyUiF6XIR8gODZwwvaYFwML2sNzh1FSkPOCl1y
	Eby8w5bBkS/kR96R8DzaI8bd/2kfrxEhfEKO7SGuYeFkhuz9AuYnOD3GgtsQdK1ePGdL
	P9qWCGqf3m2SSUR7TEv1e9i0uKG81I+ZvAAxQIpGzsG8HO6m4BmfwafKdIoWqAOug1b6
	2wGw==
X-Gm-Message-State: ALoCoQliQtIAMODFCyTo7SHL7TWIHk1oZdMQZAxsW1Cp73TwlGNloteLOGgpQaxcEVFr7rgQMhnI
X-Received: by 10.140.90.99 with SMTP id w90mr4149958qgd.57.1433947089103;
	Wed, 10 Jun 2015 07:38:09 -0700 (PDT)
Received: from [10.205.28.38] ([167.160.116.2])
	by mx.google.com with ESMTPSA id o19sm4202255qkh.25.2015.06.10.07.38.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Jun 2015 07:38:08 -0700 (PDT)
Message-ID: <55784BCB.7040002@linaro.org>
Date: Wed, 10 Jun 2015 22:38:03 +0800
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
	<55784985.6000608@linaro.org>
	<20150610163441-mutt-send-email-mst@redhat.com>
In-Reply-To: <20150610163441-mutt-send-email-mst@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.179
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
X-List-Received-Date: Wed, 10 Jun 2015 14:38:20 -0000



On 2015/6/10 22:36, Michael S. Tsirkin wrote:
> On Wed, Jun 10, 2015 at 10:28:21PM +0800, Shannon Zhao wrote:
>>
>>
>> On 2015/6/10 22:01, Michael S. Tsirkin wrote:
>>> On Wed, Jun 10, 2015 at 09:38:24PM +0800, Shannon Zhao wrote:
>>>>
>>>>
>>>> On 2015/6/10 21:21, Michael S. Tsirkin wrote:
>>>>> On Wed, Jun 10, 2015 at 09:18:27PM +0800, Shannon Zhao wrote:
>>>>>> Ping?
>>>>>> Have these patches been missed?
>>>>>
>>>>> I see them upstream. See e.g. da3e8a23492dbc13c4b70d90b6ae42970624e63a.
>>>>> What's missing?
>>>>>
>>>>
>>>> da3e8a23492dbc13c4b70d90b6ae42970624e63a is "virtio-net: Move
>>>> DEFINE_VIRTIO_NET_FEATURES to virtio-net", not this patchset.
>>>
>>> Oh right, I just saw Cornelia sent a minor comment which wasn't
>>> addressed.
>>>
>> Yeah, and I ask whether it needs to repin. Could you help deal the
>> indentations?
>
> Sorry I can't. Too many patches flying around, trying to make 2.4.
>

Ok, will send out v2 later. Thanks.

>>> Also, I'd rather this is rebased on top of Gerd's virtio 1 tree -
>>> I plan to merge them today.
>>>
>>
>> I pull master, apply Gerd's virtio-1 patchset "[PATCH 00/33] virtio 1.0
>> patch series rebased", then apply these patches. No conflicts and compile
>> pass. I guess you could apply these directly.
>>
>> PS: The [PATCH 01/33] of Gerd's virtio-1 patchset is already in master.
>
> Thanks.
>
>> Thanks,
>>
>> --
>> Shannon

-- 
Shannon


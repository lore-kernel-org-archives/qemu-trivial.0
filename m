Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hVyOD-0005Dn-US
	for mharc-qemu-trivial@gnu.org; Wed, 29 May 2019 09:13:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hVyOB-0005CS-IJ
	for qemu-trivial@nongnu.org; Wed, 29 May 2019 09:13:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hVyOA-0001Hd-L3
	for qemu-trivial@nongnu.org; Wed, 29 May 2019 09:13:07 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43587)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hVyOA-0001H1-FO
	for qemu-trivial@nongnu.org; Wed, 29 May 2019 09:13:06 -0400
Received: by mail-wr1-f68.google.com with SMTP id l17so1736660wrm.10
	for <qemu-trivial@nongnu.org>; Wed, 29 May 2019 06:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=bLBhYxmyCOK950suWj6xfv2aF2fm0wHyVz3jTsE1p1Q=;
	b=hkd1xFVWhnXbnLMVHCPKtDgkICL6e8WEWHSwXmIZ0GPe1P/iOPF2CyRtLFNsfSpDsP
	YkGR1z2u4ryAjShP+v2SpUJo9eD5afh9Ynh+/7u6gUBU/CeILZsCsskm1ZlcYxu0cX9W
	A7AbgQbE75SlsZnm7B7OafSPVbCO+COXwnfF1Wtz+TyahTYzDqTcGSjKa0y+9a9Wiue7
	1C7ZqM8DqnfaLzlHmu8BTs0nVSt4veBBbKHtA1hhimOA3tZkDYhZsjlgyYZRt0+eS6TT
	s/9ciSWWee60KC6/oxv9R122ukys1WzORvVVWDSTUvSHs4bPTdrAFj9KfjCUEgYjxOke
	p+TQ==
X-Gm-Message-State: APjAAAW8JxL3LexglH8z5YNYXB8aebIirC3Wqw+A6fGYBuHme9AU/GuN
	URVXosJu4AwVnV8HClo4pSM98dsNrA0=
X-Google-Smtp-Source: APXvYqyPtXSvUmleH1XId5ibwbmRY1+1pYAMBKCRpo7/mYd4JT0LGGvebL2Fp13qKPpVuOhxBmF/WQ==
X-Received: by 2002:a5d:6807:: with SMTP id w7mr15826749wru.336.1559135585215; 
	Wed, 29 May 2019 06:13:05 -0700 (PDT)
Received: from [10.32.224.40] (red-hat-inc.vlan560.asr1.mad1.gblx.net.
	[159.63.51.90]) by smtp.gmail.com with ESMTPSA id
	r16sm4687534wmh.17.2019.05.29.06.13.03
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 06:13:04 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Jie Wang <wangjie88@huawei.com>, qemu-devel@nongnu.org
Cc: eric.fangyi@huawei.com, wu.wubin@huawei.com, mst@redhat.com,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <1556605773-42019-1-git-send-email-wangjie88@huawei.com>
	<9bacd55b-4333-28fd-18cb-c0dbd771062c@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <43413f68-ef2e-27c3-d6e3-62dc6c7930c3@redhat.com>
Date: Wed, 29 May 2019 15:13:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9bacd55b-4333-28fd-18cb-c0dbd771062c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vhost: fix incorrect print
 type
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
X-List-Received-Date: Wed, 29 May 2019 13:13:08 -0000

Cc'ing qemu-trivial

On 4/30/19 10:48 AM, Philippe Mathieu-Daudé wrote:
> On 4/30/19 8:29 AM, Jie Wang wrote:
>> fix incorrect print type in vhost_virtqueue_stop
>>
>> Signed-off-by: Jie Wang <wangjie88@huawei.com>
>> ---
>>  hw/virtio/vhost.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> index 7f61018f2a..286bb27c65 100644
>> --- a/hw/virtio/vhost.c
>> +++ b/hw/virtio/vhost.c
>> @@ -1081,7 +1081,7 @@ static void vhost_virtqueue_stop(struct vhost_dev *dev,
>>  
>>      r = dev->vhost_ops->vhost_get_vring_base(dev, &state);
>>      if (r < 0) {
>> -        VHOST_OPS_DEBUG("vhost VQ %d ring restore failed: %d", idx, r);
>> +        VHOST_OPS_DEBUG("vhost VQ %u ring restore failed: %d", idx, r);
> 
> 'idx' is indeed unsigned.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
>>          /* Connection to the backend is broken, so let's sync internal
>>           * last avail idx to the device used idx.
>>           */
>>


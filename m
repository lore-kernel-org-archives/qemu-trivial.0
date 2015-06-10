Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z2gDD-0007sO-3k
	for mharc-qemu-trivial@gnu.org; Wed, 10 Jun 2015 09:38:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z2gDA-0007sH-TI
	for qemu-trivial@nongnu.org; Wed, 10 Jun 2015 09:38:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z2gD6-0001HL-TG
	for qemu-trivial@nongnu.org; Wed, 10 Jun 2015 09:38:32 -0400
Received: from mail-qg0-f50.google.com ([209.85.192.50]:33669)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z2gD6-0001HC-PZ
	for qemu-trivial@nongnu.org; Wed, 10 Jun 2015 09:38:28 -0400
Received: by qgfa66 with SMTP id a66so16137660qgf.0
	for <qemu-trivial@nongnu.org>; Wed, 10 Jun 2015 06:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=JQdub6sboNvfkGdpkdZ+N8fpy+D2tzpbQq+uTP5ZJLs=;
	b=RwlgE36RymV/NvhTG7TxtHiwWW7KSt+Aernu+T9Paq/ltpiuRmxOiX61hc2n/Fm5m+
	jBf3wwr7DcMv9ZBF1JOVx3hbolwMgXgvAdvO8eQXZmoydjY0XbDp0uQLQ0z45Uy/gYFo
	WpGZK6Ild9kLZk7z1/U0jIFWQmzh/l9SajLxPf/R/qawX16IQsoJIEUvnjFulcOLSm5P
	HSMs+TSelfR6jMP11c2si9S26D8/1f2W97+b68lIHjkfBjjLns+fluevI9Di1eP5HL0k
	+PS1RrtPs5fSrKYQSL/SFJsyQoXv+WmgsNGIA6FzNrUoOdzREC9H5QcfIQ5iH4pbQN9u
	Hqxg==
X-Gm-Message-State: ALoCoQnOmUH1xQma64+M/rBuRiyjul+eEaDkkZpoAMFo5qSu/neElqvDbectxLbcQvWGCn0Z/0Yl
X-Received: by 10.140.236.77 with SMTP id h74mr4069890qhc.21.1433943508412;
	Wed, 10 Jun 2015 06:38:28 -0700 (PDT)
Received: from [10.205.28.38] ([167.160.116.2])
	by mx.google.com with ESMTPSA id k71sm4110657qhc.42.2015.06.10.06.38.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Jun 2015 06:38:27 -0700 (PDT)
Message-ID: <55783DD0.7080307@linaro.org>
Date: Wed, 10 Jun 2015 21:38:24 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1430321049-11859-1-git-send-email-shannon.zhao@linaro.org>
	<55783923.2000203@linaro.org>
	<20150610152104-mutt-send-email-mst@redhat.com>
In-Reply-To: <20150610152104-mutt-send-email-mst@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.50
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
X-List-Received-Date: Wed, 10 Jun 2015 13:38:34 -0000



On 2015/6/10 21:21, Michael S. Tsirkin wrote:
> On Wed, Jun 10, 2015 at 09:18:27PM +0800, Shannon Zhao wrote:
>> Ping?
>> Have these patches been missed?
>
> I see them upstream. See e.g. da3e8a23492dbc13c4b70d90b6ae42970624e63a.
> What's missing?
>

da3e8a23492dbc13c4b70d90b6ae42970624e63a is "virtio-net: Move 
DEFINE_VIRTIO_NET_FEATURES to virtio-net", not this patchset.

-- 
Shannon


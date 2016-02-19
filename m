Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aWucs-0002Yc-DM
	for mharc-qemu-trivial@gnu.org; Fri, 19 Feb 2016 18:38:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aWucp-0002YB-Tg
	for qemu-trivial@nongnu.org; Fri, 19 Feb 2016 18:38:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aWucm-0007Ua-Je
	for qemu-trivial@nongnu.org; Fri, 19 Feb 2016 18:38:15 -0500
Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242]:34513)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>)
	id 1aWucm-0007U2-Bn; Fri, 19 Feb 2016 18:38:12 -0500
Received: by mail-pa0-x242.google.com with SMTP id yy13so4009590pab.1;
	Fri, 19 Feb 2016 15:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oN7w6modYRGxX4ve9zeFiCV3bsfzDfknbpA9NDWU+1A=;
	b=yflXeRTPKX92UJ5Po7ngzNxMZlCYUOOZ8qeL5W+hYzOEbXDBkQXbzvUhg/cID8QOUc
	hpQQc+ZJMpSV84mUdpJ7M5M5F70uHXjgRTOcDqp4FaYNnaVrUVAKsiWIJbumPVA0iTWO
	EicipoPymvBR76n/JwgcRl46gxvrIv2b3a+6q3E2njp8HlhfO9Bp6DVC1S7xoVzK27hx
	bSbZEeli0eewSQYycgAi/k821gKUZjbwANwcIxFjC5enK6uDy4C+oVNVqWvMuWkqTT9x
	SQVwkfw+i08LRHQ+lVWL+vVJ8VbFk0WcnKYr2ZER73kaNBYmDjBYFGBPdhu3UJSYDno9
	FISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=oN7w6modYRGxX4ve9zeFiCV3bsfzDfknbpA9NDWU+1A=;
	b=fAeAXd8wu8ztW9TRdgsobgLQwOuwVN6MhwI2HgnDI9y8P9QipL2TqaBBqEcwTbKdC6
	RFyJ87M4f0ojTphCN+iasPYymvixdoCOwXTRCHNZh7FDlLd26KxEEVcG4Ems3khRtWzL
	krvo355+gT4h5+7VlqVUkYUFrBRdKK+5EaztYHnOvsea/PucDUxicfpWotL+geiNgCEr
	ikPo7A9/tRIhkzcizOJxMrHTCsH2LVoQgF1MIPKDAtmTCV5d3v9c4V7Vk9W1fL1aB6NX
	Y2TYN/LY4+hxdoxKfxkz3bL1Y2Fjl2/XIBrmjqix1jugLEIyjxWS9GWyFWmXfSRsEn9U
	wzkA==
X-Gm-Message-State: AG10YORz9elkuQmPVjx1pqaeNWmI9pqWrfgG6SJG019J5DncmzaF65elzumUZFc6MbX7UQ==
X-Received: by 10.66.118.7 with SMTP id ki7mr21898547pab.153.1455925091496;
	Fri, 19 Feb 2016 15:38:11 -0800 (PST)
Received: from localhost ([45.32.44.20]) by smtp.gmail.com with ESMTPSA id
	i23sm20101035pfj.68.2016.02.19.15.38.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Feb 2016 15:38:10 -0800 (PST)
Date: Fri, 19 Feb 2016 23:38:08 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Alex Williamson <alex.williamson@redhat.com>
Message-ID: <20160219233808.GA8336@vultr.guest>
References: <1455895091-7589-1-git-send-email-richard.weiyang@gmail.com>
	<1455895091-7589-2-git-send-email-richard.weiyang@gmail.com>
	<20160219094532.47e2f131@t450s.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160219094532.47e2f131@t450s.home>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::242
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] vfio/pci: use
 PCI_MSIX_FLAGS on retrieving the MSIX entries
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: Wei Yang <richard.weiyang@gmail.com>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Feb 2016 23:38:16 -0000

On Fri, Feb 19, 2016 at 09:45:32AM -0700, Alex Williamson wrote:
>On Fri, 19 Feb 2016 15:18:10 +0000
>Wei Yang <richard.weiyang@gmail.com> wrote:
>
>> Even PCI_CAP_FLAGS has the same value as PCI_MSIX_FLAGS, the later one is
>> the more proper on retrieving MSIX entries.
>> 
>> This patch uses PCI_MSIX_FLAGS to retrieve the MSIX entries.
>> 
>> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>> ---
>>  hw/vfio/pci.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index e66c47f..321423b 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -1210,7 +1210,7 @@ static int vfio_msix_early_setup(VFIOPCIDevice *vdev)
>>      }
>>  
>>      if (pread(fd, &ctrl, sizeof(ctrl),
>> -              vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
>> +              vdev->config_offset + pos + PCI_MSIX_FLAGS) != sizeof(ctrl)) {
>>          return -errno;
>>      }
>>  
>
>This is certainly trivial, I'll grab it for the respin of yesterday's
>pull request.  Thanks,

Thanks Alex, have a nice weekend :-)

>
>Alex

-- 
Wei Yang
Help you, Help me


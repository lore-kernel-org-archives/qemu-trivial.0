Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gj57U-0006aY-BX
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jan 2019 11:29:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gj57P-0006XE-P5
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 11:29:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gj57P-00076x-2A
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 11:29:43 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42868)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gj57O-00070J-R7
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 11:29:42 -0500
Received: by mail-wr1-f68.google.com with SMTP id q18so23584265wrx.9
	for <qemu-trivial@nongnu.org>; Mon, 14 Jan 2019 08:29:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8EKzLKp/bqiU+k3mIp95UO4bCmvzskL51CxjfezPo2M=;
	b=Ov+vIW/4YSZvb6EZakqA9PVWzC+GJM2YJI9uyLhprsCpJOir3bRQWX9nh+z/0QuCZ+
	ls/DhMx59qKIetICAuLirdYbUQ5x/knvsPtLolg5CfKGFh1EejaJckW2MpbJ+ukiitSu
	8PaBc8wIxTbKcQJCNKG6tvdbvBhWDVqTblwCQWyUuGu6GbRm6z1ClPtHcl8ORUb9gkn6
	Q6AoSgTRGWMJRSCrUqWsTzIxSoLFlIK40kw0RRfk8XQNUhw92j/kmOJSPSHOOhAUbN9O
	NXJPwgNwS7acUGRRDjE/bw9gdGlSPbc2kVbS8ff8hcMOUA2/H9fJTiewIwa+aRiZUq35
	odeQ==
X-Gm-Message-State: AJcUukfZa8cF+CkkNIps2pIzeRL7u1vIEZvjDirDYeXhB/1jKOG7ptUh
	vxgnFcj4iUv74uI1s1V4gJoQ8w==
X-Google-Smtp-Source: ALg8bN6t+GwizO16+Bh7u2m+IYYd42WM/3INIpD2G70bxDdaq3Qf7G+H9Ep4VLiwYoAKu6VrwU6LMw==
X-Received: by 2002:adf:8c09:: with SMTP id z9mr25169326wra.301.1547483367555; 
	Mon, 14 Jan 2019 08:29:27 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	a132sm34989906wmh.5.2019.01.14.08.29.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 08:29:26 -0800 (PST)
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Fei Li <lifei1214@126.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Jiri Slaby <jslaby@suse.cz>, qemu-devel@nongnu.org, shirley17fei@gmail.com
References: <20190114131015.52967-1-lifei1214@126.com>
	<ac0015a7-5fcf-f5f6-a1a5-6c3846459b8c@redhat.com>
	<20190114105015-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d104b828-c514-7dc8-6d78-edd9e89733b5@redhat.com>
Date: Mon, 14 Jan 2019 17:29:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190114105015-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-trivial] [PATCH v2] hw/misc/edu: add msi_uninit() for
 pci_edu_uninit()
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
X-List-Received-Date: Mon, 14 Jan 2019 16:29:46 -0000

On 1/14/19 4:51 PM, Michael S. Tsirkin wrote:
> On Mon, Jan 14, 2019 at 02:28:39PM +0100, Philippe Mathieu-Daudé wrote:
>> Cc'ing qemu-trivial
>>
>> On 1/14/19 2:10 PM, Fei Li wrote:
>>> From: Fei Li <shirley17fei@gmail.com>
>>>
>>> Let's supplement the msi_uninit() when failing to realize
>>> the pci edu device.
>>>
>>> Reported-by: Markus Armbruster <armbru@redhat.com>
>>> Signed-off-by: Fei Li <shirley17fei@gmail.com>
>>> Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Reviewed-by: Peter Xu <peterx@redhat.com>
>>> ---
>>>  hw/misc/edu.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/misc/edu.c b/hw/misc/edu.c
>>> index cdcf550dd7..ceaf688bfb 100644
>>> --- a/hw/misc/edu.c
>>> +++ b/hw/misc/edu.c
>>> @@ -377,6 +377,7 @@ static void pci_edu_uninit(PCIDevice *pdev)
>>>      qemu_mutex_destroy(&edu->thr_mutex);
>>>  
>>>      timer_del(&edu->dma_timer);
>>> +    msi_uninit(pdev);
>>>  }
>>>  
>>>  static void edu_obj_uint64(Object *obj, Visitor *v, const char *name,
>>>
> 
> That's not trivial material IMHO. I put it in my tree for now.

Hmm it is releasing ressources on deinit... Anyway it is better placed
in your tree, no doubt. Thanks!

Phil.


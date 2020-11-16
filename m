Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kefX5-0003Op-PR
	for mharc-qemu-trivial@gnu.org; Mon, 16 Nov 2020 09:31:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kefX4-0003N4-9h
 for qemu-trivial@nongnu.org; Mon, 16 Nov 2020 09:31:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kefX1-0006iG-Tb
 for qemu-trivial@nongnu.org; Mon, 16 Nov 2020 09:31:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605537057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PGNHSg4Sp9CoHAy4ZaQhDb+hO4Vt/JXwwawKzFkEsjY=;
 b=hCpfcxHnJQ3Mvyzrk8LKFWemJnSFr5lCmY/qsP8I7uiebpvmAZBSkGivcof+i9IlO595xN
 1LC4isevH19uzWwpqzyGgHhktxnik+Q/quC8kC6s7Tkw1twMpzsC1fB+qecyR5fwkz4FlM
 z/EeSZbUYvOJBlydiAT/IZ++zwplzdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-VtsuLlN-NGG2f08pBI8gFA-1; Mon, 16 Nov 2020 09:30:56 -0500
X-MC-Unique: VtsuLlN-NGG2f08pBI8gFA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C58A6104ECFF;
 Mon, 16 Nov 2020 14:30:34 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-126.ams2.redhat.com [10.36.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E21BC1A3D6;
 Mon, 16 Nov 2020 14:30:25 +0000 (UTC)
Subject: Re: [PATCH 13/13] bcm2835_cprman: put some peripherals of bcm2835
 cprman into the 'misc' category
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: kuhn.chenqun@huawei.com, zhang.zhanghailiang@huawei.com,
 Markus Armbruster <armbru@redhat.com>
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-14-ganqixin@huawei.com>
 <c2ca2185-4253-da71-eab4-f96b29067c96@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <882df4ee-948c-7e00-d951-9b14ea40b2df@redhat.com>
Date: Mon, 16 Nov 2020 15:30:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c2ca2185-4253-da71-eab4-f96b29067c96@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 16 Nov 2020 14:31:02 -0000

On 16/11/2020 14.25, Philippe Mathieu-Daudé wrote:
> Hi Gan,
> 
> On 11/15/20 7:49 PM, Gan Qixin wrote:
>> Some peripherals of bcm2835 cprman have no category, put them into the 'misc'
>> category.
>>
>> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
>> ---
>> Cc: Philippe Mathieu-DaudÃƒÂ© <f4bug@amsat.org>
>> ---
>>  hw/misc/bcm2835_cprman.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
>> index 7e415a017c..c62958a99e 100644
>> --- a/hw/misc/bcm2835_cprman.c
>> +++ b/hw/misc/bcm2835_cprman.c
>> @@ -136,6 +136,7 @@ static void pll_class_init(ObjectClass *klass, void *data)
>>  
>>      dc->reset = pll_reset;
>>      dc->vmsd = &pll_vmstate;
>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> 
> Well, this is not an usable device but a part of a bigger device,
> so here we want the opposite: not list this device in any category.
> 
> Maybe we could add a DEVICE_CATEGORY_COMPOSITE for all such QOM
> types so management apps can filter them out? (And so we are sure
> all QOM is classified).
> 
> Thomas, you already dealt with categorizing devices in the past,
> what do you think about this? Who else could help? Maybe add
> someone from libvirt in the thread?

My 0.02 € : Mark the device as user_creatable = false if it can not really
be used by the user with the -device CLI parameter. Then it also does not
need a category. I know Markus will likely have a different opinion, but in
my eyes it's just ugly if we present devices to the users that they can not use.
(By the way, this device here seems to be a decendant of TYPE_SYS_BUS_DEVICE
... shouldn't these show up as user_creatable = false automatically?)

 Thomas



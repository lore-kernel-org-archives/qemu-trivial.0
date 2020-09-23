Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kL69y-000171-En
	for mharc-qemu-trivial@gnu.org; Wed, 23 Sep 2020 10:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kL69v-00014j-IP
 for qemu-trivial@nongnu.org; Wed, 23 Sep 2020 10:54:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kL69q-00081V-Fy
 for qemu-trivial@nongnu.org; Wed, 23 Sep 2020 10:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600872847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ro5t1jCGdDB36UmHSm5D5f/N7RXFA4qSkHw3W7QM1Q4=;
 b=PRdI9U3/HFsiHKn+fQou4XLLMW1BHvL6eywCYYL9sI44AHjSD49IQnuR4hbcaReMxCLgi/
 yMjj/MOVGyFzUuLw8rTl25Ec1rr9nCNhIcynpjqxVuWP/z+7dEe/n4poCvUDGNrvth9BVS
 N6Igr8HppNkBAsdF6bdn1fDO89CuumM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-lZAW9pQDP8SmEuZO0Dlm8w-1; Wed, 23 Sep 2020 10:54:03 -0400
X-MC-Unique: lZAW9pQDP8SmEuZO0Dlm8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 610D510BBEC8;
 Wed, 23 Sep 2020 14:54:01 +0000 (UTC)
Received: from [10.10.119.140] (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20DE07368B;
 Wed, 23 Sep 2020 14:53:59 +0000 (UTC)
Subject: Re: [PATCH 3/7] hw/ide/core: Replace magic '512' value by
 BDRV_SECTOR_SIZE
To: Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Laurent Vivier <laurent@vivier.eu>, qemu-block@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20200814082841.27000-1-f4bug@amsat.org>
 <20200814082841.27000-4-f4bug@amsat.org>
 <20200817111745.GG11402@linux.fritz.box>
From: John Snow <jsnow@redhat.com>
Message-ID: <2347d8f7-5632-f7a4-6b81-bee179241da4@redhat.com>
Date: Wed, 23 Sep 2020 10:53:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200817111745.GG11402@linux.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
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
X-List-Received-Date: Wed, 23 Sep 2020 14:54:15 -0000

On 8/17/20 7:17 AM, Kevin Wolf wrote:
> Am 14.08.2020 um 10:28 hat Philippe Mathieu-Daudé geschrieben:
>> Use self-explicit definitions instead of magic '512' value.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> BDRV_SECTOR_SIZE is the arbitrary unit in which some block layer
> functions and variables work (such as bs->total_sectors). It happens to
> be 512.
> 
> IDE disks have a sector size, too. Actually, two of them, a physical and
> a logical one. The more important one is the logical one. We happen to
> emulate only IDE devices for which the logical block size is 512 bytes
> (ide_dev_initfn() errors out otherwise).
> 
> But just because two constants both happen to be 512 in practice, they
> are not the same thing.
> 
> So if we want to replace all magic 512 values, we should probably
> introduce a new IDE_SECTOR_SIZE and then decide case by case whether
> IDE_SECTOR_SIZE or BDRV_SECTOR_SIZE is meant. I think most (if not all)
> of the places you converted in this patch need to be IDE_SECTOR_SIZE.
> 
> Kevin
> 

I didn't audit the other patches, but be mindful of the distinction that 
Kevin is pointing out.

Luckily, I think we're low risk for deciding to change the 
BDRV_SECTOR_SIZE default any time soon, so it probably won't matter in 
the near future ...

--js



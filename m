Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgB16-0007Vk-05
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2020 13:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jgB13-0007S3-St
 for qemu-trivial@nongnu.org; Tue, 02 Jun 2020 13:47:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55547
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jgB12-0007wA-DT
 for qemu-trivial@nongnu.org; Tue, 02 Jun 2020 13:47:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591120075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lcqRSlfpGDzdPYN9CPBQPIGREYWSJrW0y6VlPUX4QII=;
 b=Q3I9Iml0amd9nT9QK7dU25kB3DAH/Uuaq52WWg1i4S8xdfatD9xmbDMv9MLyjwh/71SGCH
 AI6aQzd1Vx7y2+EV1F9TrU6g8zXpTrXJ/qAW2ce0GENkemxY1iwshFk0HjxnsFpYC9GAK6
 U7ui53KtaUQRUJ3wf+61k9EquCWiuJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-Rsg_7ECJPf2SLYOChAxEuA-1; Tue, 02 Jun 2020 13:47:53 -0400
X-MC-Unique: Rsg_7ECJPf2SLYOChAxEuA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E470E800053;
 Tue,  2 Jun 2020 17:47:51 +0000 (UTC)
Received: from [10.3.113.22] (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C90478EF6;
 Tue,  2 Jun 2020 17:47:51 +0000 (UTC)
Subject: Re: [PATCH 1/2] hax: Fix setting of FD_CLOEXEC
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, peter.maydell@linaro.org, 
 Wenchao Wang <wenchao.wang@intel.com>, Colin Xu <colin.xu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 "open list:X86 HAXM CPUs" <haxm-team@intel.com>
References: <20200420175309.75894-1-eblake@redhat.com>
 <20200420175309.75894-2-eblake@redhat.com>
 <20200420220733.GH4952@habkost.net>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <91447317-58f1-3022-6d9d-0cfbae887b6b@redhat.com>
Date: Tue, 2 Jun 2020 12:47:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200420220733.GH4952@habkost.net>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 23:49:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 02 Jun 2020 17:47:58 -0000

On 4/20/20 5:07 PM, Eduardo Habkost wrote:
> On Mon, Apr 20, 2020 at 12:53:07PM -0500, Eric Blake wrote:
>> Blindly setting FD_CLOEXEC without a read-modify-write will
>> inadvertently clear any other intentionally-set bits, such as a
>> proposed new bit for designating a fd that must behave in 32-bit mode.
>> Use our wrapper function instead of an incorrect hand-rolled version.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> Thanks, queued for 5.1.

Ping - I still don't see this upstream.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



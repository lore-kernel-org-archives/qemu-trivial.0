Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXmey-0004VE-Lj
	for mharc-qemu-trivial@gnu.org; Wed, 28 Oct 2020 10:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kXmex-0004UD-Gs
 for qemu-trivial@nongnu.org; Wed, 28 Oct 2020 10:42:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kXmev-0001dy-WF
 for qemu-trivial@nongnu.org; Wed, 28 Oct 2020 10:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603896160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aFCLjXrCbVDnSB06L+2FCYKJI5t/01be0QHHgg3oi1g=;
 b=OanMWsTPuA1FRCsGrN9EDJAd2v5w5H73BnoNZFPwr3J7VCWQ2ZmCJLyZyUKQjIu8tXUCir
 RJMbYHyKVMrwVsAl+R3PG9vwH505o9+mVGe8fWElr/IUiaagwJ5+ZSUTmav6ts0zC/6cDy
 UYPvfPuXXByR4atbqBu37mv7I8Trk14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-FlTAmPSBOkKEqrV-egdI9g-1; Wed, 28 Oct 2020 10:42:36 -0400
X-MC-Unique: FlTAmPSBOkKEqrV-egdI9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1615B1DDFB;
 Wed, 28 Oct 2020 14:42:35 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-124.ams2.redhat.com [10.36.112.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E840B1974D;
 Wed, 28 Oct 2020 14:42:32 +0000 (UTC)
Subject: Re: [PATCH 7/9] ppc: silence the compiler warnings
To: David Gibson <david@gibson.dropbear.id.au>,
 Chen Qun <kuhn.chenqun@huawei.com>
Cc: qemu-trivial@nongnu.org, Euler Robot <euler.robot@huawei.com>,
 qemu-devel@nongnu.org, ganqixin@huawei.com, zhang.zhanghailiang@huawei.com,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
References: <20201028041819.2169003-1-kuhn.chenqun@huawei.com>
 <20201028041819.2169003-8-kuhn.chenqun@huawei.com>
 <20201028042900.GC5604@yekko.fritz.box>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ddcb887d-42ec-2021-1785-a6fb0d13d6b9@redhat.com>
Date: Wed, 28 Oct 2020 15:42:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201028042900.GC5604@yekko.fritz.box>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:51:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.921, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Wed, 28 Oct 2020 14:42:43 -0000

On 28/10/2020 05.29, David Gibson wrote:
> On Wed, Oct 28, 2020 at 12:18:17PM +0800, Chen Qun wrote:
>> When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
>> hw/ppc/ppc.c: In function ‘ppc6xx_set_irq’:
>> hw/ppc/ppc.c:118:16: warning: this statement may fall through [-Wimplicit-fallthrough=]
>>   118 |             if (level) {
>>       |                ^
>> hw/ppc/ppc.c:123:9: note: here
>>   123 |         case PPC6xx_INPUT_INT:
>>       |         ^~~~
>>
>> Add the corresponding "fall through" comment to fix it.
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> 
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> 
>> ---
>> Cc: David Gibson <david@gibson.dropbear.id.au>
>> ---
>>  hw/ppc/ppc.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
>> index 4a11fb1640..f9eb8f21b4 100644
>> --- a/hw/ppc/ppc.c
>> +++ b/hw/ppc/ppc.c
>> @@ -120,6 +120,7 @@ static void ppc6xx_set_irq(void *opaque, int pin, int level)
>>              } else {
>>                  cpu_ppc_tb_stop(env);
>>              }
>> +            /* fall through */
>>          case PPC6xx_INPUT_INT:
>>              /* Level sensitive - active high */
>>              LOG_IRQ("%s: set the external IRQ state to %d\n",
> 

Is that fall through actually really the right thing to do here? I'd rather
expect to see a PPC_INTERRUPT_DECR instead of a PPC_INTERRUPT_EXT in case
someone messes with the TBEN pin? So I assume this is likely rather bug and
we should a "break" statement here instead?

 Thomas



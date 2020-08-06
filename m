Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3coc-0002c0-TU
	for mharc-qemu-trivial@gnu.org; Thu, 06 Aug 2020 06:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k3cob-0002aw-0L
 for qemu-trivial@nongnu.org; Thu, 06 Aug 2020 06:08:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k3coY-0002ht-Js
 for qemu-trivial@nongnu.org; Thu, 06 Aug 2020 06:08:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596708476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=COG95HzB6W4riqDfKaT8VHOJkxpvAVw5ExvX7uBMST0=;
 b=BSrD+9sbOJtBPRY35zlV2xKoM+PPFUOWrk80ehqlMZr7eoAlfhdv1E1wMdrSfgPqb9ld+f
 Q6vQE2Mze9Olqy+IeYiAtbVDV54h+cdRJjzKbpVCORsSqARTzSy7PcT5mb0zZ7FklX1O3h
 nWqsowbzJQzKkM9oIKfkCx2+QCZGRE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-hktdH_5tPpO_aUd_doo7tw-1; Thu, 06 Aug 2020 06:07:54 -0400
X-MC-Unique: hktdH_5tPpO_aUd_doo7tw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FA4918FF662;
 Thu,  6 Aug 2020 10:07:53 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-229.ams2.redhat.com [10.36.112.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68D2987A4D;
 Thu,  6 Aug 2020 10:07:50 +0000 (UTC)
Subject: Re: [PATCH 1/5] log: Add logs for vm start and destroy
To: Peng Liang <liangpeng10@huawei.com>, qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
References: <20200806093720.2355692-1-liangpeng10@huawei.com>
 <20200806093720.2355692-2-liangpeng10@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <4c171abd-1366-6ff9-f261-a450a3a1783d@redhat.com>
Date: Thu, 6 Aug 2020 12:07:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200806093720.2355692-2-liangpeng10@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 04:39:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 06 Aug 2020 10:08:01 -0000

On 06/08/2020 11.37, Peng Liang wrote:
> Add logs for vm start and destroy.
> 
> Signed-off-by: Peng Liang <liangpeng10@huawei.com>
> ---
>  hw/acpi/core.c  | 3 +++
>  hw/core/reset.c | 2 ++
>  softmmu/vl.c    | 8 ++++++++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index ac06db3450..0a24f018cf 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -560,13 +560,16 @@ static void acpi_pm1_cnt_write(ACPIREGS *ar, uint16_t val)
>          uint16_t sus_typ = (val >> 10) & 7;
>          switch(sus_typ) {
>          case 0: /* soft power off */
> +            info_report("VM will be soft power off");
>              qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>              break;
>          case 1:
> +            info_report("VM will be suspend state");
>              qemu_system_suspend_request();
>              break;
>          default:
>              if (sus_typ == ar->pm1.cnt.s4_val) { /* S4 request */
> +                info_report("VM will be S4 state");
>                  qapi_event_send_suspend_disk();
>                  qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>              }

There is already a trace point in qemu_system_shutdown_request(), so
this can already be used instead.

 Thomas



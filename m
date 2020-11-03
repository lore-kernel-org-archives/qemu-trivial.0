Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZvQY-0001u5-Qb
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2020 07:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kZvQW-0001pf-QT
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 07:28:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kZvQT-0002Xo-Po
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 07:28:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604406516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pi3DS4YXAkM2HLQXOIYhWQFsnnY4SqzTZGXfX9Fe/WM=;
 b=VSH+vMmPP5BFm1udirhxScNGdIb4wU6TdyQ5m/EbmArOtANAd7/gmHgWJ+9J06zQUO89aj
 F9O/Yjlc7BOaaDu33u1DRb+RAbFrPp8FiDUJs9pzZRpfqGlRNF8NfMBiVGt1liT+QlxUSr
 W2aDX1RtXYF8m+N/zPGwv8tXO4y1gEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-y_VDOTpbPuSFF8KnK-xELA-1; Tue, 03 Nov 2020 07:28:33 -0500
X-MC-Unique: y_VDOTpbPuSFF8KnK-xELA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0DE157086;
 Tue,  3 Nov 2020 12:28:31 +0000 (UTC)
Received: from localhost (unknown [10.40.208.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 781F560BF1;
 Tue,  3 Nov 2020 12:28:26 +0000 (UTC)
Date: Tue, 3 Nov 2020 13:28:25 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Xinhao Zhang <zhangxinhao1@huawei.com>
Cc: <qemu-devel@nongnu.org>, xiaoguangrong.eric@gmail.com, mst@redhat.com,
 qemu-trivial@nongnu.org, alex.chen@huawei.com, dengkai1@huawei.com
Subject: Re: [PATCH 2/3] hw/acpi : add space before the open parenthesis '('
Message-ID: <20201103132825.34c7f588@redhat.com>
In-Reply-To: <20201103102634.273021-2-zhangxinhao1@huawei.com>
References: <20201103102634.273021-1-zhangxinhao1@huawei.com>
 <20201103102634.273021-2-zhangxinhao1@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 01:02:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 03 Nov 2020 12:28:41 -0000

On Tue, 3 Nov 2020 18:26:33 +0800
Xinhao Zhang <zhangxinhao1@huawei.com> wrote:

> Fix code style. Space required before the open parenthesis '('.
> 
> Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
> Signed-off-by: Kai Deng <dengkai1@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index ade9158cbf..2c0c83221f 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -558,7 +558,7 @@ static void acpi_pm1_cnt_write(ACPIREGS *ar, uint16_t val)
>      if (val & ACPI_BITMASK_SLEEP_ENABLE) {
>          /* change suspend type */
>          uint16_t sus_typ = (val >> 10) & 7;
> -        switch(sus_typ) {
> +        switch (sus_typ) {
>          case 0: /* soft power off */
>              qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>              break;



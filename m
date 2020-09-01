Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kCwo3-0000kW-Mt
	for mharc-qemu-trivial@gnu.org; Mon, 31 Aug 2020 23:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kCwo1-0000k4-VD
 for qemu-trivial@nongnu.org; Mon, 31 Aug 2020 23:17:57 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48983
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kCwnz-0002Zs-7d
 for qemu-trivial@nongnu.org; Mon, 31 Aug 2020 23:17:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598930273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhWlYaTCpKFEvdVrcqy0M8TIDbH2UzIE8/0Zarc8u38=;
 b=Hc3nvnYBf1MsuHiyflNNeIFqNZOrVcGyohnr9mmh3Xhrs/t/l21yMFlXer5XDeKmOJtmZM
 JCQulghMc/GYm2bgkLpcisxaNSdkP6dkVqR8lGUJjv/IqTD7DdLSBC0Avv6sjjfv60CHP+
 Mz0eeh7PIWwPA+6tgUvceb4taQk9anw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-LeWAl1EFPsSm6aGVqOORdw-1; Mon, 31 Aug 2020 23:17:51 -0400
X-MC-Unique: LeWAl1EFPsSm6aGVqOORdw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8D328030A9;
 Tue,  1 Sep 2020 03:17:47 +0000 (UTC)
Received: from [10.72.13.164] (ovpn-13-164.pek2.redhat.com [10.72.13.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E049B5D9CD;
 Tue,  1 Sep 2020 03:17:35 +0000 (UTC)
Subject: Re: [PATCH v2 0/2] util/hexdump: Cleanup qemu_hexdump()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Zhang Chen
 <chen.zhang@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-trivial@nongnu.org,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org
References: <20200822180950.1343963-1-f4bug@amsat.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <17019b64-30b7-1cbb-701d-c3760a8e13d4@redhat.com>
Date: Tue, 1 Sep 2020 11:17:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200822180950.1343963-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 23:17:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.13, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 01 Sep 2020 03:17:58 -0000


On 2020/8/23 上午2:09, Philippe Mathieu-Daudé wrote:
> - Pass const void* buffer
> - Reorder arguments
>
> Supersedes: <20200822150457.1322519-1-f4bug@amsat.org>
>
> Philippe Mathieu-Daudé (2):
>    util/hexdump: Convert to take a void pointer argument
>    util/hexdump: Reorder qemu_hexdump() arguments
>
>   include/qemu-common.h    |  3 ++-
>   hw/dma/xlnx_dpdma.c      |  2 +-
>   hw/net/fsl_etsec/etsec.c |  2 +-
>   hw/net/fsl_etsec/rings.c |  2 +-
>   hw/sd/sd.c               |  2 +-
>   hw/usb/redirect.c        |  2 +-
>   net/colo-compare.c       | 24 ++++++++++++------------
>   net/net.c                |  2 +-
>   util/hexdump.c           |  4 +++-
>   util/iov.c               |  2 +-
>   10 files changed, 24 insertions(+), 21 deletions(-)
>

Applied.

Thanks



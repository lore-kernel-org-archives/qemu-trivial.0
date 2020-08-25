Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kAa7M-00019d-23
	for mharc-qemu-trivial@gnu.org; Tue, 25 Aug 2020 10:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kAa7K-00017J-N7
 for qemu-trivial@nongnu.org; Tue, 25 Aug 2020 10:40:06 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:37344
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kAa7I-0006dE-T8
 for qemu-trivial@nongnu.org; Tue, 25 Aug 2020 10:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598366403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DtZUDai+s7L6QNSMrmPh12MI6mIeUr/342AVDTJ+krw=;
 b=ZWv1KcSVtvnT2QTwCUmBE3FhLD5enCXt89gP5IvOjKFBnTtExZw6mF4WgvXEDkLsMsllm2
 G63uPhlV+URkN13GYjP5a0enzU+xORnByL23u9STGHzWG+GdmnxNzJNJOWoNvKA5vYxCjw
 S1Ny3S4NEloS1AegJAjMmqURfN+yF50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238--XibY0vnNqeGH-cAKH_TmA-1; Tue, 25 Aug 2020 10:39:58 -0400
X-MC-Unique: -XibY0vnNqeGH-cAKH_TmA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA36E2FD03;
 Tue, 25 Aug 2020 14:39:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-74.ams2.redhat.com
 [10.36.112.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D03595D9CA;
 Tue, 25 Aug 2020 14:39:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 64C5E112D737; Tue, 25 Aug 2020 16:39:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>,
 zhang.zhanghailiang@huawei.com, pannengyuan@huawei.com,
 Gerd Hoffmann <kraxel@redhat.com>, Euler Robot <euler.robot@huawei.com>
Subject: Re: [PATCH v2 08/10] usb/bus: Remove dead assignment in
 usb_get_fw_dev_path()
References: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
 <20200825112447.126308-9-kuhn.chenqun@huawei.com>
Date: Tue, 25 Aug 2020 16:39:53 +0200
In-Reply-To: <20200825112447.126308-9-kuhn.chenqun@huawei.com> (Chen Qun's
 message of "Tue, 25 Aug 2020 19:24:45 +0800")
Message-ID: <87r1rudc1y.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 01:35:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 25 Aug 2020 14:40:07 -0000

Chen Qun <kuhn.chenqun@huawei.com> writes:

> Clang static code analyzer show warning:
> qemu/hw/usb/bus.c:615:13: warning: Value stored to 'pos' is never read
>             pos += snprintf(fw_path + pos, fw_len - pos, "%s@%lx",
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/usb/bus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/usb/bus.c b/hw/usb/bus.c
> index b17bda3b29..7bab0499ad 100644
> --- a/hw/usb/bus.c
> +++ b/hw/usb/bus.c
> @@ -612,8 +612,8 @@ static char *usb_get_fw_dev_path(DeviceState *qdev)
           if (in[0] == '.') {
               /* some hub between root port and device */
               pos += snprintf(fw_path + pos, fw_len - pos, "hub@%lx/", nr);
>              in++;
>          } else {
>              /* the device itself */
> -            pos += snprintf(fw_path + pos, fw_len - pos, "%s@%lx",
> -                            qdev_fw_name(qdev), nr);
> +            snprintf(fw_path + pos, fw_len - pos, "%s@%lx", qdev_fw_name(qdev),
> +                     nr);
>              break;
>          }
>      }

I'd prefer to keep the line break where it is:

            snprintf(fw_path + pos, fw_len - pos, "%s@%lx",
                     qdev_fw_name(qdev), nr);

The patch is safe, so
Reviewed-by: Markus Armbruster <armbru@redhat.com>

The loss of symmetry betwen the two arms of the if is a bit sad.  Up to
Gerd.



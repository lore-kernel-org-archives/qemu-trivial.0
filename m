Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mM8vu-00075w-P5
	for mharc-qemu-trivial@gnu.org; Fri, 03 Sep 2021 09:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vr-00074U-M0
 for qemu-trivial@nongnu.org; Fri, 03 Sep 2021 09:08:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vo-0001Kk-No
 for qemu-trivial@nongnu.org; Fri, 03 Sep 2021 09:08:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630674511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aj5A8c+EWhE4Oxb00JW6s+eDdXBOGRUGlPPMDTt7L4w=;
 b=cqwwHpmnofY+SpgGYViquwlvGXai2fvJLdyP6YGy+f3pJAbYaqOGDjvuVnj8aclmy3MLlx
 rPO51mCJDVPRQO4THA0BTQAhcoT0ZEuwurP3UwUZvsM31VLPhAqDdcHT1czcypmj/OYaTe
 lX/xrD5wEyu3lLVYQuKWyzNf2vxLtRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-NlwgLQsAMv-imW4sTwpDRQ-1; Fri, 03 Sep 2021 09:08:28 -0400
X-MC-Unique: NlwgLQsAMv-imW4sTwpDRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2034107ACC7;
 Fri,  3 Sep 2021 13:08:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D89C19C79;
 Fri,  3 Sep 2021 13:08:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7A85B1138220; Wed,  1 Sep 2021 13:19:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org,  Eduardo Habkost <ehabkost@redhat.com>,  Daniel
 P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org
Subject: Re: [PATCH] qdev: Complete qdev_init_gpio_out() documentation
References: <20210819142731.2827912-1-philmd@redhat.com>
Date: Wed, 01 Sep 2021 13:19:29 +0200
In-Reply-To: <20210819142731.2827912-1-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 19 Aug 2021 16:27:31
 +0200")
Message-ID: <87k0k0bl1a.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 03 Sep 2021 13:08:36 -0000

Cc: qemu-trivial

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> qdev_init_gpio_out() states it "creates an array of anonymous
> output GPIO lines" but doesn't document how this array is
> released. Add a note that it is automatically free'd in qdev
> instance_finalize().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/hw/qdev-core.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index bafc311bfa1..555d4e444a5 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -597,6 +597,10 @@ void qdev_init_gpio_in(DeviceState *dev, qemu_irq_ha=
ndler handler, int n);
>   *
>   * See qdev_connect_gpio_out() for how code that uses such a device
>   * can connect to one of its output GPIO lines.
> + *
> + * There is no need to release the @pins allocated array because it
> + * will be automatically released when @dev calls its instance_finalize(=
)
> + * handler.
>   */
>  void qdev_init_gpio_out(DeviceState *dev, qemu_irq *pins, int n);
>  /**



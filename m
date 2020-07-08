Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtHmD-0007MU-7h
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jul 2020 17:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jtHmA-0007I4-Iv
 for qemu-trivial@nongnu.org; Wed, 08 Jul 2020 17:38:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21467
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jtHm8-0003S2-5m
 for qemu-trivial@nongnu.org; Wed, 08 Jul 2020 17:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594244323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0Ma7ijg3Nvpwxwl5uTE3a13so6FxTARUYgVyjWwO9k=;
 b=BnF8wetis5V+1zJK5wQ66Fz/r6okzMIImkk3ykyNEsRb2nvv+QnHbma0d5hnSBoZtyBiku
 /dCZRgEs9O/md1oZlRNDrib/VFbcBVBl1utgJwU0smSudH3NfZAx7ZOXl/eFz2LzChi5WC
 OdQ4Ek1mT6TxgWEMqm0sKRwNtSCAqV8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-c8RB8PIRPHWe7giavN5e4A-1; Wed, 08 Jul 2020 06:37:49 -0400
X-MC-Unique: c8RB8PIRPHWe7giavN5e4A-1
Received: by mail-wr1-f70.google.com with SMTP id o12so51387053wrj.23
 for <qemu-trivial@nongnu.org>; Wed, 08 Jul 2020 03:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=b0Ma7ijg3Nvpwxwl5uTE3a13so6FxTARUYgVyjWwO9k=;
 b=OFUJ72P6dPLOwmLj4zL1Mwuz79m5crPgV//uL31btCxh+V4kUbZqNgVs2VzK9emmCX
 bYo7XqH8Jdr5Xla0TOMPOP2xTeV2l3qIt6fQbOBXx4TPZSs590eEQSyOpT4ILaQ3lUM1
 9Uk7KOa48EfC3UeZkG2BDp+jgNOHdt6OjBCRhqmKlZoxVyleADdJgH+nYem2W9sF6eRi
 khfrypmC7ic+2XO3Rgu8tcXezV/b3nGyeVJnQeNh3pK7CtH1x66ISeLUXzfybZaQcLSN
 vCXZeDmZj+crKDgYQ0zgTkPvz8KOOE/TgIiRae8qljwlpteOwk6BwcPgCa7oxhGG/dty
 kWaw==
X-Gm-Message-State: AOAM532s8Y6QnvdzbLbSdDceViT0J6Eq6j35hRuhHSqXIbhRLgWgI38W
 Ek6Yy66Aa0tyIY1EOukxgWcRv5k29r9kKCQjDue10jX7jjTbnw+DVbVO0uQMR3ZKDYKec3099qr
 7zNK5a6HEeHZjnsO8rA==
X-Received: by 2002:a1c:7fd7:: with SMTP id a206mr8578684wmd.104.1594204668469; 
 Wed, 08 Jul 2020 03:37:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbpeZoGStBwww98/41W96R4yDpqf+YUwDklw7WGwqzqdlbIblYxjnu3Tise3Dv1+JK3pUKmw==
X-Received: by 2002:a1c:7fd7:: with SMTP id a206mr8578659wmd.104.1594204668216; 
 Wed, 08 Jul 2020 03:37:48 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 133sm5923591wme.5.2020.07.08.03.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 03:37:47 -0700 (PDT)
Date: Wed, 8 Jul 2020 06:37:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Laszlo Ersek <lersek@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Subject: Re: [PATCH v2] MAINTAINERS: Cover the firmware JSON schema
Message-ID: <20200708063659-mutt-send-email-mst@kernel.org>
References: <20200703183450.32398-1-philmd@redhat.com>
 <20200708024434-mutt-send-email-mst@kernel.org>
 <3dafd514-f66c-96c5-3217-86ef990dda1b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3dafd514-f66c-96c5-3217-86ef990dda1b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 08 Jul 2020 21:38:47 -0000

On Wed, Jul 08, 2020 at 10:57:31AM +0200, Philippe Mathieu-Daudé wrote:
> +qemu-trivial
> 
> On 7/8/20 8:45 AM, Michael S. Tsirkin wrote:
> > On Fri, Jul 03, 2020 at 08:34:50PM +0200, Philippe Mathieu-DaudÃƒÂ© wrote:
> >> Add an entry to cover firmware.json (see commit 3a0adfc9bf:
> >> schema that describes the different uses and properties of
> >> virtual machine firmware).
> >>
> >> Cc: Laszlo Ersek <lersek@redhat.com>
> >> Cc: Gerd Hoffmann <kraxel@redhat.com>
> >> Cc: Michael S. Tsirkin <mst@redhat.com>
> >> Cc: Kashyap Chamarthy <kchamart@redhat.com>
> >> Cc: Daniel P. Berrange <berrange@redhat.com>
> >> Suggested-by: Laszlo Ersek <lersek@redhat.com>
> >> Signed-off-by: Philippe Mathieu-DaudÃƒÂ© <philmd@redhat.com>
> > 
> > 
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Thanks Michael. If you plan to do a pull request, can you
> include this patch please? (modulo the weird UTF8 mojibakes)

I'll try, hopefully utf8 will be fine when I do.

> Else it can simply go via the trivial tree.
> 
> > 
> >> ---
> >> Since RFC v1:
> >> - Added Daniel & Kashyap as reviewer
> >> - Added myself as co-maintainer with Laszlo
> >>
> >> Based on a comment from Laszlo:
> >> https://www.mail-archive.com/qemu-devel@nongnu.org/msg604925.html
> >> Background info from Kashyap:
> >> https://lists.nongnu.org/archive/html/qemu-devel/2018-03/msg01978.html
> >> ---
> >>  MAINTAINERS | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index dec252f38b..64bcea658d 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -2601,6 +2601,14 @@ F: include/hw/i2c/smbus_master.h
> >>  F: include/hw/i2c/smbus_slave.h
> >>  F: include/hw/i2c/smbus_eeprom.h
> >>  
> >> +Firmware schema specifications
> >> +M: Laszlo Ersek <lersek@redhat.com>
> >> +M: Philippe Mathieu-DaudÃƒÂ© <philmd@redhat.com>
> >> +R: Daniel P. Berrange <berrange@redhat.com>
> >> +R: Kashyap Chamarthy <kchamart@redhat.com>
> >> +S: Maintained
> >> +F: docs/interop/firmware.json
> >> +
> >>  EDK2 Firmware
> >>  M: Laszlo Ersek <lersek@redhat.com>
> >>  M: Philippe Mathieu-DaudÃƒÂ© <philmd@redhat.com>
> >> -- 
> >> 2.21.3
> > 



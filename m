Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGkuS-000206-PN
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2020 11:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kGkuR-0001yp-8V
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 11:24:19 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41300
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kGkuO-0006Og-It
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 11:24:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599837856;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=xdg6kiQbx4t6mfdB8vw8E9TPvsPyMjvWzwqpQumToK4=;
 b=CxzBn03vqeLLMzpJ5qtmnGSEXETRd4KRqliTNF+pHzQeEiJBpAlDQOVTiwawKiNnmbxlzh
 DMHjm7YOpfdBa3vkNu/6EPb3bzmWaN27L3953jDBN7frGI8qWxToUgdxWa8Xsxec9vXpg2
 eesxpgRPY26hzwOkq77RkPNb4dNqUUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-NAuC4LlXM2ehMAuaiXkDdQ-1; Fri, 11 Sep 2020 11:24:03 -0400
X-MC-Unique: NAuC4LlXM2ehMAuaiXkDdQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC2D4107B273;
 Fri, 11 Sep 2020 15:24:01 +0000 (UTC)
Received: from redhat.com (ovpn-113-229.ams2.redhat.com [10.36.113.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D67E60C04;
 Fri, 11 Sep 2020 15:23:56 +0000 (UTC)
Date: Fri, 11 Sep 2020 16:23:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Laszlo Ersek <lersek@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "McMillan, Erich" <erich.mcmillan@hp.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: PATCH: Increase System Firmware Max Size
Message-ID: <20200911152353.GI1203593@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <CS1PR8401MB0327EF9D532330BA44257AFCF3240@CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM>
 <20c5210f-8199-a9e7-9297-0bea06c4d9ae@redhat.com>
 <20200911083408.GA3310@work-vm>
 <ae2d820e-78c6-da92-2fa6-73c1a7d10333@redhat.com>
 <20200911150602.GH3310@work-vm>
MIME-Version: 1.0
In-Reply-To: <20200911150602.GH3310@work-vm>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 00:33:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 11 Sep 2020 15:24:19 -0000

On Fri, Sep 11, 2020 at 04:06:02PM +0100, Dr. David Alan Gilbert wrote:
> * Laszlo Ersek (lersek@redhat.com) wrote:
> > On 09/11/20 10:34, Dr. David Alan Gilbert wrote:

> > > it doesn't have any pretty graphics
> > > or snazzy stuff,
> > 
> > Which is arguably completely superfluous on every possible platform one
> > can imagine. On the other hand, if you want a real serial port on
> > workstation class hardware, you may have to order a separate part (if
> > you are lucky and you *can* order one). Serial-over-LAN is a complete
> > non-replacement.
> > 
> > The reason (should I say: excuse) for the firmware to exist is to (a)
> > boot operating systems, (b) abstract away some ugly platform-specific
> > hardware for OS runtime (by providing ACPI and SMBIOS descriptions, and
> > a *small* set of runtime services). We can maybe add (c) "root of trust".
> > 
> > In practice, physical firmware is becoming the hw vendor's OS before
> > (and under) your OS, one you cannot replace, and one whose updates can
> > brick your hardware. Permitting the same feature creep on virtual
> > platforms is wrong.
> 
> On the firmware you develop that choice is fine; but there's no reason
> to force that restriction onto others.
> 
> > > or have to survive configuring lots of hardware; also
> > > I'm aware of other companies who are looking at putting big blobs
> > > of stuff in firmware for open uses;
> > 
> > Key term being "open uses". Let us see them.
> 
> Well yes, I think we know who we're speaking about here and we're
> working on it.

I don't think we need to dictate that firmware used with QEMU has to be
open source.

If someone wants to use a closed source firmware that is fine. They simply
can't expect us to help debug problems in QEMU when using the closed source
firmware, without first demonstrating it with an open source firmware we can
see.

> > > so I don't see a problem with
> > > changing this limit from the QEMU side of things.
> > 
> > I do. Software and data always expand to consume all available space,
> > and it's going to cause a conflict between UEFI features and platform
> > MMIO sooner or later. Then I'll get the privilege of shuffling around
> > the crap in OVMF (all of which is "indispensable" or course).
> > 
> > If we ever go down this route, it needs to benefit open source directly
> > and significantly.
> 
> Being able to use QEMU to let vendors debug their platform firmware is a
> perfectly reasonable use of QEMU; maybe not of your OVMF build - we
> need to keep the restrictions on the two separate.

Agreed, I can understand the motivation to not want to change the QEMU
defaults, but I don't see why we should have this as a hard coded
limit that is not runtime configurable.

IOW, why can't we keep our current default and provide a machine type
property "firmware_max_size" which users can opt-in to setting if
their particular firmware exceeds normal defaults. That won't impact
us for migration compat in any way, and lets users have flexibility t
do what they want.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



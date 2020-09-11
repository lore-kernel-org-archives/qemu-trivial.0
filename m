Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGlZU-000257-31
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2020 12:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kGlZT-00023r-1k
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 12:06:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kGlZQ-0005Ow-Sr
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 12:06:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599840399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c4ygajeVSmt2c4Tfp7UiD59+U3C9CgyYcM/rJ1HeOrg=;
 b=Qezlw+GNymHt2x4SgwYWDIBotvU7HrS5HIQt6ZPFz2NYMh/KBoDwMQyeBvu8sjEHG47MHE
 AKlY1z2qEQuIhZ8uvRmj7Rg5gtDAOEa2lI+A+xpXZcMvoeCP2QuYeRrJ3jy/kygGXYkOzk
 +WQ1jqRI1CPaJJZhT9CfJfPylWR+SlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-KcQbrIajNcyLgxkiwzUNGQ-1; Fri, 11 Sep 2020 12:06:37 -0400
X-MC-Unique: KcQbrIajNcyLgxkiwzUNGQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55A3E18BE167;
 Fri, 11 Sep 2020 16:06:33 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-62.ams2.redhat.com
 [10.36.113.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87D4519C66;
 Fri, 11 Sep 2020 16:06:28 +0000 (UTC)
Subject: Re: PATCH: Increase System Firmware Max Size
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "mst@redhat.com" <mst@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "McMillan, Erich" <erich.mcmillan@hp.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <CS1PR8401MB0327EF9D532330BA44257AFCF3240@CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM>
 <20c5210f-8199-a9e7-9297-0bea06c4d9ae@redhat.com>
 <20200911083408.GA3310@work-vm>
 <ae2d820e-78c6-da92-2fa6-73c1a7d10333@redhat.com>
 <20200911150602.GH3310@work-vm> <20200911152353.GI1203593@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d7d0d37e-4bba-ab82-783d-06463d78d9cf@redhat.com>
Date: Fri, 11 Sep 2020 18:06:27 +0200
MIME-Version: 1.0
In-Reply-To: <20200911152353.GI1203593@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 08:18:51
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
X-List-Received-Date: Fri, 11 Sep 2020 16:06:43 -0000

On 09/11/20 17:23, Daniel P. Berrangé wrote:

> I don't see why we should have this as a hard coded
> limit that is not runtime configurable.
> 
> IOW, why can't we keep our current default and provide a machine type
> property "firmware_max_size" which users can opt-in to setting if
> their particular firmware exceeds normal defaults. That won't impact
> us for migration compat in any way, and lets users have flexibility t
> do what they want.

Technically, this is fine, in my opinion.

My concerns (in distilled form, this time):

- The change increases maintenance burden.

- The change does not benefit most users of QEMU, as the intended guest
payload will not available to most of them at all (regardless of
licensing terms).

- The existence of the property may entice OVMF users to ask us to
enlarge the *current* OVMF firmware platform and to pack more stuff in
it. That is not OK. My counter-proposal ("please contribute a new
platform DSC/FDF under OvmfPkg, and assume co-reviewership for it")
would almost certainly not be acted upon.

That's all.

Thanks
Laszlo



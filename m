Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSEW2-0001aD-MC
	for mharc-qemu-trivial@gnu.org; Tue, 13 Oct 2020 03:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kSEW1-0001Xz-5U
 for qemu-trivial@nongnu.org; Tue, 13 Oct 2020 03:14:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kSEVz-0002gK-8b
 for qemu-trivial@nongnu.org; Tue, 13 Oct 2020 03:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602573270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9FsuujMKg6CaWhJVvKBuGoAUHap29BGHI/JjDqIWy24=;
 b=H4K5DEVwMaTib0nOAbq8XR1zu55oQXiTkMjXSQb7Hm89mwkVvu7HPuzLbexHCjpDDuGyzL
 HbviAL8uFqv+3zGICx0ncj5f4UP8CfLr5o5PHbuqIzyrlUn15i9f2qteyddk2jLpimoS1/
 LrDP1BDiGDJLOF/LUdF2ZuNu2vKuYkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-XFZ0zN7NO8CtJ7V4LE7psg-1; Tue, 13 Oct 2020 03:14:26 -0400
X-MC-Unique: XFZ0zN7NO8CtJ7V4LE7psg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79BF41084C84;
 Tue, 13 Oct 2020 07:14:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3A0E60C07;
 Tue, 13 Oct 2020 07:14:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0E5651750A; Tue, 13 Oct 2020 09:14:17 +0200 (CEST)
Date: Tue, 13 Oct 2020 09:14:17 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 qemu-trivial@nongnu.org,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 03/10] hw/isa: Add the ISA_IRQ_SER_DEFAULT definition
Message-ID: <20201013071417.xfqlnsik6eqmcizq@sirius.home.kraxel.org>
References: <20201011193229.3210774-1-f4bug@amsat.org>
 <20201011193229.3210774-4-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20201011193229.3210774-4-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 03:04:27
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
X-List-Received-Date: Tue, 13 Oct 2020 07:14:33 -0000

On Sun, Oct 11, 2020 at 09:32:22PM +0200, Philippe Mathieu-Daudé wrote:
> The first serial port uses IRQ #4 by default. Add this
      ^^^^^
> +    ISA_IRQ_SER_DEFAULT =  4,

... so name this SER1 maybe?  And add SER2 = 3?

take care,
  Gerd



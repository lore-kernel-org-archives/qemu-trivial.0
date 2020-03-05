Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9p9u-0002gr-4w
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 06:59:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60916)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1j9p9n-0002e9-JP
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 06:59:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1j9p9m-00019h-Lm
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 06:59:15 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56526
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1j9p9m-000187-Hk
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 06:59:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583409553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DMBX7jwvEhYERR2oFqWerlGCA/xirpAAmT2ofGoiN5M=;
 b=XXT3W1/XJ4e/pqPWzoLcK76pwpdaN/esLx/IX2+gm9w6O4pmxh0iSOajtyChy4AKfv6wr0
 celOZKzjHCEFVK+kbaNcGG2ZypnFU1q1/G8yQK7AdHAjA1MIrCJ9I3MvRraKt08p36g7EH
 VTlDvQR2/dQKtRAuH6YiQb38lZapOtU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-GfbOGbD9OkW4nFvGc6OPjA-1; Thu, 05 Mar 2020 06:59:12 -0500
X-MC-Unique: GfbOGbD9OkW4nFvGc6OPjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28EB6DB23;
 Thu,  5 Mar 2020 11:59:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEAC510027A3;
 Thu,  5 Mar 2020 11:59:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 21A8717449; Thu,  5 Mar 2020 12:59:10 +0100 (CET)
Date: Thu, 5 Mar 2020 12:59:10 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
Subject: Re: [PATCH 3/6] hw/usb/quirks: Use smaller types to reduce .rodata
 by 10KiB
Message-ID: <20200305115910.zhmaw3xqgoz4fan2@sirius.home.kraxel.org>
References: <20200304221807.25212-1-philmd@redhat.com>
 <20200304221807.25212-4-philmd@redhat.com>
 <20200305080237.j2a7waokxominirn@sirius.home.kraxel.org>
 <a5b6cddf-5887-be27-db76-2e515daa2c11@redhat.com>
 <CAP+75-XBbTPHbQJWxn5nEYsz4hdGXSTLTqKRRR-sx-APbPN2Sg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP+75-XBbTPHbQJWxn5nEYsz4hdGXSTLTqKRRR-sx-APbPN2Sg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Thu, 05 Mar 2020 11:59:16 -0000

> > And went this less intrusive way.
> >
> > I'll respin with s/-1/UINT8_MAX/.
>=20
> Problem, now this entry is ignored (interface_class=3D=3D-1):

Yep, "-1" is used as "not used" or "end-of-list" indicator, and it is
outside the valid range to avoid that kind of clashes.  You need some
other way to express that if you want go with smaller types which don't
allow values outside the valid range any more.  Add a "flags" field for
that maybe?

cheers,
  Gerd



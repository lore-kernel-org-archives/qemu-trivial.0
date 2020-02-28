Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7fY7-00029v-6K
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 08:19:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53897)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1j7fY4-00028K-BE
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 08:19:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1j7fY3-0003ky-0V
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 08:19:23 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41737
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1j7fY2-0003kV-SY
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 08:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582895960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+xCUhTSim984pYGbAD924PwF3i8/b1AXYEro7Ol7+dM=;
 b=SPbw/hsqny5S4dEygGVEmetVKkPdzfpyoKwgy+y2YJ2UmengifXBh7W/9+cDHecJr5/OEL
 4b9gunOwUx0KTi3EEE6W4wtimNwC+wSgfqYdnkedaa61NPg10PhyZvXYde9V2VioisqlmM
 xTFsm9zXp0pmmj5ks5Z1Nn/fEmSVhI4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-3JPSNaL7Mm-1KRuD4U4XMQ-1; Fri, 28 Feb 2020 08:19:19 -0500
X-MC-Unique: 3JPSNaL7Mm-1KRuD4U4XMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BF1B108C30C;
 Fri, 28 Feb 2020 13:19:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 233D28D543;
 Fri, 28 Feb 2020 13:19:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4D61517449; Fri, 28 Feb 2020 14:19:14 +0100 (CET)
Date: Fri, 28 Feb 2020 14:19:14 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 05/18] hw/usb/dev-storage: Remove unused
 "ui/console.h" header
Message-ID: <20200228131914.zhveihewcm6yoia3@sirius.home.kraxel.org>
References: <20200228114649.12818-1-philmd@redhat.com>
 <20200228114649.12818-6-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200228114649.12818-6-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
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
X-List-Received-Date: Fri, 28 Feb 2020 13:19:26 -0000

On Fri, Feb 28, 2020 at 12:46:36PM +0100, Philippe Mathieu-Daud=E9 wrote:
> The USB models related to storage don't need anything from
> "ui/console.h". Remove it.
>=20
> Acked-by: John Snow <jsnow@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>



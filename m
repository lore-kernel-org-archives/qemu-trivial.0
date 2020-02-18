Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j409T-0002So-DV
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 05:30:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50987)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j409Q-0002QF-Gl
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:30:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j409P-0005h7-JI
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:30:48 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28478
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j409P-0005gl-Ej
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:30:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582021847;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AM0HGPZD+Ex5WWLbIDoA83h03b95yxVKJplIappPJrw=;
 b=V8Tyc+jhFsADPLY5ekxqOWD9iI5muFc+G4eIpknWgAc/8fUAEeM5E/J6701U669BEj8IyN
 38tcpFI/qHjHeFDYFHGVwn5cYLKHFZ3xIcHWyRzjXOYIokAN5UG6ppANXqTQ4R9iPZ0NYA
 U5F/WLK4AV7E/eOK74OWaK0QSKbL7fE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-WDe4YRMXOSGRRbzIVm6wbQ-1; Tue, 18 Feb 2020 05:30:45 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CE40100550E;
 Tue, 18 Feb 2020 10:30:43 +0000 (UTC)
Received: from redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D405C60BE1;
 Tue, 18 Feb 2020 10:30:30 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org,  Max Reitz <mreitz@redhat.com>,  Kevin Wolf
 <kwolf@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Fam Zheng
 <fam@euphon.net>,  Eduardo Habkost <ehabkost@redhat.com>,  Alex Williamson
 <alex.williamson@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Richard Henderson <rth@twiddle.net>,  Julia
 Suvorova <jusual@redhat.com>,  Thomas Huth <huth@tuxfamily.org>,  "Edgar
 E. Iglesias" <edgar.iglesias@gmail.com>,  Aarushi Mehta
 <mehta.aaru20@gmail.com>,  qemu-trivial@nongnu.org,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Alistair Francis <alistair@alistair23.me>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Luc Michel <luc.michel@greensocs.com>,
 Laurent Vivier <lvivier@redhat.com>,  Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,  Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Yuval Shaia
 <yuval.shaia.ml@gmail.com>,  qemu-arm@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  qemu-block@nongnu.org
Subject: Re: [PATCH RESEND 06/13] hw/m68k/next-cube: Remove superfluous
 semicolon
In-Reply-To: <20200218094402.26625-7-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 18 Feb 2020 10:43:55
 +0100")
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-7-philmd@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Tue, 18 Feb 2020 11:30:27 +0100
Message-ID: <875zg4nq64.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: WDe4YRMXOSGRRbzIVm6wbQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Tue, 18 Feb 2020 10:30:49 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> Fixes: 956a78118bf
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>



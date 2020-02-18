Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j40Ce-0007tG-EW
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 05:34:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51758)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j40Cb-0007nm-2O
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:34:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j40CZ-00070Z-Sm
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:34:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30188
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j40CZ-00070D-PF
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:34:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582022043;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e7YYxi112FaVPgxQnQ+jIZzVnUDT/yUViX4VXn8S3CM=;
 b=THpdRwWZD5N5Tt+PL9mtR/TVAV5Pa8F2I4o6XSU8fQFtHXCnziqY20rS2jMYKgJ5DE2I5f
 o76RJZ32FFgVO6zXyySPlw3t4DnR9ftkzG7NYeK5a14Nqhy5eF2OjK84KUKz3gYmXRqJaB
 7Tu931+AIvxGe8z29h34Cf+s4r4tm/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-FhwYc7e9M4yazGyX21d3Xg-1; Tue, 18 Feb 2020 05:33:59 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D08408018C0;
 Tue, 18 Feb 2020 10:33:56 +0000 (UTC)
Received: from redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F03FD8B550;
 Tue, 18 Feb 2020 10:33:43 +0000 (UTC)
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
 <peter.maydell@linaro.org>,  qemu-block@nongnu.org,  Emanuele Giuseppe
 Esposito <e.emanuelegiuseppe@gmail.com>
Subject: Re: [PATCH RESEND 12/13] tests/qtest/libqos/qgraph: Remove
 superfluous semicolons
In-Reply-To: <20200218094402.26625-13-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 18 Feb 2020 10:44:01
 +0100")
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-13-philmd@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Tue, 18 Feb 2020 11:33:41 +0100
Message-ID: <87ftf8mbga.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: FhwYc7e9M4yazGyX21d3Xg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Tue, 18 Feb 2020 10:34:07 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> Fixes: fc281c80202
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>



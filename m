Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j40C9-0006wA-7A
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 05:33:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51648)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j40C5-0006sa-Ll
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:33:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j40C4-0006qk-Qe
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:33:33 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:50987
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j40C4-0006q2-N0
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:33:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582022011;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHvYpcDrHNi0jmtvHi5F3RD1e3HRjxtiCWreI9vii74=;
 b=Tol1xs+CAJn7EECc3Gh6B8nl+jgeFWB2lmdC3yNytgmiEm3zuMmZRREHIFEzAup8wVV54t
 f/EC1NiXRfL/rnJqWGTeceoCQHGdb7E1kXFfTYVVy1dEkWAVa7aANcWd0+j8lsWjZpZUCJ
 iwCs1ZGrc1GEfDbE8Z2If/e6fNeGZmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-aLTvOjWmOoyfIACJsGpPXA-1; Tue, 18 Feb 2020 05:33:29 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62445189F760;
 Tue, 18 Feb 2020 10:33:27 +0000 (UTC)
Received: from redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF13A5D9E2;
 Tue, 18 Feb 2020 10:33:13 +0000 (UTC)
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
 <peter.maydell@linaro.org>,  qemu-block@nongnu.org,  Justin Terry
 <juterry@microsoft.com>
Subject: Re: [PATCH RESEND 11/13] target/i386/whpx: Remove superfluous
 semicolon
In-Reply-To: <20200218094402.26625-12-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 18 Feb 2020 10:44:00
 +0100")
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-12-philmd@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Tue, 18 Feb 2020 11:33:10 +0100
Message-ID: <87k14kmbh5.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: aLTvOjWmOoyfIACJsGpPXA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 18 Feb 2020 10:33:34 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> Fixes: 812d49f2a3e
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>



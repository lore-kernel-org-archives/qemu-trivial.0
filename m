Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1itn3V-0006n0-F7
	for mharc-qemu-trivial@gnu.org; Tue, 21 Jan 2020 01:30:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43119)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1itn3P-0006mi-VT
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 01:30:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1itn3M-00051I-3m
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 01:30:23 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34098
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1itn3L-00050z-VB
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 01:30:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579588219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qsiftc4sag6Yw4KJj/+j+lEX2X59zfXwkvJoqT4IxwQ=;
 b=V1Ys/SQi/EmtCuTnSqWPcBADplAU/RBZnsTF+fCtyaf9edSr+1MfHOUXT+bx5HRiDf7HVX
 poWBVmoTL92stMuXUzrKwfaDZHSoBJv5YlfDsZHzSzJ1bNtF0kv+9NFokaNO0057hji7au
 Tk1dojkdSX29tSFWQF2SGPkkKNP2nHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-LNmucJ6BOnWxd_pdwVnLHQ-1; Tue, 21 Jan 2020 01:30:18 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EE4718A8C92;
 Tue, 21 Jan 2020 06:30:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com
 [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBF7B8CCD2;
 Tue, 21 Jan 2020 06:30:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 58DFA1747D; Tue, 21 Jan 2020 07:30:08 +0100 (CET)
Date: Tue, 21 Jan 2020 07:30:08 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] ui/console: Display the 'none' backend in '-display help'
Message-ID: <20200121063008.i2nr5osfkj65wjl3@sirius.home.kraxel.org>
References: <20200120192947.31613-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200120192947.31613-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: LNmucJ6BOnWxd_pdwVnLHQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-List-Received-Date: Tue, 21 Jan 2020 06:30:28 -0000

On Mon, Jan 20, 2020 at 08:29:47PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Commit c388f408b5 added the possibility to list the display
> backends using '-display help'. Since the 'none' backend is
> is not implemented as a DisplayChangeListenerOps, it is not
> registered to the dpys[] array with qemu_display_register(),
> and is not listed in the help output.
>=20
> This might be confusing, as we list it in the man page:
>=20
>   -display type
>       Select type of display to use. This option is a replacement for
>       the old style -sdl/-curses/... options. Valid values for type are
>=20
>       none
>           Do not display video output. The guest will still see an
>           emulated graphics card, but its output will not be displayed
>           to the QEMU user. This option differs from the -nographic
>           option in that it only affects what is done with video
>           output; -nographic also changes the destination of the serial
>           and parallel port data.
>=20
> Fix by manually listing the special 'none' backend in the help.
>=20
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Added to ui queue.

thanks,
  Gerd



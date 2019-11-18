Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iWoPA-0002BT-IZ
	for mharc-qemu-trivial@gnu.org; Mon, 18 Nov 2019 16:17:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36169)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iWoP3-000269-T1
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 16:17:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iWoOz-0007zv-Ro
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 16:17:45 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20248
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iWoOz-0007zc-MY
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 16:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574111861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=amk6rxLyaAB8a++vwdkJvdNbx85Yp5ACkAA4d8gdI0o=;
 b=aRIeQAtOhovdOvfOl/fIgxhuod6uF/garogpv/TtIyUSiY9JmTHRlCeVL4W6Dcu0GEo+6r
 5jD+3QwJZRPMHThFEHFyM8UOsRoTfWUGSB+/YyYLf7eRGdzD1IWbNnl//EJxrZhsA2eFjM
 HcZPxTIQHTCou5NE99M3VqVQR3t015k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-FL8IEw15OPKyzANkyljneA-1; Mon, 18 Nov 2019 16:17:37 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41E1A100FE67;
 Mon, 18 Nov 2019 21:17:36 +0000 (UTC)
Received: from [10.3.116.221] (ovpn-116-221.phx2.redhat.com [10.3.116.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2B121CD;
 Mon, 18 Nov 2019 21:17:29 +0000 (UTC)
Subject: Re: [PATCH-for-4.2 v3 2/3] hw/mips/gt64xxx: Remove dynamic field
 width from trace events
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>, qemu-trivial@nongnu.org
References: <20191118210458.11959-1-philmd@redhat.com>
 <20191118210458.11959-3-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <43305839-1edc-715e-26b1-a767b644df09@redhat.com>
Date: Mon, 18 Nov 2019 15:17:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191118210458.11959-3-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: FL8IEw15OPKyzANkyljneA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 18 Nov 2019 21:17:50 -0000

On 11/18/19 3:04 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Since not all trace backends support dynamic field width in
> format (dtrace via stap does not), replace by a static field
> width instead.
>=20
> We previously passed to the trace API 'width << 1' as the number
> of hex characters to display (the dynamic field width). We don't
> need this anymore. Instead, display the size of bytes accessed.
>=20
> Reported-by: Eric Blake <eblake@redhat.com>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1844817
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Fixes: ab6bff424f

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



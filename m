Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iWoMo-00088C-P6
	for mharc-qemu-trivial@gnu.org; Mon, 18 Nov 2019 16:15:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35667)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iWoMm-00085V-H2
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 16:15:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iWoMl-0005UD-0x
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 16:15:24 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23992
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iWoMk-0005Tq-UN
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 16:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574111722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O2UsfxAmTPLYL+cGfqfSn8DXxf2oW74nMHRcKoQdDmk=;
 b=OApvwaXLtJ4NIQjyJYN7Olrbc2BnowGUBSNBjtAVzNdkRKQ5NNiN6bIqy+kzar0CZZO10a
 nxkwcwA0ASewGEESUjfMdOOV/VfXHpKTjD2K3RRh4XUrSlSiroFCA/RxeQF1n3r1+GP5qB
 2cGjlioXg2EPrAjB49YjyYXvND+zQ+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-ekjv9PHaPNuYZiIljLbk6w-1; Mon, 18 Nov 2019 16:15:18 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D715107B103;
 Mon, 18 Nov 2019 21:15:16 +0000 (UTC)
Received: from [10.3.116.221] (ovpn-116-221.phx2.redhat.com [10.3.116.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 877721BC76;
 Mon, 18 Nov 2019 21:15:10 +0000 (UTC)
Subject: Re: [PATCH-for-4.2 v3 1/3] hw/block/pflash: Remove dynamic field
 width from trace events
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>, qemu-trivial@nongnu.org
References: <20191118210458.11959-1-philmd@redhat.com>
 <20191118210458.11959-2-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <833a3e22-2bbb-f646-eb9b-5c56dfeb43e6@redhat.com>
Date: Mon, 18 Nov 2019 15:15:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191118210458.11959-2-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: ekjv9PHaPNuYZiIljLbk6w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Mon, 18 Nov 2019 21:15:25 -0000

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

Is it worth a Fixes: XXX calling out the commit that introduced the '*'?

/me goes and searches

Fixes: e8aa2d95ea
Fixes: c1474acd5d

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



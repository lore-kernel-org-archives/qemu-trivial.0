Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3eAg-0000kv-T9
	for mharc-qemu-trivial@gnu.org; Mon, 17 Feb 2020 06:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35468)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j3eAe-0000jz-Kc
 for qemu-trivial@nongnu.org; Mon, 17 Feb 2020 06:02:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j3eAd-0003yO-Mt
 for qemu-trivial@nongnu.org; Mon, 17 Feb 2020 06:02:36 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:51455
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j3eAd-0003xz-J7
 for qemu-trivial@nongnu.org; Mon, 17 Feb 2020 06:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581937355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZbbQYttegt3tOjyANMeLdbMX9Eu97lfpxXt6czx+VHE=;
 b=PFi6KAmDhfQDrLiNUzNwI1/B1BCzgvH/IYRZN2AmsZ6N1zMNsZwRnoh0GuRA1H+zLYttB6
 DGPKoiy5+KTv98LjEn39MugXqacFldDtjRdlkDQdGWuZQmMpz7Z+lfj3IX/OYoupW4YMz/
 bEOsOfcUfIm/tP3J3/bwu0s2fz7Biq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-q-I9kPf9N7-hVImAoff6Xg-1; Mon, 17 Feb 2020 06:02:33 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EDCADB6B;
 Mon, 17 Feb 2020 11:02:32 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-208.ams2.redhat.com [10.36.117.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0DA41000325;
 Mon, 17 Feb 2020 11:02:25 +0000 (UTC)
Date: Mon, 17 Feb 2020 12:02:23 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 John Snow <jsnow@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH 1/3] block/qcow2-bitmap: Remove unneeded variable
 assignment
Message-ID: <20200217110223.GE6309@linux.fritz.box>
References: <20200215161557.4077-1-philmd@redhat.com>
 <20200215161557.4077-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200215161557.4077-2-philmd@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: q-I9kPf9N7-hVImAoff6Xg-1
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
X-List-Received-Date: Mon, 17 Feb 2020 11:02:37 -0000

Am 15.02.2020 um 17:15 hat Philippe Mathieu-Daud=E9 geschrieben:
> Fix warning reported by Clang static code analyzer:
>=20
>     CC      block/qcow2-bitmap.o
>   block/qcow2-bitmap.c:650:5: warning: Value stored to 'ret' is never rea=
d
>       ret =3D -EINVAL;
>       ^     ~~~~~~~
>=20
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

This isn't hw/, so I'm taking it through my tree. Thanks, applied to the
block branch.

Kevin



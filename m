Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gkALa-000425-Rn
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2019 11:16:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1gkALY-00040N-M6
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 11:16:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1gkALY-0008T5-16
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 11:16:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38294)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1gkALV-0008NF-Uh; Thu, 17 Jan 2019 11:16:46 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0A197C03D47D;
	Thu, 17 Jan 2019 16:08:31 +0000 (UTC)
Received: from localhost.localdomain (ovpn-121-148.rdu2.redhat.com
	[10.10.121.148])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 501525D6AA;
	Thu, 17 Jan 2019 16:08:30 +0000 (UTC)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-trivial@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20190117153338.11820-1-alex.bennee@linaro.org>
From: Cleber Rosa <crosa@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5258121f-d54b-8b58-f393-7f9140760950@redhat.com>
Date: Thu, 17 Jan 2019 11:08:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190117153338.11820-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 17 Jan 2019 16:08:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] scripts/replay-dump.py: fix utf-8
 mangling
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2019 16:16:49 -0000



On 1/17/19 10:33 AM, Alex Benn=C3=A9e wrote:
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  scripts/replay-dump.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/replay-dump.py b/scripts/replay-dump.py
> index 5ae77c8a92..ee7fda2638 100755
> --- a/scripts/replay-dump.py
> +++ b/scripts/replay-dump.py
> @@ -3,7 +3,7 @@
>  #
>  # Dump the contents of a recorded execution stream
>  #
> -#  Copyright (c) 2017 Alex Benn=C3=83=C2=A9e <alex.bennee@linaro.org>
> +#  Copyright (c) 2017 Alex Benn=C3=A9e <alex.bennee@linaro.org>
>  #
>  # This library is free software; you can redistribute it and/or
>  # modify it under the terms of the GNU Lesser General Public
>=20

Reviewed-by: Cleber Rosa <crosa@redhat.com>


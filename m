Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXTwg-0003qz-J7
	for mharc-qemu-trivial@gnu.org; Thu, 13 Dec 2018 11:34:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gXTwc-0003pu-L2
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 11:34:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gXTwa-0002dL-O9
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 11:34:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34096)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gXTwR-0002HU-OU; Thu, 13 Dec 2018 11:34:27 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 520BE37E66;
	Thu, 13 Dec 2018 16:34:26 +0000 (UTC)
Received: from [10.10.126.241] (ovpn-126-241.rdu2.redhat.com [10.10.126.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0B49E61B6C;
	Thu, 13 Dec 2018 16:34:12 +0000 (UTC)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
	"Richard W.M. Jones" <rjones@redhat.com>, qemu-trivial@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Max Reitz <mreitz@redhat.com>, Liu Yuan <namei.unix@gmail.com>
References: <20181213162727.17438-1-lvivier@redhat.com>
	<20181213162727.17438-2-lvivier@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <827ac081-587f-d365-b682-3a65271a0a4a@redhat.com>
Date: Thu, 13 Dec 2018 10:34:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181213162727.17438-2-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 13 Dec 2018 16:34:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/4] block/ssh: Convert
 from DPRINTF() macro to trace events
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
X-List-Received-Date: Thu, 13 Dec 2018 16:34:42 -0000

On 12/13/18 10:27 AM, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>=20
> Notes:
>      v2: use %zu with size_t
>          change an uint64_t to int64_t to match % PRIi64

Why PRIi64?  It's identical to PRId64, but the sources show a strong=20
preference for %d over %i:

$ git grep PRIi[0-9] | wc
      25     172    1885
$ git grep PRId[0-9] | wc
     415    3991   40345

$ git grep '%i' | wc
     231    1664   18269
$ git grep '%d' | wc
    5492   46211  498225

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


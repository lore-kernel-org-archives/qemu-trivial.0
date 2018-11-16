Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNfhy-0005c5-O8
	for mharc-qemu-trivial@gnu.org; Fri, 16 Nov 2018 10:06:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gNfhu-0005aM-9a
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2018 10:06:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gNfht-0001sJ-Kf
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2018 10:06:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38488)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gNfhn-0001ap-NI; Fri, 16 Nov 2018 10:06:47 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75CA53097065;
	Fri, 16 Nov 2018 15:06:39 +0000 (UTC)
Received: from [10.10.123.32] (ovpn-123-32.rdu2.redhat.com [10.10.123.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A1265C6A5;
	Fri, 16 Nov 2018 15:06:37 +0000 (UTC)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, pbonzini@redhat.com,
	armbru@redhat.com, xiezhide@huawei.com
References: <20181115225052.1322639-1-eblake@redhat.com>
	<20181116102659.GA28597@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <bef6b1f7-327a-a786-a9c2-d69386eb98d8@redhat.com>
Date: Fri, 16 Nov 2018 09:06:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181116102659.GA28597@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 16 Nov 2018 15:06:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qapi: Reduce Makefile
 boilerplate
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
X-List-Received-Date: Fri, 16 Nov 2018 15:06:56 -0000

On 11/16/18 4:26 AM, Daniel P. Berrang=C3=A9 wrote:

>>   Makefile      | 192 ++++++------------------------------------------=
--
>>   Makefile.objs |  75 ++------------------
>>   2 files changed, 30 insertions(+), 237 deletions(-)
>=20
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>=20
> Though I'd also suggest .gitignore is updated to use wildcards
> to exclude the generated files.

Oh, good idea. v3 coming up

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

